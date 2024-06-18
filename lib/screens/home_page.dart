// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mirror_me_app/constants.dart';
// import 'package:mirror_me_app/screens/ItemPage.dart';
// import 'package:mirror_me_app/screens/Seven.dart';
// import 'package:mirror_me_app/screens/five.dart';
// import 'package:mirror_me_app/screens/four.dart';
// import 'package:mirror_me_app/screens/items_page.dart';
// import 'package:mirror_me_app/screens/one.dart';
// import 'package:mirror_me_app/screens/profilePage.dart';
// import 'package:mirror_me_app/screens/search.dart';
// import 'package:mirror_me_app/screens/six.dart';
// import 'package:mirror_me_app/screens/three.dart';
// import 'package:mirror_me_app/screens/two.dart';
// import 'package:mirror_me_app/widgets/custom_text_form_field.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class HomePage extends StatefulWidget {
//   HomePage({super.key});
//   static String id = 'HomePage';
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final TextEditingController _searchController = TextEditingController();
//   List<DocumentSnapshot> _searchResults = [];

//   void _searchProducts(String query) async {
//     final results = await FirebaseFirestore.instance
//         .collection('tshirtone')
//         .where('name', isGreaterThanOrEqualTo: query)
//         .where('name', isLessThanOrEqualTo: query + '\uf8ff')
//         .get();

//     setState(() {
//       _searchResults = results.docs;
//     });
//   }

//   final PageController _pageController = PageController(keepPage: true);
//   int _selectedIndex = 0;
//   dynamic categoriesName = [];
//   String? productName;

//   final List<String> pageRoutes = [
//     one.id,
//     TwoPage.id,
//     ThreePage.id,
//     FourPage.id,
//     FivePage.id,
//     SixPage.id,
//     SevenPage.id
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> containers = [
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: 100,
//         decoration: BoxDecoration(
//           color: Color(0XffD9D9D9),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 10,
//             ),
//             Image.asset('images/jimmy1.jpg'),
//             SizedBox(
//               width: 25,
//             ),
//             Text(
//               'New Collection',
//               style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               width: 5,
//             ),
//             Image.asset('images/homePage/Arrow---Right-3.png',
//                 height: 30, width: 30)
//           ],
//         ),
//       ),
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: 111,
//         decoration: BoxDecoration(
//           color: Color(0XffD9D9D9),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 10,
//             ),
//             Image.asset('images/homePage/shirt (5).jpeg'),
//             SizedBox(
//               width: 45,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Discount 50% for ',
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//                 ),
//                 Text(
//                   'the frist transaction',
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ];
//     var size = MediaQuery.of(context).size;
//     final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//     final double itemWidth = size.width / 2;
//     String userName = 'ahmed';
//     List<String> chars = userName.split('');
//     void _onItemTapped(int index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, ProfilePage.id);
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Color(0xff4280EF).withOpacity(0.07),
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       height: 60,
//                       width: 50,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                         radius: 15,
//                         child: Text(
//                           chars[0].toUpperCase(),
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   IconButton(
//                     icon: const Icon(Icons.search),
//                     onPressed: () {
//                       Navigator.pushNamed(context, SearchPage.id);
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 height: 111,
//                 child: PageView.builder(
//                   controller: _pageController,
//                   itemCount: 2,
//                   itemBuilder: (_, index) => containers[index],
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SmoothPageIndicator(
//                     controller: _pageController, // PageController
//                     count: 2,
//                     effect: ExpandingDotsEffect(
//                         activeDotColor: kPrimaryColor), // your preferred effect
//                     onDotClicked: (index) {},
//                   ),
//                 ],
//               ),
//               StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('features')
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   List<DocumentSnapshot> docs = snapshot.data!.docs;
//                   return Container(
//                     width: 500,
//                     height: 50,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       // clipBehavior: Clip.none,
//                       // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       //   crossAxisCount: 2,
//                       //   mainAxisExtent: 280,
//                       //   crossAxisSpacing: 5,
//                       //   mainAxisSpacing: 10,
//                       // ),
//                       // shrinkWrap: true,
//                       // physics: NeverScrollableScrollPhysics(),
//                       itemCount: docs.length,
//                       itemBuilder: (context, index) {
//                         Map<String, dynamic> data =
//                             docs[index].data() as Map<String, dynamic>;
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, pageRoutes[index]);
//                           },
//                           child: Container(
//                             color: Color(0xFFBABABA),
//                             child: Text(
//                               data['name'],
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: kPrimaryColor,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mirror_me_app/constants.dart';
import 'package:mirror_me_app/screens/ItemPage.dart';
import 'package:mirror_me_app/screens/Seven.dart';
import 'package:mirror_me_app/screens/five.dart';
import 'package:mirror_me_app/screens/four.dart';
import 'package:mirror_me_app/screens/items_page.dart';
import 'package:mirror_me_app/screens/one.dart';
import 'package:mirror_me_app/screens/profilePage.dart';
import 'package:mirror_me_app/screens/search.dart';
import 'package:mirror_me_app/screens/six.dart';
import 'package:mirror_me_app/screens/three.dart';
import 'package:mirror_me_app/screens/two.dart';
import 'package:mirror_me_app/widgets/custom_text_form_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static String id = 'HomePage';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];

  void _searchProducts(String query) async {
    final results = await FirebaseFirestore.instance
        .collection('tshirtone')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .get();

    setState(() {
      _searchResults = results.docs;
    });
  }

  final PageController _pageController = PageController(keepPage: true);
  int _selectedIndex = 0;
  dynamic categoriesName = [];
  String? productName;

  final List<String> pageRoutes = [
    one.id,
    TwoPage.id,
    ThreePage.id,
    FourPage.id,
    FivePage.id,
    SixPage.id,
    SevenPage.id
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> containers = [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0XffD9D9D9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset('images/jimmy1.jpg'),
            SizedBox(
              width: 25,
            ),
            Text(
              'New Collection',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 5,
            ),
            Image.asset('images/homePage/Arrow---Right-3.png',
                height: 30, width: 30)
          ],
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 111,
        decoration: BoxDecoration(
          color: Color(0XffD9D9D9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset('images/homePage/shirt (5).jpeg'),
            SizedBox(
              width: 45,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Discount 50% for ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Text(
                  'the frist transaction',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    ];
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    String userName = 'ahmed';
    List<String> chars = userName.split('');
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfilePage.id);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff4280EF).withOpacity(0.07),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      height: 60,
                      width: 50,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Text(
                          chars[0].toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.pushNamed(context, SearchPage.id);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 111,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 2,
                  itemBuilder: (_, index) => containers[index],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController, // PageController
                    count: 2,
                    effect: ExpandingDotsEffect(
                        activeDotColor: kPrimaryColor), // your preferred effect
                    onDotClicked: (index) {},
                  ),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('features')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<DocumentSnapshot> docs = snapshot.data!.docs;
                  return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 280,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data =
                          docs[index].data() as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, pageRoutes[index]);
                        },
                        child: Column(
                          children: [
                            Image.network(
                              data['image'],
                              height: 250,
                              width: 250,
                            ),
                            Text(
                              data['name'],
                              style: TextStyle(
                                fontSize: 20,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
