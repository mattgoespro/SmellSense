library;

import 'package:flutter_test/flutter_test.dart';
import 'package:smellsense/app/shared/utils/stringbuilder.dart';

void main() {
  group('StringBuilder', () {
    test('append should concatenate multiple strings in the same line', () {
      expect(
          StringBuilder.builder()
              .append("Hello")
              .append(" ")
              .append("World")
              .build(),
          "Hello World");
    });

    test('append line should concatenate multiple strings on different lines',
        () {
      expect(
        StringBuilder.builder()
            .append("String")
            .append(" ")
            .append("Builder")
            .appendLine("Description: incrementally builds strings.")
            .appendLine("Used for tracing and debugging purposes.")
            .build(),
        "String Builder\nDescription: incrementally builds strings.\nUsed for tracing and debugging purposes.",
      );
    });
  });
}
