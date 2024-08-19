import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/screens/scent_selection/scent_selection_checkbox_group.widget.dart';
import 'package:smellsense/app/shared/logger.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

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

  bool isSelectionComplete() =>
      selectedScents.length ==
      ScentSelectionCheckboxGroupWidget.maxSelectionCount;

  Future<void> storeScentSelections() async {
    var infrastructure = Infrastructure.of(context);

    try {
      await infrastructure.databaseService.trainingPeriodService
          .createTrainingPeriod(
              DateTime.now(),
              selectedScents.map(
                (scent) {
                  return TrainingScent(name: scent);
                },
              ).toList());

      Log.trace('Training period created');
    } catch (e) {
      throw Exception('Error creating training period: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = MaterialTheme.of(context);
    var textTheme = theme.textTheme;

    return Scaffold(
      body: Center(
        widthFactor: MediaQuery.of(context).size.width,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  'Select four of your desired training scents',
                  style: textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                flex: 3,
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
              Align(
                alignment: Alignment.bottomRight,
                child: OutlinedButton(
                  onPressed: isSelectionComplete()
                      ? () {
                          storeScentSelections();
                          context.goNamed('home');
                        }
                      : null,
                  child: const Text('NEXT'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
