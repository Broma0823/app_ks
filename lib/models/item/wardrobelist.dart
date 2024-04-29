class Wardrobe {
  final String wardrobeName;
  final String wardrobeDescription;
  final String wardrobeImagePath;
  final WardrobeCategory category;
  final int maxnumberofItem;

  Wardrobe({
    required this.wardrobeName,
    required this.wardrobeDescription,
    required this.wardrobeImagePath,
    required this.category,
    required this.maxnumberofItem,
  });
}

enum WardrobeCategory {
  MEN,
  WOMEN,
}
