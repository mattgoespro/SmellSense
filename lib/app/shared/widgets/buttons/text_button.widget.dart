import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

enum TextButtonVariant { filled, raised }

class TextButtonWidget extends StatelessWidget {
  final TextButtonVariant variant;
  final Widget child;
  final VoidCallback onPressed;

  const TextButtonWidget({
    super.key,
    required this.variant,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var theme = MaterialTheme.of(context);
    var textTheme = theme.textTheme;

    //   return TextButton(
    //     onPressed: onPressed,
    //     style: ButtonStyle(
    //       textStyle: WidgetStateProperty.resolveWith<TextStyle>(
    //         (Set<WidgetState> states) {
    //           if (states.contains(WidgetState.disabled)) {
    //             return textTheme.labelMedium!.copyWith(
    //               color: theme.colorScheme.surfaceDim,
    //             );
    //           }

    //           return textTheme.labelMedium!.copyWith(
    //             color: theme.colorScheme.primary,
    //           );
    //         },
    //       ),
    //       backgroundColor: WidgetStateProperty.resolveWith<Color>(
    //         (Set<WidgetState> states) {
    //           if (states.contains(WidgetState.disabled)) {
    //             return theme.colorScheme.surfaceDim;
    //           }

    //           return theme.colorScheme.primaryContainer;
    //         },
    //       ),
    //       shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
    //         (Set<WidgetState> states) {
    //           switch (variant) {
    //             case TextButtonVariant.filled:
    //               var color = theme.colorScheme.primaryContainer;

    //               if (states.contains(WidgetState.disabled)) {
    //                 color = theme.colorScheme.surfaceDim;
    //               } else if (states.contains(WidgetState.hovered)) {
    //                 color = theme.colorScheme.primaryContainer.withOpacity(0.8);
    //               } else if (states.contains(WidgetState.focused)) {
    //                 color = theme.colorScheme.primaryContainer.withOpacity(0.8);
    //               }

    //               return RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(4),
    //                 side: BorderSide(
    //                   color: color,
    //                   width: 1,
    //                 ),
    //               );
    //             case TextButtonVariant.raised:
    //               var color = theme.colorScheme.primaryContainer;

    //               if (states.contains(WidgetState.disabled)) {
    //                 color = theme.colorScheme.surfaceDim;
    //               } else if (states.contains(WidgetState.hovered)) {
    //                 color = theme.colorScheme.primaryContainer.withOpacity(0.8);
    //               } else if (states.contains(WidgetState.focused)) {
    //                 color = theme.colorScheme.primaryContainer.withOpacity(0.8);
    //               }

    //               return RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(4),
    //                 side: BorderSide(
    //                   color: color,
    //                   width: 1,
    //                 ),
    //               );
    //           }
    //         },
    //       ),
    //     ),
    //     child: child,
    //   );
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: theme.colorScheme.primaryContainer,
            width: 1,
          ),
        ),
        textStyle: textTheme.labelMedium,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        elevation: 0,
        shadowColor: theme.colorScheme.primaryContainer,
        minimumSize: const Size(88, 36),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          color: theme.colorScheme.primaryContainer,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
