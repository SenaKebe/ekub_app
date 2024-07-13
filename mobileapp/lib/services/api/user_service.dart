import 'dart:convert';

import 'package:mobileapp/config/server_instance.dart';

class UserService {
  Future<Map<String, dynamic>> getAllUsers() async {
    final url = Uri.parse('${ServerInstance.baseUrl}user/get');
    try {
      final _response = await ServerInstance.getClient().get(
        url,
        headers: ServerInstance.headers,
      );
      final Map<String, dynamic> _responseData = jsonDecode(_response.body);
      if (_response.statusCode == 200) {
        return _responseData;
      } else {
        return _responseData;
      }
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': "${e.toString()}"};
      ;
    }
  }

  Future<Map<String, dynamic>> getAllWinners() async {
    final url = Uri.parse('${ServerInstance.baseUrl}winner/get');
    try {
      final _response = await ServerInstance.getClient().get(
        url,
        headers: ServerInstance.headers,
      );
      final Map<String, dynamic> _responseData = jsonDecode(_response.body);
      if (_response.statusCode == 200) {
        return _responseData;
      } else {
        return _responseData;
      }
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': "${e.toString()}"};
    }
  }

  Future<Map<String, dynamic>> addUser(Map<String, dynamic> json) async {
    final _data = jsonEncode(json);
    print(_data);
    final url = Uri.parse("${ServerInstance.baseUrl}user/register");
    try {
      final response = await ServerInstance.getClient()
          .post(url, headers: ServerInstance.headers, body: _data);
      final Map<String, dynamic> _responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return _responseData;
      } else {
        return _responseData;
      }
    } catch (e) {
      print(e.toString());
    }
    return {'success': false, 'message': "error occured"};
  }
}
