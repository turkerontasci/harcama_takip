import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:harcama_takip/expenses/expenses.dart';
import 'package:harcama_takip/memberships/memberships.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

String odemeTitle;

List<Expenses> expenseList = [];

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
                addItemToList();
              },
            ),
          ],
        );
      },
    );
  }

  String expenseType;

  double price;

  IconData iconData;

  void addItemToList() {
    setState(() {
      expenseList.add(
        Expenses(
          type: expenseType,
          price: price,
          iconData: iconData,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    height: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: (expenseList.isEmpty)
                      ? Center(child: Text("Günlük Harcama Girişi Yapmadınız"),)
                        : Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                        children: List.generate(expenseList.length, (index) => Padding(
                                          padding: const EdgeInsets.only(bottom: 10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Colors.grey.shade100,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    expenseList[index].iconData,
                                                    size: 15.0,
                                                  ),
                                                  SizedBox(width: 5.0),
                                                  Text(
                                                    "${expenseList[index].type}",
                                                  ),
                                                  SizedBox(width: 5.0),
                                                  Text(
                                                    "${(expenseList[index].price).toStringAsFixed(2)} TL",
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ))
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: Container(
                                  height: 250.0,
                                  child: SfCircularChart(
                                    legend: Legend(
                                      isVisible: true,
                                      overflowMode: LegendItemOverflowMode.scroll,
                                    ),
                                    series: <CircularSeries>[
                                      PieSeries<Expenses, String>(
                                        dataSource: expenseList,
                                        xValueMapper: (Expenses data,_) => data.type,
                                        yValueMapper: (Expenses data,_) => data.price,
                                        dataLabelSettings: DataLabelSettings(isVisible: true),
                                        enableTooltip: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                    )
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 230.0,
                                  aspectRatio: 2.0,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: false,
                                  scrollDirection: Axis.horizontal,
                                ),
                                items: List.generate(
                                  memberships.length,
                                  (index) => Column(
                                    children: <Widget>[
                                      Container(
                                        height: 150.0,
                                        width: 150.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                memberships[index]["image"]),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "${memberships[index]["title"]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "${memberships[index]["price"].toStringAsFixed(2)} TL",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
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
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              expenses[index]["iconData"],
                                              size: 30.0,
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              "${expenses[index]["title"]}",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w400,
                                              ),
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
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
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
