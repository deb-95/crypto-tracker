import 'package:cryptotracker/features/detail/models/crypto_graph_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<CryptoGraphValueVM> graphData;

  const LineChartWidget({Key key, this.graphData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true, verticalInterval: 100.0),
          titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTitles: (value) {
                  return '${graphData[value.toInt()].date.day}/${graphData[value.toInt()].date.month}';
                },
                margin: 8,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                margin: 10,
              )),
          lineBarsData: [
            LineChartBarData(
              spots: [
                for (int index = 0; index < graphData.length; index++)
                  FlSpot(index.toDouble(), graphData[index].priceToDate)
              ],
              isCurved: true,
            ),
          ],
        ),
      ),
    );
  }
}
