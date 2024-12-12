import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/theme/theme.dart';
import 'package:smellsense/app/shared/color.mixin.dart';

class LoaderWidget extends StatefulWidget {
  const LoaderWidget({super.key});

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _colorAnimationController;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    MaterialTheme theme = MaterialTheme.of(context);

    _colorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
    _animation = ColorTween(
      begin: theme.colorScheme.primary,
      end: theme.colorScheme.primary.darken(50),
    ).animate(
      CurvedAnimation(
        parent: _colorAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _colorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: _animation,
      ),
    );
  }
}
