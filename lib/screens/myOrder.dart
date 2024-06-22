import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/providers/my_order_provider.dart';
import 'package:mirror_me_app/widgets/List_item_widget.dart';
import 'package:provider/provider.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});
  static String id = 'MyOrder';

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final listkey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<MyOrderProvider>(context, listen: false);
    provider.fetchproduct();
  }

  Widget build(BuildContext context) {
    final provider = Provider.of<MyOrderProvider>(context);
    List<Productone> productlist = [];
    productlist = provider.productList;
    final Map<String, dynamic>? orderData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final double? totalprice = orderData?['total'] as double?;
    // final Map<String, dynamic>? productdata =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // //  final String? image = productdata?['image'] as String?;
    // //  final String?name = productdata?['name'] as String?;
    // //  final String? price= productdata?['price'] as String?;
    // final List<Productone> product =
    //     productdata!['product'] as List<Productone>;

    // final String? resultColor = productdata?['resultColor'] as String?;
    // final String? resultSize = productdata?['resultSize'] as String?;
    final int? quantity = orderData?['quantity'] as int?;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'My Orders',
          style:
              TextStyle(color: Color(0xFF0A2472), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: provider.getproduct.length != 0
          ? AnimatedList(
              key: listkey,
              initialItemCount: productlist.length,
              itemBuilder: (context, index, animation) => ListItemWidget(
                product: productlist[index],
                animation: animation,
                onclick: () {
                  provider.removeItem(index, listkey);
                },
                // amount: quantity,
                totalPrice: totalprice,
              ),
            )
          // ListView.separated(
          //     separatorBuilder: (context, index) => SizedBox(
          //           height: 5,
          //         ),
          //     itemCount: provider.getproduct.length,
          //     itemBuilder: (context, index) {
          //       return
          // return ListItemWidget(product: provider.getproduct[index], animation: animation, onclick: onclick)
          // return Container(
          //   margin: const EdgeInsets.all(15),
          //   padding: EdgeInsets.all(8),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     color: Colors.grey[300],
          //   ),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 100,
          //         height: 100,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(
          //               20), // تعديل انحناء الزوايا هنا
          //           border: Border.all(
          //             color: Colors.white, // لون الحدود
          //             width: 0.5, // سمك الحدود
          //           ),
          //         ),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(20),
          //           child: Image.network(
          //             provider.getproduct[index].image,
          //             width: 100,
          //             height: 100,
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             children: [
          //               Text(
          //                 'Product Name:  ',
          //                 style: TextStyle(
          //                     color: kPrimaryColor,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //               Text(
          //                 provider.getproduct[index].name,
          //               ),
          //             ],
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Row(
          //             children: [
          //               Text(
          //                 'Price:  ',
          //                 style: TextStyle(
          //                     color: kPrimaryColor,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //               Text(
          //                 totalprice.toString(),
          //               ),
          //             ],
          //           ),
          //           SizedBox(
          //             height: 10,
          //           ),
          //           Row(
          //             children: [
          //               Text(
          //                 'Amount:  ',
          //                 style: TextStyle(
          //                     color: kPrimaryColor,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //               Text(
          //                 quantity.toString(),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //       Spacer(),
          //       //         IconButton(
          //       // onPressed: provider.removeItem(index, listkey);
          //       // icon: Icon(
          //       //   Icons.delete,
          //       //   size: 32,
          //       //   color: kPrimaryColor,
          //       // )),
          //     ],
          //   ),
          // );
          // })
          : Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/emptyorders.jpg'),
                  Text(
                    'You haven\'t placed any orders yet',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: kPrimaryColor),
                  )
                ],
              ),
            ),
      // Expanded(
      //   child: ListView.builder(
      //     itemCount: 7,
      //     itemBuilder: (context, index) {
      //       return CustomProductInCart();
      //     },
      //   ),
      // ),
      //     Row(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             'Total',
      //             style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
      //           ),
      //           Text(
      //             '\$670.00',
      //             style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
      //           )
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       width: 50,
      //     ),
      //     // SizedBox(
      //     //   height: 50,
      //     //   width: 160,
      //     //   child: ElevatedButton(
      //     //     onPressed: () {
      //     //       Navigator.pushNamed(context, PaymentPage.id ,
      //     //       arguments:

      //     //       {
      //     //       'resultColor':resultColor,
      //     //       'resultSize':resultSize,
      //     //         'image':image,
      //     //          'name':name,
      //     //           'price':price,
      //     //       }

      //     //       );

      //     //     },
      //     //     style: ButtonStyle(
      //     //         backgroundColor:
      //     //             MaterialStateProperty.all<Color>(KPrimaryColor),
      //     //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //     //             RoundedRectangleBorder(
      //     //           borderRadius: BorderRadius.circular(24.0),
      //     //         ))),
      //     //     child: Text(
      //     //       'Buy',
      //     //       style: TextStyle(fontSize: 20),
      //     //     ),
      //     //   ),
      //     // )
      //   ],
      // ),
      ///////////////
    );
  }
}

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// class MyOrder extends StatefulWidget {
//   const MyOrder({Key? key}) : super(key: key);
//   static String id = 'MyOrder';
//   static int quantity = 1;

