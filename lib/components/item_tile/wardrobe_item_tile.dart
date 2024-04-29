import 'package:app/models/item/wardrobelist.dart';
import 'package:flutter/material.dart';

class MyWardrobeTile extends StatelessWidget {
  final Wardrobe wardrobe;
  final void Function()? onTap;
  const MyWardrobeTile({
    super.key,
    required this.wardrobe,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Image.asset(
                    wardrobe.wardrobeImagePath,
                    height: 160,
                  ),

                  Text(
                    wardrobe.wardrobeName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
