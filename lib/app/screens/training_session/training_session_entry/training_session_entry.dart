import 'package:flutter/material.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/screens/training_session/training_session_entry/training_session_entry_rating_bar.widget.dart';
import 'package:smellsense/app/screens/training_session/training_session_entry/training_session_entry_timer.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';

class TrainingSessionEntryWidget extends StatefulWidget {
  static const Duration timerDuration = Duration(seconds: 15);

  final TrainingScent scent;

  const TrainingSessionEntryWidget({
    super.key,
    required this.scent,
  });

  @override
  TrainingSessionEntryWidgetState createState() =>
      TrainingSessionEntryWidgetState();

  static TrainingSessionEntryWidgetState of(BuildContext context) =>
      context.findAncestorStateOfType<TrainingSessionEntryWidgetState>()!;
}

class TrainingSessionEntryWidgetState extends State<TrainingSessionEntryWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final Map<TrainingScentName, TrainingSessionEntry> _entries = {};

  bool busy = false;
  String? currentEncouragement;

  @override
  bool get wantKeepAlive => true;

  void updateEntry(void Function(TrainingSessionEntry) updateFn) {
    updateFn(_entries[widget.scent.name]!);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Center(
              child: Infrastructure.of(context)
                  .supportedTrainingScentProvider
                  .findSupportedTrainingScentByName(widget.scent.name.scentName)
                  .displayImage,
            ),
            Center(
              child: TimerWidget(
                duration: RatingBarWidget.timerDuration,
                onStart: () {
                  setState(
                    () {
                      currentEncouragement =
                          TrainingSessionEncouragements.getNextEncouragement();
                    },
                  );
                },
                replaceDoneTimerWidget: RatingBarWidget(
                  scent: widget.scent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
