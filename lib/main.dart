import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'screens/splash_screen.dart'; // Import your splash screen
import 'screens/login_screen.dart'; // Import your login screen
import 'screens/signup_screen.dart'; // Import your signup screen
import 'screens/home_screen.dart'; // Import your home screen
import 'providers/order_provider.dart'; // Import your order provider

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                OrderProvider()), // Provide your OrderProvider here
        // Add other providers if necessary
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home Service App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<bool>(
          future: _checkLoginStatus(), // Check login status
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator()); // Loading spinner
            } else {
              // Navigate based on login status
              return snapshot.data == true ? HomeScreen() : LoginScreen();
            }
          },
        ),
      ),
    );
  }

  // Function to check if the user is logged in
  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');

    // Check if email and password are not null (i.e., user is logged in)
    return email != null && password != null;
  }
}
