import 'package:farms/firebase_options.dart';
import 'package:farms/pages/cart_page.dart';
import 'package:farms/pages/home_page.dart';
import 'package:farms/pages/navigation/fertilizerpage.dart';
import 'package:farms/pages/navigation/fruits.dart';
import 'package:farms/pages/navigation/vegatable.dart';
import 'package:farms/plantidentifierpage.dart';
import 'package:farms/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with the correct options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // No parentheses required
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/cart': (context) => const CartPage(),
        // Example route
        // Example route
        // Example route

        '/fertilizer': (context) => FertilizerPage(
              cartItems: [],
            ),

        '/fruits': (context) => const Fruits(),
        '/vegatable': (context) => const Vegatable(),
        '/plantidentifierpage': (context) => PlantIdentifierPage()
      },
    );
  }
}
