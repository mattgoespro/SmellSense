import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/router/shell_routes/navbar_shell/navbar_shell_page.dart';

class NavBarShellPageRouteData extends ShellRouteData {
  const NavBarShellPageRouteData();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return NavBarShellPage(
      child: navigator,
    );
  }
}
