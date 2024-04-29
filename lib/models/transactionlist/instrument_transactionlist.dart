// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionItemInstrument {
  final String instrumenItemName;
  final String instrumentItemNumber;
  final String instrumentnameOfBorrower;
  final String instrumentphoneNumber;
  final String instrumentDateBorrowed;
  final String instrumentDateDue;
  final String instrumentImagePath_trans;
  final String id;
  final DateTime instrumentlastClicked;
  bool isBorrowed;

  TransactionItemInstrument({
    required this.instrumenItemName,
    required this.instrumentItemNumber,
    required this.instrumentnameOfBorrower,
    required this.instrumentphoneNumber,
    required this.instrumentDateBorrowed,
    required this.instrumentDateDue,
    required this.instrumentImagePath_trans,
    required this.id,
    required this.instrumentlastClicked,
    required this.isBorrowed,
  });

  TransactionItemInstrument copyWith({
    String? instrumenItemName,
    String? instrumentItemNumber,
    String? instrumentnameOfBorrower,
    String? instrumentphoneNumber,
    String? instrumentDateBorrowed,
    String? instrumentDateDue,
    String? instrumentImagePath_trans,
    String? id,
    DateTime? instrumentlastClicked,
    bool? isBorrowed,
  }) {
    return TransactionItemInstrument(
      instrumenItemName: instrumenItemName ?? this.instrumenItemName,
      instrumentItemNumber: instrumentItemNumber ?? this.instrumentItemNumber,
      instrumentnameOfBorrower:
          instrumentnameOfBorrower ?? this.instrumentnameOfBorrower,
      instrumentphoneNumber:
          instrumentphoneNumber ?? this.instrumentphoneNumber,
      instrumentDateBorrowed:
          instrumentDateBorrowed ?? this.instrumentDateBorrowed,
      instrumentDateDue: instrumentDateDue ?? this.instrumentDateDue,
      instrumentImagePath_trans:
          instrumentImagePath_trans ?? this.instrumentImagePath_trans,
      id: id ?? this.id,
      instrumentlastClicked:
          instrumentlastClicked ?? this.instrumentlastClicked,
      isBorrowed: isBorrowed ?? this.isBorrowed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'instrumenItemName': instrumenItemName,
      'instrumentItemNumber': instrumentItemNumber,
      'instrumentnameOfBorrower': instrumentnameOfBorrower,
      'instrumentphoneNumber': instrumentphoneNumber,
      'instrumentDateBorrowed': instrumentDateBorrowed,
      'instrumentDateDue': instrumentDateDue,
      'instrumentImagePath_trans': instrumentImagePath_trans,
      'id': id,
      'instrumentlastClicked': instrumentlastClicked,
      'isBorrowed': isBorrowed,
    };
  }

  factory TransactionItemInstrument.fromMap(
      Map<String, dynamic> map, String id) {
    return TransactionItemInstrument(
      instrumenItemName: map['instrumenItemName'] as String,
      instrumentItemNumber: map['instrumentItemNumber'] as String,
      instrumentnameOfBorrower: map['instrumentnameOfBorrower'] as String,
      instrumentphoneNumber: map['instrumentphoneNumber'] as String,
      instrumentDateBorrowed: map['instrumentDateBorrowed'] as String,
      instrumentDateDue: map['instrumentDateDue'] as String,
      instrumentImagePath_trans: map['instrumentImagePath_trans'] as String,
      id: id,
      instrumentlastClicked:
          (map['instrumentlastClicked'] as Timestamp).toDate(),
      isBorrowed: map['isBorrowed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionItemInstrument.fromJson(String source) =>
      TransactionItemInstrument.fromMap(
          json.decode(source) as Map<String, dynamic>, source);

  @override
  String toString() {
    return 'TransactionItemInstrument(instrumenItemName: $instrumenItemName, instrumentItemNumber: $instrumentItemNumber, instrumentnameOfBorrower: $instrumentnameOfBorrower, instrumentphoneNumber: $instrumentphoneNumber, instrumentDateBorrowed: $instrumentDateBorrowed, instrumentDateDue: $instrumentDateDue, instrumentImagePath_trans: $instrumentImagePath_trans, id: $id, instrumentlastClicked: $instrumentlastClicked, isBorrowed: $isBorrowed)';
  }

  @override
  bool operator ==(covariant TransactionItemInstrument other) {
    if (identical(this, other)) return true;

    return other.instrumenItemName == instrumenItemName &&
        other.instrumentItemNumber == instrumentItemNumber &&
        other.instrumentnameOfBorrower == instrumentnameOfBorrower &&
        other.instrumentphoneNumber == instrumentphoneNumber &&
        other.instrumentDateBorrowed == instrumentDateBorrowed &&
        other.instrumentDateDue == instrumentDateDue &&
        other.instrumentImagePath_trans == instrumentImagePath_trans &&
        other.id == id &&
        other.instrumentlastClicked == instrumentlastClicked &&
        other.isBorrowed == isBorrowed;
  }

  @override
  int get hashCode {
    return instrumenItemName.hashCode ^
        instrumentItemNumber.hashCode ^
        instrumentnameOfBorrower.hashCode ^
        instrumentphoneNumber.hashCode ^
        instrumentDateBorrowed.hashCode ^
        instrumentDateDue.hashCode ^
        instrumentImagePath_trans.hashCode ^
        id.hashCode ^
        instrumentlastClicked.hashCode ^
        isBorrowed.hashCode;
  }
}
