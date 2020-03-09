import './widgets/transaction_list.dart';

import './models/transaction_model.dart';
import './widgets/add_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.purple,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<TransactionModel> transactions = [
    TransactionModel(
        id: 't1', title: 'Sepatu Baru', amount: 15.45, date: DateTime.now()),
    TransactionModel(
        id: 't2', title: 'Kemeja Batik', amount: 10.12, date: DateTime.now()),
  ];

  void _addTransaction(String titleAdd, double amountAdd) {
    final addTrx = TransactionModel(
        id: DateTime.now().toString(),
        title: titleAdd,
        amount: amountAdd,
        date: DateTime.now());

    setState(() {
      transactions.add(addTrx);
    });
  }

  void modalAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: AddTransaction(
            addFunction: _addTransaction,
          ),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanses Widget'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              modalAddTransaction(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
              ),
            ),
            TransactionList(transactions: transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
