import 'package:app/models/transactionlist/accesories_transactionlist.dart';
import 'package:app/models/transactionlist/instrument_transactionlist.dart';
import 'package:app/models/transactionlist/wardrobe_transactionlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //WARDROBE COLLECTION REFERENCE
  final CollectionReference wardrobeCollection =
      FirebaseFirestore.instance.collection('wardrobe');

  //INSTRUMENT COLLECTION REFERENCE
  final CollectionReference instrumentCollection =
      FirebaseFirestore.instance.collection('instrument');

  //ACCESORIES COLLECTION REFERENCE
  final CollectionReference accesoriesCollection =
      FirebaseFirestore.instance.collection('accesories');

  //LIBRARY COLLECTION REFERECE
  final CollectionReference libraryCollection =
      FirebaseFirestore.instance.collection('library');

  //WARDROBE SAVE TRANSACTION
  Future<String> saveTransactionWardrobe(TransactionItem transaction) async {
    DocumentReference docRef =
        await wardrobeCollection.add(transaction.toMap());
    return docRef.id;
  }

  //INSTRUMENT SAVE TRANSACTION
  Future<String> saveTransactionInstrument(
      TransactionItemInstrument transaction) async {
    DocumentReference docRef =
        await instrumentCollection.add(transaction.toMap());
    return docRef.id;
  }

  //ACCESORIES SAVE TRANSACTION
  Future<String> saveTransactionAccesory(
      TransactionItemAccesories transaction) async {
    DocumentReference docRef =
        await accesoriesCollection.add(transaction.toMap());
    return docRef.id;
  }

  //LIBRARY SAVE TRANSACTION

  //LAST CLICKED FOR WARDROBE PAGE
  Future<void> updateLastWardrobe(String id) {
    return wardrobeCollection.doc(id).update({
      'wardrobelastClicked': Timestamp.now(),
    });
  }

  //LAST CLICKED FOR INSTRUMENT PAGE
  Future<void> updateLastInstrument(String id) {
    return instrumentCollection.doc(id).update({
      'instrumentlastClicked': Timestamp.now(),
    });
  }

  //LAST CLICKED FOR ACCESORIES PAGE
  Future<void> updateLastAccesories(String id) {
    return accesoriesCollection.doc(id).update({
      'accesorieslastClicked': Timestamp.now(),
    });
  }

  //LAST CLICKED FOR LIBRARY PAGE

  //BORROW FUNCTION FOR INSTRUMENT
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> updateBorrowStatus(String itemId, bool isBorrowed) async {
    await _db.collection('items').doc(itemId).update({
      'isBorrowed': isBorrowed,
    });
  }

  //RETURN FUNCTION FOR INSTRUMENT

  //WARDROBE DELETE TRANSACTION
  Future<void> deleteWardrobe(String id) {
    return wardrobeCollection.doc(id).delete();
  }

  //INSTRUMENT DELETE TRANSACTION
  Future<void> deleteInstrument(String id) {
    return instrumentCollection.doc(id).delete();
  }

  //ACCESORIES DELETE TRANSCATION
  Future<void> deleteAccesories(String id) {
    return accesoriesCollection.doc(id).delete();
  }

  //LIBRARY DELETE TRANSACTION

  //WARDROBE ITEM LIST
  Stream<List<TransactionItem>> getTransactionsWardrobe() {
    return wardrobeCollection
        .orderBy('wardrobelastClicked', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TransactionItem.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }

  //INSTRUMENT ITEM LIST
  Stream<List<TransactionItemInstrument>> getTransactionsInstrument() {
    return instrumentCollection
        .orderBy('instrumentlastClicked', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TransactionItemInstrument.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }

  //ACCESORY ITEM LIST
  Stream<List<TransactionItemAccesories>> getTransactionsAccesories() {
    return accesoriesCollection
        .orderBy('accesorieslastClicked', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TransactionItemAccesories.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }
}
