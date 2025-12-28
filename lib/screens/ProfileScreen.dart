import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔒 Fixed Logo
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Image.asset('assets/images/logo.png', height: 60),
            ),

            /// Profile Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    /// Title
                    Text(
                      'PROFILE',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1F3C58),
                        fontFamily: 'Sigmar',
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Profile Info
                    _profileRow(Icons.person, 'Hamza Khalid'),
                    _profileRow(Icons.motorcycle, 'Honda'),
                    _profileRow(Icons.settings, 'Pridor'),
                    _profileRow(Icons.calendar_month, '2014'),
                    _profileRow(Icons.speed, '55429 km'),
                    _profileRow(Icons.email, 'abc@gmail.com'),
                    _profileRow(Icons.phone, '0312-456789'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable Profile Row
  Widget _profileRow(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.black),
          const SizedBox(width: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
