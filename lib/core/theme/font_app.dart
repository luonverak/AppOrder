import 'package:flutter/material.dart';

class FontApp {
  static smallText12(var text) {
    return Text(text, style: const TextStyle(fontSize: 12));
  }

  static smallText14(var text) {
    return Text(text, style: const TextStyle(fontSize: 14));
  }

  static smallText16(var text, {var color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: color,
      ),
    );
  }

  static smallText18(var text, {var color = Colors.black, int maxLines = 1}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }

  static smallText20(var text, {var color = Colors.black, int maxLines = 1}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
