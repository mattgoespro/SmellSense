import 'package:flutter/material.dart';
import 'package:smellsense/app/pages/training_session/training_session_entry/training_session_entry.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';

class TrainingSessionStepperWidget extends StatefulWidget {
  final List<TrainingScent> scents;

  const TrainingSessionStepperWidget({
    super.key,
    required this.scents,
  });

  @override
  State<TrainingSessionStepperWidget> createState() =>
      _TrainingSessionStepperWidgetState();
}

class _TrainingSessionStepperWidgetState
    extends State<TrainingSessionStepperWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      type: StepperType.vertical,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: widget.scents.map(
        (scent) {
          return Step(
            title: Text(scent.name.toString()),
            content: TrainingSessionEntryWidget(
              scent: scent,
            ),
          );
        },
      ).toList(),
    );
  }
}
