import 'package:flutter/material.dart';

// di ubah ke statefull karena agar
class AddTransaction extends StatefulWidget {
  final Function addFunction;

  AddTransaction({this.addFunction});

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final title = TextEditingController();

  final amount = TextEditingController();

  void onSubmit() {
    if (amount.text.isEmpty || double.parse(amount.text) <= 0) {
      return;
    }
    // Dengan widget, kita bisa mengambil properti parrent class ke child class
    widget.addFunction(title.text, double.parse(amount.text));

    Navigator.of(context).pop();
  }

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
              keyboardType: TextInputType.text,
              onSubmitted: (str) => onSubmit,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amount,
              keyboardType: TextInputType.number,
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Text('Tidak tanggal dipilih'),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Pilih Tanggal',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: () => onSubmit(),
              child: Text('Save'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
