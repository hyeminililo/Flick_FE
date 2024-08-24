import 'package:flick_frontend/user/google_login.dart';
import 'package:flutter/material.dart';

class GoogleLogin_screen extends StatefulWidget {
  const GoogleLogin_screen({super.key});

  @override
  State<GoogleLogin_screen> createState() => _GoogleLogin_screenState();
}

class _GoogleLogin_screenState extends State<GoogleLogin_screen> {
  final googleLogin = GoogleLogin();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text('')],
      ),
    );
  }
}
