import 'package:flutter/material.dart';

extension ColorUtils on Color {
  Color darken(int percent) {
    assert(1 <= percent && percent <= 100);
    return Color.fromRGBO(
      (red * (100 - percent) / 100).round(),
      (green * (100 - percent) / 100).round(),
      (blue * (100 - percent) / 100).round(),
      opacity,
    );
  }

  Color lighten(int percent) {
    assert(1 <= percent && percent <= 100);
    return Color.fromRGBO(
      red + (255 - red) * percent ~/ 100,
      green + (255 - green) * percent ~/ 100,
      blue + (255 - blue) * percent ~/ 100,
      opacity,
    );
  }
}
