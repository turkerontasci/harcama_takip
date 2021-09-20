import 'package:flutter/material.dart';
import 'package:harcama_takip/expenses/expenses.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'home_screen.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  double totalCalculator() {
    double totalPrice = 0.0;
    if (expenseList.isEmpty) {
      totalPrice = 0.0;
    } else {
      for (int i = 0; i < expenseList.length; i++) {
        totalPrice += expenseList[i].price;
      }
    }
    return totalPrice;
  }

  double wage = 3000.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (expenseList.isEmpty) Container() else Container(
                child: Column(
                  children: <Widget>[
                    SfCircularChart(
                      title: ChartTitle(
                        text: "Aylık Harcamanız",
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      tooltipBehavior: _tooltipBehavior,
                      series: <CircularSeries>[
                        RadialBarSeries<Expenses, String>(
                          dataSource: expenseList,
                          xValueMapper: (Expenses data, _) =>
                          data.type,
                          yValueMapper: (Expenses data, _) =>
                          data.price,
                          dataLabelSettings:
                          DataLabelSettings(isVisible: true),
                          enableTooltip: true,
                          maximumValue: 1000,
                          cornerStyle: CornerStyle.bothCurve,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Maaş : ${wage.toStringAsFixed(2)} TL",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "Kalan : ",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "${(wage - totalCalculator()).toStringAsFixed(2)} TL",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [];
    return chartData;
  }
}

class ExpenseData {
  ExpenseData(this.title, this.price);

  final String title;
  final double price;
}


