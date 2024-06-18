import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.onChanged,
      this.onSubmitted,
      required this.label,
      this.obscureText = false,
      this.suffix_icon,
      required this.icon});
  String? label;

  Function(String)? onChanged;
  Function(String)? onSubmitted;
  bool? obscureText;
  Icon icon;
  Icon? suffix_icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
      },
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xff4280EF).withOpacity(0.07),
        prefixIcon: Image.asset('images/homePage/Search.png'),
        prefixIconColor: kPrimaryColor,
        suffixIcon: suffix_icon,
        // suffixIconColor: Colors.black,
        // hintText: hintText,
        label: Text(
          label!,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        border: OutlineInputBorder(
            //borderSide: BorderSide(width: 0.5, color: Colors.red),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
