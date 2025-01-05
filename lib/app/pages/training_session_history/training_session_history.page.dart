import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:easy_localization/easy_localization.dart';

class TrainingSessionHistoryPage extends StatefulWidget {
  const TrainingSessionHistoryPage({super.key});

  @override
  TrainingSessionHistoryPageState createState() =>
      TrainingSessionHistoryPageState();
}

class TrainingSessionHistoryPageState
    extends State<TrainingSessionHistoryPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    super.dispose();
  }

  ///
  /// TODO: Create bar chart series from training data
  ///
  List getTrainingRatings() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create chart from training sessions
    // var chart;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'screens.training_session_history.title'.tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                  fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                ),
              ),
            ),
          ),
          Text(
            'No training data to show.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w100,
              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            ),
          )
        ],
      ),
    );
  }
}
