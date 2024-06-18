import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/screens/cart_screen.dart';
import 'package:mirror_me_app/screens/favourite_list_page.dart';
import 'package:mirror_me_app/screens/home_page.dart';
import 'package:mirror_me_app/screens/profilePage.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key, this.selectedIndex});
  static String id = 'MainPage';
  int? selectedIndex;
  @override
  State<MainPage> createState() => _MainPageState();
}

int _selectedIndex = 0;
int _previousIndex = 0;

class _MainPageState extends State<MainPage> {
  static List<Widget> pages = <Widget>[
    HomePage(),
    FavoritePage(),
    CartScreen(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _previousIndex = _selectedIndex; // تحديث الفهرس السابق
      _selectedIndex = index; // تعيين الفهرس الجديد
    });

    // عندما يتم اختيار تبويب جديد ويتم تحديث _selectedIndex، يمكنك وضع هذا الكود للعودة إلى التبويب الساب
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedIconTheme: IconThemeData(
          size: 25,
        ),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: Color(0xff0A2472),
            ),
            label: 'Home',
            activeIcon: Icon(
              CupertinoIcons.house_fill,
              color: Color(0xff0A2472),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart,
              color: Color(0xff0A2472),
            ),
            label: 'Favorites',
            activeIcon: Icon(
              CupertinoIcons.heart_fill,
              color: Color(0xff0A2472),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.cart,
              color: Color(0xff0A2472),
            ),
            label: 'Cart',
            activeIcon: Icon(
              CupertinoIcons.cart_fill,
              color: Color(0xff0A2472),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              color: Color(0xff0A2472),
            ),
            label: 'Profile',
            activeIcon: Icon(
              CupertinoIcons.person_fill,
              color: Color(0xff0A2472),
            ),
          ),
        ],
        //onTap: _onItemTapped,
      ),
    );
  }
}
