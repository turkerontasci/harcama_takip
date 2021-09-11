import 'package:flutter/material.dart';

class Expenses {
  String type;
  IconData iconData;
  double price;

  Expenses({
    this.price,
    this.type,
    this.iconData,
  });
}

class MonthlyExpenses {

  String type;
  double totalPrice;

  MonthlyExpenses({
    this.type,
    this.totalPrice
  });
}
