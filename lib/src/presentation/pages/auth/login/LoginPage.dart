import 'package:flutter/material.dart';
import 'package:indriver_rosa/src/presentation/pages/auth/login/LoginContent.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 143, 243, 147),
      body: LoginContent()
    );
  }
}