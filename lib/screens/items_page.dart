import 'package:flutter/material.dart';
import 'package:mirror_me_app/models/itemModel.dart';
import 'package:mirror_me_app/models/product.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/screens/prodcut_page.dart';
import 'package:mirror_me_app/services/get_products_of_category.dart';
import 'package:mirror_me_app/widgets/items/item.dart';
import 'package:mirror_me_app/widgets/products_screens_body.dart';

class ItemsPage extends StatefulWidget {
  ItemsPage({super.key});
  static const String id = 'ItemsPage';


  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    String? categoryName;
  List<Productone> products = [];
  bool isloading = false;
  categoryName = ModalRoute.of(context)!.settings.arguments as String;

    final String itemName =
        ModalRoute.of(context)!.settings.arguments as String;
    final List<ItemModel> items = [
      ItemModel(
          image: 'images/homePage/shirt (3).jpeg',
          title: ' lu Sweatshirt ',
          price: ' \$ 85',
          size: 'M',
          length: '14 in',
          material: '100% Cotton',
          washingInstructions: 'Machine wash cold'),
      ItemModel(
          image: 'images/homePage/shirt (3).jpeg',
          title: ' lu Sweatshirt ',
          price: ' \$ 85',
          size: 'M',
          length: '14 in',
          material: '100% Cotton',
          washingInstructions: 'Machine wash cold'),
      ItemModel(
          image: 'images/homePage/shirt (3).jpeg',
          title: ' lu Sweatshirt ',
          price: '\$  85',
          size: 'M',
          length: '14 in',
          material: '100% Cotton',
          washingInstructions: 'Machine wash cold'),
      ItemModel(
          image: 'images/homePage/shirt (3).jpeg',
          title: ' lu Sweatshirt ',
          price: '\$ 85',
          size: 'M',
          length: '14 in',
          material: '100% Cotton',
          washingInstructions: 'Machine wash cold'),
      ItemModel(
          image: 'images/homePage/shirt (3).jpeg',
          title: ' lu Sweatshirt ',
          price: '\$  85',
          size: 'M',
          length: '14 in',
          material: '100% Cotton',
          washingInstructions: 'Machine wash cold'),
      ItemModel(
          image: 'images/homePage/shirt (3).jpeg',
          title: ' lu Sweatshirt ',
          price: '\$  85',
          size: 'M',
          length: '14 in',
          material: '100% Cotton',
          washingInstructions: 'Machine wash cold'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          itemName,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color(0xff0A2472)),
        ),
        centerTitle: true,
        leading: InkWell(
          child: Image.asset('images/itemsPage/Arrow - Left.png'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
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
      // body: ProductsScreenBody(
      //     future: AllProductsOfCategoryService()
      //         .getAllProductsOfCategory(categoryName: categoryName!),
      //   )
    );
  }
}
