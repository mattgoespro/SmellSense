import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry_parosmia_reaction.module.dart';

class SeverityCheckboxGroupWidget extends StatefulWidget {
  final TrainingSessionEntry entry;

  const SeverityCheckboxGroupWidget({super.key, required this.entry});

  @override
  SeverityCheckboxGroupWidgetState createState() =>
      SeverityCheckboxGroupWidgetState();
}

class SeverityCheckboxGroupWidgetState
    extends State<SeverityCheckboxGroupWidget> {
  TrainingSessionEntryParosmiaReactionSeverity _selectedSeverity =
      TrainingSessionEntryParosmiaReactionSeverity.none;

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            for (var severity
                in TrainingSessionEntryParosmia.getParosmiaReactions())
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: RadioListTile(
                  title: Text(
                    TrainingSessionEntryParosmia.getParosmiaReactionEmoji(
                        severity.key),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  groupValue: _selectedSeverity,
                  value: severity.value,
                  onChanged: (dynamic value) {
                    setState(() => _selectedSeverity = value);
                  },
                ),
              ),
          ],
        ),
      );
}
