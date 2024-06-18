import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mirror_me_app/colors/color.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/models/productmain.dart';
import 'package:mirror_me_app/providers/favorites_provider.dart';
import 'package:mirror_me_app/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../../colors/color.dart';
import '../widgets/custom_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);
  static String id = 'FavoritePage';

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavoritesProvider>(context, listen: false).fetchproduct();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesProvider>(context);
    List<Productone> productsList = provider.productsList;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Favorite List',
          style: TextStyle(
              fontSize: 22, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: productsList.length != 0
          ? GridView.builder(
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 70,
              ),
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  product: productsList[index],
                );
              },
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                      radius: 160,
                      backgroundImage: AssetImage('images/fav.jpeg')),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'No Favorites yet.',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
    );
  }
}
