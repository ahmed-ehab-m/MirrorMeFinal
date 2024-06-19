import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mirror_me_app/colors/color.dart';
import 'package:mirror_me_app/screens/favourite_list_page.dart';
import 'package:mirror_me_app/screens/feedback.dart';
import 'package:mirror_me_app/screens/myOrder.dart';
import 'package:mirror_me_app/screens/signin.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _imageUrl;
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    _imageUrl = ''; // Initialize with empty URL or the default image URL
  }

  Future<void> _uploadImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Upload the image to Firebase Storage and get the download URL
      // This is just a placeholder, you need to implement the actual upload logic
      // For Firebase Storage, you can use the firebase_storage package
      // Example: https://pub.dev/packages/firebase_storage
      setState(() {
        _imageUrl = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(color: Color(0xFF0A2472)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, Snapshot) {
            final name = Snapshot.data?.data()!['username'];
            final email = Snapshot.data?.data()!['email'];

            if (Snapshot.hasError) {
              return Text("error");
            }
            if (Snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (Snapshot.hasData) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            // onTap: _uploadImage,
                            child: Center(
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/jj.jpg'),
                                // _imageUrl.isNotEmpty
                                //     ? FileImage(File(_imageUrl))
                                //     : AssetImage('images/3_4.jpg')
                                //         as ImageProvider,
                                radius: 50,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 45,
                    endIndent: 45,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyOrder()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_basket,
                            color: KPrimaryColor,
                          ),
                          SizedBox(
                            width: 10, // تحديد المسافة هنا
                          ),
                          Text(
                            'My Orders',
                            style: TextStyle(
                              fontSize: 25,
                              color: KPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 30, bottom: 40),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, FavoritePage.id);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: KPrimaryColor,
                          ),
                          SizedBox(
                            width: 10, // تحديد المسافة هنا
                          ),
                          Text(
                            'Favourite List',
                            style: TextStyle(
                              fontSize: 25,
                              color: KPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 0, bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, FeedbackPage.id);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.feedback, // أيقونة التقييم
                            color: KPrimaryColor,
                          ),
                          SizedBox(
                            width: 10, // تحديد المسافة هنا
                          ),
                          Text(
                            'Feedback',
                            style: TextStyle(
                              fontSize: 25,
                              color: KPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 45,
                    endIndent: 45,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 40),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushNamed(context, SignIn.id);
                          },
                          child: Icon(
                            Icons.logout,
                            color: KPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 25,
                            color: KPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }

            return Text(" ");
          }),
    );
  }
}
