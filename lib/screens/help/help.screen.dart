import 'package:flutter/material.dart';
import 'package:smellsense/shared/widgets/app_bar.widget.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  final String _helpInfo = """
  <div style="font-family: Roboto;">
    <h1 style="font-size: 24px; font-weight: 200;">What is smell training?</h1>
    <p style="font-size: 14px; font-weight: 200; padding-bottom: 5px">
        Smell training engages an inate property of the brain called <span style="font-weight: 300;">Neuroplasticity</span>:
        the capacity of the brain to reassign and unblock neural networks associated with body
        functions to reestablish a normal function, in this case the loss of sense of smell.
    </p>
    <h1 style="font-size: 24px; font-weight: 200;">I'm ready to begin. What do I do?</h1>
    <p style="font-size: 14px; font-weight: 200; padding-bottom: 5px">
        In a training session, a set of four familiar smells (typically <span style="color: #f18db0; font-weight: 400;">Rose</span>,
        <span style="color: #a0877f; font-weight: 400;">Clove</span>,
        <span style="color: #d6e063; font-weight: 400;">Lemon</span>, and <span
            style="color: #56af57; font-weight: 400;">Eucalyptus</span>)
        are smelled, in turn, for a period of 20-30 seconds, whilst mindfully visualising and remembering
        how each substance would have smelled prior to the onset of the loss of smell.
    </p>
    <p style="font-size: 14px; font-weight: 200; padding-bottom: 5px">Repeat the training twice daily for better results.</p>
    <h1 style="font-size: 24px; font-weight: 200;">Over how long a period do I need to train in order to recover fully?
    </h1>
    <p style="font-size: 14px; font-weight: 200; padding-bottom: 5px">
        Recovery periods naturally differ from person to person, but research suggests that the minimum treatment
        should last 3 months.
    </p>
    <p style="font-size: 14px; font-weight: 200; padding-bottom: 5px">
        Much depends on the underlying cause of your loss of smell, the severity thereof. Most people will
        become aware of positive changes within 3 months of starting smell training. Initially the sense of smell might recover 
        with an 'incorrect' smell for a substance, but this is a positive sign that recovery is under way,
        and that one should persevere with the training.
    </p>
    <h1 style="font-size: 24px; font-weight: 200;">I don't have the official SmellSense kit, so am I still able to use
        this app?</h1>
    <p style="font-size: 18px; font-weight: 300; padding-bottom: 5px">
        Yes!
    </p>
    <p style="font-size: 14px; font-weight: 200; padding-bottom: 5px">
        The SmellSense kit is built simply for convenience, and the scents supplied
        are the most effective for retraining based on most research up to date.
    </p>
    <p style="font-size: 14px; font-weight: 200;">
        Luckily, you can make up your own set of scents on which to smell train. Be
        sure to use a set of recognizable smells that remain consistently strong
        over the period of training.

        Studies tend to use a representative from each of the 'notes' of smell:
    </p>
    <ul style="font-size: 14px; font-weight: 200; padding-left: 25px;">
        <li style="padding: 3px;">
          Floral - eg. <span style="color: #f18db0; font-weight: 400;">Rose</span>
        </li>
        <li style="padding: 3px;">
          Fruity - eg. <span style="color: #d6e063; font-weight: 400;">Lemon</span>
        </li>
        <li style="padding: 3px;">
          Spicy - eg. <span style="color: #a0877f; font-weight: 400;">Clove</span>
        </li>
        <li style="padding: 3px;">Aromatic - eg. <span style="color: #56af57; font-weight: 400;">
          Eucalyptus</span>
        </li>
    </ul>
    <p style="font-size: 14px; font-weight: 200;">Refer to <span style="color: #054a9e;font-weight: 600;">About</span> from the main menu for more information.</p>
  </div>
  """;

  static const headerStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w200,
  );

  static const bodyStyle = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w200,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmellSenseAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: HtmlWidget(
            _helpInfo,
          ),
        ),
      ),
    );
  }
}
