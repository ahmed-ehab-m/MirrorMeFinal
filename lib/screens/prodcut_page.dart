import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/providers/my_cart_provider.dart';
import 'package:mirror_me_app/screens/cart_screen.dart';
import 'package:mirror_me_app/screens/three.dart';
import 'package:mirror_me_app/screens/try2.dart';
import 'package:mirror_me_app/screens/try3.dart';

import 'package:mirror_me_app/screens/try_page.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ProdcutPage extends StatefulWidget {
  ProdcutPage({Key? key, required this.p1, this.pass});
  static const String id = 'ProdcutPage';
  final Productone p1;
  String? pass;
  // static int quantity = 1;

  @override
  State<ProdcutPage> createState() => _ProdcutPageState();
}

class _ProdcutPageState extends State<ProdcutPage> {
  @override
  int count = 1;
  int quantity = 1;
  // double top = 0;
  // double bottom = 0;
  // double left = 0;
  // double right = 0;
  bool isZoomed = false;
  bool isSelected = false;
  bool selected = false;
  int selectedSize = -1;
  bool isSelectedSize = false;
  int selectedIndex = -1;
  int selectedIndexColor = -1;
  String resultSize = '';
  String? resultColor;
  void tryOn() async {
    String apiUrl =
        'http://10.0.2.2:5000/tryon'; // تعديل هنا على حسب عنوان Flask app الخاص بك

    Map<String, String> headers = {
      "Content-type": "application/json",
    };

    Map<String, dynamic> data = {
      "personImage":
          'C:\Users\jamal\Desktop\DM-VTON555555\VITON-Clean\VITON_traindata\train_img\000068_0.jpg',
      // "clothImage": widget.pass,
      "clothImage": widget.pass,
    };

    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(data), // تحويل البيانات إلى JSON قبل إرسالها
    );

