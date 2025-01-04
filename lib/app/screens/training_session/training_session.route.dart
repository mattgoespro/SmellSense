import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/router/router_transition.page.dart';
import 'package:smellsense/app/screens/training_session/training_session.screen.dart';

class TrainingSessionRouteData extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return PageTransition(
      page: const TrainingSessionScreenWidget(),
    );
  }
}
