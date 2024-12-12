import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';

class TrainingScentDisplay {
  final TrainingScentName name;
  final String displayName;
  final Color displayColor;
  final String displayImage;

  const TrainingScentDisplay({
    required this.name,
    required this.displayName,
    required this.displayColor,
    required this.displayImage,
  });

  @override
  String toString() {
    return "TrainingScentDisplay(name: $name, displayName: ${"shared.scent_name.$displayName".tr()}, displayColor: $displayColor, displayImage: $displayImage)";
  }
}
