class Tuple<T1, T2> {
  T1 first;
  T2 second;

  Tuple(this.first, this.second);
}

enum FormMode { fill, view }

class AssetPathProvider {
  final String assetTypePath;
  final String _basePath = "assets";

  AssetPathProvider({required this.assetTypePath});

  String getAssetPath(String assetName) {
    return _basePath + assetTypePath + assetName;
  }
}

String formatString(dynamic clazz, List<dynamic> fieldNames) {
  return "${clazz.runtimeType.toString()}(${fieldNames.map((field) => "$field: ${clazz.field}").join(", ")})";
}
