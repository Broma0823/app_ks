import 'package:app/models/item/wardrobelist.dart';
import 'package:flutter/material.dart';

class MyWardrobeTabBar extends StatelessWidget {
  final TabController tabController;

  const MyWardrobeTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs() {
    return WardrobeCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        indicatorColor: Theme.of(context).primaryColor,
        labelColor: Theme.of(context).primaryColor,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
