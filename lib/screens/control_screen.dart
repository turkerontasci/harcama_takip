import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  List<ExpenseData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500.0,
                child: SfCircularChart(
                  title: ChartTitle(
                      text: "Aylık Harcamanız",
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                  ),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    RadialBarSeries<ExpenseData, String>(
                      dataSource: _chartData,
                      xValueMapper: (ExpenseData data,_) => data.title,
                      yValueMapper: (ExpenseData data,_) => data.price,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true,
                      maximumValue: 500,
                      cornerStyle: CornerStyle.bothCurve,
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
    
    final List<ExpenseData> chartData = [
      ExpenseData("Yemek", 55.00),
      ExpenseData("Fatura", 250.00),
      ExpenseData("Mutfak", 350.00),
      ExpenseData("Eğlence", 75.00),
      ExpenseData("Giyim", 35.00),
      ExpenseData("Elektronik", 350.00),
      ExpenseData("Ulaşım", 260.00),
    ];
    return chartData;
  }
}

class ExpenseData{

  ExpenseData(this.title, this.price);

  final String title;
  final double price;
}


