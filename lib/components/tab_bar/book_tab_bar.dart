import 'package:app/models/item/booklist.dart';
import 'package:flutter/material.dart';

class MyBookTabBar extends StatelessWidget {
  final TabController tabController;

  const MyBookTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs() {
    return BookCategory.values.map((category) {
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
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
