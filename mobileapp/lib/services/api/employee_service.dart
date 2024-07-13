import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobileapp/config/server_instance.dart';

class EmployeeService {
  Future<List<Map<String, dynamic>>> fechMothers(int skip, int take) async {
    // prepare request
    final url = Uri.parse('${ServerInstance.baseUrl}/user/mother/hs/my/');
    // debugPrint(
    //     "${ServerInstance.baseUrl}/user/mother/hs/my/data?skip=$skip&take=$take");
    try {
      //send request
      final response = await ServerInstance.getClient().get(url);
      final List<dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> motherList =
          List<Map<String, dynamic>>.from(responseData);

      // debugPrint(" ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]" + motherList.toString());

      return motherList;
    } catch (error) {}

    return [];
  }

  Future<List<Map<String, dynamic>>> fechVaccine(int skip, int take) async {
    // prepare request
    final url = Uri.parse('${ServerInstance.baseUrl}/vaccine/');
    try {
      //send request
      final response = await ServerInstance.getClient().get(url);
      final List<dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> motherList =
          List<Map<String, dynamic>>.from(responseData);
      // debugPrint(motherList.toString());
      return motherList;
    } catch (error) {}

    return [];
  }

  Future<Map<String, dynamic>> vaccineteMother(
      Map<String, dynamic> jsonData) async {
    final url = Uri.parse('${ServerInstance.baseUrl}/vaccine/mother/');
    final jsonString = jsonEncode(jsonData);
    // now send api request
    try {
      final response = await ServerInstance.getClient().post(
        url,
        headers: ServerInstance.headers,
        body: jsonString,
      );
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        // debugPrint(" 0000000000$responseData");
        // final String token = responseData['token'];
        return {'success': true, 'message': responseData['message']};
      } else {
        return {'success': false, 'message': responseData['message']};
      }
    } catch (e) {
      debugPrint(" 0000000000" + e.toString());
      return {"sucess": false, "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> addChild(Map<String, dynamic> jsonData) async {
    final url = Uri.parse('${ServerInstance.baseUrl}/child/');
    final jsonString = jsonEncode(jsonData);
    // now send api request
    try {
      final response = await ServerInstance.getClient().post(
        url,
        headers: ServerInstance.headers,
        body: jsonString,
      );
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        // debugPrint(" child 0000000$responseData");
        // final String token = responseData['token'];
        return {'success': true, 'message': responseData['message']};
      } else {
        return {'success': false, 'message': responseData['message']};
      }
    } catch (e) {
      debugPrint(" child0000000000$e");
      return {"sucess": false, "message": e.toString()};
    }
  }
}
