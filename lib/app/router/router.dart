import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/router/router_route_data.dart';
import 'package:smellsense/app/shared/theme/theme.dart';
import 'package:smellsense/app/shared/utils/colorutils.mixin.dart';
import 'package:smellsense/app/shared/utils/logger.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/splash',
  navigatorKey: rootNavigatorKey,
  errorPageBuilder: (context, state) {
    MaterialTheme theme = MaterialTheme.of(context);
    GoException? exception = state.error;

    if (exception == null) {
      return MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text(
              'An unknown navigation error occurred.',
              style: theme.textTheme.displayMedium,
            ),
          ),
        ),
      );
    }

    Output.error(exception);

    return MaterialPage(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'GoRouter encountered an error.',
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
              Text(
                exception.message,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.error.darkenPercent(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
