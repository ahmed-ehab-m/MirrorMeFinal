import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/providers/favorites_provider.dart';
import 'package:mirror_me_app/screens/prodcut_page.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product, this.pass});
  final Productone product;
  String? pass;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkIfFavorite();
  }

  Future<void> checkIfFavorite() async {
    final provider = Provider.of<FavoritesProvider>(context, listen: false);
    _isFavorite = provider.isExist(widget.product);
  }

  Future<void> MyFavorite(
      String productName, int price, String imageUrl, String username) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('favorite').add({
          'userId': user.uid,
          'name': productName,
          'price': price,
          'image': imageUrl,
        });
        print('Product added to favorites successfully!');
      }
    } catch (e) {
      print('Error adding product to favorites: $e');
    }
  }

  Future<void> _deleteProductFromFirestore(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('favorite')
            .where('userId', isEqualTo: user.uid)
            .where('id', isEqualTo: productId)
            .get()
            .then((snapshot) {
          for (DocumentSnapshot ds in snapshot.docs) {
            ds.reference.delete();
          }
        });
        print('Product removed from favorites successfully!');
      }
    } catch (e) {
      print('Error removing product from favorites: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ProdcutPage(
                  p1: widget.product,
                  pass: widget.pass,
                )),
          ),
        );
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 200,
          width: 220,
          child: Card(
            color: Colors.grey.withOpacity(0.1),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Column(
                children: [
                  Image.network(
                    widget.product.image,
                    height: 150,
                    width: 150,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Spacer(),
                      Text(
                        r'$' '${widget.product.price}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 0,
          child: IconButton(
            onPressed: () async {
              final provider =
                  Provider.of<FavoritesProvider>(context, listen: false);
              provider.toggleFavorites(widget.product);
              setState(() {
                _isFavorite = !_isFavorite;
              });

              if (_isFavorite) {
                // await MyFavorite(
                //   widget.product.name,
                //   widget.product.price,
                //   widget.product.image,
                //   widget.product.id,
                // );
              } else {
                await _deleteProductFromFirestore(widget.product.id);
              }
            },
            icon: _isFavorite
                ? Icon(
                    CupertinoIcons.heart_fill,
                    color: kPrimaryColor,
                  )
                : Icon(
                    CupertinoIcons.heart,
                    color: kPrimaryColor,
                  ),
          ),
        ),
      ]),
    );
  }
}
