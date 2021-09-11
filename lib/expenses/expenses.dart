import 'package:flutter/material.dart';

class Expenses {
  String type;
  IconData iconData;
  double price;
  Color color;

  Expenses({
    this.price,
    this.type,
    this.iconData,
    this.color,
  });
}

class MonthlyExpenses {
  String type;
  double totalPrice;

  MonthlyExpenses({this.type, this.totalPrice});
}
