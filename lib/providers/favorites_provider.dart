// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:mirror_me_app/models/product.dart';
// import 'package:mirror_me_app/models/productmain.dart';
// import 'package:provider/provider.dart';

// class FavoritesProvider extends ChangeNotifier {
//   List<Productone> _productsList = [];
//   List<Productone> get productsList => _productsList;
//   bool isExist(Productone product) {
//     return _productsList.contains(product);
//   }

//   void toggleFavorites(Productone product) {
//     if (isExist(product)) {
//       _productsList.remove(product);
//       // deleteDocumentByValue(product.name,'id');
//     } else {
//       _productsList.add(product);
//       // MyFavorite(product.name, product.price, product.image, product.id);
//     }
//     notifyListeners();
//   }
// }

// Future<void> MyFavorite(
//   String productName,
//   int price,
//   String imageUrl,
//   String id,
// ) async {
//   try {
//     await FirebaseFirestore.instance.collection('favorite').add({
//       'name': productName,
//       'price': price,
//       'image': imageUrl,
//       'id': id,
//     });
//     print('Product added to Favorite successfully!');
//   } catch (e) {
//     print('Error adding product to Favorite: $e');
//   }
// }

// Future<void> deleteDocumentByValue(String productName, dynamic value) async {
//   try {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('favorite')
//         .where(productName, isEqualTo: value)
//         .get();
//     querySnapshot.docs.forEach((doc) async {
//       await FirebaseFirestore.instance
//           .collection('favorite')
//           .doc(doc.id)
//           .delete();
//     });

//     print('Documents removed from Favorites successfully!');
//   } catch (e) {
//     print('Error removing documents from Favorites: $e');
//   }
// }

//   // Other code here...

//   // الكود الأخر هنا...

//  import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//  import 'package:flutter/cupertino.dart';
//  import 'package:mirror_me_app/models/product.dart';
//  import 'package:mirror_me_app/models/productmain.dart';
//  import 'package:provider/provider.dart';

// class FavoritesProvider extends ChangeNotifier {
//   List<Productone> _productsList = [];
//   List<Productone> get productsList => _productsList;
// void fetchproduct() async {

//     _productsList.clear();
//     var userUid = FirebaseAuth.instance.currentUser?.uid;
//     if (userUid != null) {
//       final products = await FirebaseFirestore.instance
//           .collection('favorite')
//           .where('userId', isEqualTo: userUid)
//           .get();
//       products.docs.forEach((element) {
//         if (element.data().containsKey('name')) {
//           _productsList.add(
//             Productone(
//               name: element.get('name'),
//               price: element.get('price'),
//               image: element.get('image'),
//               id: element.id,
//               Adress: '',
//               phone: '',
//               username: '',
//             ),
//           );
//         }
//       });
//       notifyListeners();
//     }
//   }
//   bool isExist(Productone product) {
//     return _productsList.contains(product);
//   }

//   void toggleFavorites(Productone product) {
//     if (isExist(product)) {
//       _productsList.remove(product);
//       deleteDocumentByValue('id', product.id);
//     } else {
//       _productsList.add(product);
//       MyFavorite(product.name, product.price, product.image, product.id);
//     }
//     notifyListeners();
//   }
// }

// Future<void> MyFavorite(
//   String productName,
//   int price,
//   String imageUrl,
//   String id,

// )

// async {
//   try {
//     var user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       await FirebaseFirestore.instance.collection('favorite').add({
//         'userId': user.uid,
//         'name': productName,
//         'price': price,
//         'image': imageUrl,
//         'id': id,
//       });
//       print('Product added to Favorite successfully!');
//     }
//   } catch (e) {
//     print('Error adding product to Favorite: $e');
//   }

// }

// Future<void> deleteDocumentByValue(String productName, dynamic value) async {
//   try {
//     var user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('favorite')
//           .where('userId', isEqualTo: user.uid)
//           .where(productName, isEqualTo: value)
//           .get();
//       querySnapshot.docs.forEach((doc) async {
//         await FirebaseFirestore.instance
//             .collection('favorite')
//             .doc(doc.id)
//             .delete();
//       });
//       print('Documents removed from Favorites successfully!');
//     }
//   } catch (e) {
//     print('Error removing documents from Favorites: $e');
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:mirror_me_app/models/product.dart';
// import 'package:mirror_me_app/models/productmain.dart';
// import 'package:provider/provider.dart';

// class FavoritesProvider extends ChangeNotifier {
//   List<Productone> _productsList = [];
//   List<Productone> get productsList => _productsList;
//   bool isExist(Productone product) {
//     return _productsList.contains(product);
//   }

//   void toggleFavorites(Productone product) {
//     if (isExist(product)) {
//       _productsList.remove(product);
//       // deleteDocumentByValue(product.name,'id');
//     } else {
//       _productsList.add(product);
//       // MyFavorite(product.name, product.price, product.image, product.id);
//     }
//     notifyListeners();
//   }
// }

// Future<void> MyFavorite(
//   String productName,
//   int price,
//   String imageUrl,
//   String id,
// ) async {
//   try {
//     await FirebaseFirestore.instance.collection('favorite').add({
//       'name': productName,
//       'price': price,
//       'image': imageUrl,
//       'id': id,
//     });
//     print('Product added to Favorite successfully!');
//   } catch (e) {
//     print('Error adding product to Favorite: $e');
//   }
// }

