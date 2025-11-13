import 'package:flutter/material.dart';

// The main screen widget
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
              const SizedBox(height: 12),

              // Description Text
              const Text(
                'Welcome to RyDra, your platform for bike maintenance and spare parts.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),

              // Continue Button
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
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
            ],
          ),
        ),
      ],
    );
  }
}

// Custom Clipper to create the wavy top edge of the white container
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start from the bottom-left corner
    path.lineTo(0, size.height);

    // Go to the bottom-right corner
    path.lineTo(size.width, size.height);

    // Define the right starting point of the wave (about 58% down)
    path.lineTo(size.width, size.height * 0.58);

    // --- Create the Wavy Top Edge using two Quadratic Bezier Curves ---

    // First Curve: Creates the initial dip
    path.quadraticBezierTo(
      size.width * 0.7, // Control Point X: Pulls the curve inward
      size.height *
          0.45, // Control Point Y: Defines the low point of the first dip
      size.width * 0.5, // End Point X: Midpoint
      size.height * 0.5, // End Point Y: Higher than the dip
    );

    // Second Curve: Creates the final upward sweep
    path.quadraticBezierTo(
      size.width *
          0.25, // Control Point X: Defines the shape of the second part
      size.height *
          0.65, // Control Point Y: Defines the high point of the sweep
      0, // End Point X: Left edge
      size.height * 0.55, // End Point Y: Where the wave meets the left side
    );

    // Close the path to complete the shape
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
