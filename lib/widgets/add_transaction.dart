import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {


  final Function addFunction;

  final title = TextEditingController();
  final amount = TextEditingController();

  AddTransaction({this.addFunction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 20, bottom: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: title,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amount,
            ),
            FlatButton(
              onPressed: () {
                addFunction(title.text,double.parse(amount.text));
              },
              child: Text('Save'),
              textColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
