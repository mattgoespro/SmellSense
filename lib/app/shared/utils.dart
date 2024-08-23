import 'package:uuid/uuid.dart';

enum FormMode { fill, view }

String formatString(dynamic clazz, List<dynamic> fieldNames) {
  return "${clazz.runtimeType.toString()}(${fieldNames.map((field) => "$field: ${clazz.field}").join(", ")})";
}

String uuid() => const Uuid().v4();
