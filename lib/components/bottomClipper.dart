import 'package:flutter/material.dart';

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