// Future<void> deleteDocumentByValue(String productName, dynamic value) async {
//   try {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('favorite')
//         .where(productName, isEqualTo: value)
//         .get();
//     querySnapshot.docs.forEach((doc) async {
//       await FirebaseFirestore.instance
//           .collection('favorite')
//           .doc(doc.id)
//           .delete();
//     });

//     print('Documents removed from Favorites successfully!');
//   } catch (e) {
//     print('Error removing documents from Favorites: $e');
//   }
// }

//   // Other code here...

//   // الكود الأخر هنا...

//  import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//  import 'package:flutter/cupertino.dart';
//  import 'package:mirror_me_app/models/product.dart';
//  import 'package:mirror_me_app/models/productmain.dart';
//  import 'package:provider/provider.dart';

// class FavoritesProvider extends ChangeNotifier {
//   List<Productone> _productsList = [];
//   List<Productone> get productsList => _productsList;
// void fetchproduct() async {

//     _productsList.clear();
//     var userUid = FirebaseAuth.instance.currentUser?.uid;
//     if (userUid != null) {
//       final products = await FirebaseFirestore.instance
//           .collection('favorite')
//           .where('userId', isEqualTo: userUid)
//           .get();
//       products.docs.forEach((element) {
//         if (element.data().containsKey('name')) {
//           _productsList.add(
//             Productone(
//               name: element.get('name'),
//               price: element.get('price'),
//               image: element.get('image'),
//               id: element.id,
//               Adress: '',
//               phone: '',
//               username: '',
//             ),
//           );
//         }
//       });
//       notifyListeners();
//     }
//   }
//   bool isExist(Productone product) {
//     return _productsList.contains(product);
//   }

//   void toggleFavorites(Productone product) {
//     if (isExist(product)) {
//       _productsList.remove(product);
//       deleteDocumentByValue('id', product.id);
//     } else {
//       _productsList.add(product);
//       MyFavorite(product.name, product.price, product.image, product.id);
//     }
//     notifyListeners();
//   }
// }

// Future<void> MyFavorite(
//   String productName,
//   int price,
//   String imageUrl,
//   String id,

// )

// async {
//   try {
//     var user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       await FirebaseFirestore.instance.collection('favorite').add({
//         'userId': user.uid,
//         'name': productName,
//         'price': price,
//         'image': imageUrl,
//         'id': id,
//       });
//       print('Product added to Favorite successfully!');
//     }
//   } catch (e) {
//     print('Error adding product to Favorite: $e');
//   }

// }

// Future<void> deleteDocumentByValue(String productName, dynamic value) async {
//   try {
//     var user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('favorite')
//           .where('userId', isEqualTo: user.uid)
//           .where(productName, isEqualTo: value)
//           .get();
//       querySnapshot.docs.forEach((doc) async {
//         await FirebaseFirestore.instance
//             .collection('favorite')
//             .doc(doc.id)
//             .delete();
//       });
//       print('Documents removed from Favorites successfully!');
//     }
//   } catch (e) {
//     print('Error removing documents from Favorites: $e');
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mirror_me_app/models/productmain.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Productone> _productsList = [];
  List<Productone> get productsList => _productsList;

  void fetchproduct() async {
    _productsList.clear();
    var userUid = FirebaseAuth.instance.currentUser?.uid;
    if (userUid != null) {
      final products = await FirebaseFirestore.instance
          .collection('favorite')
          .where('userId', isEqualTo: userUid)
          .get();
      products.docs.forEach((element) {
        if (element.data().containsKey('name')) {
          _productsList.add(
            Productone(
              name: element.get('name'),
              price: element.get('price'),
              image: element.get('image'),
              id: element.id,
              Adress: '',
              phone: '',
              username: '',
            ),
          );
        }
      });
      notifyListeners();
    }
  }

  bool isExist(Productone product) {
    return _productsList.contains(product);
  }

  void toggleFavorites(Productone product) async {
    if (isExist(product)) {
      _productsList.remove(product);
      removeProduct(product); // حذف المنتج من Firestore
    } else {
      _productsList.add(product);
      MyFavorite(product.name, product.price, product.image, product.id);
    }
    notifyListeners();
  }

  Future<void> MyFavorite(
    String productName,
    int price,
    String imageUrl,
    String id,
  ) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('favorite').add({
          'userId': user.uid,
          'name': productName,
          'price': price,
          'image': imageUrl,
          'id': id,
        });
        print('Product added to Favorite successfully!');
      }
    } catch (e) {
      print('Error adding product to Favorite: $e');
    }
  }

  // Future<void> deleteDocumentByValue(String productName, dynamic value) async {
  //   try {
  //     var user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //           .collection('favorite')
  //           .where('userId', isEqualTo: user.uid)
  //           .where(productName, isEqualTo: value)
  //           .get();
  //       querySnapshot.docs.forEach((doc) async {
  //         await FirebaseFirestore.instance
  //             .collection('favorite')
  //             .doc(doc.id)
  //             .delete();
  //         _productsList.removeWhere((product) => product.id == doc.id);
  //       });
  //       print('Documents removed from Favorites successfully!');
  //     }
  //   } catch (e) {
  //     print('Error removing documents from Favorites: $e');
  //   }
  // }

  void removeProduct(Productone product) async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        _productsList.remove(product);
        await FirebaseFirestore.instance
            .collection('favorite')
            .doc(product.id)
            .delete(); // حذف المنتج من Firestore
        notifyListeners();
        print('product removed');
      } catch (e) {
        print('Error removing product: $e');
      }
    }
  }
}