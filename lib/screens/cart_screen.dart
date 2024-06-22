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
                        // amount: productList[index].amount,
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









//     bool _isDeleting = false;
//   void _deleteProduct(BuildContext context) async {
//     setState(() {
//       _isDeleting = true;
//     });

//     try {
//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('cart')
//           .where('name', isEqualTo: Productone.name)
//           .limit(1)
//           .get();

//       final docId = querySnapshot.docs.first.id;
//       await FirebaseFirestore.instance.collection('cart').doc(docId).delete();

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Product deleted successfully'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to delete product'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       setState(() {
//         _isDeleting = true;
        
//       });
//     }
//   }
// }  










































// import 'package:flutter/material.dart';
// import 'package:mirror_me_app/colors/color.dart';
// import 'package:mirror_me_app/constants.dart';
// import 'package:mirror_me_app/customWidgets/customBuy.dart';
// import 'package:mirror_me_app/customWidgets/customProductInCart.dart';
// import 'package:mirror_me_app/models/product.dart';
// import 'package:mirror_me_app/models/productmain.dart';
// import 'package:mirror_me_app/providers/my_cart_provider.dart';
// import 'package:mirror_me_app/screens/payment_page.dart';
// import 'package:mirror_me_app/widgets/List_item_widget.dart';
// import 'package:provider/provider.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key , required this.p1});
//   final Productone p1; 
//   static String id = 'CartPage';
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   List<Productone> productList = [];
//     final listkey = GlobalKey<AnimatedListState>();
//     int totalPrice = 0;
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<MyCartProvider>(context);
//     var productone = ModalRoute.of(context)!.settings.arguments;
//     //  totalPrice = (product.price - product.discountPercentage * product.price).toInt()*ProductDetailsPage.quantity;
//      productList = provider.productList;

//     // final provider = Provider.of<MyCartProvider>(context);
//     final Map<String, dynamic>? productdata =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//     final String? image = productdata?['image'] as String?;
//     final String? name = productdata?['name'] as String?;
//     final String? price = productdata?['price'] as String?;
//     final String? resultColor = productdata?['resultColor'] as String?;
//     final String? resultSize = productdata?['resultSize'] as String?;

//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           child: Image.asset('images/itemsPage/Arrow - Left.png'),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'My Cart',
//           style: TextStyle(color: Color(0xFF0A2472)),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.network(
//             image!,
//           ),
//           Text(name!),
//           Text(price!),

//           // Expanded(
//           //   child: ListView.builder(
//           //     itemCount: 7,
//           //     itemBuilder: (context, index) {
//           //       return CustomProductInCart();
//           //     },
//           //   ),
//           // ),
//           Row(
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Total',
//                       style:
//                           TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       '\$670.00',
//                       style:
//                           TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 50,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 160,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, PaymentPage.id, arguments: {
//                       'resultColor': resultColor,
//                       'resultSize': resultSize,
//                       'image': image,
//                       'name': name,
//                       'price': price,
//                     });
//                   },
//                   style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(KPrimaryColor),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24.0),
//                       ))),
//                   child: Text(
//                     'Buy',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


























// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// class CartScreen extends StatefulWidget {
//   const CartScreen({Key? key}) : super(key: key);
//   static String id = 'CartPage';
//   static int quantity = 1;

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   List<Product> productList = [];

//   final listkey = GlobalKey<AnimatedListState>();
//   int totalPrice = 0;

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<MyCartProvider>(context);
//       final Map<String, dynamic>? productdata = 
//       ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//     final String? image = productdata?['image'] as String?;
//     final String?name = productdata?['name'] as String?;
//     final String? price= productdata?['price'] as String?;
//     productList = provider.productList;
//     //totalPrice = (product!.price - product.discountPercentage * product.price).toInt() * CartScreen.quantity;

//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           child: Image.asset('images/itemsPage/Arrow - Left.png'),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'My Cart',
//           style: TextStyle(color: Color(0xFF0A2472)),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: productList.length != 0
//           ? Padding(
//               padding: const EdgeInsets.only(top: 25, bottom: 25),
//               child: Column(children: [
//                 Expanded(
//                   child: AnimatedList(
//                       key: listkey,
//                       initialItemCount: productList.length,
//                       itemBuilder: (context, index, animation) =>
//                           ListItemWidget(
//                             product: productList[index],
//                             animation: animation,
//                             onclick: () => provider.removeItem(index, listkey),
//                           )),
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Total',
//                             style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
//                           ),
//                           Text(
//                             '\$${provider.totalPrice}',
//                             style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 50,
//                     ),
//                     SizedBox(
//                       height: 50,
//                       width: 160,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, PaymentPage.id, arguments: {
//                             'resultColor': resultColor!,
//                             'resultSize': resultSize!,
//                             'product': productList,
//                             'totalprice': provider.totalPrice,
//                           });
//                         },
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
//                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(24.0),
//                             ))),
//                         child: Text(
//                           'Buy',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ]),
//             )
//           : Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assests/images/empty_cart.png'),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   'Empty Cart .',
//                   style: TextStyle(fontSize: 24),
//                 )
//               ],
//             ),
//     );
//   }
// }
