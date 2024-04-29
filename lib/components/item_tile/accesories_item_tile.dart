import 'package:app/models/item/accesorieslist.dart';
import 'package:flutter/material.dart';

class MyAccesoriesTile extends StatelessWidget {
  final Accesories accesories;
  final void Function()? onTap;
  const MyAccesoriesTile({
    super.key,
    required this.accesories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 15.0,
          ),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    accesories.accesoriesImagePath,
                    height: 160,
                  ),
                  Text(
                    accesories.accesoriesName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
