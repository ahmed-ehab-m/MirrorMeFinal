import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirror_me_app/colors/color.dart';
import 'package:mirror_me_app/screens/payment_page.dart';

class CustomBuyWidget extends StatelessWidget {
  const CustomBuyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              Text(
                '\$670.00',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        SizedBox(
          width: 50,
        ),
        SizedBox(
          height: 50,
          width: 160,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, PaymentPage.id ,
              
              
              ); 

            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(KPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ))),
            child: Text(
              'Buy',
              style: TextStyle(fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
