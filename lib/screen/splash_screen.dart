
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moderan_weather_app/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // create a method to navigate to home screen
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen() )
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            Image.asset("assets/icons/logo.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "WEATHER APP",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "By : Raj Singh",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
