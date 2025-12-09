import 'package:flutter/material.dart';
import 'package:rydra/screens/HomeScreen.dart';
import 'package:rydra/screens/menuScreen.dart';
import 'package:rydra/screens/reportScreen.dart';
import 'package:rydra/screens/sparePartsScreen.dart';

class bottomNavbar extends StatelessWidget {
  const bottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xff1F3C58),
      shape: const CircularNotchedRectangle(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (ModalRoute.of(context)?.settings.name !=
                  Homescreen.routeName) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Homescreen.routeName,
                  (route) => false,
                );
              }
            },
            child: const Icon(Icons.home, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: () {
              if (ModalRoute.of(context)?.settings.name !=
                  ReportsScreen.routeName) {
                Navigator.pushNamed(context, ReportsScreen.routeName);
              }
            },
            child: const Icon(Icons.analytics, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 45),

          GestureDetector(
            onTap: () {
              if (ModalRoute.of(context)?.settings.name !=
                  ReportsScreen.routeName) {
                Navigator.pushNamed(context, SparePartsScreen.routeName);
              }
            },
            child: const Icon(Icons.build, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: () {
              if (ModalRoute.of(context)?.settings.name !=
                  ReportsScreen.routeName) {
                Navigator.pushNamed(context, MenuScreen.routeName);
              }
            },
            child: const Icon(Icons.menu, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }
}
