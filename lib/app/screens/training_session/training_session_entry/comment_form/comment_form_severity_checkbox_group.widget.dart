import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_altered_reaction.module.dart';

class CommentsFormSeverityCheckboxGroupWidget
    extends FormField<TrainingSessionEntryAlteredReactionSeverity> {
  final TrainingSessionEntry entry;

  CommentsFormSeverityCheckboxGroupWidget(this.entry, {super.key})
      : super(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<TrainingSessionEntryAlteredReactionSeverity>
                  field) =>
              RatingBar.builder(
            itemBuilder: (context, rating) {
              return const Icon(
                Icons.star,
                color: Colors.amber,
              );
            },
            onRatingUpdate: (rating) {},
          ),
        );
}
