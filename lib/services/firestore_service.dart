import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference transactionDB =
      FirebaseFirestore.instance.collection('transaction');

  Future<void> saveTransactionToDatabase(String transact) async {
    await transactionDB.add(
      {
        'Date': DateTime.now(),
      },
    );
  }

  Stream<QuerySnapshot> getTransactionStream() {
    final transactionSream =
        transactionDB.orderBy('Date', descending: true).snapshots();

    return transactionSream;
  }
}
