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
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('carts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final docs = snapshot.data?.docs;
        return ListView.builder(
          itemCount: docs?.length,
          itemBuilder: (context, index) {
            final doc = docs![index];
            final product = Bike.fromMap(doc.data() as Map<String, dynamic>);
            return OrderCard(orderNumber: product.id);
          },
        );
      },
    );

  }
}



class OrderScreenCard extends StatefulWidget {
  final Product product;
  const OrderScreenCard({
    Key? key,
    required this.product,}) : super(key: key);

  @override
  State<OrderScreenCard> createState() => _OrderScreenCardState();
}

class _OrderScreenCardState extends State<OrderScreenCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
      child: Container(
        color: Colors.grey.shade50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                ),
                child: Image.asset(widget.product.image),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.name,
                  style: TextStyle(fontSize: 20),),
                //Text('Quantity: ${widget.quantity}',
                // style: TextStyle(fontSize: 20),),
                Text('Price: \$${widget.product.price.toString()}',
                  style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
