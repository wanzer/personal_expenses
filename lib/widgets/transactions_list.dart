import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
          children: <Widget>[
            Text("No items added yet!", style: Theme.of(context).textTheme.title),
            SizedBox(height: 20),
            Container(child: Image.asset("assets/images/waiting.png", fit: BoxFit.cover), height: 200)
          ],
        ): ListView.builder(
          itemBuilder: (context, index){
            return Card(
              child: (Row(
                children: <Widget>[
                  Container(
                    child: Text('\$${transactions[index].amount}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor)),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                    padding: EdgeInsets.all(5),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(transactions[index].title,
                          style: Theme.of(context).textTheme.title),
                      Text(DateFormat.yMMMd().format(transactions[index].date),
                          style: TextStyle(color: Colors.grey))
                    ],
                  )
                ],
              )),
            );
          },
          itemCount: transactions.length,
        )
    );
  }
}
