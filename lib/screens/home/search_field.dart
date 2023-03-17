import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../controller/cart_controller.dart';
import '../../model/product.dart';
import '../detail/details_screen.dart';

class SearchField extends StatelessWidget {
  final cartController  = Get.put(BikeCartController());

   SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 56,
          width: 250,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Center(
            child: TextField(
              onChanged: (value) => log(value),
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFBDBDBD),
                ),
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF212121),
                ),
              ),
            ),
          ),
        ),

      ],
    );

  }
}

class SearchBar extends SearchDelegate<String> {
  final List<Product> searchResults;

  SearchBar(this.searchResults);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';        },      ),    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final cartController  = Get.put(BikeCartController());

    final matchingBikes = bikes
        .where((bike) => bike.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return SizedBox(
      height: 900,
      child: ListView.builder(
        itemCount: matchingBikes.length,
        itemBuilder: (context, index) {
          final item = matchingBikes[index];
          return ListTile(
            title: Text(
              item.name,
              style: TextStyle(color: Colors.red),
            ),
            subtitle: Text(item.name),
            onTap: () {
              // Navigate to the details screen for the selected bike
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopDetailScreen(
                      product: item,
                      controller: cartController,
                      index: index, ),
                ),
              );
            },
          );
        },
      ),
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final cartController  = Get.put(BikeCartController());

    final suggestions = bikes.where((bike) => bike.name.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final item = suggestions[index];

        return ListTile(
          title: Text(item.name),
          onTap: () {
            // Navigate to the details screen for the selected bike
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopDetailScreen(
                  product: item,
                  controller: cartController,
                  index: index, ),
              ),
            );
          },
        );
      },
    );
  }
}

