// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// // import '../model/popular.dart';
// //
// // class BikeCartController extends GetxController {
// //   //add a dict to store the products in the cart
// //   var _Bikes = {}.obs;
// //   var quantity = 0;
// //
// //   void addProductToCart(Product1 bikes){
// //     if (_Bikes.containsKey(bikes)){
// //       _Bikes[bikes] += 1;
// //     }
// //     else{
// //       _Bikes[bikes] = 1;
// //
// //     }
// //     Get.snackbar('Product Added',
// //       'You have added ${bikes.name} to your cart',
// //       snackPosition: SnackPosition.TOP,
// //       backgroundColor: Colors.transparent,
// //       duration: const Duration(seconds: 2),);
// //
// //   }
// //
// //   void removeProductFromCart(Product1 bikes){
// //     if (_Bikes.containsKey(bikes) && _Bikes[bikes] == 1){
// //       _Bikes.removeWhere((key, value) => key == bikes);
// //     } else {
// //       _Bikes[bikes] -= 1;
// //     }
// //
// //     Get.snackbar('Product Removed',
// //       'You have removed ${bikes.name} from your cart',
// //       snackPosition: SnackPosition.TOP,
// //       backgroundColor: Colors.transparent,
// //       duration: const Duration(seconds: 1),);
// //
// //   }
// //
// //   get bikes => _Bikes;
// //
// //   get productSubTotal => _Bikes.entries
// //       .map((product) => product.key.price * product.value)
// //       .toList();
// //
// //   get total => _Bikes.isEmpty
// //       ? "0.00"
// //       : _Bikes.entries
// //       .map((product) => product.key.price * product.value)
// //       .toList()
// //       .reduce((value, element) => value + element)
// //       .toStringAsFixed(2);
// //
// //
// //   double getTotal() {
// //     final double _total = total;
// //     if (_total == 0) {
// //       return 0;
// //     }
// //     return _total;
// //   }
// //
// //
// // }
// //
// //
// // import 'package:get/get.dart';
// // import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// //
// // import '../model/popular.dart';
// //
// // class BikeCartController extends GetxController {
// //   var _Product = {}.obs;
// //
// //
// //   void addProductToCart(Product product) {
// //     if (_Product.containsKey(product)) {
// //       _Product[product] += 1;
// //     } else {
// //       _Product[product] = 1;
// //     }
// //   }
// //
// //   void removeProductFromCart(Product product) {
// //     if (_Product.containsKey(product) && _Product[product] == 1) {
// //       _Product.removeWhere((key, value) => key == product);
// //     } else {
// //       _Product[product] -= 1;
// //     }
// //   }
// //
// //   get cart => _Product;
// //
// //   get productSubTotal => _Product.entries
// //       .map((entry) => entry.key is Bike
// //       ? (entry.key as Bike).price * entry.value
// //       : (entry.key as Keke).price * entry.value)
// //       .toList();
// //
// //   get total => _Product.isEmpty
// //       ? 0
// //       : _Product.entries
// //       .map((entry) => entry.key is Bike
// //       ? (entry.key as Bike).price * entry.value
// //       : (entry.key as Keke).price * entry.value)
// //       .toList()
// //       .reduce((value, element) => value + element);
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../model/popular.dart';
//
// class BikeCartController extends GetxController {
//   //add a dict to store the products in the cart
//   var _Products = {}.obs;
//
//
//
//   void addProductToCart(Product products){
//     if (_Products.containsKey(products)){
//       _Products[products] += 1;
//     }
//     else{
//       _Products[products] = 1;
//
//     }
//     Get.snackbar('Product Added',
//       'You have added ${products.name} to your cart',
//       snackPosition: SnackPosition.TOP,
//       backgroundColor: Colors.transparent,
//       duration: const Duration(milliseconds: 800),);
//
//   }
//
//   void removeProductFromCart(Product products){
//     if (_Products.containsKey(products) && _Products[products] == 1){
//       _Products.removeWhere((key, value) => key == products);
//     } else {
//       _Products[products] -= 1;
//     }
//
//     Get.snackbar('Product Removed',
//       'You have removed ${products.name} from your cart',
//       snackPosition: SnackPosition.TOP,
//       backgroundColor: Colors.transparent,
//       duration: const Duration(seconds: 2),);
//
//   }
//
//   get products => _Products;
//
//   get productSubTotal => _Products.entries
//       .map((product) => product.key.price * product.value)
//       .toList();
//
//   get total => _Products.isEmpty
//       ? "0.00"
//       : _Products.entries
//       .map((entry) => entry.key is Bike
//       ? (entry.key as Bike).price * entry.value
//       : entry.key is Keke
//       ? (entry.key as Keke).price * entry.value
//       : (entry.key as Motor).price * entry.value)
//       .toList()
//       .reduce((value, element) => value + element);
//
//
//
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_share/whatsapp_share.dart';
import 'package:whatsapp_share/whatsapp_share.dart';


import '../model/popular.dart';

class BikeCartController extends GetxController {
  var _Products = {}.obs;

  void addProductToCart(Product products) {
    if (_Products.containsKey(products)) {
      _Products[products] += 1;
    } else {
      _Products[products] = 1;
    }
    Get.snackbar(
      'Product Added',
      'You have added ${products.name} to your cart',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      duration: const Duration(milliseconds: 800),
    );
  }

  void removeProductFromCart(Product products) {
    if (_Products.containsKey(products) && _Products[products] == 1) {
      _Products.removeWhere((key, value) => key == products);
    } else {
      _Products[products] -= 1;
    }
    Get.snackbar(
      'Product Removed',
      'You have removed ${products.name} from your cart',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),
    );
  }

  get products => _Products;

  get productSubTotal => _Products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _Products.isEmpty
      ? "0.00"
      : _Products.entries
      .map((entry) => entry.key is Bike
      ? (entry.key as Bike).price * entry.value
      : entry.key is Keke
      ? (entry.key as Keke).price * entry.value
      : (entry.key as Motor).price * entry.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);



  Future<void> addCartToFirestore() async {
    // Get the current user
    final user = FirebaseAuth.instance.currentUser;

    // Get a reference to the Firestore collection where the cart items will be added
    final collection = FirebaseFirestore.instance.collection('carts');

    // Create a new document for the cart items
    final document = collection.doc();

    // Add the cart items to the document
    await document.set({
      'userId': user?.uid,
      'items': products.map((key, value) => MapEntry(key.id, value)),
      'total': total,
    });
  }




}
