class StringBuilder {
  final StringBuffer _buffer = StringBuffer();
  int currentIndent = 0;

  StringBuilder();

  static StringBuilder builder() => StringBuilder();

  StringBuilder append(dynamic obj) {
    _buffer.write(obj.toString());
    return this;
  }

  StringBuilder appendLine(dynamic obj) {
    if (!_buffer.toString().endsWith("\n")) {
      _buffer.write("${'\n'}${obj.toString()}${'\n'}");
      return this;
    }

    _buffer.writeln(obj);

    return this;
  }

  String build() => toString();

  @override
  String toString() => _buffer.toString().trim();
}
