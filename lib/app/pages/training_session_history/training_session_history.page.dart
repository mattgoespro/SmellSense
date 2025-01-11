import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

class TrainingSessionHistoryPage extends StatefulWidget {
  const TrainingSessionHistoryPage({super.key});

  @override
  TrainingSessionHistoryPageState createState() =>
      TrainingSessionHistoryPageState();
}

class TrainingSessionHistoryPageState
    extends State<TrainingSessionHistoryPage> {
  ///
  /// TODO: Create bar chart series from training data
  ///
  List getTrainingRatings() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create chart from training sessions

    MaterialTheme theme = MaterialTheme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'pages.training_session_history.title'.tr(),
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Text(
              'pages.training_session_history.training_session_history_chart.no_data_to_show'
                  .tr(),
              style: theme.textTheme.displaySmall,
            ),
          )
        ],
      ),
    );
  }
}
