import 'package:flutter/material.dart';

class ItemModel {
  final String title;
  final String image;
  final String price;
  bool isFavorite;
  String? length;
  String? material;
  String? washingInstructions;
  String? size;
  Color? color;
  ItemModel(
      {required this.image,
      required this.title,
      required this.price,
      this.isFavorite = true,
      this.color,
      this.length,
      this.material,
      this.size,
      this.washingInstructions});
}
