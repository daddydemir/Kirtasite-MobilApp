import 'package:http/http.dart' as http;
import 'package:kirtasite/Custom/content.dart';
import 'package:kirtasite/models/responseModels/order.dart';

class OrderApi{

  Future getOrderById(var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}order/$id");
    return await http.get(url);
  }

  Future getOrdersByCustomerId(var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}orders/customer/$id");
    return await http.get(url);
  }

  Future getOrdersByStationeryId(var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}orders/stationery/$id");
    return await http.get(url);
  }

  Future addOrder(OrderModel om) async {
    var url = Uri.parse("${CustomContent.baseUrl}order");
    return http.post(url);
  }

  Future cancelOrder(var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}order/$id/cancel");
    return http.put(url);
  }

  Future confirmOrder(var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}order/$id/confirm");
    return http.put(url);
  }

  Future readyOrder(var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}order/$id/ready");
    return http.put(url);
  }

  Future completeOrder(var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}order/$id/complete");
    return http.put(url);
  }
}