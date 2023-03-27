import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constant/key.dart';
import '../controller/cart_controller.dart';

class MakePayment {
  MakePayment({required this.ctx, required this.total, required this.email});
  final BikeCartController cartController = Get.find<BikeCartController>();
  final CollectionReference cartsCollection =
  FirebaseFirestore.instance.collection('carts');
  late String _orderNumber;
  final _user = FirebaseAuth.instance.currentUser!;



  BuildContext ctx;

  int total;

  String email;

  PaystackPlugin paystack = PaystackPlugin();

  //Reference

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //GetUi
  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await paystack.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
  }

  //Method Charging card
  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = cartController.total* 100
        ..email = _user.email
        ..reference = _getReference()
        ..card = _getCardUI();

      CheckoutResponse response = await paystack.checkout(
        ctx,

        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: FlutterLogo(
          size: 24,

        ),
      );

      print("Response $response");

      // Listen for successful payment
      if (response.status == true) {
        // Update order status in Firestore
        try {
          // Update order status to 'confirmed'
          await cartsCollection.doc(_orderNumber).update({'statusOfOrder': 'confirmed'});
        } catch (error) {
          if (kDebugMode) {
            print(error);
          }
        }

      } else {
        // Handle payment error
        print('Payment failed');
      }
    });
  }
}



