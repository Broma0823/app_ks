import 'package:app/models/kstransactions/ks_transaction_instrument.dart';
import 'package:app/models/kstransactions/kstransaction_accesories.dart';
import 'package:app/models/kstransactions/kstransaction_book.dart';
import 'package:app/models/kstransactions/kstransaction_wardrobe.dart';
import 'package:app/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyTransactionPageCategorized extends StatefulWidget {
  const MyTransactionPageCategorized({
    super.key,
  });

  @override
  State<MyTransactionPageCategorized> createState() =>
      _MyTransactionPageCategorizedState();
}

class _MyTransactionPageCategorizedState
    extends State<MyTransactionPageCategorized> {
  //
  FirestoreService db = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Transactions"),
        ),
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "WARDROBE",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Tab(
                  child: Text(
                    "INSTRUMENT",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Tab(
                  child: Text(
                    "ACCESORIES",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                Tab(
                  child: Text(
                    "LIBRARY",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      Consumer<KSTransaction>(
                        builder: (context, transactionvalue, child) => Expanded(
                          child: transactionvalue.transactions.isEmpty
                              ? const Center(
                                  child: Text("No Transgender Found"),
                                )
                              : ListView.builder(
                                  itemCount:
                                      transactionvalue.transactions.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Confirm Return'),
                                              content: Text(
                                                  'Return ${transactionvalue.transactions[index].itemName}?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Return'),
                                                  onPressed: () {
                                                    transactionvalue.removeItem(
                                                        transactionvalue
                                                                .transactions[
                                                            index]);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      title: Text(
                                          '${transactionvalue.transactions[index].itemName} Item Number: ${transactionvalue.transactions[index].itemNumber} is borrowed by ${transactionvalue.transactions[index].nameOfBorrower} on ${transactionvalue.transactions[index].dateBorrowed}'),
                                      subtitle: Text(
                                          'Due Date: ${transactionvalue.transactions[index].dateDue}'),
                                      leading: Image.asset(transactionvalue
                                          .transactions[index].imagePath_trans),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Consumer<KSTransactionInstrument>(
                        builder: (context, transactionvalue, child) => Expanded(
                          child: transactionvalue.instrumentransactions.isEmpty
                              ? const Center(
                                  child: Text("No Transgender Found"),
                                )
                              : ListView.builder(
                                  itemCount: transactionvalue
                                      .instrumentransactions.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Confirm Return'),
                                              content: Text(
                                                  'Return ${transactionvalue.instrumentransactions[index].instrumenItemName}?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Return'),
                                                  onPressed: () {
                                                    transactionvalue.removeItem(
                                                        transactionvalue
                                                                .instrumentransactions[
                                                            index]);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      title: Text(
                                          '${transactionvalue.instrumentransactions[index].instrumenItemName} Item Number: ${transactionvalue.instrumentransactions[index].instrumentItemNumber} is borrowed by ${transactionvalue.instrumentransactions[index].instrumentnameOfBorrower} on ${transactionvalue.instrumentransactions[index].instrumentDateBorrowed}'),
                                      subtitle: Text(
                                          'Due Date: ${transactionvalue.instrumentransactions[index].instrumentDateDue}'),
                                      leading: Image.asset(transactionvalue
                                          .instrumentransactions[index]
                                          .instrumentImagePath_trans),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Consumer<KSTransactionAccesories>(
                        builder: (context, transactionvalue, child) => Expanded(
                          child: transactionvalue.accesoriestransactions.isEmpty
                              ? const Center(
                                  child: Text("No Transgender Found"),
                                )
                              : ListView.builder(
                                  itemCount: transactionvalue
                                      .accesoriestransactions.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Confirm Return'),
                                              content: Text(
                                                  'Return ${transactionvalue.accesoriestransactions[index].accesoriesItemName}?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Return'),
                                                  onPressed: () {
                                                    transactionvalue.removeItem(
                                                        transactionvalue
                                                                .accesoriestransactions[
                                                            index]);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      title: Text(
                                          '${transactionvalue.accesoriestransactions[index].accesoriesItemName} Item Number: ${transactionvalue.accesoriestransactions[index].accesoriesItemNumber} is borrowed by ${transactionvalue.accesoriestransactions[index].accesoriesnameOfBorrower} on ${transactionvalue.accesoriestransactions[index].accesoriesDateBorrowed}'),
                                      subtitle: Text(
                                          'Due Date: ${transactionvalue.accesoriestransactions[index].accesoriesDateDue}'),
                                      leading: Image.asset(transactionvalue
                                          .accesoriestransactions[index]
                                          .accesoriesImagePath_trans),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Consumer<KSTransactionBook>(
                        builder: (context, transactionvalue, child) => Expanded(
                          child: transactionvalue.booktransactions.isEmpty
                              ? const Center(
                                  child: Text("No Transgender Found"),
                                )
                              : ListView.builder(
                                  itemCount:
                                      transactionvalue.booktransactions.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Confirm Return'),
                                              content: Text(
                                                  'Return ${transactionvalue.booktransactions[index].bookItemName}?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Return'),
                                                  onPressed: () {
                                                    transactionvalue.removeItem(
                                                        transactionvalue
                                                                .booktransactions[
                                                            index]);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      title: Text(
                                          '${transactionvalue.booktransactions[index].bookItemName} Item Number: ${transactionvalue.booktransactions[index].bookItemNumber} is borrowed by ${transactionvalue.booktransactions[index].booknameOfBorrower} on ${transactionvalue.booktransactions[index].bookDateBorrowed}'),
                                      subtitle: Text(
                                          'Due Date: ${transactionvalue.booktransactions[index].bookDateDue}'),
                                      leading: Image.asset(transactionvalue
                                          .booktransactions[index]
                                          .bookImagePath_trans),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
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
