import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';

AppBar appbar({
  required VoidCallback ontab,
  required String title,
}) {
  return AppBar(
    elevation: 0,
    leading: InkWell(
        child: Image.asset('images/itemsPage/Arrow - Left.png'), onTap: ontab),
    title: Text(
      title,
      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
  );
}
