import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/router.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialTheme theme = MaterialTheme.of(context);

    return MultiProvider(
      providers: [
        FutureProvider<Infrastructure?>(
          create: (context) => Infrastructure.getInfrastructure(),
          initialData: null,
          builder: (context, child) {
            if (context.watch<Infrastructure?>() == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return MaterialApp.router(
              scrollBehavior: const MaterialScrollBehavior(),
              routerConfig: routerConfig,
              theme: theme.themeData,
              builder: (context, child) {
                return MultiProvider(
                  providers: [
                    Provider<Infrastructure?>.value(
                      value: context.watch<Infrastructure?>(),
                    ),
                  ],
                  child: child,
                );
              },
            );
          },
        )
      ],
    );
  }
}
