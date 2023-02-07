import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, this.title = ''});

  static String route() => '/cart';

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title\nWaitting to implement!\nExpect it!',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
