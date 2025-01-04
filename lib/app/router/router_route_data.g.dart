// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_route_data.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $baseShellRouteData,
    ];

RouteBase get $baseShellRouteData => ShellRouteData.$route(
      factory: $BaseShellRouteDataExtension._fromState,
      routes: [
        ShellRouteData.$route(
          factory: $SimpleShellPageRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: '/splash',
              name: 'splash',
              factory: $SplashRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/scent-selection',
              name: 'scent-selection',
              factory: $ScentSelectionRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/training-session',
              name: 'training-session',
              factory: $TrainingSessionRouteDataExtension._fromState,
            ),
          ],
        ),
        ShellRouteData.$route(
          factory: $NavBarShellPageRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: '/training-session-history',
              factory: $TrainingSessionHistoryRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/help',
              factory: $HelpRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/about',
              factory: $AboutRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $BaseShellRouteDataExtension on BaseShellRouteData {
  static BaseShellRouteData _fromState(GoRouterState state) =>
      BaseShellRouteData();
}

extension $SimpleShellPageRouteDataExtension on SimpleShellPageRouteData {
  static SimpleShellPageRouteData _fromState(GoRouterState state) =>
      const SimpleShellPageRouteData();
}

extension $SplashRouteDataExtension on SplashRouteData {
  static SplashRouteData _fromState(GoRouterState state) => SplashRouteData();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ScentSelectionRouteDataExtension on ScentSelectionRouteData {
  static ScentSelectionRouteData _fromState(GoRouterState state) =>
      ScentSelectionRouteData();

  String get location => GoRouteData.$location(
        '/scent-selection',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TrainingSessionRouteDataExtension on TrainingSessionRouteData {
  static TrainingSessionRouteData _fromState(GoRouterState state) =>
      TrainingSessionRouteData();

  String get location => GoRouteData.$location(
        '/training-session',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NavBarShellPageRouteDataExtension on NavBarShellPageRouteData {
  static NavBarShellPageRouteData _fromState(GoRouterState state) =>
      const NavBarShellPageRouteData();
}

extension $TrainingSessionHistoryRouteDataExtension
    on TrainingSessionHistoryRouteData {
  static TrainingSessionHistoryRouteData _fromState(GoRouterState state) =>
      TrainingSessionHistoryRouteData();

  String get location => GoRouteData.$location(
        '/training-session-history',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HelpRouteDataExtension on HelpRouteData {
  static HelpRouteData _fromState(GoRouterState state) => HelpRouteData();

  String get location => GoRouteData.$location(
        '/help',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AboutRouteDataExtension on AboutRouteData {
  static AboutRouteData _fromState(GoRouterState state) => AboutRouteData();

  String get location => GoRouteData.$location(
        '/about',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
