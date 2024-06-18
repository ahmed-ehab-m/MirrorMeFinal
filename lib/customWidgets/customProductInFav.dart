import 'package:flutter/material.dart';
import 'package:mirror_me_app/colors/color.dart';

class CustomProductInFav extends StatefulWidget {
  const CustomProductInFav({
    super.key,
  });

  @override
  State<CustomProductInFav> createState() => _CustomProductInFavState();
}

class _CustomProductInFavState extends State<CustomProductInFav> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          child: Column(
            children: [
              Image.asset(
                'images/1122.jpg',
                height: 220,
              ),
              Row(
                children: [
                  Text(
                    'Black Shirt',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: KPrimaryColor),
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '\$93.00',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: KPrimaryColor),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
