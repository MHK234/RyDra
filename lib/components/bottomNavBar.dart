import 'package:flutter/material.dart';
import 'package:rydra/screens/HomeScreen.dart';
import 'package:rydra/screens/reportScreen.dart';

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
              print("Home Button pressed");
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Homescreen()));
              ;
            },
            child: const Icon(Icons.home, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: () {
              print("Analytics Button pressed");
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ReportsScreen()));
              ;
            },
            child: const Icon(Icons.analytics, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 45),

          GestureDetector(
            onTap: () {
              print("Spare Parts Button pressed");
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => SignupScreen(),
              //   ),
              // );;
            },
            child: const Icon(Icons.build, color: Colors.white, size: 28),
          ),

          const SizedBox(width: 10),

          GestureDetector(
            onTap: () {
              print("Menu Button pressed");
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => SignupScreen(),
              //   ),
              // );;
            },
            child: const Icon(Icons.menu, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }
}
