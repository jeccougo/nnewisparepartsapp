import 'package:flutter/material.dart';
import 'package:nnewi_spare_parts_market/model/product.dart';
import 'package:nnewi_spare_parts_market/screens/buttomnav/buttomnavbar.dart';
import 'package:nnewi_spare_parts_market/screens/cart/cart_screen.dart';
import 'package:nnewi_spare_parts_market/screens/detail/details_screen.dart';
import 'package:nnewi_spare_parts_market/screens/detail/keke_detail_screen.dart';
import 'package:nnewi_spare_parts_market/screens/home/home.dart';
import 'package:nnewi_spare_parts_market/screens/mostpopular/most_popular_screen.dart';
import 'package:nnewi_spare_parts_market/screens/profile/profile_screen.dart';
import 'package:nnewi_spare_parts_market/screens/special_offers/special_offers_screen.dart';


final Map<String, WidgetBuilder> routes = {
  HomeScreen.route(): (context) => const HomeScreen(title: '123'),
  MostPopularScreen.route(): (context) => const MostPopularScreen(),
  SpecialOfferScreen.route(): (context) => const SpecialOfferScreen(),
  ProfileScreen.route(): (context) =>  ProfileScreen(),
  KekeDetailScreen.route(): (context) =>    KekeDetailScreen( product: null,),
  ShopDetailScreen.route(): (context) =>     ShopDetailScreen( controller: null, index: null, product: null, ),
  CartScreen.route(): (context) =>  CartScreen(),
  MainScreen.route: (context) => MainScreen(),

};
