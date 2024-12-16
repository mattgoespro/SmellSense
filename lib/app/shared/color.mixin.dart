import 'package:flutter/material.dart';

extension ColorUtils on Color {
  Color darken(int percent) {
    assert(1 <= percent && percent <= 100);
    return Color.fromRGBO(
      (r * (100 - percent) / 100).round(),
      (g * (100 - percent) / 100).round(),
      (b * (100 - percent) / 100).round(),
      a,
    );
  }

  Color lighten(int percent) {
    assert(1 <= percent && percent <= 100);
    return Color.fromRGBO(
      r.toInt() + (255 - r) * percent ~/ 100,
      g.toInt() + (255 - g) * percent ~/ 100,
      b.toInt() + (255 - b) * percent ~/ 100,
      a,
    );
  }
}
