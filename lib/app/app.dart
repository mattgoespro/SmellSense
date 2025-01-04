import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/router/router.dart';
import 'package:smellsense/app/shared/widgets/loader.widget.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      path: 'assets/i18n',
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: const JsonAssetLoader(),
      child: FutureProvider<Infrastructure>(
        create: (context) => Infrastructure.getInfrastructure(),
        initialData: Infrastructure.empty(),
        builder: (context, child) {
          if (context.watch<Infrastructure?>() == null) {
            return const Center(
              child: LoaderWidget(),
            );
          }

          return MaterialApp.router(
            routerConfig: router,
            theme: MaterialTheme.of(context).themeData,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
      errorWidget: (error) {
        if (error == null) {
          return ErrorWidget(
            Exception('An unknown error occurred. Please try again.'),
          );
        }

        return ErrorWidget.withDetails(
          message: error.message,
          error: error,
        );
      },
    );
  }
}
