import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/router/router_transition.page.dart';
import 'package:smellsense/app/pages/training_session_history/training_session_history.page.dart';

class TrainingSessionHistoryRouteData extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return PageTransition(
      page: const TrainingSessionHistoryPage(),
    );
  }
}
