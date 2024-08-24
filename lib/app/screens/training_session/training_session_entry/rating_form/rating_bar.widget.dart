import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/screens/training_session/training_session_entry/training_session_entry.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_parosmia_reaction.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_rating.module.dart';

class RatingBarWidget extends StatefulWidget {
  static const timerDuration = 15;

  final TrainingScent scent;

  const RatingBarWidget({super.key, required this.scent});

  @override
  RatingBarWidgetState createState() => RatingBarWidgetState();
}

class RatingBarWidgetState extends State<RatingBarWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late Infrastructure _infrastructure;

  bool busy = false;
  String? currentEncouragement;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    _infrastructure = context.read<Infrastructure>();

    return RatingBar.builder(
      direction: Axis.vertical,
      itemCount: TrainingSessionEntryRating.values.length,
      minRating: 1,
      itemBuilder: (context, rating) =>
          _infrastructure.getAssetProvider().getIcon(
                TrainingSessionEntryRating.fromValue(
                  rating,
                ).name,
              ),
      onRatingUpdate: (rating) {
        var entryWidget = TrainingSessionEntryWidget.of(context);

        return entryWidget.updateEntry(
          (entry) {
            entry.rating = TrainingSessionEntryRating.fromValue(rating.toInt());
            entry.comment = ""; // TODO
            entry.parosmiaReactionSeverity =
                TrainingSessionEntryParosmiaReactionSeverity.none;
            entry.parosmiaReaction = TrainingSessionEntryParosmiaReaction
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
