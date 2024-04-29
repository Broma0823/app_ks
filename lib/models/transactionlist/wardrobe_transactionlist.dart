// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionItem {
  final String itemName;
  final String itemNumber;
  final String nameOfBorrower;
  final String phoneNumber;
  final String dateBorrowed;
  final String dateDue;
  final String imagePath_trans;
  final String id;
  final DateTime wardrobelastClicked;
  bool isBorrowed;

  TransactionItem({
    required this.itemName,
    required this.itemNumber,
    required this.nameOfBorrower,
    required this.phoneNumber,
    required this.dateBorrowed,
    required this.dateDue,
    required this.imagePath_trans,
    required this.id,
    required this.wardrobelastClicked,
    required this.isBorrowed,
  });

  TransactionItem copyWith({
    String? itemName,
    String? itemNumber,
    String? nameOfBorrower,
    String? phoneNumber,
    String? dateBorrowed,
    String? dateDue,
    String? imagePath_trans,
    String? id,
    DateTime? wardrobelastClicked,
    bool? isBorrowed,
  }) {
    return TransactionItem(
      itemName: itemName ?? this.itemName,
      itemNumber: itemNumber ?? this.itemNumber,
      nameOfBorrower: nameOfBorrower ?? this.nameOfBorrower,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateBorrowed: dateBorrowed ?? this.dateBorrowed,
      dateDue: dateDue ?? this.dateDue,
      imagePath_trans: imagePath_trans ?? this.imagePath_trans,
      id: id ?? this.id,
      wardrobelastClicked: wardrobelastClicked ?? this.wardrobelastClicked,
      isBorrowed: isBorrowed ?? this.isBorrowed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemName': itemName,
      'itemNumber': itemNumber,
      'nameOfBorrower': nameOfBorrower,
      'phoneNumber': phoneNumber,
      'dateBorrowed': dateBorrowed,
      'dateDue': dateDue,
      'imagePath_trans': imagePath_trans,
      'id': id,
      'wardrobelastClicked': wardrobelastClicked,
      'isBorrowed': isBorrowed,
    };
  }

  factory TransactionItem.fromMap(Map<String, dynamic> map, String id) {
    return TransactionItem(
      itemName: map['itemName'] as String,
      itemNumber: map['itemNumber'] as String,
      nameOfBorrower: map['nameOfBorrower'] as String,
      phoneNumber: map['phoneNumber'] as String,
      dateBorrowed: map['dateBorrowed'] as String,
      dateDue: map['dateDue'] as String,
      imagePath_trans: map['imagePath_trans'] as String,
      id: id,
      wardrobelastClicked: (map['wardrobelastClicked'] as Timestamp).toDate(),
      isBorrowed: map['isBorrowed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionItem.fromJson(String source) => TransactionItem.fromMap(
      json.decode(source) as Map<String, dynamic>, source);

  @override
  String toString() {
    return 'TransactionItem(itemName: $itemName, itemNumber: $itemNumber, nameOfBorrower: $nameOfBorrower, phoneNumber: $phoneNumber, dateBorrowed: $dateBorrowed, dateDue: $dateDue, imagePath_trans: $imagePath_trans, id: $id, wardrobelastClicked: $wardrobelastClicked, isBorrowed: $isBorrowed)';
  }

  @override
  bool operator ==(covariant TransactionItem other) {
    if (identical(this, other)) return true;

    return other.itemName == itemName &&
        other.itemNumber == itemNumber &&
        other.nameOfBorrower == nameOfBorrower &&
        other.phoneNumber == phoneNumber &&
        other.dateBorrowed == dateBorrowed &&
        other.dateDue == dateDue &&
        other.imagePath_trans == imagePath_trans &&
        other.id == id &&
        other.wardrobelastClicked == wardrobelastClicked &&
        other.isBorrowed == isBorrowed;
  }

  @override
  int get hashCode {
    return itemName.hashCode ^
        itemNumber.hashCode ^
        nameOfBorrower.hashCode ^
        phoneNumber.hashCode ^
        dateBorrowed.hashCode ^
        dateDue.hashCode ^
        imagePath_trans.hashCode ^
        id.hashCode ^
        wardrobelastClicked.hashCode ^
        isBorrowed.hashCode;
  }
}
