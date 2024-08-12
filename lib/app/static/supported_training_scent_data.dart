import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supported_training_scent_data.g.dart';

class SupportedTrainingScentData {
  List<SupportedTrainingScent>? scents;

  SupportedTrainingScentData({this.scents});

  factory SupportedTrainingScentData.fromJson(
    List<Map<String, String>> json,
  ) =>
      SupportedTrainingScentData(
        scents: json.map(_$SupportedTrainingScentFromJson).toList(),
      );
}

@JsonSerializable(createToJson: false)
class SupportedTrainingScent {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(
    name: "displayName",
  )
  final String displayName;

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
    this.displayName,
    this.displayColor,
    this.displayImage,
  );

  static Image _displayImageFromJson(String imagePath) {
    return Image.asset(imagePath);
  }

  static String _displayImageToJson(Image image) {
    return image.image.toString();
  }

  static Color _displayColorFromJson(String color) {
    return Color(int.parse(color));
  }

  static String _displayColorToJson(Color color) {
    return color.value.toRadixString(16);
  }

  factory SupportedTrainingScent.fromJson(Map<String, String> json) =>
      _$SupportedTrainingScentFromJson(json);
}

@JsonLiteral('../../../assets/static/supported_scents.json')
List<Map<String, String>> get supportedScentsData =>
    _$supportedScentsDataJsonLiteral;
