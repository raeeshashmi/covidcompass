import 'package:covidtracker/screens/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        cardTheme: CardTheme(
          color: Colors.grey.shade900,
        ),
        dividerTheme: DividerThemeData(
          color: Colors.grey.shade800,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
