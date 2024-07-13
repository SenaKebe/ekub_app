import 'dart:convert';

import 'package:mobileapp/config/server_instance.dart';

class CategoryService {
  Future<Map<String, dynamic>> getAllCategory() async {
    final url = Uri.parse('${ServerInstance.baseUrl}category/getAllCategory');
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

  Future<Map<String, dynamic>> addCategory(Map<String, dynamic> json) async {
    final url = Uri.parse('${ServerInstance.baseUrl}category/register');
    final jsonString = jsonEncode(json);
    try {
      final response = await ServerInstance.getClient().post(
        url,
        headers: ServerInstance.headers,
        body: jsonString,
      );
      final Map<String, dynamic> _responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return _responseData;
      } else {
        return _responseData;
      }
    } catch (e) {
      return {'success': false, 'message': "${e.toString()}"};
    }
  }
}
