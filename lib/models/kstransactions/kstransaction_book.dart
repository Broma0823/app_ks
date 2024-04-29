import 'package:app/models/transactionlist/book_transactionlist.dart';
import 'package:flutter/material.dart';

class KSTransactionBook extends ChangeNotifier {
  final List<TransactionItemBook> booktransactions = [];

  void add(TransactionItemBook item) {
    booktransactions.add(item);
    notifyListeners();
  }

  void removeItem(TransactionItemBook item) {
    booktransactions.remove(item);
    notifyListeners();
  }
}
