import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/screens/welcome.dart';
import '../../colors/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = "splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedSplashScreen(
          splash: Center(
            child: Image.asset(
              'images/splash.png',
              height: 900,
              width: 1000,
            ),
          ),
          nextScreen: WelcomeScreen(),
          splashTransition: SplashTransition.fadeTransition,
          duration: 1500,
        ),
      ),
    );
  }
}
