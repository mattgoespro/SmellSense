import 'package:uuid/uuid.dart';

enum FormMode { fill, view }

String uuid() => const Uuid().v4();
