import 'dart:async';

import 'package:covidtracker/screens/world_states_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with TickerProviderStateMixin {
  late final _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat();

  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WorldStatesScreen()),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _animationController.value * 2 * math.pi,
                  child: child,
                );
              },
              child: Image.asset(
                'images/virus.png',
                width: screenWidth * 0.5,
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Text(
              'Covid-19\nTracker App',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: screenWidth * 0.075),
            ),
          ],
        ),
      ),
    );
  }
}
