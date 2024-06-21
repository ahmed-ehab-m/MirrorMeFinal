import 'package:cloud_firestore/cloud_firestore.dart';

class Productone {
  final String Adress;
  final String image;
  final String name;
  final int price;
  final String phone;
  final String username;
  final String id;
  int? amount;

  Productone({
    required this.name,
    required this.price,
    required this.image,
    required this.id,
    required this.Adress,
    required this.phone,
    required this.username,
    this.amount,
  });

  factory Productone.fromMap(Map<String, dynamic> map) {
    return Productone(
      name: map['name'],
      price: map['price'],
      image: map['image'],
      id: map['id'],
      Adress: map['Adress'],
      phone: map['phone'],
      username: map['username'],
      amount: map['amount'],
    );
  }
}

// Future<List<Productone>> getTshirts() async {
//   List<Productone> tshirts = [];
//   QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection('tshirtone').get();
//   querySnapshot.docs.forEach((doc) {
//     tshirts.add(Productone.fromMap(doc.data() as Map<String, dynamic>));
//   });
//   return tshirts;
// }
