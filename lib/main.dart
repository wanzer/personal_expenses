import 'package:flutter/material.dart';

import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transactions_list.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
        )
      ),
      title: 'Home Page',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Transaction> _transactions = [
//    Transaction(title: "First tra", amount: 15, date: DateTime.now()),
//    Transaction(title: "Second tra", amount: 10, date: DateTime.now()),
//    Transaction(title: "Third tra", amount: 32, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount){
    Transaction tr = Transaction (title: title, amount: amount, date: DateTime.now());

    setState(() {
      _transactions.add(tr);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        child: NewTransaction(_addNewTransaction), onTap: (){},
        behavior: HitTestBehavior.opaque
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal expenses', style: TextStyle(fontFamily: 'OpenSans')),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () { return _startAddNewTransaction(context);},
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
              ),
            ),
            TransactionList(_transactions)
          ],
        )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context)
        ),
    );
  }
}
