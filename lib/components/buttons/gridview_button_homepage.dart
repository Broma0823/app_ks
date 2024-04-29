import 'package:app/pages/mainpages/accesories.dart';
import 'package:app/pages/mainpages/instruments.dart';
import 'package:app/pages/mainpages/wardrobe.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePageButtons extends StatelessWidget {
  final List<String> names = [
    'WARDROBE',
    'INSTRUMENT',
    'ACCESORY',
  ]; // Your data here
  final List<IconData> icons = [
    FontAwesomeIcons.shirt,
    Icons.piano_rounded,
    FontAwesomeIcons.ring,
  ];

  MyHomePageButtons({super.key}); // Your icons here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: names.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items in a row
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigate to a different page based on the tapped item
              switch (index) {
                case 0:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyWardrobePage()));
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyInstrumentPage()));
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyAccesoriesPage()));
                  break;
                // Add more cases for other indices
              }
            },
            child: Card(
              color: Theme.of(context).cardTheme.color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Icon(
                      icons[index],
                      size: 50,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ), // The icon
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(names[index],
                        style: Theme.of(context).textTheme.titleSmall),
                  ), // The name
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
