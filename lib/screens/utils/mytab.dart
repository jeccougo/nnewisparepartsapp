import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String tabName;
  const MyTab({Key? key, required this.tabName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 40,
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12)
        ),
        child: Text(tabName,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,

        ),),
      ),
    );
  }
}
