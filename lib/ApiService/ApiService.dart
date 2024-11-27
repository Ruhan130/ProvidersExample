// import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:project/Model/getApiModel.dart';

class ApiService {
  Future<getApiModel?> getData() async {
    try {
      final response = await get(Uri.parse('https://reqres.in/api/users?page=2'));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return getApiModel.fromJson(data);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }
}