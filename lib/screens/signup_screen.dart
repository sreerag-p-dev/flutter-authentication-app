import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nxlapp/widgets/custom_elevated_button.dart';
import 'package:nxlapp/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Register Now",
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
                inputfield(controller: nameController, hintText: "Full Name"),
                SizedBox(height: 20),
                inputfield(controller: emailController, hintText: "Email"),
                SizedBox(height: 20),
                inputfield(
                  controller: passwordController,
                  hintText: "Password",
                ),
                SizedBox(height: 20),
                inputfield(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          SizedBox(height: 20),
          customElevatedButton(label: "Sign Up", onPressed: () {}),
          SizedBox(height: 17),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              "Back to Login",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
