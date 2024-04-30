import 'package:app/models/transactionlist/accesories_transactionlist.dart';
import 'package:app/models/transactionlist/instrument_transactionlist.dart';
import 'package:app/models/transactionlist/wardrobe_transactionlist.dart';
import 'package:app/test/databaseservice.dart';
import 'package:app/test/functions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTransactionPageCategorizedTest extends StatefulWidget {
  const MyTransactionPageCategorizedTest({super.key});

  @override
  _MyTransactionPageCategorizedTestState createState() =>
      _MyTransactionPageCategorizedTestState();
}

class _MyTransactionPageCategorizedTestState
    extends State<MyTransactionPageCategorizedTest> {
  //DATABASE SERVCE
  final db = DatabaseService();

  //DATE FORMATTER
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('MMMM dd, yyyy hh:mm a');
    return formatter.format(date);
  }

  //
  BorrowReturnFunction transFunction = BorrowReturnFunction();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Borrowed Items"),
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                  child: Text(
                    "WARDROBE",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Tab(
                  child: Text(
                    "INSTRUMENTS",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Tab(
                  child: Text(
                    "ACCESORIES",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //WARDROBE TAB
                  StreamBuilder<List<TransactionItem>>(
                    stream: db.getTransactionsWardrobe(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final transactions = snapshot.data ?? [];

                      return transactions.isEmpty
                          ? const Center(child: Text('No transactions'))
                          : ListView.builder(
                              itemCount: transactions.length,
                              itemBuilder: (context, index) {
                                final transaction = transactions[index];

                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                              dialogBackgroundColor:
                                                  Colors.grey.shade300),
                                          child: AlertDialog(
                                            title: const Text(
                                              'Details',
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  transaction.itemName
                                                      .toUpperCase(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                Text(
                                                  'borrower: ${transaction.nameOfBorrower}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Image.asset(transaction
                                                    .imagePath_trans),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                    'Borrowed Date: ${formatDate(
                                                  DateTime.parse(
                                                      transaction.dateBorrowed),
                                                )}\nDue Date: ${formatDate(
                                                  DateTime.parse(
                                                      transaction.dateDue),
                                                )}\nPhone Number: ${transaction.phoneNumber}'),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.black),
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.black),
                                                child: Text(
                                                  'Return Item',
                                                ),
                                                onPressed: () async {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          '${transaction.itemName} Returned Successfully'),
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      backgroundColor:
                                                          Colors.green,
                                                    ),
                                                  );
                                                  Navigator.of(context).pop();

                                                  await db.updateLastWardrobe(
                                                      transaction.id);
                                                  await db.deleteWardrobe(
                                                      transaction.id);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Card(
                                    color: Theme.of(context).cardTheme.color,
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsetsDirectional.only(
                                        bottom: 10,
                                        top: 10,
                                      ),

                                      //image
                                      leading: Image.asset(
                                          transaction.imagePath_trans),
                                      //text
                                      title: Text.rich(
                                        TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  ' ${transaction.itemName} # ${transaction.itemNumber}',
                                            ),
                                            const TextSpan(
                                              text: ' borrowed by ',
                                            ),
                                            TextSpan(
                                              text: transaction.nameOfBorrower,
                                              style: const TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                  //INSTRUMENT TAB
                  StreamBuilder<List<TransactionItemInstrument>>(
                    stream: db.getTransactionsInstrument(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final transactions = snapshot.data ?? [];

                      return transactions.isEmpty
                          ? const Center(child: Text("No transactions"))
                          : ListView.builder(
                              itemCount: transactions.length,
                              itemBuilder: (context, index) {
                                final transaction = transactions[index];

                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                              dialogBackgroundColor:
                                                  Colors.grey.shade300),
                                          child: AlertDialog(
                                            title: const Text('Details'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  transaction.instrumenItemName
                                                      .toUpperCase(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                Text(
                                                  'borrower: ${transaction.instrumentnameOfBorrower}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Image.asset(transaction
                                                    .instrumentImagePath_trans),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Borrowed Date: ${formatDate(DateTime.parse(transaction.instrumentDateBorrowed))}\nDue Date: ${formatDate(DateTime.parse(transaction.instrumentDateDue))}\nPhone Number: ${transaction.instrumentphoneNumber}',
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.black),
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.black),
                                                child:
                                                    const Text('Return Item'),
                                                onPressed: () async {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          '${transaction.instrumenItemName} Returned Successfully'),
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      backgroundColor:
                                                          Colors.green,
                                                    ),
                                                  );
                                                  Navigator.of(context).pop();
                                                  await db.updateLastInstrument(
                                                      transaction.id);
                                                  await db.deleteInstrument(
                                                      transaction.id);
                                                  transaction.isBorrowed =
                                                      false;
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Card(
                                    color: Theme.of(context).cardTheme.color,
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsetsDirectional.only(
                                        bottom: 10,
                                        top: 10,
                                      ),

                                      //image
                                      leading: Image.asset(transaction
                                          .instrumentImagePath_trans),
                                      //text

                                      title: Text.rich(
                                        TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  transaction.instrumenItemName,
                                            ),
                                            const TextSpan(
                                              text: ' borrowed by ',
                                            ),
                                            TextSpan(
                                              text: transaction
                                                  .instrumentnameOfBorrower,
                                              style: const TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // other properties...
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                  // ACCESORY TAB
                  StreamBuilder<List<TransactionItemAccesories>>(
                    stream: db.getTransactionsAccesories(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final transactions = snapshot.data ?? [];

                      return transactions.isEmpty
                          ? const Center(child: Text('No Transactions'))
                          : ListView.builder(
                              itemCount: transactions.length,
                              itemBuilder: (context, index) {
                                final transaction = transactions[index];

                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                              dialogBackgroundColor:
                                                  Colors.grey.shade300),
                                          child: AlertDialog(
                                            title: const Text('Details'),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  transaction.accesoriesItemName
                                                      .toUpperCase(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                Text(
                                                  'borrower: ${transaction.accesoriesnameOfBorrower}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Image.asset(transaction
                                                    .accesoriesImagePath_trans),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Borrowed Date: ${formatDate(DateTime.parse(transaction.accesoriesDateBorrowed))}\nDue Date: ${formatDate(DateTime.parse(transaction.accesoriesDateDue))}\nPhone Number: ${transaction.accesoriesphoneNumber}',
                                                ),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.black),
                                                child: const Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.black),
                                                child: const Text('Return'),
                                                onPressed: () async {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          '${transaction.accesoriesItemName} Returned Successfully'),
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      backgroundColor:
                                                          Colors.green,
                                                    ),
                                                  );
                                                  Navigator.of(context).pop();
                                                  await db.updateLastAccesories(
                                                      transaction.id);
                                                  await db.deleteAccesories(
                                                      transaction.id);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Card(
                                    color: Theme.of(context).cardTheme.color,
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsetsDirectional.only(
                                        bottom: 10,
                                        top: 10,
                                      ),

                                      //image
                                      leading: Image.asset(transaction
                                          .accesoriesImagePath_trans),
                                      //text

                                      title: Text.rich(
                                        TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  't${transaction.accesoriesItemName} # ${transaction.accesoriesItemNumber}',
                                            ),
                                            const TextSpan(
                                              text: ' borrowed by ',
                                            ),
                                            TextSpan(
                                              text: transaction
                                                  .accesoriesnameOfBorrower,
                                              style: const TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
