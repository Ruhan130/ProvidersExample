import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project/ApiService/ApiService.dart';
import 'package:project/Model/getApiModel.dart';

class Authprovider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  getApiModel? _apiResponse;
  getApiModel? get apiResponse => _apiResponse;

  Future<void> getData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _apiResponse = await ApiService().getData();
    } catch (e) {
      print('Error fetching data: $e');
      _apiResponse = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  
  
  
  
  
  
  
  
  
  //  POST API 
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {'email':email, 'password': password},
      );
      if (response.statusCode == 200) {
        print("Successfull");
        setLoading(false);
      } else {
        print("Unsuccessll");
        setLoading(false);
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
