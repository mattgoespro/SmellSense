import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/screens/scent_selection/scent_selection_checkbox_group.widget.dart';
import 'package:smellsense/app/shared/dateutils.dart';
import 'package:smellsense/app/shared/logger.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/theme/theme.dart';
import 'package:smellsense/app/shared/utils.dart';

class ScentSelectionScreenWidget extends StatefulWidget {
  static int maxSelectionCount = 4;

  const ScentSelectionScreenWidget({super.key});

  @override
  ScentSelectionScreenWidgetState createState() =>
      ScentSelectionScreenWidgetState();
}

class ScentSelectionScreenWidgetState
    extends State<ScentSelectionScreenWidget> {
  List<TrainingScentName> selectedScents = [];
  ValueNotifier<bool> isSubmitting = ValueNotifier(false);

  bool isSelectionComplete() =>
      selectedScents.length ==
      ScentSelectionCheckboxGroupWidget.maxSelectionCount;

  Future<void> storeScentSelections() async {
    var infrastructure = Infrastructure.of(context);

    try {
      await infrastructure.databaseService.createTrainingPeriod(
        DateTimeUtils.date(),
        selectedScents
            .map(
              (scent) => TrainingScent(
                id: uuid(),
                name: scent,
              ),
            )
            .toList(),
      );

      Log.trace('Training period created');
    } catch (e) {
      throw Exception('Error creating training period: $e');
    }
  }

  void Function()? get onNextButtonPressed => isSelectionComplete()
      ? () async {
          isSubmitting.value = true;
          try {
            await storeScentSelections();
            if (context.mounted) {
              setState(() {
                isSubmitting.value = false;
                context.go('/');
              });
            }
          } catch (e) {
            Log.error('Error storing scent selections: $e');
          } finally {
            isSubmitting.value = false;
          }
        }
      : null;

  @override
  Widget build(BuildContext context) {
    var theme = MaterialTheme.of(context);
    var textTheme = theme.textTheme;

    return Scaffold(
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                'screens.scent_selection.select_scents_headline'.tr(),
                style: textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ScentSelectionCheckboxGroupWidget(
                  onSelectionChange: (List<TrainingScentName> scents) {
                    setState(
                      () {
                        selectedScents = scents;
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: OutlinedButton(
                onPressed: onNextButtonPressed,
                child: Text(
                  'shared.next_button_text'.tr(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
