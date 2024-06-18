import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mirror_me_app/screens/signin.dart';
import '../../colors/color.dart';

class NewPassword extends StatefulWidget {
  NewPassword(
      // {super.key}
      );

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formfield = GlobalKey<FormState>(); /////////////////////
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passwordTogule = true;
  bool confirmPasswordTogule = true;
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
                MaterialPageRoute(builder: (context) => const SignIn()));
          },

          // onTap: () {
          //   Navigator.pushReplacement(
          //       context, MaterialPageRoute(builder: (context) => LogIn()));
          // },
        ),
        title: const Text(
          'Back',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: Form(
            key: _formfield, /////////////////////
            child: Column(
              children: [
                Text(
                  "Create new password ",
                  style: TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w600, color: col),
                ),
                const SizedBox(
                  height: 65,
                ),
                Row(
                  children: [
                    Text(
                      "New password ",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 48,
                  child: SizedBox(
                    height: 48,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: passwordController,
                      obscureText: passwordTogule, //////////////
                      decoration: InputDecoration(
                          labelText: 'Enter new password',
                          labelStyle: TextStyle(
                            color: const Color(0xff555555)
                                .withOpacity(0.59), //<-- SEE HERE
                          ),
                          fillColor: const Color(0xffD9D9D9).withOpacity(0.1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            // borderSide: BorderSide(
                            //   color: Colors.white,
                            // ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: const Color(0xffE1E1E1),
                            ),
                          ),

                          //prefixIcon: Icon(CupertinoIcons.lock),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                ////////////////////
                                passwordTogule = !passwordTogule;
                              });
                            },
                            child: Icon(
                                passwordTogule
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: col),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Password";
                        } else if (passwordController.text.length < 6) {
                          return "Password Length Should be more than 6 characters";
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Text(
                      "Confirm password ",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  //height: 48,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: confirmPasswordController,
                    obscureText: confirmPasswordTogule, //////////////
                    decoration: InputDecoration(
                        labelText: 'Enter new password',
                        labelStyle: TextStyle(
                          color: const Color(0xff555555)
                              .withOpacity(0.59), //<-- SEE HERE
                        ),
                        fillColor: const Color(0xffD9D9D9).withOpacity(0.1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(
                          //   color: Colors.white,
                          // ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: const Color(0xffE1E1E1),
                          ),
                        ),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              ////////////////////
                              confirmPasswordTogule = !confirmPasswordTogule;
                            });
                          },
                          child: Icon(
                              confirmPasswordTogule
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: col),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Password";
                      } else if (confirmPasswordController.text !=
                          passwordController.text) {
                        return "Password doesn't match";
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 75,
                ),

                ElevatedButton(
                  onPressed: () {
                    if (_formfield.currentState!.validate()) {
                      print('succes');

                      passwordController.clear();
                      confirmPasswordController.clear();
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MoviesView()));
                    }
                  },
                  child: const Center(
                    child: Text(
                      'Reset new password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: col,
                      fixedSize: Size(342, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
