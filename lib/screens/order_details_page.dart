import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/providers/my_order_provider.dart';
import 'package:mirror_me_app/screens/successfullOrder.dart';
import 'package:provider/provider.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({
    super.key,
  });

  static String id = 'OrderDetailsPage';

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  List<Productone> productList = [];
  @override
  Widget build(BuildContext context) {
    Future<void> MyOrders(String productName, int price, String imageUrl,
        String username, String phone, String Adress) async {
      try {
        var user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestore.instance.collection('orders').add({
            'userId': user.uid,
            'name': productName,
            'price': price,
            'image': imageUrl,
            'username': username,
            'phone': phone,
            'Adress': Adress,
          });
          print('Product added to cart successfully!');
        }
      } catch (e) {
        print('Error adding product to cart: $e');
      }
    }

    final provider = Provider.of<MyOrderProvider>(context);
    //Product product = ModalRoute.of(context)!.settings.arguments as Product;
    final Map<String, dynamic> orderData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String? username = orderData['username'] as String;
    final String? userAddress = orderData['userAddress'] as String;
    final String? phoneNo = orderData['phoneNo'] as String;
    final List<Productone> product =
        orderData['productone'] as List<Productone>;
    final String resultColor = orderData['resultColor'] as String;
    final String resultSize = orderData['resultSize'] as String;
    final int? quantity = orderData?['quantity'] as int?;
    // final String image = orderData['image'] as String;
    // final String? name = orderData?['name'] as String?;
    // final String? price = orderData?['price'] as String?;

    final double? totalprice = orderData?['total'] as double?;
    productList = provider.productList;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,

        // leading: InkWell(
        //   child: Image.asset('images/itemsPage/Arrow - Left.png'),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text(
          'Order Details',
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: ListView(
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Text(
                  'User Address:',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  userAddress!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Phone Number:',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 21,
                ),
                Text(
                  phoneNo!,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
              height: 60,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: product.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Product Name:',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          product[index].name,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Amount:',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 85,
                        ),
                        Text(
                          //product[index].amount.toString() ,
                          '${quantity}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Color:',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 105,
                        ),
                        Text(
                          resultColor!,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Size:',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 112,
                        ),
                        Text(
                          resultSize!,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Price:',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 108,
                        ),
                        Text(
                          totalprice.toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 90,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //  provider.addItem(product);
                  for (Productone products in product) {
                    MyOrders(
                      products.name,
                      products.price,
                      products.image,
                      username!,
                      phoneNo,
                      userAddress,
                    );
                  }
                  Navigator.pushNamed(context, SuccussfulOrder.id, arguments: {
                    // 'image': products.image,
                    // 'name':products.name,
                    // 'price': products.price,
                    'product': product,
                    'resultColor': resultColor,
                    'resultSize': resultSize,
                    'username': username,
                    'phonNo': phoneNo,
                    'userAdress': userAddress,
                    'quantity': quantity,
                    'total': totalprice,
                  });

                  //  Navigator.pushNamed(context, SuccussfulOrder.id);
                },
                child: Text(
                  'Confirm Order',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Color(0xffFFFFFF),
                  fixedSize: Size(180, 45),
                  shadowColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel Order',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 21,
                      fontWeight: FontWeight.w400),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    side: BorderSide(color: kPrimaryColor),
                    fixedSize: Size(180, 45)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
