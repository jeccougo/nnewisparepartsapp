import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/bike_cart_controller.dart';
import '../../model/popular.dart';
import '../cart/cart_screen.dart';
import 'orderCard.dart';

class AllOrderScreen extends StatelessWidget {
  AllOrderScreen({super.key, this.title = ''});

  static String route() => '/cart';

  final String title;

  final cartController  = Get.put(BikeCartController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }



}
