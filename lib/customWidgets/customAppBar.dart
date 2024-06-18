import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/screens/signin.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        child: const Icon(
          CupertinoIcons.back,
          color: Color(0xFF0A2472),
        ),
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const SignIn()));
        },
      ),
      title: Text(
        '$text',
        style: TextStyle(color: Color(0xFF0A2472)),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
