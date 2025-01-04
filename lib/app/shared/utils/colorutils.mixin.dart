import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension ColorUtils on Color {
  Color darkenPercent(int value) {
    assert(1 <= value && value <= 100);

    darkenChannel(double channel) =>
        clampDouble(channel * (100 - value), 1, 255).round();

    return Color.fromRGBO(
      darkenChannel(r),
      darkenChannel(g),
      darkenChannel(b),
      a,
    );
  }

  Color lightenPercent(int value) {
    assert(1 <= value && value <= 100);

    lightenChannel(double channel) =>
        clampDouble(channel * (1 + (value / 100)) * 255, 1, 255).round();

    return Color.fromRGBO(
      lightenChannel(r),
      lightenChannel(g),
      lightenChannel(b),
      a,
    );
  }
}
