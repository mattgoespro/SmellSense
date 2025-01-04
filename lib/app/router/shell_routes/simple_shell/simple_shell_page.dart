import 'package:flutter/material.dart';

class SimpleShellPage extends StatelessWidget {
  final Widget child;

  const SimpleShellPage({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
