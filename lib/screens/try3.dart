import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';

class TryPage3 extends StatefulWidget {
  const TryPage3({super.key});
  static String id = 'TryPage3';

  @override
  State<TryPage3> createState() => _TryPage3State();
}

class _TryPage3State extends State<TryPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Try On',
          style: TextStyle(
              fontSize: 22, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // leading: InkWell(
        //   // child: Image.asset('images/itemsPage/Arrow - Left.png'),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color.fromARGB(255, 218, 215, 215),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'images/TESTING3.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
