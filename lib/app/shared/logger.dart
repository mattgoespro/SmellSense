import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart' as dart_logger;

class AppLogPrinter extends dart_logger.PrettyPrinter {
  AppLogPrinter({
    super.lineLength = 150,
    super.colors = true,
    super.printEmojis = true,
    super.printTime = true,
    super.methodCount = 0,
    super.errorMethodCount = 5,
    super.excludeBox = const {
      dart_logger.Level.all: false,
      dart_logger.Level.trace: true,
    },
  });

  @override
  List<String> log(dart_logger.LogEvent event) {
    if (kDebugMode) {
      switch (event.level) {
        case dart_logger.Level.debug:
          return super.log(event);
        case dart_logger.Level.error:
          return super.log(event).map((line) => '🔥 $line').toList();
        case dart_logger.Level.fatal:
          return super.log(event).map((line) => '💥 $line').toList();
        case dart_logger.Level.info:
        case dart_logger.Level.trace:
          return super.log(event).map((line) => '🔵 $line').toList();
        case dart_logger.Level.warning:
          return super.log(event).map((line) => '⚠️ $line').toList();
        default:
          return super.log(event);
      }
    }

    if (!kDebugMode && event.level == dart_logger.Level.debug) {
      return [];
    }

    return super.log(event);
  }

  @override
  String stringifyMessage(dynamic message) => stringifyClassObject(message);

  String stringifyClassObject(dynamic object) => object.toString();
}

class Log {
  static var logger = dart_logger.Logger(
    printer: AppLogPrinter(),
    output: dart_logger.ConsoleOutput(),
  );

  static trace(dynamic message) {
    logger.t(message);
  }

  static debug(dynamic message) {
    logger.d(message);
  }

  static info(dynamic message) {
    logger.i(message);
  }

  static warn(dynamic message) {
    logger.w(message);
  }

  static error(dynamic exception) {
    logger.e(exception);
  }
}
