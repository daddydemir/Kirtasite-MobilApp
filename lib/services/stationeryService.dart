import 'dart:convert';

import 'package:kirtasite/apis/stationeryApi.dart';
import 'package:kirtasite/models/responseModels/stationery.dart';

class StationeryService {
  var api = StationeryApi();

  Future<List> getAllStationeries() async {
    var liste = <StationeryModel>[];
    var response = await api.getAllStationery();
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for (var i in data) {
        liste.add(StationeryModel.fromJson(i));
      }
      return liste;
    } else {
      return liste;
    }
  }
}
