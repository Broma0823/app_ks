import 'package:flutter/material.dart';

class BorrowReturnPage extends StatefulWidget {
  final String shirt;
  final List<String> transactions;

  const BorrowReturnPage({
    super.key,
    required this.shirt,
    required this.transactions,
  });

  @override
  _BorrowReturnPageState createState() => _BorrowReturnPageState();
}

class _BorrowReturnPageState extends State<BorrowReturnPage> {
  DateTime selectedDate = DateTime.now();
  String shirtStatus = 'Available';
  TextEditingController nameController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.shirt} Page'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Enter your name",
            ),
          ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select date'),
          ),
          Text('Selected date: ${selectedDate.toString()}'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                shirtStatus = 'Borrowed';
                widget.transactions.add(
                    '${nameController.text} borrowed ${widget.shirt} on ${selectedDate.toString()}');
              });
            },
            child: const Text('Borrow'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                shirtStatus = 'Returned';
                widget.transactions.add(
                    '${nameController.text} returned ${widget.shirt} on ${selectedDate.toString()}');
              });
            },
            child: const Text('Return'),
          ),
          Text('Shirt status: $shirtStatus'),
        ],
      ),
    );
  }
}
