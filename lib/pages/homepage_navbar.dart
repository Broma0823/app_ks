import 'package:app/pages/homepage.dart';
import 'package:app/pages/settings.dart';
import 'package:app/pages/unreturned_page.dart';
import 'package:app/test/transactionpage_test.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePageTest extends StatefulWidget {
  const HomePageTest({super.key});

  @override
  State<HomePageTest> createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePageTest>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset > 0.0;
    });
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const MyTransactionPageCategorizedTest(),
      const MyUnreturnedItemsPage(),
      const MySettingsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Theme.of(context).splashColor,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 12),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history),
        title: ("History"),
        activeColorPrimary: Theme.of(context).splashColor,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 12),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.error_outline),
        title: ("Unreturned"),
        activeColorPrimary: Theme.of(context).splashColor,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 12),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: Theme.of(context).splashColor,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 12),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarHeight: 70,
      confineInSafeArea: true,
      backgroundColor: Theme.of(context).primaryColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBar: isKeyboardVisible,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style5,
    );
  }
}
