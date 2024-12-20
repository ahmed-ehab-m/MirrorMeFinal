import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    required this.text,
  });
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(32),
          ),
          width: double.infinity,
          height: 60,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
