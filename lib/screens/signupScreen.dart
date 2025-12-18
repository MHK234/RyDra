import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rydra/components/inputfield.dart';
import 'package:rydra/screens/bikeDetails.dart';
import 'package:rydra/screens/loginScreen.dart';
import '../components/bottomClipper.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignupScreenContent(),
    );
  }
}

// ================= SIGNUP CONTENT =================

class SignupScreenContent extends StatefulWidget {
  const SignupScreenContent({super.key});
  @override
  State<SignupScreenContent> createState() => _SignupScreenContentState();
}

class _SignupScreenContentState extends State<SignupScreenContent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/backgroundImage.png',
            fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          child: ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(color: Colors.white),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF2E4E6F),
                  fontFamily: "Sigmar",
                ),
              ),

              const SizedBox(height: 10),
              InputField(
                hint: "Enter Email",
                controller: emailController,
                isNumber: false,
                isPassword: false,
              ),

              const SizedBox(height: 6),
              InputField(
                hint: "Enter Password",
                controller: passwordController,
                isNumber: false,
                isPassword: true,
              ),

              const SizedBox(height: 6),
              InputField(
                hint: "Confirm Password",
                controller: confirmPasswordController,
                isNumber: false,
                isPassword: true,
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E4E6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Bikedetails()),
                    );
                  },
                  child: const Text(
                    "SIGNUP",
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontFamily: "Sigmar",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have Account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Color(0xFF2E4E6F),
                        fontFamily: "Sigmar",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
