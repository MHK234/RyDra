import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CostDistributionChart extends StatelessWidget {
  const CostDistributionChart({super.key});

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
            'Cost Distribution',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          _barRow(
            title: 'Fuel',
            value: 2200,
            maxValue: 3000,
            color: Colors.red.shade700,
          ),

          const SizedBox(height: 14),

          _barRow(
            title: 'Parts',
            value: 1800,
            maxValue: 3000,
            color: Colors.grey.shade800,
          ),

          const SizedBox(height: 14),

          _barRow(
            title: 'Service/Labor',
            value: 1200,
            maxValue: 3000,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  Widget _barRow({
    required String title,
    required double value,
    required double maxValue,
    required Color color,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(title, style: const TextStyle(fontSize: 14)),
        ),

        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),

              FractionallySizedBox(
                widthFactor: value / maxValue,
                child: Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        Text(
          'Rs${value.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
