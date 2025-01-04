import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/screens/splash/splash.screen.dart';

class SplashRouteData extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SplashScreenWidget();
  }
}
