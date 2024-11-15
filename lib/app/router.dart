import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/screens/help/help.screen.dart';
import 'package:smellsense/app/screens/home/home.screen.dart';
import 'package:smellsense/app/screens/scent_selection/scent_selection.screen.dart';
import 'package:smellsense/app/screens/splash/splash.screen.dart';
import 'package:smellsense/app/screens/training_session/training_session.screen.dart';
import 'package:smellsense/app/screens/training_session_history/training_session_history.screen.dart';
import 'package:smellsense/app/shared/logger.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/widgets/fade.animated_widget.dart';

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

        return const MaterialPage(
          child: FadeAnimate(
            fadeInDuration: Duration(milliseconds: 300),
            child: HomeScreenWidget(),
          ),
        );
      },
    ),
    GoRoute(
      name: 'scent-selection',
      path: '/scent-selection',
      pageBuilder: (context, state) {
        if (kDebugMode) {
          Log.trace(
              'Navigated to route: (name="scent-selection", path="/scent-selection")');
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
          child: const ScentSelectionScreenWidget(),
        );
      },
    ),
    GoRoute(
      name: "training-session",
      path: "/training-session",
      pageBuilder: (context, state) {
        if (kDebugMode) {
          Log.trace(
              'Navigated to route: (name="training-session", path="/training-session")');
        }

        List<TrainingScent> scents = []; // TODO: fetch scents from db

        return CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(animation),
            child: child,
          ),
          child: TrainingSessionScreenWidget(scents: scents),
        );
      },
    ),
    GoRoute(
      name: "help",
      path: "/help",
      builder: (context, state) {
        if (kDebugMode) {
          Log.trace('Navigated to route: (name="help", path="/help")');
        }

        return const HelpScreenWidget();
      },
    ),
    GoRoute(
      name: "training-session-history",
      path: "/training-session-history",
      builder: (context, state) {
        if (kDebugMode) {
          Log.trace(
              'Navigated to route: (name="training-session-history", path="/training-session-history")');
        }

        return const TrainingSessionHistoryScreenWidget();
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
