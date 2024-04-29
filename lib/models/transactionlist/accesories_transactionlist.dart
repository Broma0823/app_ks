// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionItemAccesories {
  final String accesoriesItemName;
  final String accesoriesItemNumber;
  final String accesoriesnameOfBorrower;
  final String accesoriesphoneNumber;
  final String accesoriesDateBorrowed;
  final String accesoriesDateDue;
  final String accesoriesImagePath_trans;
  final String id;
  final DateTime accesorieslastClicked;
  bool isBorrowed;

  TransactionItemAccesories({
    required this.accesoriesItemName,
    required this.accesoriesItemNumber,
    required this.accesoriesnameOfBorrower,
    required this.accesoriesphoneNumber,
    required this.accesoriesDateBorrowed,
    required this.accesoriesDateDue,
    required this.accesoriesImagePath_trans,
    required this.id,
    required this.accesorieslastClicked,
    required this.isBorrowed,
  });

  TransactionItemAccesories copyWith({
    String? accesoriesItemName,
    String? accesoriesItemNumber,
    String? accesoriesnameOfBorrower,
    String? accesoriesphoneNumber,
    String? accesoriesDateBorrowed,
    String? accesoriesDateDue,
    String? accesoriesImagePath_trans,
    String? id,
    DateTime? accesorieslastClicked,
    bool? isBorrowed,
  }) {
    return TransactionItemAccesories(
      accesoriesItemName: accesoriesItemName ?? this.accesoriesItemName,
      accesoriesItemNumber: accesoriesItemNumber ?? this.accesoriesItemNumber,
      accesoriesnameOfBorrower:
          accesoriesnameOfBorrower ?? this.accesoriesnameOfBorrower,
      accesoriesphoneNumber:
          accesoriesphoneNumber ?? this.accesoriesphoneNumber,
      accesoriesDateBorrowed:
          accesoriesDateBorrowed ?? this.accesoriesDateBorrowed,
      accesoriesDateDue: accesoriesDateDue ?? this.accesoriesDateDue,
      accesoriesImagePath_trans:
          accesoriesImagePath_trans ?? this.accesoriesImagePath_trans,
      id: id ?? this.id,
      accesorieslastClicked:
          accesorieslastClicked ?? this.accesorieslastClicked,
      isBorrowed: isBorrowed ?? this.isBorrowed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accesoriesItemName': accesoriesItemName,
      'accesoriesItemNumber': accesoriesItemNumber,
      'accesoriesnameOfBorrower': accesoriesnameOfBorrower,
      'accesoriesphoneNumber': accesoriesphoneNumber,
      'accesoriesDateBorrowed': accesoriesDateBorrowed,
      'accesoriesDateDue': accesoriesDateDue,
      'accesoriesImagePath_trans': accesoriesImagePath_trans,
      'id': id,
      'accesorieslastClicked': accesorieslastClicked,
      'isBorrowed': isBorrowed,
    };
  }

  factory TransactionItemAccesories.fromMap(
      Map<String, dynamic> map, String id) {
    return TransactionItemAccesories(
      accesoriesItemName: map['accesoriesItemName'] as String,
      accesoriesItemNumber: map['accesoriesItemNumber'] as String,
      accesoriesnameOfBorrower: map['accesoriesnameOfBorrower'] as String,
      accesoriesphoneNumber: map['accesoriesphoneNumber'] as String,
      accesoriesDateBorrowed: map['accesoriesDateBorrowed'] as String,
      accesoriesDateDue: map['accesoriesDateDue'] as String,
      accesoriesImagePath_trans: map['accesoriesImagePath_trans'] as String,
      id: id,
      accesorieslastClicked:
          (map['accesorieslastClicked'] as Timestamp).toDate(),
      isBorrowed: map['isBorrowed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionItemAccesories.fromJson(String source) =>
      TransactionItemAccesories.fromMap(
          json.decode(source) as Map<String, dynamic>, source);

  @override
  String toString() {
    return 'TransactionItemAccesories(accesoriesItemName: $accesoriesItemName, accesoriesItemNumber: $accesoriesItemNumber, accesoriesnameOfBorrower: $accesoriesnameOfBorrower, accesoriesphoneNumber: $accesoriesphoneNumber, accesoriesDateBorrowed: $accesoriesDateBorrowed, accesoriesDateDue: $accesoriesDateDue, accesoriesImagePath_trans: $accesoriesImagePath_trans, id: $id, accesorieslastClicked: $accesorieslastClicked, isBorrowed: $isBorrowed)';
  }

  @override
  bool operator ==(covariant TransactionItemAccesories other) {
    if (identical(this, other)) return true;

    return other.accesoriesItemName == accesoriesItemName &&
        other.accesoriesItemNumber == accesoriesItemNumber &&
        other.accesoriesnameOfBorrower == accesoriesnameOfBorrower &&
        other.accesoriesphoneNumber == accesoriesphoneNumber &&
        other.accesoriesDateBorrowed == accesoriesDateBorrowed &&
        other.accesoriesDateDue == accesoriesDateDue &&
        other.accesoriesImagePath_trans == accesoriesImagePath_trans &&
        other.id == id &&
        other.accesorieslastClicked == accesorieslastClicked &&
        other.isBorrowed == isBorrowed;
  }

  @override
  int get hashCode {
    return accesoriesItemName.hashCode ^
        accesoriesItemNumber.hashCode ^
        accesoriesnameOfBorrower.hashCode ^
        accesoriesphoneNumber.hashCode ^
        accesoriesDateBorrowed.hashCode ^
        accesoriesDateDue.hashCode ^
        accesoriesImagePath_trans.hashCode ^
        id.hashCode ^
        accesorieslastClicked.hashCode ^
        isBorrowed.hashCode;
  }
}
