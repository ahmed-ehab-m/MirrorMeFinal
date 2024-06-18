import 'package:flutter/material.dart';
import 'package:mirror_me_app/screens/afterWelcome.dart';
import '../../colors/color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 116,
        ),
        Center(
          child: Image.asset(
            'images/welcome.png',
          ),
        ),
        const SizedBox(
          height: 55,
        ),
        Text('Welcome',
            style: TextStyle(
              fontSize: 50,
              color: col,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center),
        const SizedBox(
          height: 50,
        ),
        const Text('Now you can try the clothes you like  ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center),
        const Text('virtually and see how it looks on you',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AfterWelcome()));
          },
          child: const Center(
            child: Text(
              'Continue',
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
    ));
  }
}
