import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nnewi_spare_parts_market/controller/cart_controller.dart';
import 'package:nnewi_spare_parts_market/routes.dart';
import 'package:nnewi_spare_parts_market/screens/buttomnav/buttomnavbar.dart';
import 'package:nnewi_spare_parts_market/screens/cart/cart_screen.dart';
import 'package:nnewi_spare_parts_market/screens/detail/details_screen.dart';
import 'package:nnewi_spare_parts_market/screens/detail/keke_detail_screen.dart';
import 'package:nnewi_spare_parts_market/screens/home/home.dart';
import 'package:nnewi_spare_parts_market/screens/login/login.dart';
import 'package:nnewi_spare_parts_market/screens/mostpopular/most_popular_screen.dart';
import 'package:nnewi_spare_parts_market/screens/profile/profile_screen.dart';
import 'package:nnewi_spare_parts_market/screens/signup/signup.dart';
import 'package:nnewi_spare_parts_market/screens/special_offers/special_offers_screen.dart';
import 'package:nnewi_spare_parts_market/screens/splash/splash.dart';
import 'package:nnewi_spare_parts_market/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ImeAfia());
}

class ImeAfia extends StatelessWidget {
  const ImeAfia({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nnewi Spare Parts Market',
      theme: appTheme(),

      routes: routes,
      home: ButtomNavbarScreen(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen(title: '',)),
        GetPage(name: '/most_popular', page: () => MostPopularScreen()),
        GetPage(name: '/special_offers', page: () =>  SpecialOfferScreen()),
        GetPage(name: '/keke_detail', page: () => KekeDetailScreen(product: null,)),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/shop_detail', page: () =>  ShopDetailScreen( controller: null, index: null, quantity: null, product: null, )),
        GetPage(name: '/cart', page: () =>  CartScreen()),
        GetPage(name: '/bnav', page: () =>  ButtomNavbarScreen()),
        GetPage(name: '/login', page: () =>  LoginPage()),
        GetPage(name: '/signup', page: () =>  SignupPage()),

      ],

    );
  }
}
