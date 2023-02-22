import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product.dart';

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

}
