import 'package:flutter/material.dart';
import 'package:harcama_takip/expenses/expenses.dart';
import 'package:harcama_takip/memberships/memberships.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

String odemeTitle;

List<Expenses> expenseList = [];

List<MonthlyExpenses> monthlyExpense = [];

class _HomeScreenState extends State<HomeScreen> {

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
        child: Column(
          children: <Widget>[
            if (expenseList.isEmpty)
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: 45.0,
                        alignment: Alignment.center,
                        child: Text(
                          "Harcama Türünüzü Seçiniz",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(expenses.length, (index) => Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              _displayTextInputDialog(context);
                              expenseType = expenses[index]["title"];
                              iconData = expenses[index]["iconData"];
                              expenseColor = expenses[index]["color"];
                            },
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              elevation: 1,
                              child: Container(
                                height: 75.0,
                                width: 75.0,
                                decoration: BoxDecoration(
                                  color: expenses[index]["color"],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      expenses[index]["iconData"],
                                      size: 20.0,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      expenses[index]["title"],
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              )
            else
              Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                        child: Material(
                          elevation: 1,
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            height: 45.0,
                            alignment: Alignment.center,
                            child: Text(
                              "Harcama Türünüzü Seçiniz",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(expenses.length, (index) => Padding(
                              padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  _displayTextInputDialog(context);
                                  expenseType = expenses[index]["title"];
                                  iconData = expenses[index]["iconData"];
                                  expenseColor = expenses[index]["color"];
                                },
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  elevation: 1,
                                  child: Container(
                                    height: 75.0,
                                    width: 75.0,
                                    decoration: BoxDecoration(
                                      color: expenses[index]["color"],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          expenses[index]["iconData"],
                                          size: 20.0,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          expenses[index]["title"],
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
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
                                  left: 10.0, right: 10.0),
                              child: Container(
                                height: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: totalCalculator() > limit ? Colors.redAccent : Colors.green,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10.0, right: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Günlük Harcama",
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
                  ),
                ],
              ),
          ],
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
