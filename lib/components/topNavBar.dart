import 'package:flutter/material.dart';

class topnavbar extends StatelessWidget {
  const topnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/images/logo.png', width: 160)],
      ),
    );
  }
}
