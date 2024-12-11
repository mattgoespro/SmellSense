import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supported_training_scent.g.dart';

@JsonLiteral('../../../assets/data/supported_scents.json')
List<Map<String, String>> get supportedScentsData =>
    _$supportedScentsDataJsonLiteral;

@JsonSerializable(createToJson: false)
class SupportedTrainingScent {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(
    name: "displayColor",
    fromJson: _displayColorFromJson,
    toJson: _displayColorToJson,
  )
  final Color displayColor;

  @JsonKey(
    name: 'displayImage',
    fromJson: _displayImageFromJson,
    toJson: _displayImageToJson,
  )
  final Image displayImage;

  SupportedTrainingScent(
    this.id,
    this.name,
    this.displayColor,
    this.displayImage,
  );

  static Image _displayImageFromJson(String imagePath) =>
      Image.asset(imagePath);

  static String _displayImageToJson(Image image) => image.image.toString();

  static Color _displayColorFromJson(String color) => Color(int.parse(color));

  static String _displayColorToJson(Color color) =>
      color.value.toRadixString(16);

  factory SupportedTrainingScent.fromJson(Map<String, String> json) =>
      _$SupportedTrainingScentFromJson(json);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SupportedTrainingScent && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'SupportedTrainingScent(id: $id, name: $name, displayColor: $displayColor, displayImage: $displayImage}';
}
