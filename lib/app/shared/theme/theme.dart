///
/// Generated from Material Theme Builder
/// https://material-foundation.github.io/material-theme-builder/
///
library;

import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/theme/text_theme.dart';
import 'package:smellsense/app/shared/theme/widget_theme_data.dart';

class MaterialTheme {
  late final ThemeData themeData;
  late final TextTheme textTheme;
  late final ColorScheme colorScheme;

  final String displayFont = "Roboto";
  final String bodyFont = "Open Sans";

  MaterialTheme.of(BuildContext context) {
    colorScheme = createColorScheme();
    textTheme = createTextTheme(
      context,
      bodyFont,
      displayFont,
    );
    themeData = createTheme(colorScheme, textTheme);
  }

  ColorScheme createColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      error: Color(0xffba1a1a),
      errorContainer: Color(0xffffdad6),
      onPrimary: Color(0xffffffff),
      onPrimaryContainer: Color(0xff00121b),
      onError: Color(0xffffffff),
      onErrorContainer: Color(0xff410002),
      onPrimaryFixed: Color(0xff001e2c),
      onPrimaryFixedVariant: Color(0xff004c68),
      onSecondary: Color(0xffffffff),
      onSecondaryContainer: Color(0xff5f2f3f),
      onSecondaryFixed: Color(0xff350c1d),
      onSecondaryFixedVariant: Color(0xff6a3748),
      onSurface: Color(0xff181c1f),
      onSurfaceVariant: Color(0xff3f484e),
      onTertiary: Color(0xffffffff),
      onTertiaryContainer: Color(0xff364a62),
      onTertiaryFixed: Color(0xff051d33),
      onTertiaryFixedVariant: Color(0xff344860),
      primary: Color(0xff006689),
      primaryContainer: Color(0xff4da7d2),
      scrim: Color(0xff000000),
      secondary: Color(0xff854e5f),
      secondaryContainer: Color(0xffffc2d3),
      secondaryFixed: Color(0xffffd9e2),
      secondaryFixedDim: Color(0xfff9b3c7),
      shadow: Color(0xff000000),
      surface: Color(0xFFF0F0F0),
      surfaceBright: Color(0xfff7fafd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f7),
      surfaceContainer: Color(0xffebeef2),
      surfaceContainerHigh: Color(0xffe5e8ec),
      surfaceContainerHighest: Color(0xffe0e3e6),
      surfaceDim: Color(0xffd7dade),
      surfaceTint: Color(0xff006689),
      tertiary: Color(0xff4c6079),
      tertiaryContainer: Color(0xffd4e5ff),
      tertiaryFixed: Color(0xffd1e4ff),
      tertiaryFixedDim: Color(0xffb3c8e5),
      outline: Color(0xff6f787f),
      outlineVariant: Color(0xffbec8cf),
      primaryFixed: Color(0xffc3e8ff),
      primaryFixedDim: Color(0xff7ad1fe),
    );
  }

  ThemeData createTheme(ColorScheme colorScheme, TextTheme textTheme) {
    return ThemeData(
      brightness: colorScheme.brightness,
      canvasColor: colorScheme.surface,
      cardColor: colorScheme.surfaceContainer,
      checkboxTheme: WidgetThemeData.getCheckboxThemeData(colorScheme),
      listTileTheme: WidgetThemeData.getListTileThemeData(
        colorScheme,
        textTheme,
      ),
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      snackBarTheme: WidgetThemeData.getSnackBarThemeData(
        colorScheme,
        textTheme,
      ),
      splashColor: colorScheme.primary,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      textButtonTheme: WidgetThemeData.getTextButtonTheme(
        colorScheme,
        textTheme,
      ),
      outlinedButtonTheme: WidgetThemeData.getOutlinedButtonTheme(
        colorScheme,
        textTheme,
      ),
      useMaterial3: true,
    );
  }
}
