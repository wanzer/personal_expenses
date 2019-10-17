import 'package:flutter/foundation.dart';

class Transaction {

  //@required final int id;
  @required final String title;
  @required final double amount;
  @required final DateTime date;

  Transaction({this.title, this.amount, this.date});
}