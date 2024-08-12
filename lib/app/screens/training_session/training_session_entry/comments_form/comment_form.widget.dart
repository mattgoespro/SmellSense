import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_parosmia_reaction.module.dart';
import 'package:smellsense/app/shared/utils.dart';

class CommentForm extends StatefulWidget {
  final FormMode mode;
  final TrainingSessionEntry entry;

  const CommentForm({super.key, required this.mode, required this.entry});

  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  Widget get parosmiaReactionFormField => FormField(
        builder: (FormFieldState<dynamic> field) => DropdownButtonFormField(
          items: [
            for (var reaction
                in TrainingSessionEntryParosmia.getParosmiaReactions())
              DropdownMenuItem(
                value: reaction.value,
                alignment: Alignment.center,
                child: SvgPicture.asset(reaction.value),
              ),
          ],
          decoration: const InputDecoration(
            labelText: 'How did you react after smelling this scent?',
            hintText: 'I reacted...',
          ),
          onChanged: (String? value) {
            field.didChange(value);
          },
        ),
      );

  Widget get parosmiaReactionSeverityFormField => FormField(
        builder: (FormFieldState<dynamic> field) => DropdownButtonFormField(
          items: [
            for (var severity
                in TrainingSessionEntryParosmia.getParosmiaSeverities())
              DropdownMenuItem(
                value: severity.value,
                alignment: Alignment.center,
                child: Text(
                  TrainingSessionEntryParosmia.getParosmiaSeverityDisplayValue(
                      severity.key),
                ),
              ),
          ],
          decoration: const InputDecoration(
            labelText:
                'How severe was your reaction to the smell of this scent?',
            hintText: 'The severity...',
          ),
          onChanged: (String? value) {
            field.didChange(value);
          },
        ),
      );

  Widget get additionalCommentsFormField => FormField(
        builder: (FormFieldState<dynamic> field) => TextFormField(
          decoration: const InputDecoration(
            labelText: 'Any additional comments?',
            hintText: 'Additionally...',
          ),
          maxLines: 3,
          onChanged: (String value) {
            field.didChange(value);
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          parosmiaReactionFormField,
          parosmiaReactionSeverityFormField,
          additionalCommentsFormField
        ],
      ),
    );
  }
}
