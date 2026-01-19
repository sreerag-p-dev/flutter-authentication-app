import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nxlapp/screens/home_screen.dart';
import 'package:nxlapp/screens/signup_screen.dart';
import 'package:nxlapp/widgets/custom_elevated_button.dart';
import 'package:nxlapp/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailError;
  String? passwordError;

  bool validate() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      // Email
      if (email.isEmpty) {
        emailError = "Email is required";
      } else if (!RegExp(
        r'^[\w\.\-]+@[\w\-]+\.[a-zA-Z]{2,4}$',
      ).hasMatch(email)) {
        emailError = "Invalid email address";
      } else {
        emailError = null;
      }

      // Password
      if (password.isEmpty) {
        passwordError = "Password is required";
      } else if (password.length < 6) {
        passwordError = "Password must be at least 6 characters";
      } else {
        passwordError = null;
      }
    });

    return emailError == null && passwordError == null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.brown[900],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                inputfield(
                  controller: emailController,
                  hintText: "Email",
                  errorMessage: emailError,
                ),
                (emailError == null)
                    ? SizedBox(height: 20)
                    : SizedBox(height: 5),
                inputfield(
                  controller: passwordController,
                  hintText: "Password",
                  errorMessage: passwordError,
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.brown[900],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          customElevatedButton(
            label: "Login",
            onPressed: () {
              if (!validate()) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            },
          ),
          SizedBox(height: 20),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Not registered yet? ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
