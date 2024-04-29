import 'package:app/models/item/instrumentlist.dart';
import 'package:flutter/material.dart';

class MyInstrumentTile extends StatelessWidget {
  final Instrument instrument;
  final void Function()? onTap;
  const MyInstrumentTile({
    super.key,
    required this.instrument,
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
                    instrument.instrumentImagePath,
                    height: 160,
                  ),
                  Text(instrument.instrumentName,
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
          ),
        ));
  }
}
