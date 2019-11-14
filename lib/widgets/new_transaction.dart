import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  DateTime _selectedDate;

  void submitData() {
    if (titleInputController.text.isEmpty || double.parse(amountInputController.text) <=0 || _selectedDate == null){
      return;
    }
    widget.addTransaction(
        titleInputController.text, double.parse(amountInputController.text), _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
//              onChanged: (val){
//                titleInput = val;
//              },
              controller: titleInputController,
              // textInputAction: TextInputAction.continueAction,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
//              onChanged: (val) {
//                amountInput = val;
//              },
              controller: amountInputController,
              //textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(_selectedDate == null
                          ? "No Date Choosen"
                          : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}')),
                  FlatButton(
                    child: Text('Choose Date'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
                child: Text("Add item"),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: submitData
                //addTransaction(titleInputController.text, double.parse(amountInputController.text));
                // }
                )
          ],
        ),
      ),
    );
  }
}
