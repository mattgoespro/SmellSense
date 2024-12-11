import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/router.dart';
import 'package:smellsense/app/shared/loader.widget.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialTheme theme = MaterialTheme.of(context);

    return FutureProvider<Infrastructure>(
      create: (context) => Infrastructure.getInfrastructure(),
      catchError: (context, error) {
        throw Exception(
            "Fatal error: failed to provide infrastructure: ${error.toString()}.");
      },
      initialData: Infrastructure.empty(),
      builder: (context, child) {
        if (context.watch<Infrastructure?>() == null) {
          return const Center(
            child: LoaderWidget(),
          );
        }

        return MaterialApp.router(
          scrollBehavior: const MaterialScrollBehavior(),
          routerConfig: routerConfig,
          theme: theme.themeData,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (context, child) {
            return MultiProvider(
              providers: [
                Provider<Infrastructure>.value(
                  value: context.watch<Infrastructure>(),
                ),
              ],
              child: Container(
                padding: const EdgeInsets.all(16),
                color: theme.colorScheme.surface,
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
