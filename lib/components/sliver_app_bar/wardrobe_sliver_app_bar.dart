import 'package:app/test/transactionpage_test.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  final Widget actions;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      collapsedHeight: 200,
      floating: false,
      pinned: true,
      title: const Text(""),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyTransactionPageCategorizedTest(),
              ),
            );
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background: child,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0),
      ),
    );
  }
}
