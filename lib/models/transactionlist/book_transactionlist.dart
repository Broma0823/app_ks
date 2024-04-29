// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionItemBook {
  final String bookItemName;
  final String bookItemNumber;
  final String booknameOfBorrower;
  final String bookDateBorrowed;
  final String bookDateDue;
  final String bookImagePath_trans;
  final String id;
  final DateTime booklastClicked;

  TransactionItemBook({
    required this.bookItemName,
    required this.bookItemNumber,
    required this.booknameOfBorrower,
    required this.bookDateBorrowed,
    required this.bookDateDue,
    required this.bookImagePath_trans,
    required this.id,
    required this.booklastClicked,
  });

  TransactionItemBook copyWith({
    String? bookItemName,
    String? bookItemNumber,
    String? booknameOfBorrower,
    String? bookDateBorrowed,
    String? bookDateDue,
    String? bookImagePath_trans,
    String? id,
    DateTime? booklastClicked,
  }) {
    return TransactionItemBook(
      bookItemName: bookItemName ?? this.bookItemName,
      bookItemNumber: bookItemNumber ?? this.bookItemNumber,
      booknameOfBorrower: booknameOfBorrower ?? this.booknameOfBorrower,
      bookDateBorrowed: bookDateBorrowed ?? this.bookDateBorrowed,
      bookDateDue: bookDateDue ?? this.bookDateDue,
      bookImagePath_trans: bookImagePath_trans ?? this.bookImagePath_trans,
      id: id ?? this.id,
      booklastClicked: booklastClicked ?? this.booklastClicked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookItemName': bookItemName,
      'bookItemNumber': bookItemNumber,
      'booknameOfBorrower': booknameOfBorrower,
      'bookDateBorrowed': bookDateBorrowed,
      'bookDateDue': bookDateDue,
      'bookImagePath_trans': bookImagePath_trans,
      'id': id,
      'booklastClicked': booklastClicked,
    };
  }

  factory TransactionItemBook.fromMap(Map<String, dynamic> map) {
    return TransactionItemBook(
      bookItemName: map['bookItemName'] as String,
      bookItemNumber: map['bookItemNumber'] as String,
      booknameOfBorrower: map['booknameOfBorrower'] as String,
      bookDateBorrowed: map['bookDateBorrowed'] as String,
      bookDateDue: map['bookDateDue'] as String,
      bookImagePath_trans: map['bookImagePath_trans'] as String,
      id: map['id'] as String,
      booklastClicked: (map['instrumentlastClicked'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionItemBook.fromJson(String source) =>
      TransactionItemBook.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionItemBook(bookItemName: $bookItemName, bookItemNumber: $bookItemNumber, booknameOfBorrower: $booknameOfBorrower, bookDateBorrowed: $bookDateBorrowed, bookDateDue: $bookDateDue, bookImagePath_trans: $bookImagePath_trans, id: $id, booklastClicked: $booklastClicked)';
  }

  @override
  bool operator ==(covariant TransactionItemBook other) {
    if (identical(this, other)) return true;

    return other.bookItemName == bookItemName &&
        other.bookItemNumber == bookItemNumber &&
        other.booknameOfBorrower == booknameOfBorrower &&
        other.bookDateBorrowed == bookDateBorrowed &&
        other.bookDateDue == bookDateDue &&
        other.bookImagePath_trans == bookImagePath_trans &&
        other.id == id &&
        other.booklastClicked == booklastClicked;
  }

  @override
  int get hashCode {
    return bookItemName.hashCode ^
        bookItemNumber.hashCode ^
        booknameOfBorrower.hashCode ^
        bookDateBorrowed.hashCode ^
        bookDateDue.hashCode ^
        bookImagePath_trans.hashCode ^
        id.hashCode ^
        booklastClicked.hashCode;
  }
}
