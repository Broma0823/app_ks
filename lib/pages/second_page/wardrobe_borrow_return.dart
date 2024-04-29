import 'package:app/components/buttons/borrow_button_test.dart';
import 'package:app/components/textfields/my_borrower_textfield.dart';
import 'package:app/models/item/wardrobelist.dart';
import 'package:app/models/kstransactions/kstransaction_wardrobe.dart';
import 'package:app/models/transactionlist/wardrobe_transactionlist.dart';
import 'package:app/test/databaseservice.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class MyWardrobeDescPage extends StatefulWidget {
  final Wardrobe wardrobe;
  const MyWardrobeDescPage({
    super.key,
    required this.wardrobe,
  });

  @override
  State<MyWardrobeDescPage> createState() => _MyWardrobeDescPageState();
}

class _MyWardrobeDescPageState extends State<MyWardrobeDescPage> {
  //DATABASE
  final db = DatabaseService();
  //SELECTED NUMBER INDEX
  int selectedNumber = 1;

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  bool isValidPhoneNumber(String phoneNumber) {
    bool regExp = RegExp(r"^[0-9]{10}").hasMatch(phoneNumber);
    bool length = phoneNumber.length == 11;
    return regExp && length;
  }

  //DATE FUNCTION
  DateTime borrowedDate = DateTime.now();
  DateTime returnDate = DateTime.now();

  //DATE FORMAT FUNCTION
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('MMMM dd, yyyy hh:mm a');
    return formatter.format(date);
  }

  //Borrow DateTime
  Future<void> _borrowDate(BuildContext context) async {
    final DateTime? pickedBorrow = await showDatePicker(
      context: context,
      initialDate: borrowedDate,
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2101),
    );
    if (pickedBorrow != null && pickedBorrow != borrowedDate) {
      // ignore: use_build_context_synchronously
      final TimeOfDay? pickedBorrowTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(pickedBorrow),
      );
      if (pickedBorrowTime != null) {
        final DateTime pickedDate = DateTime(
          pickedBorrow.year,
          pickedBorrow.month,
          pickedBorrow.day,
          pickedBorrowTime.hour,
          pickedBorrowTime.minute,
        );

        setState(() {
          borrowedDate = pickedDate;
        });
      }
    }
  }

  //Return DateTime
  Future<void> _returnDate(BuildContext context) async {
    final DateTime? pickedReturn = await showDatePicker(
      context: context,
      initialDate: returnDate,
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2101),
    );
    if (pickedReturn != null && pickedReturn != returnDate) {
      // ignore: use_build_context_synchronously
      final TimeOfDay? pickedReturnTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(pickedReturn),
      );
      if (pickedReturnTime != null) {
        final DateTime pickedReturnDate = DateTime(
          pickedReturn.year,
          pickedReturn.month,
          pickedReturn.day,
          pickedReturnTime.hour,
          pickedReturnTime.minute,
        );
        setState(() {
          returnDate = pickedReturnDate;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<int> numbers =
        List.generate(widget.wardrobe.maxnumberofItem, (index) => index + 1);

    return Consumer<KSTransaction>(
      builder: (context, transactionvalue, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(widget.wardrobe.wardrobeName),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  widget.wardrobe.wardrobeImagePath,
                  height: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.wardrobe.wardrobeName.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 10,
                ),

                //NAME OF BORROWER
                MyBorrowTextField(
                  controller: nameController,
                  hintText: "Name",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyBorrowTextField(
                  controller: phoneNumberController,
                  hintText: "Phone Number",
                  obscureText: false,
                ),
                //SIZED BOX
                const SizedBox(
                  height: 20,
                ),
                //DATE SELECTION
                SizedBox(
                  width: 370,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black)),
                    onPressed: () => _borrowDate(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Borrow Date: '),
                        Text(
                          formatDate(borrowedDate).toString(),
                          style: const TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
                //SIZED BOX
                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  width: 370,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                    ),
                    onPressed: () => _returnDate(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Return Date: '),
                        Text(
                          formatDate(returnDate).toString(),
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 280.0),
                  child: Text("Item Number:"),
                ),

                //ITEM SELECTION
                Padding(
                  padding: const EdgeInsets.only(
                    right: 300.0,
                    left: 20,
                  ),
                  child: DropdownButtonFormField<int>(
                    isExpanded: false,
                    value: selectedNumber,
                    onChanged: (newValue) {
                      setState(() {
                        selectedNumber = newValue!;
                      });
                    },
                    items: numbers.map(
                      (number) {
                        return DropdownMenuItem<int>(
                          value: number,
                          child: Text(number.toString()),
                        );
                      },
                    ).toList(),
                  ),
                ),

                //SIZED BOX

                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<List<TransactionItem>>(
                  stream: DatabaseService().getTransactionsWardrobe(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<TransactionItem> transactions = snapshot.data!;
                      bool isBorrowed = transactions.any((transaction) =>
                          transaction.itemName ==
                              widget.wardrobe.wardrobeName &&
                          transaction.isBorrowed &&
                          transaction.itemNumber == selectedNumber.toString());

                      return MyBorrowButtonBool(
                        buttonText: isBorrowed ? 'Unavailable' : 'Borrow',
                        color: isBorrowed ? Colors.grey.shade400 : Colors.black,
                        onTap: isBorrowed
                            ? null
                            : () async {
                                String nameValidator = nameController.text;
                                String phoneNumberValidator =
                                    phoneNumberController.text;

                                if (nameValidator.isEmpty &&
                                    phoneNumberValidator.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please input a  valid name and phone number'),
                                      duration: Duration(milliseconds: 500),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else if (nameValidator.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Please input a valid name',
                                      ),
                                      duration: Duration(milliseconds: 500),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else if (phoneNumberValidator.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please input a valid phone number'),
                                      duration: Duration(milliseconds: 500),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else if (!isValidPhoneNumber(
                                    phoneNumberController.text)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please input a valid phone number'),
                                      duration: Duration(milliseconds: 500),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else {
                                  final TransactionItem transaction =
                                      TransactionItem(
                                    itemName: widget.wardrobe.wardrobeName,
                                    itemNumber: selectedNumber.toString(),
                                    nameOfBorrower: nameController.text,
                                    phoneNumber: phoneNumberController.text,
                                    dateBorrowed: borrowedDate.toString(),
                                    imagePath_trans:
                                        widget.wardrobe.wardrobeImagePath,
                                    dateDue: returnDate.toString(),
                                    id: randomAlphaNumeric(10),
                                    wardrobelastClicked: DateTime.now(),
                                    isBorrowed: true,
                                  );

                                  //ADD TO TRANSACTION LIST
                                  await db.saveTransactionWardrobe(transaction);

                                  //ADD TO TRANSACTION VALUE
                                  final TransactionValue =
                                      context.read<KSTransaction>();
                                  TransactionValue.add(
                                    transaction,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Item Borrowed Successfully'),
                                      duration: Duration(milliseconds: 500),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  Navigator.pop(context);
                                }
                              },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    // The data is still loading
                    return const CircularProgressIndicator();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
