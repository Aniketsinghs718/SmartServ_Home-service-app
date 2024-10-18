import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        home: SplashScreen(), // Start with the Splash Screen
      ),
    );
  }
}
