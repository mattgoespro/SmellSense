import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smellsense/app/screens/training_session/training_session_entry/training_session_entry.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_parosmia_reaction.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_rating.module.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

class RatingBarWidget extends StatefulWidget {
  static const Duration timerDuration = Duration(seconds: 15);

  const RatingBarWidget({
    super.key,
  });

  @override
  RatingBarWidgetState createState() => RatingBarWidgetState();
}

class RatingBarWidgetState extends State<RatingBarWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool busy = false;
  String? currentEncouragement;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var theme = MaterialTheme.of(context);

    return RatingBar.builder(
      direction: Axis.vertical,
      itemCount: TrainingSessionEntryRating.values.length,
      minRating: 1,
      itemBuilder: (context, rating) {
        var option = TrainingSessionEntryRating.fromValue(rating.toInt());

        return Text(
          "screens.training_session.training_session_entry.rating_bar.option.${option.rating}",
          style: theme.textTheme.bodyMedium,
        );
      },
      onRatingUpdate: (rating) {
        var entryWidget = TrainingSessionEntryWidget.of(context);

        return entryWidget.updateEntry(
          (entry) {
            entry.update(
              rating: TrainingSessionEntryRating.fromValue(rating.toInt()),
              parosmiaReaction: TrainingSessionEntryParosmiaReaction.none,
              parosmiaReactionSeverity:
                  TrainingSessionEntryParosmiaSeverity.none,
            );
          },
        );
      },
      glow: true,
      glowColor: Theme.of(context).primaryColor,
      unratedColor: Theme.of(context).primaryColor.withAlpha(50),
    );
  }
}
