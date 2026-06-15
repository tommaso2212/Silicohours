import 'package:flutter/material.dart';

class ColorHelper {
  static Color? fromHex(String? hex) {
    if (hex == null || hex.length != 6) return null;
    final bits = int.tryParse(hex, radix: 16);
    if (bits == null) return null;
    return Color(bits).withAlpha(255);
  }

  static String? toHex(Color? color) {
    return color?.toARGB32().toRadixString(16).padLeft(8, '0').substring(2);
  }
}
