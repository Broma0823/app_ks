import 'package:app/models/transactionlist/accesories_transactionlist.dart';
import 'package:flutter/material.dart';

class KSTransactionAccesories extends ChangeNotifier {
  final List<TransactionItemAccesories> accesoriestransactions = [];

  void add(TransactionItemAccesories item) {
    accesoriestransactions.add(item);
    notifyListeners();
  }

  void removeItem(TransactionItemAccesories item) {
    accesoriestransactions.remove(item);
    notifyListeners();
  }
}
