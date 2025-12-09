import 'package:flutter/material.dart';
import 'package:rydra/screens/HomeScreen.dart';
import 'package:rydra/screens/menuScreen.dart';
import 'package:rydra/screens/reportScreen.dart';
import 'package:rydra/screens/sparePartsScreen.dart';
import 'package:video_player/video_player.dart';
import './screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Homescreen.routeName,
      routes: {
        Homescreen.routeName: (context) => Homescreen(),
        ReportsScreen.routeName: (context) => ReportsScreen(),
        SparePartsScreen.routeName: (context) => SparePartsScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Rydra',
      home: const SplashScreen(),
    );
  }
}
