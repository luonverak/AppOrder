import 'package:flutter/material.dart';

class ScreenSpace {
  static spaceAround({double top = 0.0, double buttom = 0.0}) {
    return EdgeInsets.only(
      right: 18,
      left: 18,
      top: top,
      bottom: buttom,
    );
  }

  static spaceContent(
      {double right = 10,
      double left = 10,
      double top = 8,
      double buttom = 8}) {
    return EdgeInsets.only(
      right: right,
      left: left,
      top: top,
      bottom: buttom,
    );
  }

  static spaceLeftRigth(
      {double right = 10,
      double left = 10,
      double top = 5,
      double buttom = 5}) {
    return EdgeInsets.only(
      right: right,
      left: left,
      top: top,
      bottom: buttom,
    );
  }
}
