import 'package:flutter/material.dart';

extension ColorUtils on Color {
  Color darkenPercent(int value) {
    assert(1 <= value && value <= 100);
    return Color.fromRGBO(
      (r * (100 - value) / 100).round(),
      (g * (100 - value) / 100).round(),
      (b * (100 - value) / 100).round(),
      a,
    );
  }

  Color lightenPercent(int value) {
    assert(1 <= value && value <= 100);
    return Color.fromRGBO(
      r.toInt() + (255 - r) * value ~/ 100,
      g.toInt() + (255 - g) * value ~/ 100,
      b.toInt() + (255 - b) * value ~/ 100,
      a,
    );
  }
}
