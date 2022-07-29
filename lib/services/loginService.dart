// ignore_for_file: file_names

import 'dart:convert';

import '../apis/authApi.dart';
import '../data/localData.dart';
import '../models/databaseModel.dart';

class LoginService{
  var api = AuthApi();
  var db = LocalData();

  Future login(String username , String password) async {
    api.login(username, password).then((response) async{
      if (response.statusCode == 200) {
        var r = json.decode(utf8.decode(response.bodyBytes));
        print(r);
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
        print("KOD: " + response.statusCode.toString());
      }
    });
  }
}