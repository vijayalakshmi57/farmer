import 'package:farms/loginpage.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulating a delay for splash screen
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the home page after 3 seconds

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginRegisterPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.green, // Set a background color for your splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash.png', // Your app logo
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Farmer E-Commerce',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
