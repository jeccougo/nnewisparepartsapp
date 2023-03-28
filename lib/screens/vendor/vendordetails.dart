import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/vendor.dart';

class VendorDetailsPage extends StatelessWidget {
  final Vendor vendor;

  const VendorDetailsPage({Key? key, required this.vendor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vendor.name,style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: vendor.id,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(vendor.vendorImage),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(vendor.description),
            SizedBox(height: 25),
            Text(
              'Products:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: vendor.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = vendor.products[index];
                  return Row(
                    children: [
                      Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(product.image),
                        ),
                      ),
                    ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name),
                          Text(product.description),
                        ],
                      ),
                    ]
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
