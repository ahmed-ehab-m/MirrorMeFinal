// import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirror_me_app/firebase_options.dart';
import 'package:mirror_me_app/providers/favorites_provider.dart';
import 'package:mirror_me_app/providers/my_cart_provider.dart';
import 'package:mirror_me_app/providers/my_order_provider.dart';
import 'package:mirror_me_app/screens/ItemPage.dart';
import 'package:mirror_me_app/screens/Seven.dart';
import 'package:mirror_me_app/screens/camera_screen.dart';
import 'package:mirror_me_app/screens/cart_screen.dart';
import 'package:mirror_me_app/screens/favourite_list_page.dart';
import 'package:mirror_me_app/screens/feedback.dart';
import 'package:mirror_me_app/screens/five.dart';
import 'package:mirror_me_app/screens/four.dart';
import 'package:mirror_me_app/screens/home_page.dart';
import 'package:mirror_me_app/screens/items_page.dart';
import 'package:mirror_me_app/screens/mainPage.dart';
import 'package:mirror_me_app/screens/myOrder.dart';
import 'package:mirror_me_app/screens/newPassword.dart';
import 'package:mirror_me_app/screens/one.dart';
import 'package:mirror_me_app/screens/order_details_page.dart';
import 'package:mirror_me_app/screens/payment_page.dart';
import 'package:mirror_me_app/screens/profilePage.dart';
import 'package:mirror_me_app/screens/search.dart';
import 'package:mirror_me_app/screens/signin.dart';
import 'package:mirror_me_app/screens/signup.dart';
import 'package:mirror_me_app/screens/six.dart';
import 'package:mirror_me_app/screens/splash.dart';
import 'package:mirror_me_app/screens/successfullOrder.dart';
import 'package:mirror_me_app/screens/three.dart';
import 'package:mirror_me_app/screens/try_page.dart';
import 'package:mirror_me_app/screens/two.dart';
import 'package:provider/provider.dart';

// List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // try {
  //   cameras = await availableCameras();
  // } on CameraException catch (e) {
  //   print('Error in fetching the cameras: $e');
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => MyCartProvider()),
        ChangeNotifierProvider(create: (context) => MyOrderProvider()),
      ],
      child: MaterialApp(
        routes: {
          SignUp.id: (context) => SignUp(),
          SignIn.id: (context) => SignIn(),
          ItemsPage.id: (context) => ItemsPage(),
          HomePage.id: (context) => HomePage(),
          //ProdcutPage.id: (context) =>  ProdcutPage(name,),
          PaymentPage.id: (context) => const PaymentPage(),
          FavoritePage.id: (context) => FavoritePage(),
          OrderDetailsPage.id: (context) => OrderDetailsPage(),
          SuccussfulOrder.id: (context) => const SuccussfulOrder(),
          ProfilePage.id: (context) => const ProfilePage(),
          // CameraScreen.id: (context) => CameraScreen(),
          CartScreen.ids: (context) => CartScreen(),
          MainPage.id: (context) => MainPage(),
          MyOrder.id: (context) => MyOrder(),
          ItPage.id: (context) => ItPage(),
          TwoPage.id: (context) => TwoPage(),
          ThreePage.id: (context) => ThreePage(),
          FourPage.id: (context) => FourPage(),
          FivePage.id: (context) => FivePage(),
          SixPage.id: (context) => SixPage(),
          SevenPage.id: (context) => SevenPage(),
          one.id: (context) => one(),
          SplashScreen.id: (context) => SplashScreen(),
          FeedbackPage.id: (context) => FeedbackPage(),
          SearchPage.id: (context) => SearchPage(),

          //MyOrderTwo.id: (context) => MyOrderTwo(),
        },
        initialRoute: MainPage.id,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
