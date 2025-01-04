import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/router/router_transition.page.dart';
import 'package:smellsense/app/screens/scent_selection/scent_selection.screen.dart';

class ScentSelectionRouteData extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return PageTransition(
      page: const ScentSelectionScreenWidget(),
    );
  }
}
