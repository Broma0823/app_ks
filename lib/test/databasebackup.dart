
// import 'package:app/components/buttons/borrow_button.dart';
// import 'package:app/components/textfields/my_borrower_textfield.dart';
// import 'package:app/models/item/instrumentlist.dart';
// import 'package:app/models/kstransactions/ks_transaction_instrument.dart';
// import 'package:app/models/transactionlist/instrument_transactionlist.dart';
// import 'package:app/test/databaseservice.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:random_string/random_string.dart';

// class MyInstrumentDescPage extends StatefulWidget {
//   final Instrument instrument;

//   const MyInstrumentDescPage({
//     super.key,
//     required this.instrument,
//   });

//   @override
//   State<MyInstrumentDescPage> createState() => _MyInstrumentDescPageState();
// }

// class _MyInstrumentDescPageState extends State<MyInstrumentDescPage> {
//   final db = DatabaseService();
//   int selectedNumber = 1;
//   final nameController = TextEditingController();
//   final phoneNumberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // final db = DatabaseService();
//     final List<int> numbers = List.generate(
//         widget.instrument.instrumentmaxnumberofItem, (index) => index + 1);
//     return Consumer<KSTransactionInstrument>(
//       builder: (context, instrumenttransactionvalue, child) => Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text(widget.instrument.instrumentName),
//         ),
//         body: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               children: [
//                 Image.asset(
//                   widget.instrument.instrumentImagePath,
//                   height: 200,
//                 ),
//                 Text(
//                   widget.instrument.instrumentName,
//                   style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 //NAME OF BORROWER
//                 MyBorrowTextField(
//                   controller: nameController,
//                   hintText: "Name of Borrower",
//                   obscureText: false,
//                 ),
              

//                 //ITEM SELECTION
                

//                 //SIZED BOX

//                 const SizedBox(
//                   height: 20,
//                 ),

//                 //BORROW RETURN BUTTONS
//                 MyBorrowButton(
//                   buttonText: 'Borrow',
//                   onTap: () async {
                    
//       final TransactionItemInstrument instrumenttransaction =
//           TransactionItemInstrument(
//         instrumenItemName: widget.instrument.instrumentName,
//         instrumentItemNumber: selectedNumber.toString(),
//         instrumentnameOfBorrower: nameController.text,
//         instrumentphoneNumber: phoneNumberController.text,
//         instrumentDateBorrowed: borrowedDate.toString(),
//         instrumentImagePath_trans: widget.instrument.instrumentImagePath,
//         instrumentDateDue: returnDate.toString(),
//         id: randomAlphaNumeric(10),
//         instrumentlastClicked: DateTime.now(),
//         isBorrowed: true,
//       );

//       //ADD TO TRANSACTION LIST
//       await db.saveTransactionInstrument(instrumenttransaction);
//       // ignore: use_build_context_synchronously

//       //ADD TO TRANSACTION VALUE
//       final TransactionValue = context.read<KSTransactionInstrument>();
//       TransactionValue.add(
//         instrumenttransaction,
//       );
                    
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
