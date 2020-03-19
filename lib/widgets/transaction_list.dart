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
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.only(top: 2, bottom: 2),
              child: ListTile(
                leading: FittedBox(
                  child: CircleAvatar(
                    radius: 30,
                    child: Text(
                      '\$${transactions[index].amount}',
                    ),
                  ),
                ),
                title: Text(
                  transactions[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                ),
                
              ),
            ),
          );
        },
      ),
    );
  }
}
