import 'dart:developer';

import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _searchController;
  List<String> _searchResults = [];


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    // Perform search based on the current text in the search bar
    // You can implement your own search logic here
    setState(() {
      _searchResults = ['Result 1 for $text', 'Result 2 for $text', 'Result 3 for $text'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: Color(0xFFf3f3f3),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Center(
        child: TextField(
          controller: _searchController,
          onChanged: (value) => log(value),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(Icons.search),
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
    );
  }
}
