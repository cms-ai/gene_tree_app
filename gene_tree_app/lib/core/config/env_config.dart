// ignore_for_file: constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvKeys {
  BASE_URL,
}

class EnvConfig {
  static Future<void> loadEnv(String environment) async {
    await dotenv.load(fileName: "env/.env.$environment");
  }

  static String? get(EnvKeys key) {
    return dotenv.env[key.name];
  }

  static String getRequired(EnvKeys key) {
    final value = dotenv.env[key.name];
    if (value == null) {
      throw Exception("Missing required environment variable: $key");
    }
    return value;
  }
}
