// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Custom/content.dart';
class AuthApi{

  

  Future login(String usernmae , String password) async {
    var url = Uri.parse(CustomContent.baseUrl+"login");
    return await http.post(
      url,
      headers:{"Content-Type":"application/json; charset=UTF-8"},
      body:jsonEncode(<String,String>{
        "Mail":usernmae,
        "Password":password
      })
    );
  }
}