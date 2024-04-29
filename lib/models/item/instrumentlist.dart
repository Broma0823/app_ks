class Instrument {
  final String instrumentName;
  final String instrumentDescription;
  final String instrumentImagePath;
  final InstrumentCategory instrumentCategory;
  final int instrumentmaxnumberofItem;

  Instrument({
    required this.instrumentName,
    required this.instrumentDescription,
    required this.instrumentImagePath,
    required this.instrumentCategory,
    required this.instrumentmaxnumberofItem,
  });
}

enum InstrumentCategory {
  INSTRUMENT,
}
