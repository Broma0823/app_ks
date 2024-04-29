import 'package:app/models/transactionlist/instrument_transactionlist.dart';
import 'package:flutter/material.dart';

class KSTransactionInstrument extends ChangeNotifier {
  final List<TransactionItemInstrument> instrumentransactions = [];

  void add(TransactionItemInstrument item) {
    instrumentransactions.add(item);
    notifyListeners();
  }

  void removeItem(TransactionItemInstrument item) {
    instrumentransactions.remove(item);
    notifyListeners();
  }
}
