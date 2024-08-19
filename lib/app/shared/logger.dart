import 'package:logger/logger.dart' as dart_logger;
import 'package:smellsense/app/shared/string_builder.dart';

class CustomPrettyPrinter extends dart_logger.PrettyPrinter {
  CustomPrettyPrinter({
    int super.methodCount,
    int super.errorMethodCount,
    super.lineLength = 50,
    super.colors,
    super.printEmojis,
    bool super.printTime = true,
  });

  @override
  String stringifyMessage(dynamic message) {
    return stringifyClassObject(message);
  }

  String stringifyClassObject(dynamic object) {
    return object.toString();
  }
}

class Log {
  static var logger = dart_logger.Logger(
    printer: CustomPrettyPrinter(
      methodCount: 20,
      errorMethodCount: 8,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
    output: dart_logger.ConsoleOutput(),
  );

  static trace(dynamic message) {
    logger.t(StringBuilder.builder().append(message).toString());
  }

  static debug(dynamic message) {
    logger.d(StringBuilder.builder().append(message).toString());
  }

  static info(dynamic message) {
    logger.i(StringBuilder.builder().append(message).toString());
  }

  static warning(dynamic message) {
    logger.w(StringBuilder.builder().append(message).toString());
  }

  static error(dynamic message) {
    logger.e(StringBuilder.builder().append(message).toString());
  }
}
