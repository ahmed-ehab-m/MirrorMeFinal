// import 'package:flutter/material.dart';

// class Field extends StatefulWidget {
//   const Field({super.key,required this.name2Controller,required this.phoneController,required this.addressController });
//   final TextEditingController phoneController ;
//   final TextEditingController addressController;
//   final TextEditingController name2Controller ;

//   @override
//   State<Field> createState() => _FieldState();
// }

// class _FieldState extends State<Field> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                   height: 57,
//                   // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     controller: 
//                     decoration: InputDecoration(
//                       labelText: 'User Name',
//                       labelStyle: TextStyle(
//                         color: const Color(0xff5555550)
//                             .withOpacity(0.59), //<-- SEE HERE
//                       ),
//                       fillColor: const Color(0xffD9D9D9).withOpacity(0.3),
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         // borderSide: BorderSide(
//                         //   color: Colors.white,
//                         // ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                         borderSide: BorderSide(
//                           color: const Color(0xffD9D9D9).withOpacity(0.1),
//                         ),
//                       ),
//                       constraints: BoxConstraints(minHeight: 57),

//                       //prefixIcon: Icon(CupertinoIcons.mail),
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return "Enter Your name";
//                       } else if (name2Controller.text.length < 6) {
//                         return "username Length Should be more than 6 characters";
//                       }
//                     },
//                   ),
//                 ),;
//   }
// }