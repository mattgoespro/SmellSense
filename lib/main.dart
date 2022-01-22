import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/providers/scent.provider.dart';
import 'package:smellsense/router.dart';
import 'package:smellsense/shared/ad_state.dart';
import 'package:smellsense/storage/storage.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<SmellSenseStorage>(SmellSenseStorage());
  getIt.registerSingleton<ScentProvider>(ScentProvider());
  await getIt.get<SmellSenseStorage>().initStorage();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);

  await setup();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => const SmellSenseApp(),
    ),
  );
}

class SmellSenseApp extends StatelessWidget {
  const SmellSenseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'SmellSense',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.white,
        ),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 54,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 36,
          ),
          subtitle1: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w200,
          ),
          subtitle2: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
