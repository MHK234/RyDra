import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rydra/screens/HomeScreen.dart';
import 'package:rydra/screens/bikeDetails.dart';
import 'package:rydra/screens/signupScreen.dart' hide BottomWaveClipper;
import '../components/bottomClipper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoginScreenContent(),
    );
  }
}

class LoginScreenContent extends StatelessWidget {
  const LoginScreenContent({super.key});

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
                'Sign in',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF2E4E6F),
                  fontFamily: "Sigmar",
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
              const SizedBox(height: 7),

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
              const SizedBox(height: 5),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    print("Forgot Password  button pressed");
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 13, color: Color(0xFF2E4E6F)),
                  ),
                ),
              ),

              const SizedBox(height: 2),

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
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Bikedetails()),
                      );
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        fontFamily: "Sigmar",
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
                      "Don't Have Account? ",
                      style: TextStyle(fontSize: 13),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Signup  button pressed");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "SIGNUP",
                        style: TextStyle(
                          color: Color(0xFF2E4E6F),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Sigmar",
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
