import 'package:app/components/buttons/gridview_button_homepage.dart';
import 'package:app/components/textfields/my_search_all_items.dart';
import 'package:app/components/textfields/my_search_textfield.dart';
import 'package:app/pages/mysearchpage.dart';
import 'package:app/test/databaseservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final db = DatabaseService();
  final SearchController = TextEditingController();

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('MMMM dd, yyyy hh:mm a');
    return formatter.format(date);
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void _onTapSearchField(
      BuildContext context, TextEditingController searchController) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MySearchAllItemsPage()));
  }
  //SEARCH ALGO
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MyDrawer(),

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/propertytracker.png',
                      height: 100,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 0),
                        child: Column(
                          children: [
                            Text(
                              'Welcome to',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'KoroKatalog',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 10),
              child: Divider(
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'CHOOSE A CATEGORY',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            MyTextField_SearchAll(
              hintText: 'Search...',
              obscureText: false,
              controller: SearchController,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => MySearchAllItemsPage()))),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: MyHomePageButtons()),
          ],
        ),
      ),
    );
  }
}
