import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smellsense/app/assets/generated/assets.gen.dart';
import 'package:smellsense/app/pages/training_session/training_session_entry/comment_form/comment_form.widget.dart';
import 'package:smellsense/app/pages/training_session/training_session_entry/rating_bar/rating_bar.widget.dart';
import 'package:smellsense/app/pages/training_session/training_session_entry/timer/timer.widget.dart';
import 'package:smellsense/app/pages/training_session/training_session_entry/timer/timer_encouragements.module.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/utils/utils.dart';

class TrainingSessionEntryWidget extends StatefulWidget {
  static const Duration timerDuration = Duration(seconds: 15);
  final TrainingScent scent;

  const TrainingSessionEntryWidget({super.key, required this.scent});

  @override
  TrainingSessionEntryWidgetState createState() =>
      TrainingSessionEntryWidgetState();

  static TrainingSessionEntryWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<TrainingSessionEntryWidgetState>()!;
  }
}

class TrainingSessionEntryWidgetState extends State<TrainingSessionEntryWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final Map<TrainingScentName, TrainingSessionEntry> _entries = {};

  String? currentEncouragement;

  @override
  bool get wantKeepAlive => true;

  void updateEntry(void Function(TrainingSessionEntry) updateEntry) {
    updateEntry(_entries[widget.scent.name]!);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Assets.images.scents.values
                .elementAt(widget.scent.name.index)
                .image(),
            TimerWidget(
              duration: TrainingSessionEntryWidget.timerDuration,
              onStart: () {
                setState(() {
                  currentEncouragement =
                      TimerEncouragements.getNextEncouragement();
                });
              },
              replaceDoneTimerWidget: Column(
                children: [
                  Text(
                    'screens.training_session.training_session_entry.rating_title'
                        .tr(),
                  ),
                  const RatingBarWidget(),
                  const CommentFormWidget(
                    mode: WidgetFormMode.fill,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
