import 'package:flutter/material.dart';
import 'package:rydra/components/bottomNavBar.dart';
import 'package:rydra/components/topNavBar.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  static const routeName = "/reports";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      bottomNavigationBar: bottomNavbar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topnavbar(),
              const SizedBox(height: 15),

              _filterChips(),

              const SizedBox(height: 18),

              const Text(
                "Reports & Analysis",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Monthly Expense trend
              _sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Monthly Expense Trend", style: bold),
                    const SizedBox(height: 15),

                    Container(
                      height: 170,
                      alignment: Alignment.center,
                      child: const Text("Line Chart here"),
                    ),
                    const Divider(),
                    const SizedBox(height: 6),
                    const Text(
                      "Average monthly spending: ₹4,500",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Cost distribution
              _sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Cost Distribution", style: bold),
                    const SizedBox(height: 14),

                    _costItem("Fuel", "Rs 22,000", Colors.red),
                    _costItem("Parts", "Rs 18,000", Colors.black),
                    _costItem("Service/Labor", "Rs 12,500", Colors.amberAccent),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Performance metrics
              _sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Performance Metrics", style: bold),
                    const SizedBox(height: 14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Rs 3.25 / KM\n(Based on 15,000 KM logged)",
                          style: body,
                        ),
                        Text(
                          "Avg. 4,500 KM\n(Between oil changes)",
                          style: body,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "[ Compare to Previous Year ]",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // generate PDF button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Generate Detailed PDF Report",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

const bold = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
const body = TextStyle(fontSize: 13, height: 1.4);

Widget _costItem(String title, String val, Color barColor) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(val, style: bold),
        ],
      ),
      const SizedBox(height: 5),
      Container(
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: barColor.withOpacity(.2),
        ),
        child: FractionallySizedBox(
          widthFactor: .8,
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: barColor,
            ),
          ),
        ),
      ),
      const SizedBox(height: 15),
    ],
  );
}

Widget _filterChips() {
  return Row(
    children: [
      _chip("12 Months"),
      const SizedBox(width: 8),
      _chip("YTD"),
      const SizedBox(width: 8),
      _chip("Custom Range"),
    ],
  );
}

Widget _chip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.red.shade50,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    ),
  );
}

// card wrapper
Widget _sectionCard({required Widget child}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 1),
          blurRadius: 5,
          color: Colors.black.withOpacity(.05),
        ),
      ],
    ),
    child: child,
  );
}
