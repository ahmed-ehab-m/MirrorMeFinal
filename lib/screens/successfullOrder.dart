import 'package:flutter/material.dart';
import 'package:mirror_me_app/colors/color.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/providers/my_order_provider.dart';
import 'package:mirror_me_app/screens/myOrder.dart';
import 'package:provider/provider.dart';

class SuccussfulOrder extends StatefulWidget {
  const SuccussfulOrder({super.key});
  static String id = 'SuccussfulOrder';

  @override
  State<SuccussfulOrder> createState() => _SuccussfulOrderState();
}

class _SuccussfulOrderState extends State<SuccussfulOrder> {
  List<Productone> productList = [];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyOrderProvider>(context);
    final Map<String, dynamic> orderData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final String? username = orderData['username'] as String;
    final String? userAddress = orderData['userAdress'] as String;
    final String? phoneNo = orderData['phonNo'] as String;
    final List<Productone> product = orderData['product'] as List<Productone>;
    final String resultColor = orderData['resultColor'] as String;
    final String resultSize = orderData['resultSize'] as String;
    // final String image = orderData['image'] as String;
    // final String? name = orderData?['name'] as String?;
    // final String? price = orderData?['price'] as String?;
    final int? quantity = orderData?['quantity'] as int?;

    final double? totalprice = orderData?['total'] as double?;
    productList = provider.productList;

    return Scaffold(
      appBar: AppBar(
        // leading: InkWell(
        //   child: Image.asset('images/itemsPage/Arrow - Left.png'),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40, top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 300, child: Image.asset('images/succesfulll.jpg')),
              Text(
                'Success!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: kPrimaryColor),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your order is done successfully!',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: kPrimaryColor),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Thanks For Your Order',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 40,
                width: 170,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyOrder.id, arguments: {
                      'product': product,
                      'resultColor': resultColor,
                      'resultSize': resultSize,
                      'username': username,
                      'phonNo': phoneNo,
                      'userAdress': userAddress,
                      'total': totalprice,
                      'quantity': quantity
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(KPrimaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ))),
                  child: Text(
                    'Done',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
