import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/colors/color.dart';
import 'package:mirror_me_app/models/product.dart';
import 'package:mirror_me_app/providers/my_cart_provider.dart';
import 'package:provider/provider.dart';

class CustomProductInCart extends StatefulWidget {
  CustomProductInCart({super.key});

  @override
  State<CustomProductInCart> createState() => _CustomProductInCartState();
}

class _CustomProductInCartState extends State<CustomProductInCart> {
  bool? isChecked = false;

  // int? productNumber = 1;
  // int? productPrice = 80;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyCartProvider>(context);
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 105,
        width: 370,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 7, left: 7),
              child: Image.network(product.thumbnail),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                        color: KPrimaryColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w500),
                  ),
                  Text("\$ ${product.price}",
                      style: TextStyle(
                          color: KPrimaryColor,
                          fontSize: 37,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 75,
                    bottom: 50,
                  ),
                  child: Container(
                    height: 15,
                    width: 10,
                    child: Checkbox(
                        side: BorderSide(
                          color: KPrimaryColor,
                        ),
                        value: isChecked,
                        activeColor: KPrimaryColor,
                        tristate: true,
                        onChanged: (newBool) {
                          setState(() {
                            isChecked = !isChecked!;
                          });
                        }),
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'productNumber',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 24),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
