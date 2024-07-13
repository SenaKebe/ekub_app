import 'package:http/http.dart' as http;
import 'package:mobileapp/utils/shared_preferences.dart';

class ServerInstance {
  static const String baseUrl = 'http://192.168.43.110:7777/api/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static http.Client client = http.Client();

  static http.Client getClient() {
    return client;
  }

  static Future<void> updateHeadersWithToken() async {
    final token = await getData("token");
    if (token != null) {
      headers['authorization'] = token;
    } else {
      headers.remove('authorization');
    }
  }
}
