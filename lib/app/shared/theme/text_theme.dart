import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
  BuildContext context,
  String bodyFont,
  String displayFont,
) {
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(
    bodyFont,
  );

  var displayTextStyle = GoogleFonts.getFont(displayFont);

  TextTheme fontTextTheme = GoogleFonts.getTextTheme(
    displayFont,
    bodyTextTheme,
  ).copyWith(
    headlineSmall: displayTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w100,
      color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.8),
    ),
    headlineMedium: displayTextStyle.copyWith(
      fontSize: 24,
      color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.8),
      fontWeight: FontWeight.normal,
    ),
    headlineLarge: displayTextStyle.copyWith(
      fontSize: 32,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: displayTextStyle.copyWith(
      fontSize: 16,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w100,
    ),
    titleMedium: displayTextStyle.copyWith(
      fontSize: 20,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w200,
    ),
    titleLarge: displayTextStyle.copyWith(
      fontSize: 24,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
    ),
  );

  return fontTextTheme;
}
