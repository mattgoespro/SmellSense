import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/shared/router/router_scaffold.widget.dart';
import 'package:smellsense/app/shared/router/router_transition.page.dart';
import 'package:smellsense/app/screens/help/help.screen.dart';
import 'package:smellsense/app/screens/scent_selection/scent_selection.screen.dart';
import 'package:smellsense/app/screens/splash/splash.screen.dart';
import 'package:smellsense/app/screens/training_session/training_session.screen.dart';
import 'package:smellsense/app/screens/training_session_history/training_session_history.screen.dart';
import 'package:smellsense/app/shared/theme/theme.dart';
import 'package:smellsense/app/shared/utils/logger.dart';

MaterialApp getApp(BuildContext context) {
  MaterialTheme theme = MaterialTheme.of(context);

  return MaterialApp.router(
    title: 'SmellSense',
    routerConfig: routerConfig,
    supportedLocales: context.supportedLocales,
    locale: context.locale,
    theme: theme.themeData,
    localizationsDelegates: context.localizationDelegates,
    builder: (context, child) => Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: theme.colorScheme.surface,
        child: child,
      ),
      // bottomNavigationBar: NavigationBar(
      //   destinations: [
      //     NavigationDestination(
      //         icon: Assets.images.reactions.happy.image(), label: 'training'),
      //     NavigationDestination(
      //         icon: Assets.images.reactions.happy.image(), label: 'history'),
      //     NavigationDestination(
      //         icon: Assets.images.reactions.happy.image(), label: 'help'),
      //     NavigationDestination(
      //         icon: Assets.images.reactions.happy.image(), label: 'about'),
      //   ],
      // ),
    ),
  );
}

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final routes = [
  GoRoute(
    path: '/splash-screen',
    name: 'splash-screen',
    builder: (context, state) {
      if (kDebugMode) {
        Output.trace(
            'Navigated to route: (name="splash-screen", path="/splash-screen")');
      }

      return const SplashScreenWidget();
    },
  ),
  GoRoute(
    name: 'select-scents',
    path: '/select-scents',
    builder: (context, state) {
      if (kDebugMode) {
        Output.trace(
            'Navigated to route: (name="select-scents", path="/select-scents")');
      }

      return const ScentSelectionScreenWidget();
    },
  ),
  GoRoute(
    name: "train",
    path: "/train",
    builder: (context, state) {
      if (kDebugMode) {
        Output.trace('Navigated to route: (name="train", path="/train")');
      }

      return const TrainingSessionScreenWidget();
    },
  ),
  GoRoute(
    name: "help",
    path: "/help",
    builder: (context, state) {
      if (kDebugMode) {
        Output.trace('Navigated to route: (name="help", path="/help")');
      }

      return const HelpScreenWidget();
    },
  ),
  GoRoute(
    name: "training-session-history",
    path: "/training-session-history",
    builder: (context, state) {
      if (kDebugMode) {
        Output.trace(
            'Navigated to route: (name="training-session-history", path="/training-session-history")');
      }

      return const TrainingSessionHistoryScreenWidget();
    },
  ),
];

final routerConfig = GoRouter(
  initialLocation: !kDebugMode ? '/splash-screen' : '/select-scents',
  navigatorKey: _parentKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellKey,
      parentNavigatorKey: _parentKey,
      pageBuilder: (context, state, child) {
        return PageTransition(
          page: ScaffoldWithNavBar(
            location: "",
            child: child,
          ),
        );
      },
      routes: routes,
    )
  ],
  onException: (context, state, router) => MaterialPage(
    child: Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
        centerTitle: true,
      ),
    ),
  ),
);
