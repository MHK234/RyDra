import 'package:flutter/material.dart';
import 'package:rydra/components/bottomNavBar.dart';
import 'package:rydra/components/topNavBar.dart';
import 'package:rydra/screens/reportScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      bottomNavigationBar: bottomNavbar(),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () {
          print("Add Data Button Pressed");
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topnavbar(),
              const Text(
                "Dashboard",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: _box(),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Rs 5600",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            fontFamily: "Sigmar",
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Expenses YTD",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Icon(Icons.circle, size: 12, color: Colors.green),
                        SizedBox(height: 4),
                        Text(
                          "Service Due\nin 600KM",
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ---- Last 30 Days ----
              const Text(
                "Last 30 Days",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Container(
                height: 150,
                decoration: _box(),
                alignment: Alignment.center,
                child: const Text("Insert Chart Here"),
              ),

              const SizedBox(height: 25),

              // ---- Recent Activity ----
              const Text(
                "Recent Activity",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              _activityTile(
                icon: Icons.analytics,
                title: "Fuel-Up",
                detail: "Jan 25, 2025 - Shell",
                amount: "Rs 1800",
                color: Colors.green,
              ),

              _activityTile(
                icon: Icons.analytics,
                title: "Oil Change",
                detail: "Jan 10 KM Svc",
                amount: "Rs 900",
                color: Colors.green,
              ),

              _activityTile(
                icon: Icons.build,
                title: "New Chain & Sprockets",
                detail: "Dec 28, 2025 - Labor + Parts",
                amount: "Rs 2800",
                color: Colors.green,
              ),
              _activityTile(
                icon: Icons.build,
                title: "Plug Change",
                detail: "Dec 28, 2023 - Labor + Parts",
                amount: "Rs 180",
                color: Colors.green,
              ),
              _activityTile(
                icon: Icons.analytics,
                title: "Tyres And Tube Change",
                detail: "Sept 26, 2025 - Labor + Parts",
                amount: "Rs 3500",
                color: Colors.green,
              ),
              _activityTile(
                icon: Icons.build,
                title: "New Indicators",
                detail: "Dec 28, 2023 - Labor + Parts",
                amount: "Rs 480",
                color: Colors.green,
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // One activity row
  Widget _activityTile({
    required IconData icon,
    required String title,
    required String detail,
    required String amount,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: _box(),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: Icon(icon, color: Colors.black),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(detail, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(color: Color(0xff1F3C58), fontSize: 16),
          ),
        ],
      ),
    );
  }

  BoxDecoration _box() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 1),
          color: Colors.black.withOpacity(.05),
          blurRadius: 6,
        ),
      ],
    );
  }
}
