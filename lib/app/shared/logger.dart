import 'package:logger/logger.dart' as dart_logger;

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
    logger.t(message);
  }

  static debug(dynamic message) {
    logger.d("DEBUG");
    logger.e("ERROR");
    logger.i("INFO");
    logger.w("WARNING");
    logger.t("TRACE");
    logger.d(message);
  }

  static info(dynamic message) {
    logger.i(message);
  }

  static warning(dynamic message) {
    logger.w(message);
  }

  static error(dynamic message) {
    logger.e(message);
  }
}
