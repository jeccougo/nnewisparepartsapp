import 'package:flutter/material.dart';

import '../../components/helper.dart';
import '../../model/orderModel.dart';
import 'OrderDetailsPage.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the OrderDetailsPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderDetailsPage(orderNumber: order.orderNumber.toString(),)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User Id: ${order.userId}'),
              Text('Order Number: ${order.orderNumber}'),
              Text('Customer Name: ${order.customerName}'),
              Text('Customer Phone: ${order.customerPhone}'),
              Text('Delivery Address: ${order.deliveryAddress}'),
              Text('Number Of Items: ${order.numberOfItems}'),
              Text('Date Of Order: ${timeConverter(order.dateOfOrder!)}'),
              Text('Status Of Order: ${order.statusOfOrder}'),
              Text('Total For Order: ${order.totalForOrder}'),
            ],
          ),
        ),
      ),
    );
  }
}

