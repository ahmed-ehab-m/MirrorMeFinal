import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/widgets/custom_card.dart';

class ThreePage extends StatefulWidget {
  ThreePage({super.key});
  static const String id = 'ThreePage';
  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Winter Wear',
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
          stream:
              FirebaseFirestore.instance.collection('tshirtthree').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List<Productone> products = [];
              snapshot.data!.docs.forEach((doc) {
                products.add(Productone(
                  id: doc.id,
                  name: doc['name'],
                  price: doc['price'],
                  image: doc['image'],
                  // amount: 1,

                  Adress: '',
                  phone: '',
                  username: '',
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
