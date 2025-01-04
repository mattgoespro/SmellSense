import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/router/shell_routes/navbar_shell/navbar_shell_page_route_data.dart';
import 'package:smellsense/app/router/shell_routes/simple_shell/simple_shell_page_route_data.dart';
import 'package:smellsense/app/screens/about/about.route.dart';
import 'package:smellsense/app/screens/help/help.route.dart';
import 'package:smellsense/app/screens/scent_selection/scent_selection.route.dart';
import 'package:smellsense/app/screens/splash/splash.route.dart';
import 'package:smellsense/app/screens/training_session/training_session.route.dart';
import 'package:smellsense/app/screens/training_session_history/training_session_history.route.dart';

part 'router_route_data.g.dart';

@TypedShellRoute<BaseShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedShellRoute<SimpleShellPageRouteData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SplashRouteData>(
          path: '/splash',
          name: 'splash',
        ),
        TypedGoRoute<ScentSelectionRouteData>(
          path: '/scent-selection',
          name: 'scent-selection',
        ),
        TypedGoRoute<TrainingSessionRouteData>(
          path: '/training-session',
          name: 'training-session',
        ),
      ],
    ),
    TypedShellRoute<NavBarShellPageRouteData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<TrainingSessionHistoryRouteData>(
          path: '/training-session-history',
        ),
        TypedGoRoute<HelpRouteData>(
          path: '/help',
        ),
        TypedGoRoute<AboutRouteData>(
          path: '/about',
        ),
      ],
    )
  ],
)
class BaseShellRouteData extends ShellRouteData {
  BaseShellRouteData();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return navigator;
  }
}
