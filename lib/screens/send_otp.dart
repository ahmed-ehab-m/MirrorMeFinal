import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mirror_me_app/colors/color.dart';
//import 'package:emailotp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mirror_me_app/screens/signin.dart';
import 'package:mirror_me_app/screens/signin.dart';
import 'package:mirror_me_app/screens/signup.dart';
import 'package:password_validated_field/password_validated_field.dart';
import 'package:validated/validated.dart';
import 'package:email_validator/email_validator.dart';

class Send extends StatefulWidget {
  const Send({Key? key}) : super(key: key);

  @override
  State<Send> createState() => _SendState();
}

class _SendState extends State<Send> {
  TextEditingController email = TextEditingController();

  Future<void> sendEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Password Reset Email Sent'),
          content: const Text('Check your email for the password reset link.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      print('Error sending password reset email: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'Failed to send password reset email. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    // Add your email sending logic here
    //  String emailText = email.text;
    // Example: sendEmailFunction(emailText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
        ),
        title: const Text(
          'Back',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Image.asset(
                  "images/pass.png",
                ),
              ),
              const SizedBox(
                height: 60,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 25, 36, 99)),
                ),
              ),
              const SizedBox(
                height: 60,
                child: Text(
                  "Enter your email for the verification process, we will send code to your email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.white,
                elevation: 0,
                child: Column(
                  children: [
                    TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          hintText: "Enter your email",
                          hintStyle: TextStyle(color: Color(0xFFBABABA)),
                          filled: true,
                          fillColor: Color(0xFFF5F5F5),
                          // focusColor: Color(0xFFF5F5F5),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE1E1E1),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF5F5F5),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? "enter a valid email"
                                : null),
                    const SizedBox(
                      height: 35,
                    ),
                    ElevatedButton(
                      onPressed: sendEmail,
                      child: const Text(
                        'Send verification code',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: col,
                          fixedSize: const Size(270, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
