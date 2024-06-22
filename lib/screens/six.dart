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
// body: GridView.builder(
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       crossAxisSpacing: 10,

//       //childAspectRatio: (itemWidth / itemHeight),
//       // childAspectRatio: MediaQuery.of(context).size.width /
//       //     (MediaQuery.of(context).size.height / 0.5),
//       mainAxisExtent: 300,
//     ),
//     itemCount: items.length,
//     itemBuilder: (context, index) {
//       return GestureDetector(
//         child: Item(itemModel: items[index]),
//         onTap: () {
//           setState(() {
//             items[index].isFavorite = !items[index].isFavorite;
//             Navigator.pushNamed(context, ProdcutPage.id, arguments: {
//               'title': items[index].title,
//               'image': items[index].image,
//               'size': items[index].size,
//               'washing': items[index].washingInstructions,
//               'length': items[index].length,
//               'material': items[index].material,
//               'price': items[index].price
//             });
//           });
//         },
//       );
//     }),

//   String? categoryName;
// List<Product> products = [];
// bool isloading = false;
// categoryName = ModalRoute.of(context)!.settings.arguments as String;

// final String itemName =
//     ModalRoute.of(context)!.settings.arguments as String;
// final List<ItemModel> items = [
//   ItemModel(
//       image: 'images/homePage/shirt (3).jpeg',
//       title: ' lu Sweatshirt ',
//       price: ' \$ 85',
//       size: 'M',
//       length: '14 in',
//       material: '100% Cotton',
//       washingInstructions: 'Machine wash cold'),
//   ItemModel(
//       image: 'images/homePage/shirt (3).jpeg',
//       title: ' lu Sweatshirt ',
//       price: ' \$ 85',
//       size: 'M',
//       length: '14 in',
//       material: '100% Cotton',
//       washingInstructions: 'Machine wash cold'),
//   ItemModel(
//       image: 'images/homePage/shirt (3).jpeg',
//       title: ' lu Sweatshirt ',
//       price: '\$  85',
//       size: 'M',
//       length: '14 in',
//       material: '100% Cotton',
//       washingInstructions: 'Machine wash cold'),
//   ItemModel(
//       image: 'images/homePage/shirt (3).jpeg',
//       title: ' lu Sweatshirt ',
//       price: '\$ 85',
//       size: 'M',
//       length: '14 in',
//       material: '100% Cotton',
//       washingInstructions: 'Machine wash cold'),
//   ItemModel(
//       image: 'images/homePage/shirt (3).jpeg',
//       title: ' lu Sweatshirt ',
//       price: '\$  85',
//       size: 'M',
//       length: '14 in',
//       material: '100% Cotton',
//       washingInstructions: 'Machine wash cold'),
//   ItemModel(
//       image: 'images/homePage/shirt (3).jpeg',
//       title: ' lu Sweatshirt ',
//       price: '\$  85',
//       size: 'M',
//       length: '14 in',
//       material: '100% Cotton',
//       washingInstructions: 'Machine wash cold'),
// ];












/*StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tshirtone').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData && snapshot.data != null) {
            List<Productone> products = [];
            snapshot.data?.docs!.forEach((element) {
              products.add(Productone(
                  name: element['name'],
                  price: element['price'],
                  image: element['image'])); 
            });
          }
          List<DocumentSnapshot> docs = snapshot.data!.docs;
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  // childAspectRatio: 0.75,
                ),
                shrinkWrap: true,
                //    physics: NeverScrollableScrollPhysics(),
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data =
                      docs[index].data() as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProdcutPage.id, arguments: {
                        'image': docs[index]['image'],
                        'name': docs[index]['name'],
                        'price': docs[index]['price'],
                      }
                          // MaterialPageRoute(
                          //     builder: (context) => ProdcutPage())
                          );
                    },
                    child: Container(
                      color: Colors.grey[300],
                      height: 100,
                      width: 100,
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(35),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 7,
                                child: Image.network(
                                  data['image'],
                                  fit: BoxFit.cover,
                                )),
                            Expanded(
                              flex: 3,
                              child: Text(data['name'] ?? 'name not available'),
                            ),
                            Expanded(
                              flex: 3,
                              child:
                                  Text(data['price'] ?? 'Price not available'),
                            ),
                          ],
                        ),
                      ),
                      //
                      //Text('\$${data['price']}'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),*/ 