import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/router/router_route_data.dart';
import 'package:smellsense/app/pages/about/about.route.dart';
import 'package:smellsense/app/pages/help/help.route.dart';
import 'package:smellsense/app/pages/training_session_history/training_session_history.route.dart';

class NavBarShellPage extends StatelessWidget {
  final Widget child;

  const NavBarShellPage({
    required this.child,
    super.key,
  });

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;

    switch (location) {
      case '/training-session-history':
        return 0;
      case '/help':
        return 1;
      case '/about':
        return 2;
      default:
        throw Exception('Unknown location: $location');
    }
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = getCurrentIndex(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.question_mark_rounded),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.info),
            label: '',
          ),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          switch (index) {
            case 0:
              TrainingSessionHistoryRouteData().go(context);
            case 1:
              HelpRouteData().go(context);
            case 2:
              AboutRouteData().go(context);
          }
        },
      ),
      body: child,
    );
  }
}
