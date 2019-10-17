import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();


  void submitData(){
    widget.addTransaction(titleInputController.text, double.parse(amountInputController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: "Title"),
//              onChanged: (val){
//                titleInput = val;
//              },
            controller: titleInputController,
             // textInputAction: TextInputAction.continueAction,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData(),
            ),
            TextField(decoration: InputDecoration(labelText: "Amount"),
//              onChanged: (val) {
//                amountInput = val;
//              },
            controller: amountInputController,
              //textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
                child: Text("Add item"),
                textColor: Colors.blue,
                onPressed : submitData
                  //addTransaction(titleInputController.text, double.parse(amountInputController.text));
                 // }
               )
          ],
        ),
      ),
    );
  }
}
