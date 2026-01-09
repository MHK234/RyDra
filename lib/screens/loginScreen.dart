import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rydra/components/authservice.dart';
import 'package:rydra/components/inputfield.dart';
import 'package:rydra/components/popupDialog.dart';
import 'package:rydra/screens/bikeDetails.dart';
import 'package:rydra/screens/signupScreen.dart' hide BottomWaveClipper;
import '../components/bottomClipper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: LoginScreenContent(),
    );
  }
}

// ================= LOGIN CONTENT =================

class LoginScreenContent extends StatefulWidget {
  const LoginScreenContent({super.key});

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  bool loading = false;

  void login() async {
    setState(() => loading = true);
    try {
      final user = await _authService.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        await StatusPopup.show(
          context,
          message: "Login Successful",
          type: PopupType.success,
        );

        if (!context.mounted) return;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Bikedetails()),
        );
      }
    } catch (e) {
      StatusPopup.show(
        context,
        message: "Invalid email or password",
        type: PopupType.failure,
      );
    }
    setState(() => loading = false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                'Sign in',
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
                type: TextInputType.emailAddress,
              ),

              const SizedBox(height: 7),
              InputField(
                hint: "Enter Password",
                controller: passwordController,
                isNumber: false,
                isPassword: true,
                type: TextInputType.text,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 13, color: Color(0xFF2E4E6F)),
                  ),
                ),
              ),

              const SizedBox(height: 10),

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
                    login();
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontFamily: "Sigmar",
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have Account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: const Text(
                      "SIGNUP",
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
