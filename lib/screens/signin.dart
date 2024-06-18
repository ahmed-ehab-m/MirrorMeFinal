import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mirror_me_app/main.dart';
import 'package:mirror_me_app/screens/afterWelcome.dart';
import 'package:mirror_me_app/screens/home_page.dart';
import 'package:mirror_me_app/screens/mainPage.dart';
import 'package:mirror_me_app/screens/profilePage.dart';
import 'package:mirror_me_app/screens/send_otp.dart';
import 'package:mirror_me_app/screens/signup.dart';
import '../../colors/color.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:validate_firebase_auth/validate_firebase_auth.dart';
import 'package:password_validated_field/password_validated_field.dart';
import 'package:validated/validated.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  static const String id = 'SignIn ';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formfield = GlobalKey<FormState>(); /////////////////////
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passTogule = true;

  void signIn(String email, String password, BuildContext context) async {
    if (_formfield.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Fetch user data from Firestore
        FirebaseFirestore.instance
            .collection('Users')
            .doc(credential.user!.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            // Navigate to the desired screen, passing the user data if needed
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          } else {
            print('User does not exist in Firestore');
          }
        }).catchError((error) {
          print('Error retrieving user data from Firestore: $error');
        });
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'Check your Email Or Password ';
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.';
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const AfterWelcome()));
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
            key: _formfield, /////////////////////
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome back! ",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: col,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(
                        color: const Color(0xff5555550)
                            .withOpacity(0.59), //<-- SEE HERE
                      ),
                      fillColor: const Color(0xffD9D9D9).withOpacity(0.1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                        ),
                      ),
                      constraints: BoxConstraints(minHeight: 57),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your name";
                      } else if (emailController.text.length < 6) {
                        return "username Length Should be more than 6 characters";
                      }
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
                    obscureText: passTogule, //////////////
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: const Color(0xff5555550)
                              .withOpacity(0.59), //<-- SEE HERE
                        ),
                        fillColor: const Color(0xffD9D9D9).withOpacity(0.1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        constraints: BoxConstraints(minHeight: 57),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: const Color(0xffD9D9D9).withOpacity(0.1),
                          ),
                        ),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passTogule = !passTogule;
                            });
                          },
                          child: Icon(
                              passTogule
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: col),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Password";
                      } else if (passController.text.length < 6) {
                        return "Password Length Should be more than 6 characters";
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                  child: Row(
                    children: [
                      Spacer(),
                      TextButton(
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: col,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Send()));
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    signIn(emailController.text, passController.text, context);
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
                      fixedSize: Size(310, 59),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    signInWithGoogle();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  child: Container(
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     border: Border.all(
                    //       color: col,
                    //       width: 1,
                    //     )),
                    width: 400,
                    height: 59,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/Googl.png',
                            height: 24,
                            width: 25.5,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign In with Google',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(350, 59),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: col))),
                ),

                // ElevatedButton(
                //   onPressed: () {
                //     signIn(emailController.text, passController.text, context);
                //   },
                //   child: const Center(
                //     child: Text(
                //       'Sign In',
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 35,
                //           fontWeight: FontWeight.w400),
                //     ),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //       backgroundColor: col,
                //       fixedSize: Size(310, 59),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       )),
                // ),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () {
                    // signInWithGoogle();
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => MainPage()));
                  },
                  child: Container(
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     border: Border.all(
                    //       color: col,
                    //       width: 1,
                    //     )),
                    width: 400,
                    height: 51,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/facebook.png',
                            height: 16,
                            width: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign In with Facebook',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(350, 59),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: col))),
                ),
                // Container(
                //   child: Center(
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Image.asset(
                //           'images/facebook.png',
                //           height: 16,
                //           width: 16,
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Text(
                //           'Sign In with Facebook',
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400),
                //         ),
                //       ],
                //     ),
                //   ),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       border: Border.all(
                //         color: col,
                //         width: 1,
                //       )),
                //   width: 342,
                //   height: 51,
                // ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Sign Up ',
                        style: TextStyle(
                            color: col,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
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
