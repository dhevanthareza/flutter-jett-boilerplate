import 'package:flutter/material.dart';

class AppText {
  static TextStyle H1({Color color = Colors.black}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: color
    );
  }
  static TextStyle titleSmallBold({Color color = Colors.black}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 9,
      color: color
    );
  }
  static TextStyle titleSmall({Color color = Colors.black}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 9,
      color: color
    );
  }
  static TextStyle titleBig({Color color = Colors.black}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: color
    );
  }
  static TextStyle standardBold({Color color = Colors.black}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13,
      color: color
    );
  }
  static TextStyle p5({Color color = Colors.black}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 6,
      color: color
    );
  }
  static TextStyle p4({Color color = Colors.black}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 7,
      color: color
    );
  }
  static TextStyle buttonHeder({Color color = Colors.black}) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: color
    );
  }
}