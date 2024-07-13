import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:mobileapp/config/server_instance.dart';

class NewsService {
  Future<List<Map<String, dynamic>>> fechNews(int skip, int take) async {
    // prepare request
    final url =
        Uri.parse('${ServerInstance.baseUrl}/news?skip=$skip&take=$take');
    try {
      //send request
      final response = await ServerInstance.getClient().get(url);
      final List<dynamic> responseData = json.decode(response.body);
      final List<Map<String, dynamic>> newsList =
          List<Map<String, dynamic>>.from(responseData);
      return newsList;
    } catch (error) {}

    return [];
  }

  Future<List<Map<String, dynamic>>> fechHs(int skip, int take) async {
    //prepare request
    final url =
        Uri.parse('${ServerInstance.baseUrl}/hs/all?skip=$skip&take=$take');
    // debugPrint(
    //     ' =========== ${ServerInstance.baseUrl}/hs/all?skip=$skip&take=$take');

    try {
      final request = await ServerInstance.getClient().get(url);
      if (request.statusCode == 200) {
        final List<dynamic> data = jsonDecode(request.body);
        final List<Map<String, dynamic>> hsList =
            List<Map<String, dynamic>>.from(data);
        return hsList;
      } else {}
    } catch (e) {}
    return [];
  }
}
