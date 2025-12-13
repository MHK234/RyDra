import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyExpenseChart extends StatelessWidget {
  const MonthlyExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Monthly Expense Trend',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 10000,

                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) {
                          return const Text('0');
                        }
                        if (value == 10000) {
                          return const Text('Rs');
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),

                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.red.shade700,
                    barWidth: 3,

                    spots: const [
                      FlSpot(0, 2000),
                      FlSpot(1, 3000),
                      FlSpot(2, 4000),
                      FlSpot(3, 1000),
                      FlSpot(4, 5000),
                      FlSpot(5, 5500),
                      FlSpot(6, 3000),
                      FlSpot(7, 7500),
                      FlSpot(8, 6500),
                      FlSpot(9, 4000),
                      FlSpot(10, 6000),
                      FlSpot(11, 5500),
                    ],

                    dotData: FlDotData(
                      show: true,
                      checkToShowDot: (spot, barData) {
                        return spot.x == 10; // highlight last major point
                      },
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 6,
                          color: Colors.white,
                          strokeWidth: 3,
                          strokeColor: Colors.red.shade700,
                        );
                      },
                    ),

                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.red.withOpacity(0.3),
                          Colors.red.withOpacity(0.05),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Average monthly spending: Rs 4,500',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
