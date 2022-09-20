import 'package:kirtasite/Custom/content.dart';
import 'package:http/http.dart' as http;

class StationeryApi{
  
  Future getAllStationery() async {
    var url = Uri.parse("${CustomContent.baseUrl}stationeries");
    return await http.get(url);
  }

  Future getStationeryById(var userId) async {
    var url = Uri.parse("${CustomContent.baseUrl}stationery/$userId");
    return await http.get(url);
  }

  Future addStationery() async {}

  Future updateStationey() async {}

}