import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/screens/afterWelcome.dart';
import 'package:mirror_me_app/screens/send_otp.dart';
import 'package:mirror_me_app/screens/signin.dart';
import '../../colors/color.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String id = 'SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool passToggle = true;
  bool confirmPassToggle = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void postDetailsToFirestore(String username, String email, String uid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference ref = FirebaseFirestore.instance.collection('Users');
    Map<String, dynamic> userData = {
      'username': username,
      'email': email,
      'uid': uid,
    };
    await ref.doc(uid).set(userData);
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    }
  }

  void signUp(String username, String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        postDetailsToFirestore(username, email, userCredential.user!.uid); // تمرير معرف المستخدم الجديد هنا
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Registration successful!'),
            actions: [
              TextButton(
                onPressed: () {
                  if (mounted) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: const Text('The email address is already in use.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    }
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
            if (mounted) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AfterWelcome()));
            }
          },
        ),
        title: const Text(
          'Back',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Getting started ",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700, color: col),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle: TextStyle(
                        color: const Color(0xff5555550).withOpacity(0.59),
                      ),
                      fillColor: const Color(0xffD9D9D9).withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: KPrimaryColor,
                        ),
                      ),
                      constraints: const BoxConstraints(minHeight: 57),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your name";
                      } else if (nameController.text.length < 6) {
                        return "Username Length Should be more than 6 characters";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                        color: const Color(0xff5555550).withOpacity(0.59),
                      ),
                      fillColor: const Color(0xffD9D9D9).withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: KPrimaryColor , 
                        ),
                      ),
                      constraints: const BoxConstraints(minHeight: 57),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your email";
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "Enter Valid Email";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: passController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: const Color(0xff5555550).withOpacity(0.59),
                      ),
                      fillColor: const Color(0xffD9D9D9).withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color:KPrimaryColor ,
                        ),
                      ),
                      constraints: const BoxConstraints(minHeight: 57),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off,
                          color: col,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Password";
                      } else if (passController.text.length < 6) {
                        return "Password Length Should be more than 6 characters";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: confirmPassController,
                    obscureText: confirmPassToggle,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        color: const Color(0xff5555550).withOpacity(0.59),
                      ),
                      fillColor: const Color(0xffD9D9D9).withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color:KPrimaryColor,
                        ),
                      ),
                      constraints: const BoxConstraints(minHeight: 57),
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            confirmPassToggle = !confirmPassToggle;
                          });
                        },
                        child: Icon(
                          confirmPassToggle ? Icons.visibility : Icons.visibility_off,
                          color: col,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Password";
                      } else if (confirmPassController.text != passController.text) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (mounted) {
                      signUp(nameController.text, emailController.text, passController.text);
                    }
                  },
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: col,
                    fixedSize: const Size(310, 59),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Sign In ',
                        style: TextStyle(
                          color: KPrimaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        if (mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const SignIn()),
                          );
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
