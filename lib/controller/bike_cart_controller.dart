
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/popular.dart';

class BikeCartController extends GetxController {
  //add a dict to store the products in the cart
  var _Products = {}.obs;

  void addProductToCart(Product products){
    if (_Products.containsKey(products)){
      _Products[products] += 1;
    }
    else{
      _Products[products] = 1;

    }
    Get.snackbar('Product Added',
      'You have added ${products.title} to your cart',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),);

  }

  void removeProductFromCart(Product products){
    if (_Products.containsKey(products) && _Products[products] == 1){
      _Products.removeWhere((key, value) => key == products);
    } else {
      _Products[products] -= 1;
    }

    Get.snackbar('Product Removed',
      'You have removed ${products.title} from your cart',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 1),);

  }

  get products => _Products;

  get productSubTotal => _Products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _Products.isEmpty
      ? "0.00"
      : _Products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);


  double getTotal() {
    final double _total = total;
    if (_total == 0) {
      return 0;
    }
    return _total;
  }


}
