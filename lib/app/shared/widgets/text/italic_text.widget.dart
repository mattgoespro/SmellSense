import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/widgets/text/body_text.widget.dart';

class ItalicTextWidget extends StatelessWidget {
  final String text;

  const ItalicTextWidget(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BodyTextWidget(
      text,
      style: const TextStyle(fontStyle: FontStyle.italic),
    );
  }
}
