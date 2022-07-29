// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
class AuthApi{

  String baseUrl = "http://2.59.117.205:1337/api/";

  Future login(String usernmae , String password) async {
    var url = Uri.parse(baseUrl+"auth/user/login");
    return await http.post(
      url,
      headers:{"Content-Type":"application/json; charset=UTF-8"},
      body:jsonEncode(<String,String>{
        "username":usernmae,
        "password":password
      })
    );
  }
}