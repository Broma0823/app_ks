class Accesories {
  final String accesoriesName;
  final String accesoriesDescription;
  final String accesoriesImagePath;
  final AccesoriesCategory category;
  final int maxnumberofItem;

  Accesories({
    required this.accesoriesName,
    required this.accesoriesDescription,
    required this.accesoriesImagePath,
    required this.category,
    required this.maxnumberofItem,
  });
}

enum AccesoriesCategory {
  EARRINGS,
  NECKLACE,
  HAIR,
  COSTUME,
}
