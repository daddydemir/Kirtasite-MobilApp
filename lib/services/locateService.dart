
import 'dart:convert';

import '../apis/locateApi.dart';
import '../models/responseModels/city.dart';

class LocateService{
  var api = LocateApi();

  Future<List> getCities() async {
    var liste = <CityModel>[];
    var response = await api.getCities();
    if(response.statusCode == 200){
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for(var i in data) {
        liste.add(CityModel.fromJson(i));
      }
      return liste;
    }else{
      print("fail");
      return <CityModel>[];
    }
    
  }
}