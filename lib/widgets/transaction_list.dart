import '../models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: transactions.map((trx) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    '\$${trx.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1)),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      trx.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(
                          trx.date), // yMMMMEEEEd() adalah spesial constructor
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
