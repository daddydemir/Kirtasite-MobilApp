// ignore_for_file: file_names, avoid_print

import 'dart:convert';

import '../apis/authApi.dart';
import '../data/localData.dart';
import '../models/databaseModel.dart';
import '../models/responseModels/customer.dart';
import '../models/responseModels/stationery.dart';

class LoginService{
  var api = AuthApi();
  var db = LocalData();

  Future login(String username , String password) async {
    api.login(username, password).then((response) async{
      if (response.statusCode == 200) {
        var r = json.decode(utf8.decode(response.bodyBytes));
        var temp = r["data"];
        temp = temp["User"];
        temp = temp["Role"];
        DatabaseModel dm = DatabaseModel.Empty();
        var model;
        if(temp["Name"] == "CUSTOMER"){
          model = CustomerModel.fromJson(r["data"]);
          dm = DatabaseModel.CustomerAdapter(model, r["token"]);
        }else if(temp["Name"] == "STATIONERY"){
          model = StationeryModel.fromJson(r["data"]);
          dm = DatabaseModel.StationeryAdapter(model, r["token"]);
        }
        LocalData service = LocalData();
        await service.InsertData(dm);
      }else{
        var r = json.decode(utf8.decode(response.bodyBytes));
        print(r["message"]);
        print("KOD: ${response.statusCode}");
      }
    });
  }
}