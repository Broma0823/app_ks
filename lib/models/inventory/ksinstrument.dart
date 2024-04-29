import 'package:app/models/item/instrumentlist.dart';
import 'package:flutter/material.dart';

class KSInstrument extends ChangeNotifier {
  final List<Instrument> _menu = [
    //Poloshirt

    Instrument(
      instrumentName: 'Piano',
      instrumentDescription: 'Blue PoloShirt by Koro Seraphim',
      instrumentImagePath: 'assets/images/instruments/PIANO.png',
      instrumentCategory: InstrumentCategory.INSTRUMENT,
      instrumentmaxnumberofItem: 1,
    ),
    Instrument(
      instrumentName: 'LAZER Maracas',
      instrumentDescription: 'Blue PoloShirt by Koro Seraphim',
      instrumentImagePath: 'assets/images/instruments/LAZER-MARACAS.png',
      instrumentCategory: InstrumentCategory.INSTRUMENT,
      instrumentmaxnumberofItem: 1,
    ),
    Instrument(
      instrumentName: 'Djembe',
      instrumentDescription: 'Blue PoloShirt by Koro Seraphim',
      instrumentImagePath: 'assets/images/instruments/DJEMBE.png',
      instrumentCategory: InstrumentCategory.INSTRUMENT,
      instrumentmaxnumberofItem: 1,
    ),
    Instrument(
      instrumentName: 'Blue Shaker',
      instrumentDescription: 'Blue PoloShirt by Koro Seraphim',
      instrumentImagePath: 'assets/images/instruments/BLUE-SHAKER.png',
      instrumentCategory: InstrumentCategory.INSTRUMENT,
      instrumentmaxnumberofItem: 1,
    ),
    Instrument(
      instrumentName: 'JBL Partybox Speaker',
      instrumentDescription: 'Blue PoloShirt by Koro Seraphim',
      instrumentImagePath: 'assets/images/instruments/JBL-PARTYBOX-SPEAKER.png',
      instrumentCategory: InstrumentCategory.INSTRUMENT,
      instrumentmaxnumberofItem: 1,
    ),
  ];
  //Getters
  List<Instrument> get menu => _menu;

  List<Instrument> generateInstrumentList() {
    return _menu
        .map((item) => Instrument(
              instrumentName: item.instrumentName,
              instrumentDescription: item.instrumentDescription,
              instrumentImagePath: item.instrumentImagePath,
              instrumentCategory: item.instrumentCategory,
              instrumentmaxnumberofItem: item.instrumentmaxnumberofItem,
            ))
        .toList();
  }
}
