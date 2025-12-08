import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rydra/components/bottomClipper.dart';
import 'package:rydra/screens/HomeScreen.dart';
import 'package:rydra/screens/loginScreen.dart';

// The main screen widget
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    // Using a LayoutBuilder to get the screen dimensions for responsive layout
    return const Scaffold(body: WelcomeScreenContent());
  }
}

class WelcomeScreenContent extends StatelessWidget {
  const WelcomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Background Image - NOW USING LOCAL ASSET
        Positioned.fill(
          child: Image.asset(
            // Local asset image as requested by the user
            'assets/images/backgroundImage.png',
            fit: BoxFit.cover,
          ),
        ),

        // 2. Custom Wave Overlay (White container clipped to a wave shape)
        Positioned.fill(
          child: ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(color: Colors.white),
          ),
        ),

        // 3. Content (Text and Button)
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use a Spacer to push the content to the bottom half, over the white area
              const Spacer(),

              // Welcome Title
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey[800],
                  fontFamily: "Sigmar",
                ),
              ),
              const SizedBox(height: 20),

              // Description Text
              const Text(
                'Welcome to RyDra, your platform for bike maintenance and spare parts.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 80),

              // Continue Button
              // ...
              Align(
                alignment: Alignment.bottomRight,
                // 1. Wrap the interactive content (the Row) in a GestureDetector
                child: GestureDetector(
                  onTap: () {
                    print('button pressed');
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800],
                          fontFamily: "Sigmar",
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF283593,
                          ), // Deep Indigo for the button
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF283593).withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ...
            ],
          ),
        ),
      ],
    );
  }
}
