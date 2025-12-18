import 'package:flutter/material.dart';
import 'package:rydra/components/bottomNavBar.dart';
import 'package:rydra/components/topNavBar.dart';
import 'package:rydra/screens/help&support.dart';
import 'package:rydra/screens/terms&conditions.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menu";

  const MenuScreen({super.key});

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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- Title --------------
              topnavbar(),
              const SizedBox(height: 20),
              // -------- Profile Card --------
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.motorcycle, size: 30),

                    const SizedBox(width: 14),

                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hamza",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Honda CB350 RS",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),

                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text("[ View Profile > ]"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "General",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 14),

              _menuTile(
                icon: Icons.calendar_month,
                title: "Maintenance Schedule",
              ),
              _menuTile(icon: Icons.notifications, title: "Notifications"),
              _menuTile(icon: Icons.backup, title: "Data Backup & Restore"),
              _menuTile(
                icon: Icons.currency_exchange,
                title: "Units & Currency",
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HelpSupportScreen(),
                    ),
                  ),
                },
                child: _menuTile(
                  icon: Icons.support_agent,
                  title: "Help & Support",
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TermsConditionsScreen(),
                    ),
                  ),
                },
                child: _menuTile(
                  icon: Icons.description,
                  title: "Terms & Privacy",
                ),
              ),

              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  // ----------- Menu Tile Widget --------------
  Widget _menuTile({required IconData icon, required String title}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 14),
          Text(title, style: const TextStyle(fontSize: 15)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}
