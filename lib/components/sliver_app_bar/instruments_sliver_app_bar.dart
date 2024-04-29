import 'package:flutter/material.dart';

class MySliverAppBarInstruments extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBarInstruments({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      collapsedHeight: 200,
      floating: false,
      pinned: true,
      title: const Text(""),
      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const MyTransactionPageCategorized(),
      //         ),
      //       );
      //     },
      //     icon: const Icon(Icons.shopping_bag_outlined),
      //   ),
      // ],
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
