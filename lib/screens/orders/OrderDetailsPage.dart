import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDetailsPage extends StatelessWidget {
  final String orderNumber;
  const OrderDetailsPage({Key? key, required this.orderNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('carts').doc(orderNumber).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final orderData = snapshot.data!.data() as Map<String, dynamic>;
          final orderItems = orderData['items'] as List<dynamic>;

          return ListView.builder(
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              final itemData = orderItems[index] as Map<String, dynamic>;
              final productData = itemData['product'] as Map<String, dynamic>;
              final productName = productData['name'] as String;
              final productPrice = productData['price'] as double;
              final productImage = productData['image'] as String;
              final quantity = itemData['quantity'] ?? 3;

              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
               child: Center(
                 child: Card(
                   color: Colors.white,
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this property to align items horizontally

                           children: [
                             Image.asset(
                               productImage,
                               fit: BoxFit.contain, // Add this property to maintain the same size
                               width: 100, // Optional: set a fixed width
                               height: 100, // Optional: set a fixed height
                             ),
                             SizedBox(
                               width: 30,
                             ),
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(productName),
                                   Text('Price: $productPrice \nQuantity: $quantity'),
                                 ],
                               ),
                             ),
                             Text('Total: ${productPrice * quantity}'),
                           ],
                         ),

                       ]),
                         // Add a SizedBox to create some space between the image and the text




                   ),
                 ),
               ),

                // child: ListTile(
                //   leading: Image.asset(
                //     productImage,
                //     fit: BoxFit.contain, // Add this property to maintain the same size
                //     width: 100, // Optional: set a fixed width
                //     height: 100, // Optional: set a fixed height
                //   ),
                //   title: Text(productName),
                //   subtitle: Text('Price: $productPrice, \n Quantity: $quantity'),
                //   trailing: Text('Total: ${productPrice * quantity}'),
                //   tileColor: Colors.white,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8.0),
                //   ),
                // ),
              );

            },
          );
        },
      ),
    );
  }
}
