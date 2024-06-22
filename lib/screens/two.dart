import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/models/itemModel.dart';
import 'package:mirror_me_app/models/product.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/screens/prodcut_page.dart';
import 'package:mirror_me_app/services/get_products_of_category.dart';
import 'package:mirror_me_app/widgets/custom_card.dart';
import 'package:mirror_me_app/widgets/items/item.dart';
import 'package:mirror_me_app/widgets/products_screens_body.dart';

class TwoPage extends StatefulWidget {
  TwoPage({super.key});
  static const String id = 'TwoPage';
  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Dresses',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color(0xff0A2472)),
          ),
          centerTitle: true,
          // leading: InkWell(
          //   child: Image.asset('images/itemsPage/Arrow - Left.png'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('dressescollection')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List<Productone> products = [];
              snapshot.data!.docs.forEach((doc) {
                products.add(Productone(
                  id: doc.id,
                  name: doc['name'],
                  price: doc['price'],
                  image: doc['image'], Adress: '', phone: '', username: '',
                  amount: 1,
                  // amount: 0,
                ));
              });
              return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    // BlocProvider.of<HomeCubit>(context).displayProductsHome();
                    return CustomCard(
                      product: products[index],
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          // body: ProductsScreenBody(
          //     future: AllProductsOfCategoryService()
          //         .getAllProductsOfCategory(categoryName: categoryName!),
          //   )
        ));
  }
}
