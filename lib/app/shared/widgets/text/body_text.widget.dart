import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

class BodyTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;

  const BodyTextWidget(
    this.text, {
    super.key,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MaterialTheme.of(context).textTheme.bodyMedium!.merge(style),
    );
  }
}
