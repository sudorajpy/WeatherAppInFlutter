import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:moderan_weather_app/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
      title: "Weather App",
      debugShowCheckedModeBanner: false,
    );
  }
}
