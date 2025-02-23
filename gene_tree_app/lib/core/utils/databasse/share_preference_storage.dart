import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<T?> get<T>(String key);
  Future<bool> save<T>(String key, T value);
  Future<void> remove(String key);
  Future<bool> containsKey(String key);
  Future<void> clearAll();
}

class SharedPreferencesStorage implements LocalStorage {
  @override
  Future<T?> get<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (T == String) return prefs.getString(key) as T?;
    if (T == int) return prefs.getInt(key) as T?;
    if (T == bool) return prefs.getBool(key) as T?;
    if (T == double) return prefs.getDouble(key) as T?;
    throw ArgumentError("Unsupported type: $T");
  }

  @override
  Future<bool> save<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) return prefs.setString(key, value);
    if (value is int) return prefs.setInt(key, value);
    if (value is bool) return prefs.setBool(key, value);
    if (value is double) return prefs.setDouble(key, value);
    throw ArgumentError("Unsupported type: ${value.runtimeType}");
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  @override
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