//   @override
//   State<MyOrder> createState() => _MyOrderState();
// }

// class _MyOrderState extends State<MyOrder> {
//   List<Productone> productList = [];

//   final listkey = GlobalKey<AnimatedListState>();
//   int totalPrice = 0;

//   @override
//   Widget build(BuildContext context) {
//   final provider = Provider.of<MyOrderProvider>(context);
//    final Map<String, dynamic>? productdata =
//        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//     //  final String? image = productdata?['image'] as String?;
//     //  final String?name = productdata?['name'] as String?;
//     //  final String? price= productdata?['price'] as String?;
//         final  List<Productone> product = productdata?['product'] as List<Productone> ;

//     final String? resultColor = productdata?['resultColor'] as String?;
//     final String?resultSize = productdata?['resultSize'] as String?;

//   //  totalPrice = (product!.price - product.discountPercentage * product.price).toInt() * CartScreen.quantity;

//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           child: Image.asset('images/itemsPage/Arrow - Left.png'),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'My Order',
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
//                             'product': product,
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

// import 'package:flutter/material.dart';
// import 'package:mirror_me_app/constants.dart';
// import 'package:mirror_me_app/providers/my_cart_provider.dart';
// import 'package:mirror_me_app/providers/my_order_provider.dart';
// import 'package:provider/provider.dart';

// import '../models/product.dart';
// import '../widgets/List_item_widget.dart';

// class MyOrder extends StatefulWidget {
//   MyOrder({super.key});
//   static String id = 'MyOrder';

//   @override
//   State<MyOrder> createState() => _MyOrderState();
// }

// class _MyOrderState extends State<MyOrder> {
//   List<Product> productList = [];

//   final listkey = GlobalKey<AnimatedListState>();
//   int totalPrice = 0;

//   @override
//   Widget build(BuildContext context) {
//       final Map<String, dynamic>? orderData =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
//     final List<Product> products = orderData?['product'] as List<Product>;
//     final provider = Provider.of< MyOrderProvider>(context);
//     // var product = ModalRoute.of(context)!.settings.arguments;
//     productList = provider.productList;

//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: const Text(
//             'My Order',
//             style: TextStyle(fontSize: 20, color: Colors.black),
//           ),
//           centerTitle: true,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back),
//             color: Colors.black,
//           ),
//         ),
//         body: productList.length != 0
//             ? Padding(
//                 padding: const EdgeInsets.only(top: 25, bottom: 25),
//                 child: Column(children: [
//                   // Expanded(
//                   //   child: AnimatedList(
//                   //       key: listkey,
//                   //       initialItemCount: productList.length,
//                   //       itemBuilder: (context, index, animation) =>
//                   //           ListItemWidget(
//                   //             product: productList[index],
//                   //             animation: animation,
//                   //             onclick: () =>
//                   //         provider.removeItem(index, listkey),
//                   //           )
//                   //           ),
//                   // ),
//                   Text(
//                     'Total Price : ${provider.totalPrice} EGP',
//                     style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: kPrimaryColor),
//                   ),
//                 ]),
//               )
//             : Padding(
//         padding: EdgeInsets.only(top: 40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Image.asset('images/noOrders.jpeg'),
//             Text(
//               'You haven\'t placed any orders yet',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             )
//           ],
//         ),
//       ),);
//   }
// }
