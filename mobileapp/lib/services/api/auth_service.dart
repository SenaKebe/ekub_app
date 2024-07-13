import 'dart:convert';
import 'package:mobileapp/config/server_instance.dart';
import 'package:mobileapp/utils/shared_preferences.dart';

class AuthService {
  Future<Map<String, dynamic>> login(Map<String, dynamic> jsonData) async {
    final url = Uri.parse('${ServerInstance.baseUrl}user/login');
    final jsonString = jsonEncode(jsonData);
    try {
      final response = await ServerInstance.getClient().post(
        url,
        headers: ServerInstance.headers,
        body: jsonString,
      );
      final Map<String, dynamic> _responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        //extract token
        final String _token = _responseData['token'];
        if (_token != '') {
          await setData("token", _token);
        }
        return _responseData;
      } else {
        return _responseData;
      }
    } catch (e) {
      return {'success': true, 'message': "${e.toString()}"};
    }
  }
}
