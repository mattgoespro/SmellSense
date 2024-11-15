import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/widgets/text/body_text.widget.dart';

class BoldTextWidget extends StatelessWidget {
  final String text;

  const BoldTextWidget(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BodyTextWidget(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
