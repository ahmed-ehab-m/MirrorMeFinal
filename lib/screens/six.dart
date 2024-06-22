import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/widgets/custom_card.dart';

class SixPage extends StatefulWidget {
  SixPage({super.key});
  static const String id = 'ItPage';
  @override
  State<SixPage> createState() => _SixPageState();
}

class _SixPageState extends State<SixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'T-shirt Collection',
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
              FirebaseFirestore.instance.collection('tshirtone').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List<Productone> products = [];
              snapshot.data!.docs.forEach((doc) {
                products.add(Productone(
                  id: doc.id,
                  name: doc['name'],
                  price: doc['price'],
                  image: doc['image'],
                  Adress: '',
                  amount: 1,

                  phone: '',
                  username: '',
                  //  amount: 0,
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
