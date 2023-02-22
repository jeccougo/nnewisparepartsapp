import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/cart_controller.dart';
import '../../model/orderModel.dart';
import '../../model/product.dart';
import '../cart/cart_screen.dart';
import 'orderCard.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key, required this.title,});

  static String route() => '/cart';

  final String title;

  final cartController  = Get.put(BikeCartController());

  final User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference cartsCollection = FirebaseFirestore.instance.collection('carts');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: cartsCollection
          //.where('userId', isEqualTo: user?.uid)
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final cartDocs = snapshot.data!.docs;
        final cartItems = cartDocs.map((doc) => OrderModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
        return ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return OrderCard(
              order: cartItems[index]
            );
          },
        );
      },
    );
  }

}
