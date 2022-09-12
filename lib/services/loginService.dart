// ignore_for_file: file_names

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
        print(temp["Name"]);
        if(temp["Name"] == "CUSTOMER"){
          var model = CustomerModel.fromJson(r["data"]);
          print(model.toString());
        }else if(temp["Name"] == "STATIONERY"){
          var model = StationeryModel.fromJson(r["data"]);
        }
        var model = DatabaseModel.fromJson(r);
        await db.InsertData(model);
        print(model.name);
        // sadece token geliyor .
        // login olan kişiye ait veriyi de dönmem gerekiyor.
        // önce bu güncellemeyi yapıp tekrar deneyeceğim.

        // 17.05.2022 : Güncelleme yaptım gelen veri tam kaydetmek istediğim gibi
        // gelen veriyi local veritabanına kaydetmem lazım
        // gelen veri kaydedildi
      }else{
        var r = json.decode(utf8.decode(response.bodyBytes));
        print(r["message"]);
        print("KOD: " + response.statusCode.toString());
      }
    });
  }
}