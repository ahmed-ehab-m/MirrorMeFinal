import 'package:flutter/material.dart';
import 'package:mirror_me_app/colors/color.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/providers/my_cart_provider.dart';
import 'package:mirror_me_app/screens/payment_page.dart';
import 'package:provider/provider.dart';

import '../widgets/List_item_widget.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});
  static String ids = 'MyCartPage';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Productone> productList = [];

  final listkey = GlobalKey<AnimatedListState>();
  int totalPrice = 0;
  // CollectionReference MyCart = FirebaseFirestore.instance.collection('cart');
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<MyCartProvider>(context, listen: false);
    provider.fetchproduct();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? productdata =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // final String? image = productdata?['image'] as String?;
    // final String? name = productdata?['name'] as String?;
    Productone? producton = productdata?['productone'] as Productone?;
    final String? resultColor = productdata?['resultColor'] as String?;
    final String? resultSize = productdata?['resultSize'] as String?;
    final int? quantity = productdata?['quantity'] as int?;

    final provider = Provider.of<MyCartProvider>(context);
    //  var product = ModalRoute.of(context)!.settings.arguments;
    //  totalPrice = (product.price - product.discountPercentage * product.price).toInt()*ProductDetailsPage.quantity;
    productList = provider.productList;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'My Cart',
            style: TextStyle(
                fontSize: 23,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          // leading: InkWell(
          //   child: Image.asset('images/itemsPage/Arrow - Left.png'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: productList.length != 0
            ? Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: Column(children: [
                  Expanded(
                    child: AnimatedList(
                      key: listkey,
                      initialItemCount: productList.length,
                      itemBuilder: (context, index, animation) =>
                          ListItemWidget(
                        product: productList[index],
                        animation: animation,
                        onclick: () {
                          provider.removeItem(index, listkey);
                        },
                        amount: quantity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total ',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${provider.add_item(productList, quantity)} EGP',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          height: 50,
                          width: 160,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, PaymentPage.id,
                                  arguments: {
                                    'resultColor': resultColor,
                                    'resultSize': resultSize,
                                    'product': productList,
                                    'total': provider.add_item(
                                        productList, quantity),
                                    'quantity': quantity,
                                    // 'image': image,
                                    // 'name': name,
                                    // 'price': price,
                                  });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        KPrimaryColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ))),
                            child: Text(
                              'Buy',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/cart.jpeg'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Empty Cart .',
                    style: TextStyle(fontSize: 24, color: kPrimaryColor),
                  )
                ],
              ));
  }
}
