import 'package:flutter/material.dart';

class MySliverAppBarAccesories extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBarAccesories({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      collapsedHeight: 150,
      floating: false,
      pinned: true,
      title: const Text(""),
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
