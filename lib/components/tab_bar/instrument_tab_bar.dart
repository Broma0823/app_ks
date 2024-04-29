import 'package:app/models/item/instrumentlist.dart';
import 'package:flutter/material.dart';

class MyInstrumentTabBar extends StatelessWidget {
  final TabController tabController;

  const MyInstrumentTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs() {
    return InstrumentCategory.values.map((category) {
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
        labelColor: Theme.of(context).primaryColor,
        indicatorColor: Theme.of(context).primaryColor,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
