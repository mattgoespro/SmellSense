import 'package:flutter/material.dart';

class WidgetThemeData {
  static TextButtonThemeData getTextButtonTheme(
      ColorScheme colorScheme, TextTheme textTheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: textTheme.displaySmall,
      ),
    );
  }

  static OutlinedButtonThemeData getOutlinedButtonTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: colorScheme.onSurface
                  .withOpacity(0.4), // Grey color when disabled
              width: 1,
            );
          }
          return BorderSide(
            color: colorScheme.primary,
            width: 1,
          );
        }),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
          (Set<WidgetState> states) {
            var borderWidth = 1.0;
            var borderRadius = BorderRadius.circular(4);

            if (states.contains(WidgetState.disabled)) {
              return RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: BorderSide(
                  color: colorScheme.outlineVariant,
                  width: borderWidth,
                ),
              );
            }

            return RoundedRectangleBorder(
              borderRadius: borderRadius,
              side: BorderSide(
                color: colorScheme.outlineVariant,
                width: borderWidth,
              ),
            );
          },
        ),
      ),
    );
  }

  static CheckboxThemeData getCheckboxThemeData(ColorScheme colorScheme) =>
      CheckboxThemeData(
        checkColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            var isDisabled = states.contains(WidgetState.disabled);
            var isChecked = states.contains(WidgetState.selected);

            if (isDisabled) {
              return isChecked
                  ? colorScheme.primaryContainer.withOpacity(0.8)
                  : colorScheme.surfaceContainer;
            }

            if (isChecked) {
              return colorScheme.primaryContainer;
            }

            return colorScheme.surfaceContainer;
          },
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) => Colors.grey.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide(
          color: colorScheme.primary,
          width: 1,
        ),
      );

  static SnackBarThemeData getSnackBarThemeData(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) =>
      SnackBarThemeData(
        backgroundColor: colorScheme.secondaryContainer,
        contentTextStyle: textTheme.displaySmall,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        behavior: SnackBarBehavior.floating,
        actionTextColor: colorScheme.onSecondaryContainer,
        dismissDirection: DismissDirection.none,
      );

  static ListTileThemeData getListTileThemeData(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return ListTileThemeData(
      tileColor: colorScheme.surfaceContainer,
      iconColor: colorScheme.onSurface,
      textColor: colorScheme.onSurface,
      selectedColor: colorScheme.onPrimary,
      horizontalTitleGap: 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      style: ListTileStyle.list,
    );
  }
}
