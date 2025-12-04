import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    // Using a LayoutBuilder to get the screen dimensions for responsive layout
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignupScreenContent(),
    );
  }
}

class SignupScreenContent extends StatelessWidget {
  const SignupScreenContent({super.key});
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
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF2E4E6F),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2E4E6F)),
                  ),
                ),
              ),
              const SizedBox(height: 4),

              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2E4E6F)),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2E4E6F)),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // Login Button
              Center(
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF2E4E6F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      print("LOGIN  button pressed");
                    },
                    child: const Text(
                      "SIGNUP",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 9),

              // Sign Up Text
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have Account? ",
                      style: TextStyle(fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Login  button pressed");
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Color(0xFF2E4E6F),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
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
