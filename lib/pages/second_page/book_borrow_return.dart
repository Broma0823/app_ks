import 'package:app/components/buttons/borrow_button.dart';
import 'package:app/components/textfields/my_borrower_textfield.dart';
import 'package:app/models/item/booklist.dart';
import 'package:app/models/kstransactions/kstransaction_book.dart';
import 'package:app/models/transactionlist/book_transactionlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class MyBookDescPage extends StatefulWidget {
  final Book book;
  const MyBookDescPage({
    super.key,
    required this.book,
  });

  @override
  State<MyBookDescPage> createState() => _MyBookDescPageState();
}

class _MyBookDescPageState extends State<MyBookDescPage> {
  int selectedNumber = 1;
  final nameController = TextEditingController();

  //DATE FUNCTION
  DateTime borrowedDate = DateTime.now();
  DateTime returnDate = DateTime.now();

  //Borrow DateTime
  Future<void> _borrowDate(BuildContext context) async {
    final DateTime? pickedBorrow = await showDatePicker(
      context: context,
      initialDate: borrowedDate,
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2101),
    );
    if (pickedBorrow != null && pickedBorrow != borrowedDate) {
      setState(() {
        borrowedDate = pickedBorrow;
      });
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
      setState(() {
        returnDate = pickedReturn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<int> numbers =
        List.generate(widget.book.maxnumberofItem, (index) => index + 1);

    return Consumer<KSTransactionBook>(
      builder: (context, booktransactionvalue, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                widget.book.bookImagePath,
                height: 200,
              ),
              Text(
                widget.book.bookName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              //NAME OF BORROWER
              MyBorrowTextField(
                controller: nameController,
                hintText: "Name of Borrower",
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
                        borrowedDate.toString(),
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
                        returnDate.toString(),
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
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
                height: 50,
              ),

              //BORROW RETURN BUTTONS
              MyBorrowButton(
                buttonText: "Borrow",
                onTap: () {
                  final TransactionItemBook booktransaction =
                      TransactionItemBook(
                    bookItemName: widget.book.bookName,
                    bookItemNumber: selectedNumber.toString(),
                    booknameOfBorrower: nameController.text,
                    bookDateBorrowed: borrowedDate.toString(),
                    bookImagePath_trans: widget.book.bookImagePath,
                    bookDateDue: returnDate.toString(),
                    id: randomAlphaNumeric(10),
                    booklastClicked: DateTime.now(),
                  );

                  //await db.save

                  final TransactionValue = context.read<KSTransactionBook>();
                  TransactionValue.add(
                    booktransaction,
                  );

                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
