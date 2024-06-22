// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mirror_me_app/constants.dart';
// import 'package:mirror_me_app/models/product.dart';
// import 'package:mirror_me_app/models/productmain.dart';

// class ListItemWidget extends StatelessWidget {
//   ListItemWidget({
//     Key? key,
//     required this.product,
//     required this.animation,
//     required this.onclick,
//   }) : super(key: key);

//   final Productone product;
//   final Animation<double> animation;
//   final VoidCallback? onclick;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.grey[300],
//       ),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(16),
//         leading: CircleAvatar(
//           radius: 40,
//           backgroundImage: NetworkImage(product.image),
//         ),
//         title: Text(
//           product.name,
//           style: const TextStyle(fontSize: 20, color: Colors.black),
//         ),
//         trailing: IconButton(
//           onPressed: () {
//             _deleteProduct(context);
//           },
//           icon: Icon(
//             Icons.delete,
//             size: 32,
//             color: kPrimaryColor,
//           ),
//         ),
//       ),
//     );
//   }

//   void _deleteProduct(BuildContext context) async {
//     try {
//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('cart')
//           .where('name',
//               isEqualTo: product
//                   .name) // Assuming 'name' is unique and identifies the document
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
//     }
//   }
// }

// import 'dart:js';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mirror_me_app/constants.dart';
// import 'package:mirror_me_app/models/product.dart';
// import 'package:mirror_me_app/models/productmain.dart';
// import 'package:mirror_me_app/providers/my_cart_provider.dart';
// import 'package:provider/provider.dart';

// class ListItemWidget extends StatefulWidget {
//   ListItemWidget({
//     Key? key,
//     required this.product,
//     required this.animation,
//     required this.onclick,
//   }) : super(key: key);

//   final Productone product;
//   final Animation<double> animation;
//   final VoidCallback? onclick;

//   @override
//   _ListItemWidgetState createState() => _ListItemWidgetState();
// }

// class _ListItemWidgetState extends State<ListItemWidget> {
//   bool _isDeleting = false;
//   void _deleteProduct(BuildContext context) async {
//     setState(() {
//       _isDeleting = true;
//     });

//     try {
//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('cart')
//           .where('name', isEqualTo: widget.product.name)
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

//   @override
//   Widget build(BuildContext context) {
//     return _isDeleting
//         ? Container(height: 0)
//         : Container(
//             margin: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.grey[300],
//             ),
//             child: ListTile(
//               contentPadding: const EdgeInsets.all(16),
//               leading: CircleAvatar(
//                 radius: 40,
//                 backgroundImage: NetworkImage(widget.product.image),
//               ),
//               title: Text(
//                 widget.product.name,
//                 style: const TextStyle(fontSize: 20, color: Colors.black),
//               ),
//               trailing: IconButton(
//                 onPressed: () {
//                   _deleteProduct(context,) ;
//                 },
//                 icon: Icon(
//                   Icons.delete,
//                   size: 32,
//                   color: kPrimaryColor,
//                 ),
//               ),
//             ),
//           );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/productmain.dart';

class ListItemWidget extends StatefulWidget {
  ListItemWidget(
      {super.key,
      required this.product,
      required this.animation,
      required this.onclick,
      // this.amount,
      this.totalPrice}) {}

  Productone product;
  final Animation<double> animation;
  final VoidCallback? onclick;
  // int? amount;
  double? totalPrice;
  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(20), // تعديل انحناء الزوايا هنا
              border: Border.all(
                color: Colors.white, // لون الحدود
                width: 0.5, // سمك الحدود
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // نفس انحناء الزوايا هنا
              child: Image.network(
                widget.product.image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.name,
                style: const TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
              ),
              widget.totalPrice == null
                  ? Text(
                      r'$' '${widget.product.price}',
                      style: const TextStyle(
                          fontSize: 15,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400),
                    )
                  : Text(
                      r'$' '${widget.totalPrice}',
                      style: const TextStyle(
                          fontSize: 15,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400),
                    ),
              Text(
                'Amount : ${widget.product.amount}',
                style: const TextStyle(
                    fontSize: 15,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: widget.onclick,
              icon: Icon(
                Icons.delete,
                size: 32,
                color: kPrimaryColor,
              )),
        ],
      ),
      // child: ListTile(
      //   contentPadding: const EdgeInsets.all(16),
      //   leading: Image.network(
      //     widget.product.image,
      //     width: 100,
      //     height: 100,
      //   ),
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         widget.product.name,
      //         style: const TextStyle(
      //             fontSize: 20,
      //             color: kPrimaryColor,
      //             fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         r'$' '${widget.product.price}',
      //         style: const TextStyle(
      //             fontSize: 20,
      //             color: kPrimaryColor,
      //             fontWeight: FontWeight.w400),
      //       ),
      //     ],
      //   ),
      //   trailing: IconButton(
      //       onPressed: widget.onclick,
      //       icon: Icon(
      //         Icons.delete,
      //         size: 32,
      //         color: kPrimaryColor,
      //       )),
      // ),
    );
  }
}
