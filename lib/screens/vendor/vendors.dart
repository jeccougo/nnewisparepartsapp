import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nnewi_spare_parts_market/model/vendor.dart';
import 'package:nnewi_spare_parts_market/screens/vendor/vendordetails.dart';

class VendorScreen extends StatelessWidget {
  final List<Vendor> vendors;

  const VendorScreen({Key? key, required this.vendors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendors', style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: vendors.length,
              itemBuilder: (BuildContext context, int index) {
                final vendor = vendors[index];

                return ListTile(
                  leading: Hero(
                    tag: vendor.id,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(vendor.vendorImage),
                    ),
                  ),
                  title: Text(vendor.name),
                  subtitle: Text(vendor.description),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VendorDetailsPage(vendor: vendor),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
