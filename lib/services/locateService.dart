import 'dart:convert';

import 'package:kirtasite/models/responseModels/district.dart';

import '../apis/locateApi.dart';
import '../models/responseModels/city.dart';

class LocateService {
  var api = LocateApi();

  Future<List> getCities() async {
    var liste = <CityModel>[];
    var response = await api.getCities();
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for (var i in data) {
        liste.add(CityModel.fromJson(i));
      }
      return liste;
    } else {
      return <CityModel>[];
    }
  }

  Future<List> getDistricts() async {
    var liste = <DistrictModel>[];
    var response = await api.getDistricts();
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for (var i in data) {
        liste.add(DistrictModel.fromJson(i));
      }
      return liste;
    } else {
      return <DistrictModel>[];
    }
  }

  Future<List> getDistrictByCityId(String cityId) async{
    var liste = <DistrictModel>[];
    var response = await api.getDistrictByCityId(cityId);
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for (var i in data) {
        liste.add(DistrictModel.fromJson(i));
      }
      return liste;
    } else {
      return <DistrictModel>[];
    }
  }
}
