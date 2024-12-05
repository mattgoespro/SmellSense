import 'package:easy_localization/easy_localization.dart';

class TimerEncouragements {
  static int numEncouragements = 4;
  static int currentIndex = 0;

  static String getNextEncouragement() =>
      "screens.training_session.training_session_entry.timer_encouragements.${++currentIndex % numEncouragements}"
          .tr();
}
