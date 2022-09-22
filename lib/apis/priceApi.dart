import 'package:kirtasite/Custom/content.dart';
import 'package:http/http.dart' as http;

class PriceApi{

  Future getPrices() async {
    var url = Uri.parse("${CustomContent.baseUrl}prices");
    return await http.get(url);
  }

  Future getPricesByStationeryId(var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}prices/stationery/$id");
    return await http.get(url);
  }
}