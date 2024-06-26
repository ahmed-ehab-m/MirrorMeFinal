import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';

class TryPage2 extends StatefulWidget {
  const TryPage2({super.key});
  static const String id = 'TryPage2';

  @override
  State<TryPage2> createState() => _TryPageState();
}

class _TryPageState extends State<TryPage2> {
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
        child: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(24),
            color: Color.fromARGB(255, 218, 215, 215),
          ),
          child: Image.asset(
            'images/TESTING2.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
