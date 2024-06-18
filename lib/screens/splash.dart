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
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 1), () {
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  //   });
  // }

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
      // body: Stack(
      //   children: [
      //     Row(
      //       children: [
      //         const Spacer(),
      //         Image.asset('images/Ellipse 31.png'),
      //       ],
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       // crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Center(
      //           child: Text('Mirror',
      //               style: TextStyle(
      //                 fontSize: 80,
      //                 color: col,
      //                 fontWeight: FontWeight.w400,
      //                 fontFamily: 'MiltonianTattoo',
      //               ),
      //               textAlign: TextAlign.center),
      //         ),
      //         Text(
      //           'Me',
      //           style: TextStyle(
      //             fontSize: 80,
      //             color: col,
      //             fontWeight: FontWeight.w400,
      //             fontFamily: 'MiltonianTattoo',
      //           ),
      //           textAlign: TextAlign.center,
      //         ),
      //       ],
      //     ),
      //     Align(
      //       child: Image.asset('images/Ellipse 31 (1).png'),
      //       alignment: Alignment.bottomLeft,
      //     ),
      //   ],
      // )),
    );
  }
}
