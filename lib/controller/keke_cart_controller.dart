
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/kekemodel.dart';

class KekeCartController extends GetxController {
  //add a dict to store the products in the cart
  var _kekeProducts = {}.obs;

  void addProductToCart(KekeModel products){
    if (_kekeProducts.containsKey(products)){
      _kekeProducts[products] += 1;
    }
    else{
      _kekeProducts[products] = 1;

    }
    Get.snackbar('Product Added',
      'You have added ${products.title} to your cart',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),);

  }

  void removeProductFromCart(KekeModel products){
    if (_kekeProducts.containsKey(products) && _kekeProducts[products] == 1){
      _kekeProducts.removeWhere((key, value) => key == products);
    } else {
      _kekeProducts[products] -= 1;
    }

    Get.snackbar('Product Removed',
      'You have removed ${products.title} from your cart',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),);

  }

  get products => _kekeProducts;

  get productSubTotal => _kekeProducts.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _kekeProducts.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2)
      ?? 0;


}
