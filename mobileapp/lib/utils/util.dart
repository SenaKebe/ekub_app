import 'package:mobileapp/utils/shared_preferences.dart';

Future<bool> checkLoginBefore(String key) async {
  String? token = await getData(key);
  if (token == null || token == "") {
    return false;
  } else {
    return true;
  }
}
