import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final Duration timerDuration;
  final void Function() onStart;
  final Widget replaceDoneTimerWidget;

  const TimerWidget({
    super.key,
    required this.timerDuration,
    required this.onStart,
    required this.replaceDoneTimerWidget,
  });

  @override
  State<TimerWidget> createState() => TimerWidgetState();
}

class TimerWidgetState extends State<TimerWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: widget.timerDuration,
      lowerBound: 0,
      upperBound: widget.timerDuration.inSeconds.toDouble(),
    )..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            break;
          case AnimationStatus.forward:
            widget.onStart();
            break;
          case AnimationStatus.dismissed:
            widget.onStart();
            break;
          default:
            break;
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Stack(
              children: [
                if (controller.isAnimating) ...[
                  CircularProgressIndicator(
                    value: controller.value,
                    strokeCap: StrokeCap.round,
                  ),
                  Text(
                    controller.value.toStringAsFixed(2),
                  )
                ],
                if (!controller.isAnimating) widget.replaceDoneTimerWidget
              ],
            ),
          ),
          if (controller.isCompleted)
            TextButton(
              onPressed: () {
                controller.reset();
              },
              child: const Text('Start'),
            ),
        ],
      ),
    );
  }
}
