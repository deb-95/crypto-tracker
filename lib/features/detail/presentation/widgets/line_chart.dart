import 'package:cryptotracker/features/detail/models/crypto_graph_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

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
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                fitInsideVertically: true,
                tooltipBgColor: Colors.blueAccent,
                getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                  return touchedBarSpots.map((barSpot) {
                    final flSpot = barSpot;
                    return LineTooltipItem(
                      '${graphData[flSpot.x.toInt()].priceToDate.toStringAsFixed(6)}',
                      const TextStyle(color: Colors.white),
                    );
                  }).toList();
                }),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (value) {
                return '${DateFormat.Md(context.locale.toString()).format(graphData[value.toInt()].date)}';
              },
              margin: 8,
              getTextStyles: (value) => const TextStyle(
                  color: Color(0xff68737d),
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
            leftTitles: SideTitles(
                getTextStyles: (value) => const TextStyle(
                      color: Color(0xff67727d),
                      fontSize: 13,
                    ),
                showTitles: true,
                reservedSize: 30,
                margin: 10,
                interval: (maxPrice - minPrice) / 6,
                checkToShowTitle: (min, max, sideTitles, interval, value) {
                  return value == min || value == max;
                }),
          ),
          borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1)),
          lineBarsData: [
            LineChartBarData(
              spots: [
                for (int index = 0; index < graphData.length; index++)
                  FlSpot(index.toDouble(), graphData[index].priceToDate)
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
