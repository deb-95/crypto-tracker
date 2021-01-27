import 'package:cryptotracker/features/detail/models/crypto_graph_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<CryptoGraphValueVM> graphData;

  const LineChartWidget({Key key, this.graphData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    graphData.sort((el, el2) => el.priceToDate.compareTo(el2.priceToDate));
    var maxPrice = graphData.last.priceToDate;
    var minPrice = graphData.first.priceToDate;

    return Container(
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: (maxPrice - minPrice) / 6,
          ),
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
                margin: 20,
                interval: (maxPrice - minPrice) / 6,
                checkToShowTitle: (min, max, sideTitles, interval, value) {
                  return value == min || value == max;
                }),
          ),
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
