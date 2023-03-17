import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product.dart';

class BikeCartController extends GetxController {
  var _Products = {}.obs;

  get isEmpty => 0;



  void addProductToCart(Product products) {
    if (_Products.containsKey(products)) {
      _Products[products] += 1;
    } else {
      _Products[products] = 1;
    }
    Get.snackbar(
      'Product Added',
      "You have ${products.name} items in your cart.",
      backgroundColor: Colors.amber,
      colorText: Colors.black,
      duration: const Duration(milliseconds: 800),
      snackPosition: SnackPosition.TOP,
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
  bool isCartEmpty() {
    return _Products.isEmpty;
  }

  void clearCart() {
    _Products.clear();
  }

  final cartItems = <Product>[].obs;



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




  var totals = 0.0.obs;
  var isSuccess = false.obs;

  void checkout() async {
    // Payment logic goes here
    // ...
    // If payment is successful, set isSuccess to true
    isSuccess.value = true;
  }



  final items = <Product>[].obs;

  final bikes = <Product>[].obs;

  void search(String query) {
    print('Searching for: $query');
    if (query.isNotEmpty) {
      bikes.value = items.where((item) => item.name.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      bikes.value = []; // clear the list if query is empty
    }
  }
}
