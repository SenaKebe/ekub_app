import 'package:shared_preferences/shared_preferences.dart';

Future<void> setData(String key, String value) async {
  final instant = await SharedPreferences.getInstance();
  instant.setString(key, value);
}

Future<String?> getData(String key) async {
  final instant = await SharedPreferences.getInstance();
  return instant.getString(key);
}

Future<void> removeData(String key) async {
  final instant = await SharedPreferences.getInstance();
  instant.remove(key);
}
