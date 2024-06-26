import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/providers/my_order_provider.dart';
import 'package:mirror_me_app/widgets/List_item_widget.dart';
import 'package:provider/provider.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});
  static String id = 'MyOrder';

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final listkey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<MyOrderProvider>(context, listen: false);
    provider.fetchproduct();
  }

  Widget build(BuildContext context) {
    final provider = Provider.of<MyOrderProvider>(context);
    List<Productone> productlist = [];
    productlist = provider.productList;
    final Map<String, dynamic>? orderData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final double? totalprice = orderData?['total'] as double?;
    // final Map<String, dynamic>? productdata =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // //  final String? image = productdata?['image'] as String?;
    // //  final String?name = productdata?['name'] as String?;
    // //  final String? price= productdata?['price'] as String?;
    // final List<Productone> product =
    //     productdata!['product'] as List<Productone>;

    // final String? resultColor = productdata?['resultColor'] as String?;
    // final String? resultSize = productdata?['resultSize'] as String?;
    final int? quantity = orderData?['quantity'] as int?;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'My Orders',
          style:
              TextStyle(color: Color(0xFF0A2472), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: provider.getproduct.length != 0
          ? AnimatedList(
              key: listkey,
              initialItemCount: productlist.length,
              itemBuilder: (context, index, animation) => ListItemWidget(
                product: productlist[index],
                animation: animation,
                onclick: () {
                  provider.removeItem(index, listkey);
                },
                amount: quantity,
                totalPrice: totalprice,
              ),
            )
          : Padding(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('images/emptyorders.jpg'),
                  Text(
                    'You haven\'t placed any orders yet',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: kPrimaryColor),
                  )
                ],
              ),
            ),
    );
  }
}
