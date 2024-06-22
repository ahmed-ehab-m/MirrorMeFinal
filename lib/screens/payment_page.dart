import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/product.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/providers/my_cart_provider.dart';
import 'package:mirror_me_app/screens/order_details_page.dart';
import 'package:mirror_me_app/screens/paypal_checkout_view.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});
  static String id = 'PaymentPage';
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formfield = GlobalKey<FormState>(); /////////////////////
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final name2Controller = TextEditingController();
  final confirmPassController = TextEditingController();
  double transfeAmount = 5.0;
  double additionalCost = 5.0;
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyCartProvider>(context);
    final Map<String, dynamic>? orderData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String? image = orderData?['image'] as String?;
    final String? name = orderData?['name'] as String?;
    final String? price = orderData?['price'] as String?;
    final String? resultColor = orderData?['resultColor'] as String?;
    final String? resultSize = orderData?['resultSize'] as String?;
    final List<Productone>? product =
        orderData?['product'] as List<Productone>?;
    // final int? totalprice= orderData?['totalprice'] as int?;
    final int? quantity = orderData?['quantity'] as int?;
    final int? totalprice = orderData?['total'] as int?;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leading: InkWell(
        //   child: Image.asset('images/itemsPage/Arrow - Left.png'),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text(
          'User Details',
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Form(
            key: _formfield, /////////////////////
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 57,
                  // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: name2Controller,
                    decoration: InputDecoration(
                      labelText: 'User Name',
                      labelStyle: TextStyle(
                        color: const Color(0xff5555550)
                            .withOpacity(0.59), //<-- SEE HERE
                      ),
                      fillColor: const Color(0xffD9D9D9).withOpacity(0.3),
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
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                        ),
                      ),
                      constraints: BoxConstraints(minHeight: 57),

                      //prefixIcon: Icon(CupertinoIcons.mail),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your name";
                      } else if (name2Controller.text.length < 6) {
                        return "username Length Should be more than 6 characters";
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 57,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        color: const Color(0xff5555550)
                            .withOpacity(0.59), //<-- SEE HERE
                      ),
                      fillColor: const Color(0xffD9D9D9).withOpacity(0.3),
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
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                        ),
                      ),
                      constraints: BoxConstraints(minHeight: 57),
                      //prefixIcon: Icon(CupertinoIcons.mail),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your Phone Number";
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 57,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(
                        color: const Color(0xff5555550)
                            .withOpacity(0.59), //<-- SEE HERE
                      ),
                      fillColor: const Color(0xffD9D9D9).withOpacity(0.3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // borderSide: BorderSide(
                        //   color: Colors.white,
                        // ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                        ),
                      ),
                      constraints: BoxConstraints(minHeight: 57),
                      //prefixIcon: Icon(CupertinoIcons.mail),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your address";
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                Text(
                  'Payment Method',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 300,
                  child: ListTile(
                    tileColor: const Color(0xffD9D9D9).withOpacity(0.3),
                    title: IntrinsicHeight(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PaypalCheckoutView(
                              sandboxMode: true,
                              clientId:
                                  "AdWyvvPO5d1N7VLTGnjw6F-4q5hMhH5a5WhNyYiALTARBNR7VzYpRs9QD78pDE1qMhsN3_q1qpJG4ThE",
                              secretKey:
                                  "EE9d4HKgs3sdyXquo89ydfY2CpJagm_Wu6ShD_EN-CKoSf7n56-J-sxI3Wmbxbj-VahyHiihCfyzYZzX",
                              transactions: [
                                {
                                  "amount": {
                                    "total": '100',
                                    "currency": "USD",
                                    "details": {
                                      "subtotal": '100',
                                      "shipping": '0',
                                      "shipping_discount": 0
                                    }
                                  },
                                  "description":
                                      "The payment transaction description.",
                                  // "payment_options": {
                                  //   "allowed_payment_method":
                                  //       "INSTANT_FUNDING_SOURCE"
                                  // },
                                  "item_list": {
                                    "items": [
                                      {
                                        "name": "Apple",
                                        "quantity": 4,
                                        "price": '10',
                                        "currency": "USD"
                                      },
                                      {
                                        "name": "Pineapple",
                                        "quantity": 5,
                                        "price": '12',
                                        "currency": "USD"
                                      }
                                    ],

                                    // Optional
                                    //   "shipping_address": {
                                    //     "recipient_name": "Tharwat samy",
                                    //     "line1": "tharwat",
                                    //     "line2": "",
                                    //     "city": "tharwat",
                                    //     "country_code": "EG",
                                    //     "postal_code": "25025",
                                    //     "phone": "+00000000",
                                    //     "state": "ALex"
                                    //  },
                                  }
                                }
                              ],
                              note:
                                  "Contact us for any questions on your order.",
                              onSuccess: (Map params) async {
                                log("onSuccess: $params");
                                Navigator.pop(context);
                              },
                              onError: (error) {
                                log("onError: $error");
                                Navigator.pop(context);
                              },
                              onCancel: () {
                                print('cancelled:');
                                Navigator.pop(context);
                              },
                            ),
                          ));
                        },
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.creditcard_fill,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            VerticalDivider(
                              thickness: 1,
                              width: 10,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Credit Card',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    trailing: Radio(
                      value: 'Credit Card',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value as String;
                        });
                      },
                    ),
                    visualDensity: VisualDensity(vertical: 4),
                    shape: RoundedRectangleBorder(
                      //side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: ListTile(
                    tileColor: const Color(0xffD9D9D9).withOpacity(0.3),
                    title: IntrinsicHeight(
                      child: Row(
                        children: [
                          Image.asset(
                            'images/paymentPage/Vector.jpg',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          VerticalDivider(
                            thickness: 1,
                            width: 10,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Cash',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    visualDensity: VisualDensity(vertical: 4),
                    shape: RoundedRectangleBorder(
                      //side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // trailing: VerticalDivider(
                    //   thickness: 2,
                    //   width: 10,
                    //   color: Colors.black,
                    // ),
                    trailing: Radio(
                      value: 'Cash',
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value as String;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Transfer Amount',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      '$transfeAmount',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Additional Cost ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      '$additionalCost',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      'Total ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      ' ${transfeAmount + additionalCost + totalprice!}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                // Text(
                //   'Selected Option: ${selectedOption ?? "None"}',
                //   style: TextStyle(fontSize: 16),
                // ),
                Center(
                  child: GestureDetector(
                    child: Container(
                      width: 150,
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onTap: () {
                      if (_formfield.currentState!.validate()) {
                        Navigator.pushNamed(context, OrderDetailsPage.id,
                            arguments: {
                              'username': name2Controller.text,
                              'phoneNo': phoneController.text,
                              'userAddress': addressController.text,
                              'resultColor': resultColor,
                              'resultSize': resultSize,
                              'quantity': quantity,
                              'total':
                                  transfeAmount + additionalCost + totalprice!,
                              // 'product': product,
                              //  'totalprice':totalprice,
                              // 'image':image,
                              //  'name':name,
                              //   'price':price,
                              'productone': product,
                            });
                        print('succes');
                        phoneController.clear();
                        addressController.clear();
                        name2Controller.clear();
                        confirmPassController.clear();
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MoviesView()));
                      }
                    },
                  ),
                ),
                //

                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
