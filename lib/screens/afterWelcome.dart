import 'package:flutter/material.dart';
import 'package:mirror_me_app/screens/signin.dart';
import 'package:mirror_me_app/screens/signup.dart';
import '../../colors/color.dart';

class AfterWelcome extends StatelessWidget {
  const AfterWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 116,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Image.asset(
                'images/afterwelcome.png',
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Text('Just from your home!',
              style: TextStyle(
                fontSize: 30,
                color: col,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: const Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w400),
              ),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: col,
                fixedSize: Size(310, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: const Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w400),
              ),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: col,
                fixedSize: Size(310, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          )
        ],
      ),
    ));
  }
}
