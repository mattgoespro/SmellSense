import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/static/supported_training_scent.dart';

class ScentSelectionCheckboxGroupWidget extends StatefulWidget {
  static const maxSelectionCount = 4;

  final void Function(List<TrainingScentName>) onSelectionChange;

  const ScentSelectionCheckboxGroupWidget({
    super.key,
    required this.onSelectionChange,
  });

  @override
  ScentSelectionCheckboxGroupWidgetState createState() =>
      ScentSelectionCheckboxGroupWidgetState();
}

class ScentSelectionCheckboxGroupWidgetState
    extends State<ScentSelectionCheckboxGroupWidget> {
  late final Map<TrainingScentName, bool> selectedScents;
  late final List<SupportedTrainingScent> supportedTrainingScents;

  @override
  void initState() {
    super.initState();
    Infrastructure infrastructure = context.read<Infrastructure>();

    supportedTrainingScents = infrastructure.supportedTrainingScentProvider
        .listSupportedTrainingScents();

    selectedScents =
        TrainingScentName.values.fold<Map<TrainingScentName, bool>>(
      {},
      (acc, scentName) => acc..[scentName] = false,
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return ListView(
      itemExtent: 48,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.antiAlias,
      children: [
        for (var scent in supportedTrainingScents)
          CheckboxListTile(
            dense: true,
            checkboxShape: theme.checkboxTheme.shape,
            title: Text(
              scent.displayName,
              style: textTheme.bodyMedium!.copyWith(
                color: scent.displayColor,
                fontWeight: FontWeight.w500,
              ),
            ).tr(),
            onChanged: (value) {
              setState(
                () {
                  var isChecked = value ?? false;
                  var scentSelections = selectedScents.keys
                      .where((key) => selectedScents[key]!)
                      .toList();
                  TrainingScentName scentName =
                      TrainingScentName.fromString(scent.name);

                  if (!isChecked) {
                    setState(() {
                      selectedScents[scentName] = isChecked;
                      scentSelections.remove(scentName);
                      widget.onSelectionChange(scentSelections);
                    });

                    return;
                  }

                  ///
                  /// Prevent the checkbox from being selected, and show a snackbar
                  /// to the user
                  ///
                  if (scentSelections.length ==
                      ScentSelectionCheckboxGroupWidget.maxSelectionCount) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Text(
                          'screens.scent_selection.scent_selection_checkbox_group.selection_limit_reached_snackbar_message'
                              .tr(
                            args: [
                              ScentSelectionCheckboxGroupWidget
                                  .maxSelectionCount
                                  .toString()
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: textTheme.labelSmall!.copyWith(
                            color: theme.colorScheme.onError,
                          ),
                        ),
                      ),
                    );
                    return;
                  }

                  setState(() {
                    selectedScents[scentName] = isChecked;
                    widget.onSelectionChange(
                      [...scentSelections, scentName],
                    );
                  });
                },
              );
            },
            value: selectedScents[TrainingScentName.fromString(scent.name)],
            controlAffinity: ListTileControlAffinity.leading,
          ),
      ],
    );
  }
}
