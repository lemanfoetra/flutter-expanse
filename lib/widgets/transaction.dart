import '../models/transaction_model.dart';
import './add_transaction.dart';
import './transaction_list.dart';
import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final List<TransactionModel> transactions = [
    TransactionModel(
        id: 't1', title: 'Sepatu Baru', amount: 15.45, date: DateTime.now()),
    TransactionModel(
        id: 't2', title: 'Kemeja Batik', amount: 10.12, date: DateTime.now()),
  ];

  void addTransaction(String titleAdd, double amountAdd) {
    final addTrx = TransactionModel(
        id: DateTime.now().toString(),
        title: titleAdd,
        amount: amountAdd,
        date: DateTime.now());

    setState(() {
      transactions.add(addTrx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(
          addFunction: addTransaction
        ),
        TransactionList(
          transactions: transactions,
        ),
      ],
    );
  }
}
