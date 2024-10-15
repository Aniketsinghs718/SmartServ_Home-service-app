import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the login screen

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to Login after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Home Service App',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
