import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/router_transition.dart';
import 'package:smellsense/app/screens/help/help.screen.dart';
import 'package:smellsense/app/screens/home/home.screen.dart';
import 'package:smellsense/app/screens/scent_selection/scent_selection.screen.dart';
import 'package:smellsense/app/screens/splash/splash.screen.dart';
import 'package:smellsense/app/screens/training_session/training_session.screen.dart';
import 'package:smellsense/app/screens/training_session_history/training_session_history.screen.dart';
import 'package:smellsense/app/shared/logger.dart';

final router = MaterialApp.router(
  routerConfig: routerConfig,
  title: 'SmellSense',
  backButtonDispatcher: RootBackButtonDispatcher(),
);

final routerConfig = GoRouter(
  initialLocation: !kDebugMode ? '/splash-screen' : '/scent-selection',
  routes: [
    GoRoute(
      path: '/splash-screen',
      name: 'splash-screen',
      pageBuilder: (context, state) {
        if (kDebugMode) {
          Log.trace(
              'Navigated to route: (name="splash-screen", path="/splash-screen")');
        }

        return const MaterialPage(
          child: SplashScreenWidget(),
        );
      },
    ),
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) {
        if (kDebugMode) {
          Log.trace('Navigated to route: (name="home", path="/")');
        }

        return CustomTransitionPage(
          maintainState: true,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: const HomeScreenWidget(),
        );
      },
    ),
    GoRoute(
      name: 'select-scents',
      path: '/select-scents',
      pageBuilder: (context, state) {
        if (kDebugMode) {
          Log.trace(
              'Navigated to route: (name="select-scents", path="/select-scents")');
        }

        return PageTransition(
          page: const ScentSelectionScreenWidget(),
        );
      },
    ),
    GoRoute(
      name: "train",
      path: "/train",
      pageBuilder: (context, state) {
        if (kDebugMode) {
          Log.trace('Navigated to route: (name="train", path="/train")');
        }

        return PageTransition(
          page: const TrainingSessionScreenWidget(),
        );
      },
    ),
    GoRoute(
      name: "help",
      path: "/help",
      pageBuilder: (context, state) {
        if (kDebugMode) {
          Log.trace('Navigated to route: (name="help", path="/help")');
        }

        return PageTransition(
          page: const HelpScreenWidget(),
        );
      },
    ),
    GoRoute(
      name: "training-session-history",
      path: "/training-session-history",
      pageBuilder: (context, state) {
        if (kDebugMode) {
          Log.trace(
              'Navigated to route: (name="training-session-history", path="/training-session-history")');
        }

        return PageTransition(
          page: const TrainingSessionHistoryScreenWidget(),
        );
      },
    ),
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
