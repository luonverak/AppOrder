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
}
