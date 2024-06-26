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
              // amount: 1,
            ),
          );
        }
      });
      notifyListeners();
    }
  }

  void deleteDocumentById(String id) async {
    await FirebaseFirestore.instance.collection('orders').doc(id).delete();
  }

  void removeItem(int index, final listkey) async {
    final removedItem = productList[index];
    if (productList.contains(removedItem)) {
      productList.removeAt(index);
      deleteDocumentById(removedItem.id); // حذف العنصر من Firestore
      listkey.currentState!.removeItem(
        index,
        (context, animation) => ListItemWidget(
          product: removedItem,
          animation: animation,
          onclick: () {},
        ),
      );
    }
    notifyListeners();
  }
}
