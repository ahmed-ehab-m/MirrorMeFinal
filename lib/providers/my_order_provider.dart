import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/models/product.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/screens/cart_screen.dart';

import '../widgets/List_item_widget.dart';

class MyOrderProvider extends ChangeNotifier {
  List<Productone> productList = [];
  int totalPrice = 0;
  List<Productone> get getproduct => productList;
  void fetchproduct() async {
    productList.clear();
    var userUid = FirebaseAuth.instance.currentUser?.uid;
    if (userUid != null) {
      final products = await FirebaseFirestore.instance
          .collection('orders')
          .where('userId', isEqualTo: userUid)
          .get();
      products.docs.forEach((element) {
        if (element.data().containsKey('name')) {
          productList.add(
            Productone(
              name: element.get('name'),
              price: element.get('price'),
              image: element.get('image'),
              id: element.id,
              Adress: element.get('Adress'),
              phone: element.get('phone'),
              username: element.get('username'),
            ),
          );
        }
      });
      notifyListeners();
    }
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mirror_me_app/models/productmain.dart'; // استخدام النموذج الصحيح للمنتج

// class MyOrderProvider extends ChangeNotifier {
//   List<Productone> productList = [];
//   int totalPrice = 0;
//   List<Productone> get getproduct => productList;

//   void fetchproduct() async {
//     try {
//       final products = await FirebaseFirestore.instance.collection('orders').get();
//       productList = products.docs.map((doc) {
//         return Productone(
//           name: doc.get('name'),
//           price: doc.get('price'),
//           image: doc.get('image'),
//           id: doc.get('id'),
//           Adress: doc.get('Adress'),
//           phone: doc.get('phone'),
//           username: doc.get('username'),
//         );
//       }).toList();
//       notifyListeners();
//     } catch (e) {
//       print('حدث خطأ: $e');
//     }
//   }
// }



// void addItem(List <Productone> product) {
  //   productList.addAll(product);
  //   notifyListeners();
  // }

  // bool isExist(Productone product) {
  //   return _productList.contains(product);
  // }

  //  void removeItem(int index, final listkey) {
  //   final removedItem = _productList[index];
  //   _productList.removeAt(index);
  //   listkey.currentState!.removeItem(
  //       index,
  //       (context, animation) => ListItemWidget(
  //     product: removedItem, animation: animation, onclick: () {}));

  //   notifyListeners();
  // }
//   void fetchproduct() async {
//   productList.clear();
//   final products = await FirebaseFirestore.instance.collection('orders').get();
//   products.docs.forEach((element) {
//     if (element.data().containsKey('name')) {
//       productList.add(
//         Productone(
//           name: element.get('name'),
//           price: element.get('price'),
//           image: element.get('image'),
//           id: element.id,
//           Adress: element.get('Adress'),
//           phone: element.get('phone'),
//           username: element.get('username'),
//           // amount: element.get(''),
//         ),
//       );
//     }
//   });
//   notifyListeners();
// }

// }