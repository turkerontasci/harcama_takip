import 'package:flutter/material.dart';
import 'package:harcama_takip/expenses/expenses.dart';
import 'package:harcama_takip/memberships/memberships.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

String odemeTitle;

List<Expenses> expenseList = [];

List<MonthlyExpenses> monthlyExpense = [];

class _HomeScreenState extends State<HomeScreen> {

  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ödeme Miktarı'),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Örnek: 19.90"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'İPTAL',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(
                'TAMAM',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                price = double.parse(_textFieldController.text);
                addDailyExpenses();
              },
            ),
          ],
        );
      },
    );
  }

  String expenseType;
  String monthlyExpenseType;
  double price;
  IconData iconData;
  Color expenseColor;
  double limit = 250.0;

  void addDailyExpenses() {
    setState(() {
      expenseList.add(
        Expenses(
          type: expenseType,
          price: price,
          iconData: iconData,
          color: expenseColor,
        ),
      );
    });
  }

  void addMonthlyExpenses() {
    setState(() {
      monthlyExpense.add(
        MonthlyExpenses(
          type: monthlyExpenseType,
          totalPrice: totalCalculator(),
        ),
      );
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          minHeight: 45.0,
          maxHeight: 422.0,
          panel: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 12.0),
                Icon(
                    Icons.keyboard_arrow_up,
                  color: Colors.grey.shade700,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          expenses.length,
                              (index) => GestureDetector(
                            onTap: () {
                              _displayTextInputDialog(context);
                              expenseType = expenses[index]["title"];
                              iconData = expenses[index]["iconData"];
                              expenseColor = expenses[index]["color"];
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets.only(bottom: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: expenses[index]["color"],
                                  borderRadius:
                                  BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            expenses[index]["iconData"],
                                            size: 30.0,
                                          ),
                                          SizedBox(width: 10.0),
                                          Text(
                                            "${expenses[index]["title"]}",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight:
                                              FontWeight.w500,
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
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: <Widget>[
              if (expenseList.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 45.0,
                      alignment: Alignment.center,
                      child: Text(
                        "Harcama Girişi Yapmadınız",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      SfCircularChart(
                        title: ChartTitle(
                          text: "Günlük Harcama Tablosu",
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
                            maximumValue: 300,
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                        ],
                      ),
                      Material(
                        elevation: 1,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: List.generate(
                                        expenseList.length,
                                            (index) => GestureDetector(
                                          onDoubleTap: () {
                                            setState(() {
                                              expenseList.removeAt(index);
                                            });
                                          },
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                            child: Material(
                                              borderRadius:
                                              BorderRadius.circular(10.0),
                                              elevation: 1.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10.0),
                                                  color: expenseList[index].color,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            expenseList[index]
                                                                .iconData,
                                                            size: 15.0,
                                                          ),
                                                          SizedBox(width: 5.0),
                                                          Text(
                                                            "${expenseList[index].type}",
                                                            style: TextStyle(
                                                              fontSize: 13.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: 5.0),
                                                      Text(
                                                        "${(expenseList[index].price).toStringAsFixed(2)} TL",
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10.0, right: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: totalCalculator() > limit ? Colors.redAccent : Colors.green,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10.0, right: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Toplam Harcama",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.0,
                                            color: totalCalculator() > limit ? Colors.black : Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          "${totalCalculator().toStringAsFixed(2)} TL",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0,
                                            color: totalCalculator() > limit ? Colors.black : Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
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
