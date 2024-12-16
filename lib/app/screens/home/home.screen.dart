import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/generated/assets.gen.dart';
import 'package:smellsense/app/shared/logger.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({
    super.key,
  });

  @override
  HomeScreenWidgetState createState() => HomeScreenWidgetState();
}

class HomeScreenWidgetState extends State<HomeScreenWidget> {
  late final Infrastructure infrastructure;
  final List<TrainingScent> scents = [];

  @override
  void initState() {
    super.initState();
    infrastructure = context.read<Infrastructure>();
  }

  @override
  Widget build(BuildContext context) {
    Log.debug('Building HomeScreenWidget');
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.canvasColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.branding.logo.image(
            width: 100,
            height: 100,
          ),
          Text(
            'SmellSense',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            'Smell Training',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          FloatingActionButton(
            onPressed: () => context.go('/training'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'screens.home.train_menu_button'.tr(),
              style: textTheme.labelMedium,
            ),
          ),
          FloatingActionButton(
            onPressed: () => context.go('/training-progress'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'screens.home.training_history_menu_button'.tr(),
              style: textTheme.labelMedium,
            ),
          ),
          FloatingActionButton(
            onPressed: () => context.go('/about'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "screens.home.about_menu_button".tr(),
              style: textTheme.labelMedium,
            ),
          ),
          FloatingActionButton(
            onPressed: () => context.go('/help'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "screens.home.help_menu_button".tr(),
              style: textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
