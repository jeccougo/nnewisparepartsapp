import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../buttomnav/buttomnavbar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () => Get.off(() => MainScreen(),

        duration: Duration(milliseconds: 500),
        transition: Transition.downToUp));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/icons/nlo.png', width: 150, height: 150),
              SizedBox(
                height: 5,
              ),
              // const Text('Welcome to Ime Afia!',
              // style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,
              // color: Colors.white),),
             // CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}


