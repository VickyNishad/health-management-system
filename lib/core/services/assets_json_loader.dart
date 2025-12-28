import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// A utility class for handling the loading and parsing of static assets,
/// particularly JSON files, from the Flutter asset bundle.
class AssetJsonLoader {
  /// Loads a JSON asset file from the given [assetPath] (e.g., 'assets/data.json').
  ///
  /// The function reads the file as a string and then decodes it into a
  /// generic Dart Map (dynamic).
  ///
  /// [assetPath]: The path to the asset, which must be registered in pubspec.yaml.
  /// Returns a Future that resolves to the decoded JSON Map.
  static Future<Map<String, dynamic>> loadJsonAsset(String assetPath) async {
    try {
      // 1. Load the raw JSON string from the asset bundle.
      final String jsonString = await rootBundle.loadString(assetPath);

      // 2. Decode the string into a Dart Map.
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      return jsonMap;
    } catch (e) {
      // It's crucial to handle errors (e.g., file not found, invalid JSON format).
      print(
        'ERROR: Failed to load or decode JSON asset at $assetPath. Error: $e',
      );
      // Throw the error so the calling function must handle the failure.
      rethrow;
    }
  }

  /// Generic function to load any raw text asset.
  static Future<String> loadTextAsset(String assetPath) {
    return rootBundle.loadString(assetPath);
  }
}
