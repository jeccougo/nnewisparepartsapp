import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Standard UI text sizes
const double kTextSizeSmall = 12.0;
const double kTextSizeMedium = 16.0;
const double kTextSizeLarge = 20.0;

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 926 is the layout height that designer use
  return (inputHeight / 926.0) * screenHeight;
}

// Get the proportionate width as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 428 is the layout width that designer use
  return (inputWidth / 428.0) * screenWidth;
}

// Get the proportionate text size as per screen size
double getProportionateTextSize(double inputTextSize) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputTextSize / 375.0) * screenWidth;
}
