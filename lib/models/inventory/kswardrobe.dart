import 'package:app/models/item/wardrobelist.dart';
import 'package:flutter/material.dart';

class KSWardrobe extends ChangeNotifier {
  final List<Wardrobe> _menu = [
    //Poloshirt
    Wardrobe(
      wardrobeName: 'Blue Poloshirt',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/BLUE-POLO-SHIRT.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: '2 Tone Poloshirt',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/TWO-TONE.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Gray Trouser',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/MALE-GRAY-TROUSER.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    /////////////////////////////////////
    Wardrobe(
      wardrobeName: 'Male Sublimation',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/SUBLIMATION-MALE.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Female Sublimation',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/SUBLIMATION_FEMALE.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Falala',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/FALALA.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Male Cityhall',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/CITY-HALL-MALE.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Nyor',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/NYOR.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Female Malacanang',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/MALACANANG-FEMALE.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Beige Skirt',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/BEIGE-SKIRT.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'WOW Nina',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/WOW-NINA.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 60,
    ),
    Wardrobe(
      wardrobeName: 'Male Cityhall',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/CITY-HALL-FEMALE.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Blue Skirt',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/BLUE-SHINY.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Black Skirt',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/BLACK-SKIRT.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Shem Shem',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/SHEMSHEM.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Blue Poncho',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/BLUE-PONCHO.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Female Gray Trouser',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/FEMALE-GRAY-TROUSER.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Red Poncho',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/RED-PONCHO.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Tribal',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/TRIBAL.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'WOW Suit',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/WOW-SUIT.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Male White House',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/WHITE-HOUSE.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Female White House',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/WHITE-HOUSE-FEMALE.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Peach Pants',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/PEACH-PANTS.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Tinkerbelt',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/TINKERBELT.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Shiny Pants',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/SHINY-PANTS.png',
      category: WardrobeCategory.MEN,
      maxnumberofItem: 30,
    ),
    Wardrobe(
      wardrobeName: 'Cityhall Jumper',
      wardrobeDescription: 'Blue PoloShirt by Koro Seraphim',
      wardrobeImagePath: 'assets/images/wardrobe/CITY-HALL-JUMPER.png',
      category: WardrobeCategory.WOMEN,
      maxnumberofItem: 30,
    ),
  ];

  //Getters
  List<Wardrobe> get menu => _menu;

  List<Wardrobe> generateWardrobeList() {
    return _menu
        .map((item) => Wardrobe(
              wardrobeName: item.wardrobeName,
              wardrobeDescription: item.wardrobeDescription,
              wardrobeImagePath: item.wardrobeImagePath,
              category: item.category,
              maxnumberofItem: item.maxnumberofItem,
            ))
        .toList();
  }
}
