import 'package:app/models/item/accesorieslist.dart';
import 'package:flutter/material.dart';

class KSAccesories extends ChangeNotifier {
  final List<Accesories> _menu = [
    //Poloshirt
    Accesories(
      accesoriesName: 'Golden Necklace',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Golden-Necklace.png',
      category: AccesoriesCategory.NECKLACE,
      maxnumberofItem: 10,
    ),
    Accesories(
      accesoriesName: 'Pearl Necklace',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Pearl-Necklace.png',
      category: AccesoriesCategory.NECKLACE,
      maxnumberofItem: 15,
    ),
    Accesories(
      accesoriesName: 'Choker',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Choker.png',
      category: AccesoriesCategory.NECKLACE,
      maxnumberofItem: 15,
    ),
    Accesories(
      accesoriesName: 'Heavy Gold Earrings',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Heavy-Gold-Earrings.png',
      category: AccesoriesCategory.EARRINGS,
      maxnumberofItem: 14,
    ),
    Accesories(
      accesoriesName: 'Egg Earrings',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Egg-Earrings.png',
      category: AccesoriesCategory.EARRINGS,
      maxnumberofItem: 15,
    ),
    Accesories(
      accesoriesName: 'Pearlssss Earrings',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Pearlsss.png',
      category: AccesoriesCategory.EARRINGS,
      maxnumberofItem: 15,
    ),
    Accesories(
      accesoriesName: 'Long Shiny Earrings',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Long-Shiny-Earrings.png',
      category: AccesoriesCategory.EARRINGS,
      maxnumberofItem: 11,
    ),
    Accesories(
      accesoriesName: 'Blue Earrings',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Blue-Earrings.png',
      category: AccesoriesCategory.EARRINGS,
      maxnumberofItem: 15,
    ),
    Accesories(
      accesoriesName: 'Red Earrings',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Red-Earrings.png',
      category: AccesoriesCategory.EARRINGS,
      maxnumberofItem: 15,
    ),
    Accesories(
      accesoriesName: 'Leaves Earrings',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Leaves-Earrings.png',
      category: AccesoriesCategory.EARRINGS,
      maxnumberofItem: 13,
    ),
    Accesories(
      accesoriesName: 'Grapes Pearl Earrings',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Grapes-Pearl-Earrings.png',
      category: AccesoriesCategory.EARRINGS,
      maxnumberofItem: 1,
    ),
    Accesories(
      accesoriesName: 'Silver Bug Earrings',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Silver-Bug-Earrings.png',
      category: AccesoriesCategory.EARRINGS,
      maxnumberofItem: 1,
    ),
    Accesories(
      accesoriesName: 'Hairbun',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Hairbun.png',
      category: AccesoriesCategory.HAIR,
      maxnumberofItem: 13,
    ),
    Accesories(
      accesoriesName: 'Flower (Gray)',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Flower-Gray.png',
      category: AccesoriesCategory.HAIR,
      maxnumberofItem: 10,
    ),
    Accesories(
      accesoriesName: 'Flower (Blue)',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Flower-Blue.png',
      category: AccesoriesCategory.HAIR,
      maxnumberofItem: 5,
    ),
    Accesories(
      accesoriesName: 'Wow Nina Brooch',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Wow-Nina-Brooch.png',
      category: AccesoriesCategory.COSTUME,
      maxnumberofItem: 15,
    ),
    Accesories(
      accesoriesName: 'Maam Aleli Brooch',
      accesoriesDescription: 'Blue PoloShirt by Koro Seraphim',
      accesoriesImagePath: 'assets/images/accesories/Ma_am-Aleli-Brooch.png',
      category: AccesoriesCategory.COSTUME,
      maxnumberofItem: 1,
    ),
  ];

  //Getters
  List<Accesories> get menu => _menu;

  List<Accesories> generateInstrumentList() {
    return _menu
        .map((item) => Accesories(
              accesoriesName: item.accesoriesName,
              accesoriesDescription: item.accesoriesDescription,
              accesoriesImagePath: item.accesoriesImagePath,
              category: item.category,
              maxnumberofItem: item.maxnumberofItem,
            ))
        .toList();
  }
}
