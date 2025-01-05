import 'package:flutter/material.dart';
import 'package:smellsense/app/application/providers/infrastructure.provider.dart';
import 'package:smellsense/app/pages/training_session/training_session_stepper.widget.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/theme/theme.dart';

class TrainingSessionPage extends StatefulWidget {
  const TrainingSessionPage({
    super.key,
  });

  @override
  TrainingSessionPageState createState() => TrainingSessionPageState();
}

class TrainingSessionPageState extends State<TrainingSessionPage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = MaterialTheme.of(context).textTheme;

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder(
            future: Infrastructure.of(context)
                .databaseService
                .getActiveTrainingScents(),
            builder: (context, AsyncSnapshot<List<TrainingScent>> snapshot) {
              // TODO: Handle loading state better
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // TODO: Handle error state
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: textTheme.headlineSmall,
                  ),
                );
              }

              // TODO: Handle this case better
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    'No training scents found.',
                    style: MaterialTheme.of(context).textTheme.headlineSmall,
                  ),
                );
              }

              return TrainingSessionStepperWidget(
                scents: snapshot.data!,
              );
            },
          )),
    );
  }
}

// ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: const Text(
//                                     'Are you sure you have finished your training session?'),
//                                 action: SnackBarAction(
//                                   label: 'Yes',
//                                   onPressed: () {
//                                     // DateTime sessionDate = DateTime.now();

//                                     // TODO: Retrieve the session entries from the entry widgets
//                                     // List<TrainingSessionEntry> ratings = ...

//                                     // TODO: Create the session entries for the training session and save them to the database

//                                     // Navigate straight to the training progress screen
//                                     Navigator.of(context)
//                                         .pushNamedAndRemoveUntil(
//                                             '/training-progress',
//                                             (route) =>
//                                                 route.settings.name == "/");
//                                   },
//                                 ),
//                               ),
//                             );
