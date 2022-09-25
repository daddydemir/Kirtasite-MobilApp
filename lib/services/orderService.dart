import 'package:kirtasite/apis/orderApi.dart';
import 'package:kirtasite/models/responseModels/order.dart';
import 'dart:convert';

class OrderService {
  var api = OrderApi();

  Future<OrderModel> getOrderById(var id) async {
    var response = await api.getOrderById(id);
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      return OrderModel.fromJson(data);
    }
    return OrderModel();
  }

  Future<List> getOrdersByCustomerId(var id) async {
    var liste = <OrderModel>[];
    var response = await api.getOrdersByCustomerId(id);
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for (var i in data) {
        liste.add(OrderModel.fromJson(i));
      }
      return liste;
    } else {
      return <OrderModel>[];
    }
  }

  Future<List> getOrdersByStationeryId(var id) async {
    var liste = <OrderModel>[];
    var response = await api.getOrdersByStationeryId(id);
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for (var i in data) {
        liste.add(OrderModel.fromJson(i));
      }
      return liste;
    } else {
      return <OrderModel>[];
    }
  }
}
