// lib/src/services/json_loader.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonLoader {
  static Future<Map<String, dynamic>> loadJson(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  static Future<List<dynamic>> loadJsonArray(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString) as List<dynamic>;
  }
}
