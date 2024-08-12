import 'package:flutter/material.dart';
import 'package:smellsense/app/screens/training_session/training_session_entry/comments_form/comment_form.widget.dart';
import 'package:smellsense/app/shared/modules/training_session/training_session_entry.module.dart';
import 'package:smellsense/app/shared/utils.dart';

class SessionEntriesCommentsFormWidget extends StatefulWidget {
  final FormMode mode;
  final List<TrainingSessionEntry> entries;

  const SessionEntriesCommentsFormWidget(
      {super.key, required this.mode, required this.entries});

  @override
  SessionEntriesCommentsFormWidgetState createState() =>
      SessionEntriesCommentsFormWidgetState();
}

class SessionEntriesCommentsFormWidgetState
    extends State<SessionEntriesCommentsFormWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            ...widget.entries.map(
              (entry) => CommentForm(
                mode: widget.mode,
                entry: entry,
              ),
            ),
          ],
        ),
      );
}