    if (response.statusCode == 200) {
      print('Try-on request sent successfully!');
    } else {
      print('Error during try-on request: ${response.statusCode}');
    }
  }

  final List<String> pageRoutes2 = [
    TryPage.id,
    TryPage2.id,
    TryPage3.id,
  ];
  Widget build(BuildContext context) {
    // Future<void> addToCart(String name, String price, String image) async {
    //   try {
    //     await FirebaseFirestore.instance.collection('cart').add({
    //       'name': name,
    //       'price': price,
    //       'image': image,
    //     });
    //     print('Product added to cart successfully!');
    //   } catch (e) {
    //     print('Error adding product to cart: $e');
    //   }
    // }

    Future<void> addToCart(
        String productName, int price, String imageUrl) async {
      try {
        var user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestore.instance.collection('cart').add({
            'userId': user.uid,
            'name': productName,
            'price': price,
            'image': imageUrl,
          });
          print('Product added to cart successfully!');
        }
      } catch (e) {
        print('Error adding product to cart: $e');
      }
    }

    final Map<String, dynamic>? productdata =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String? image = productdata?['image'] as String?;
    final String? name = productdata?['name'] as String?;
    final String? price = productdata?['price'] as String?;
    final provider = Provider.of<MyCartProvider>(context);
    //Product product = ModalRoute.of(context)!.settings.arguments as Product;
    final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
    final Map<String, Color> colors = {
      'black': Colors.black,
      'white': Colors.white,
      'grey': Colors.grey,
      'green': Colors.green,
      'red': Colors.red,
    };
    final List<String> models = [
      'images/000262_0.jpg',
      'images/000283_0.jpg',
      'images/000429_0.jpg',
    ];
    return Scaffold(
        backgroundColor: Color(0xfff6f6f6),
        key: _scaffoldKey,
        appBar: AppBar(
          actions: [],
          backgroundColor: Colors.white,
        ),
        body: Scrollbar(
          thickness: 10,
          thumbVisibility: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.p1.image!,
                  height: 300,
                  width: 300,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.35),
                      borderRadius: BorderRadiusDirectional.circular(8)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.p1.name!,
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Length : 14 in',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Material : 100% Cotton',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Washing Instructions : Machine wash cold',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Size',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 10);
                                },
                                itemCount: sizes.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        resultSize = sizes[index];
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      child: Center(
                                        child: Text(
                                          sizes[index],
                                          style: TextStyle(
                                              color: selectedIndex == index
                                                  ? Colors.white
                                                  : kPrimaryColor,
                                              fontSize: 25),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: selectedIndex == index
                                              ? kPrimaryColor
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Color',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 15);
                                },
                                itemCount: colors.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndexColor = index;
                                        resultColor =
                                            colors.keys.elementAt(index);
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 40,
                                      child: selectedIndexColor == index
                                          ? Icon(
                                              CupertinoIcons.check_mark,
                                              color: Colors.grey.shade400,
                                            )
                                          : Text(''),
                                      decoration: BoxDecoration(
                                          color: colors.values.elementAt(index),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text('Quantity : ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor)),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity -= 1;
                                    if (quantity <= 0) {
                                      quantity = 1;
                                    }

                                    //  widget.p1.amount=ProdcutPage.quantity ;
                                  });
                                },
                                icon: const Icon(Icons.remove),
                                iconSize: 25,
                              ),
                              Text(
                                '${quantity}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity += 1;
                                  });
                                },
                                icon: const Icon(Icons.add),
                                iconSize: 25,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //Navigator.pushNamed(context, TryPage.id);
                                },
                                child: Center(
                                  child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: kPrimaryColor,
                                        shadowColor: Colors.transparent,
                                        //fixedSize: Size(150, 50),
                                      ),
                                      onPressed: () {
                                        // provider.addItem(widget.p1);
                                        addToCart(
                                          widget.p1.name,
                                          widget.p1.price,
                                          widget.p1.image,
                                        );

                                        Navigator.pushNamed(
                                            context, CartScreen.ids,
                                            arguments: {
                                              // 'image': image,
                                              // 'name': name,
                                              // 'price': price,
                                              'quantity': quantity,
                                              'resultColor': resultColor,
                                              'resultSize': resultSize,
                                              'productone': widget.p1,

                                              // 'amount': widget.p1.amount,
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.cart,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Add to cart',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  // onPressed: () {
                                  //   tryOn();
                                  // },
                                  onPressed: () {
                                    showGeneralDialog(
                                        context: context,
                                        transitionDuration:
                                            Duration(milliseconds: 400),
                                        pageBuilder: (bc, ania, anis) {
                                          return SizedBox.expand(
                                            child: Container(
                                              color: Colors.white,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    Text(
                                                      'Choose Model',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: kPrimaryColor),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: GridView.builder(
                                                          itemCount: 3,
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                10,
                                                            mainAxisSpacing: 10,
                                                          ),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                // tryOn();

                                                                Navigator.pushNamed(
                                                                    context,
                                                                    pageRoutes2[
                                                                        index]);
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20), // تعديل انحناء الزوايا هنا
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .white, // لون الحدود
                                                                    width:
                                                                        0.5, // سمك الحدود
                                                                  ),
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20), // نفس انحناء الزوايا هنا
                                                                  child: Image
                                                                      .asset(
                                                                    models[
                                                                        index],
                                                                    width: 100,
                                                                    height: 100,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          elevation: 0,
                                                          backgroundColor:
                                                              kPrimaryColor,
                                                          shadowColor: Colors
                                                              .transparent,
                                                          //fixedSize: Size(150, 50),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          "Close",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: kPrimaryColor,
                                    shadowColor: Colors.transparent,
                                    //fixedSize: Size(150, 50),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            'images/homePage/Vector (2).png'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Try it virtually',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'You may also like this',
                  style: TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Image.asset('images/adi.jpeg',
                          width: 190, height: 190),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) =>
                        //             ProdcutPage(p1: widget.p1))));
                      },
                    ),
                    Image.asset('images/adi2.jpeg', width: 150, height: 190),
                  ],
                ),
              ],
            ),
          ),
        )
        // body: Stack(
        //   children: [
        //     Positioned(
        //       child: Image.network(
        //         widget.p1.image!,
        //         height: 400,
        //         width: 400,
        //       ),
        //       bottom: 0,
        //       right: 0,
        //       left: 10,
        //       top: -700,
        //     ),
        //     Positioned(
        //       child: InkWell(
        //         child: Image.asset('images/itemsPage/Arrow - Left.png'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       bottom: 0,
        //       right: 340,
        //       left: 0,
        //       top: -655,
        //     ),
        //     Positioned(
        //       top: 140,
        //       left: 0,
        //       right: 0,
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color: Colors.blue.withOpacity(0.35),
        //         ),
        //         padding: EdgeInsets.symmetric(vertical: 20),
        //         child: Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 25),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 widget.p1.name!,
        //                 style: TextStyle(
        //                     color: Colors.black,
        //                     fontSize: 20,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //               Text(
        //                 'Length : productLength',
        //                 style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 16,
        //                 ),
        //               ),
        //               Text(
        //                 'Material : productMaterial',
        //                 style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 16,
        //                 ),
        //               ),
        //               Text(
        //                 'Washing Instructions : productWashing',
        //                 style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 16,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //               Text(
        //                 'Size',
        //                 style: TextStyle(
        //                     color: Colors.black,
        //                     fontSize: 20,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Container(
        //                 height: 40,
        //                 child: ListView.separated(
        //                     separatorBuilder: (context, index) {
        //                       return SizedBox(width: 10);
        //                     },
        //                     itemCount: sizes.length,
        //                     scrollDirection: Axis.horizontal,
        //                     itemBuilder: (BuildContext context, int index) {
        //                       return GestureDetector(
        //                         onTap: () {
        //                           setState(() {
        //                             selectedIndex = index;
        //                             resultSize = sizes[index];
        //                           });
        //                         },
        //                         child: Container(
        //                           width: 50,
        //                           child: Center(
        //                             child: Text(
        //                               sizes[index],
        //                               style: TextStyle(
        //                                   color: selectedIndex == index
        //                                       ? Colors.white
        //                                       : kPrimaryColor,
        //                                   fontSize: 25),
        //                             ),
        //                           ),
        //                           decoration: BoxDecoration(
        //                               color: selectedIndex == index
        //                                   ? kPrimaryColor
        //                                   : Colors.white,
        //                               borderRadius: BorderRadius.circular(8)),
        //                         ),
        //                       );
        //                     }),
        //               ),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //               Text(
        //                 'Color',
        //                 style: TextStyle(
        //                     color: Colors.black,
        //                     fontSize: 20,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Container(
        //                 height: 40,
        //                 child: ListView.separated(
        //                     separatorBuilder: (context, index) {
        //                       return SizedBox(width: 15);
        //                     },
        //                     itemCount: colors.length,
        //                     scrollDirection: Axis.horizontal,
        //                     itemBuilder: (BuildContext context, int index) {
        //                       return GestureDetector(
        //                         onTap: () {
        //                           setState(() {
        //                             selectedIndexColor = index;
        //                             resultColor = colors.keys.elementAt(index);
        //                           });
        //                         },
        //                         child: Container(
        //                           height: 50,
        //                           width: 40,
        //                           child: selectedIndexColor == index
        //                               ? Icon(
        //                                   CupertinoIcons.check_mark,
        //                                   color: Colors.grey.shade400,
        //                                 )
        //                               : Text(''),
        //                           decoration: BoxDecoration(
        //                               color: colors.values.elementAt(index),
        //                               borderRadius: BorderRadius.circular(8)),
        //                         ),
        //                       );
        //                     }),
        //               ),

        //               SizedBox(
        //                 height: 20,
        //               ),

        //             Row(
        //           children: [
        //             const Text('Quantity : ',
        //                 style:
        //                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        //             IconButton(
        //               onPressed: () {
        //                 setState(() {
        //                   ProdcutPage.quantity -= 1;
        //                   if (ProdcutPage.quantity <= 0) {
        //                     ProdcutPage.quantity = 1;
        //                   }

        //                   //  widget.p1.amount=ProdcutPage.quantity ;

        //                 });
        //               },
        //               icon: const Icon(Icons.remove),
        //               iconSize: 25,
        //             ),
        //             Text(
        //               '${ProdcutPage.quantity}',
        //               style: const TextStyle(
        //                   fontSize: 20, fontWeight: FontWeight.bold),
        //             ),
        //             IconButton(
        //               onPressed: () {
        //                 setState(() {
        //                   ProdcutPage.quantity += 1;
        //                 });
        //               },
        //               icon: const Icon(Icons.add),
        //               iconSize: 25,
        //             ),
        //           ],
        //         ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   GestureDetector(
        //                     onTap: () {
        //                       //Navigator.pushNamed(context, TryPage.id);
        //                     },
        //                     child: Center(
        //                       child: SizedBox(
        //                         height: 50,
        //                         child: ElevatedButton(
        //                           style: ElevatedButton.styleFrom(
        //                             elevation: 0,
        //                             backgroundColor: kPrimaryColor,
        //                             shadowColor: Colors.transparent,
        //                             //fixedSize: Size(150, 50),
        //                           ),
        //                           onPressed: () {
        //                             // provider.addItem(widget.p1);
        //                             addToCart(
        //                                 widget.p1.name,
        //                                 widget.p1.price,
        //                                 widget.p1.image);

        //                             Navigator.pushNamed(context, CartScreen.ids,
        //                                 arguments: {
        //                                   // 'image': image,
        //                                   // 'name': name,
        //                                   // 'price': price,
        //                                   'resultColor': resultColor,
        //                                   'resultSize': resultSize,
        //                                   'productone': widget.p1,
        //                                   // 'amount': widget.p1.amount,

        //                                 });
        //                           },
        //                           child: Row(
        //                             children: [
        //                               Icon(
        //                                 CupertinoIcons.cart,
        //                                 color: Colors.white,
        //                               ),
        //                               SizedBox(
        //                                 width: 10,
        //                               ),
        //                               Text(
        //                                 'Add to cart',
        //                                 style: TextStyle(
        //                                     color: Colors.white, fontSize: 15),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     width: 10,
        //                   ),
        //                   SizedBox(
        //                     height: 50,
        //                     child: ElevatedButton(
        //                       onPressed: () {
        //                       },
        //                       style: ElevatedButton.styleFrom(
        //                         elevation: 0,
        //                         backgroundColor: kPrimaryColor,
        //                         shadowColor: Colors.transparent,
        //                         //fixedSize: Size(150, 50),
        //                       ),
        //                       child: Center(
        //                         child: Row(
        //                           children: [
        //                             Image.asset('images/homePage/Vector (2).png'),
        //                             SizedBox(
        //                               width: 10,
        //                             ),
        //                             Text(
        //                               'Try it virtually',
        //                               style: TextStyle(
        //                                   color: Colors.white, fontSize: 15),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     Positioned(
        //       child: Text(
        //         'You may also like this',
        //         style: TextStyle(
        //             fontSize: 20,
        //             color: kPrimaryColor,
        //             fontWeight: FontWeight.w500),
        //       ),
        //       bottom: 0,
        //       right: 0,
        //       left: 10,
        //       top: 570,
        //     ),
        //     Positioned(
        //       child: Row(
        //         children: [
        //           GestureDetector(
        //             child:
        //                 Image.network(widget.p1.image, width: 200, height: 200),
        //             onTap: () {
        //               // Navigator.push(
        //               //     context,
        //               //     MaterialPageRoute(
        //               //         builder: ((context) =>
        //               //             ProdcutPage(p1: widget.p1))));
        //             },
        //           ),
        //           Spacer(),
        //           Image.network(widget.p1.image, width: 180, height: 200),
        //         ],
        //       ),
        //       bottom: 0,
        //       right: 0,
        //       left: 10,
        //       top: 600,
        //     ),
        //   ],
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   selectedIconTheme: IconThemeData(
        //     size: 40,
        //   ),
        //   type: BottomNavigationBarType.fixed,
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         CupertinoIcons.home,
        //         color: Color(0xff0A2472),
        //       ),
        //       label: 'Home',
        //       activeIcon: Icon(
        //         CupertinoIcons.house_fill,
        //         color: Color(0xff0A2472),
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         CupertinoIcons.heart,
        //         color: Color(0xff0A2472),
        //       ),
        //       label: 'Favorites',
        //       activeIcon: Icon(
        //         CupertinoIcons.heart_fill,
        //         color: Color(0xff0A2472),
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         CupertinoIcons.cart,
        //         color: Color(0xff0A2472),
        //       ),
        //       label: 'Cart',
        //       activeIcon: Icon(
        //         CupertinoIcons.cart_fill,
        //         color: Color(0xff0A2472),
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         CupertinoIcons.person,
        //         color: Color(0xff0A2472),
        //       ),
        //       label: 'Profile',
        //       activeIcon: Icon(
        //         CupertinoIcons.person_fill,
        //         color: Color(0xff0A2472),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';

// // زر "Add to Cart" الذي يستدعي وظيفة addToCart عند الضغط
// ElevatedButton(
//   onPressed: () {

//   child: Text('Add to Cart'),
// ),