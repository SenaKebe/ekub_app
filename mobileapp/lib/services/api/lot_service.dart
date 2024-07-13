import 'dart:convert';

import 'package:mobileapp/config/server_instance.dart';

class LotService {
  Future<Map<String, dynamic>> getAllLot() async {
    final url = Uri.parse('${ServerInstance.baseUrl}lot/getAllLot');
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
      return {'success': true, 'message': "${e.toString()}"};
      ;
    }
  }

  Future<Map<String, dynamic>> addLot(Map<String, dynamic> json) async {
    final _data = jsonEncode(json);
    final url = Uri.parse("${ServerInstance.baseUrl}lot/register");
    try {
      final _response = await ServerInstance.getClient()
          .post(url, headers: ServerInstance.headers, body: _data);

      final jsonData = jsonDecode(_response.body);
      if (_response.statusCode == 200) {
        return jsonData;
      } else {
        return jsonData;
      }
    } catch (e) {
      print(e.toString());
    }
    return {"sucess": true};
  }
}
