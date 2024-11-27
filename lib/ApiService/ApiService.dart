// import 'dart:convert';
import 'package:http/http.dart';
import 'package:project/Model/getApiModel.dart';

class Apiservice {
 getApiModel demo = getApiModel();
  Future<dynamic> getData() async{
    dynamic apiData;
    var response = await get(Uri.parse('https://reqres.in/api/users?page=2'));

    if(response.statusCode == 200 || response.statusCode == 201){
      apiData = demo.toJson();
    }else{
      print("Error");
    }

    return apiData;
  }
}