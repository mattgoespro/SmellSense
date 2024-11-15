import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smellsense/app/screens/training_session/training_session_entry/training_session_entry.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_altered_reaction.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_rating.module.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

class RatingBarWidget extends StatefulWidget {
  static const Duration timerDuration = Duration(seconds: 15);

  final TrainingScent scent;

  const RatingBarWidget({
    super.key,
    required this.scent,
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
          tr("modules.training_session.training_session_entry_rating.option.${option.rating}"),
          style: theme.textTheme.bodyMedium,
        );
      },
      onRatingUpdate: (rating) {
        var entryWidget = TrainingSessionEntryWidget.of(context);

        return entryWidget.updateEntry(
          (entry) {
            entry.rating = TrainingSessionEntryRating.fromValue(rating.toInt());
            entry.comment = ""; // TODO
            entry.parosmiaReactionSeverity =
                TrainingSessionEntryAlteredReactionSeverity.none;
            entry.parosmiaReaction = TrainingSessionEntryAlteredReaction
                .none; // TODO: Set reaction if rated parosmia
          },
        );
      },
      glow: true,
      glowColor: Theme.of(context).primaryColor,
      unratedColor: Theme.of(context).primaryColor.withOpacity(0.5),
    );
  }
}
