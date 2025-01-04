import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/router/shell_routes/simple_shell/simple_shell_page.dart';

class SimpleShellPageRouteData extends ShellRouteData {
  const SimpleShellPageRouteData();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return SimpleShellPage(
      child: navigator,
    );
  }
}
