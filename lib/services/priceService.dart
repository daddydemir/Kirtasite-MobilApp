
import 'package:kirtasite/apis/priceApi.dart';
import 'package:kirtasite/models/responseModels/price.dart';
import 'dart:convert';

class PriceService{

  var api = PriceApi();

  Future<List> getPrices() async {
    var liste = <PriceModel>[];
    var response = await api.getPrices();
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for (var i in data) {
        liste.add(PriceModel.fromJson(i));
      }
      return liste;
    } else {
      return <PriceModel>[];
    }
  }

  Future<List> getPricesByStationeryId(var id) async {
    var liste = <PriceModel>[];
    var response = await api.getPricesByStationeryId(id);
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for (var i in data) {
        liste.add(PriceModel.fromJson(i));
      }
      return liste;
    } else {
      return <PriceModel>[];
    }
  }
}