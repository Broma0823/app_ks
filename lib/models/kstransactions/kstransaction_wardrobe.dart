import 'package:app/models/transactionlist/wardrobe_transactionlist.dart';
import 'package:flutter/material.dart';

class KSTransaction extends ChangeNotifier {
  final List<TransactionItem> transactions = [];

  void add(TransactionItem item) {
    transactions.add(item);
    notifyListeners();
  }

  void removeItem(TransactionItem item) {
    transactions.remove(item);
    notifyListeners();
  }
}
