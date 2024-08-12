import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/screens/training_session/training_session_entry/rating_form/rating_bar.widget.dart';
import 'package:smellsense/app/screens/training_session/training_session_entry/rating_form/timer.widget.dart';
import 'package:smellsense/app/screens/training_session/training_session_entry/training_session_entry.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent_display.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';

class RatingFormWidget extends StatefulWidget {
  static const Duration timerDuration = Duration(seconds: 15);
  final TrainingScent scent;

  const RatingFormWidget({super.key, required this.scent});

  @override
  RatingFormWidgetState createState() => RatingFormWidgetState();

  static TrainingSessionEntryWidgetState of(BuildContext context) =>
      context.findAncestorStateOfType<TrainingSessionEntryWidgetState>()!;
}

class RatingFormWidgetState extends State<RatingFormWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final Map<TrainingScentName, TrainingSessionEntry> _entries = {};

  String? currentEncouragement;

  @override
  bool get wantKeepAlive => true;

  void updateEntry(TrainingSessionEntry entry) {
    _entries[widget.scent.name] = entry;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var infrastructure = context.read<Infrastructure>();

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Image(
              image: infrastructure.getAssetProvider().getImage(
                    TrainingScentDisplay.getScent(widget.scent.name)
                        .displayImage,
                  ),
            ),
            TimerWidget(
              timerDuration: RatingFormWidget.timerDuration,
              onStart: () {
                setState(() {
                  currentEncouragement =
                      TrainingSessionEncouragements.getNextEncouragement();
                });
              },
              replaceDoneTimerWidget: RatingBarWidget(
                scent: widget.scent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
