import 'package:flutter/material.dart';

import 'OrderDetailsPage.dart';

class OrderCard extends StatelessWidget {
  final String orderNumber;
 // final String customerName;
  //final DateTime orderDate;
  //final String orderStatus;

  const OrderCard({
    Key? key,
    required this.orderNumber,
  //  required this.customerName,
  //  required this.orderDate,
   // required this.orderStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the OrderDetailsPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderDetailsPage(orderNumber: '',)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Number: $orderNumber'),
              Text('Customer Name: hg'),
              Text('Order Date: df'),
              Text('Order Status: d'),
            ],
          ),
        ),
      ),
    );
  }
}
