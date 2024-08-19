class StringBuilder {
  final StringBuffer _buffer = StringBuffer();
  int currentIndent = 0;

  StringBuilder();

  static StringBuilder builder() => StringBuilder();

  StringBuilder append(dynamic obj, {int indent = 0}) {
    _buffer.write(formatIndent(indent, obj));
    currentIndent += indent;

    return this;
  }

  StringBuilder appendLine(dynamic obj, {int indent = 0}) {
    if (obj is List) {
      for (var element in obj) {
        _buffer.writeln(formatIndent(indent, element));
      }
      return this;
    }

    _buffer.writeln(formatIndent(indent, obj));
    return this;
  }

  String formatIndent(int indent, Object? object) {
    return "${getIndent(indent: indent)}${object.toString()}";
  }

  String getIndent({int? indent}) {
    var indentTimes = indent ?? currentIndent;

    if (indentTimes < 1) {
      return "";
    }

    return "  " * indentTimes;
  }

  @override
  String toString() => _buffer.toString();
}
