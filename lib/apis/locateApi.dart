
import 'package:http/http.dart' as http;
import 'package:kirtasite/Custom/content.dart';

class LocateApi{

  Future getCities() async {
    var url = Uri.parse("${CustomContent.baseUrl}cities");
    return await http.get(url);
  }

  Future getDistricts() async {
    var url = Uri.parse("${CustomContent.baseUrl}districts");
    return await http.get(url);
  }

  Future getDistrictByCityId(String cityId) async {
    var url = Uri.parse("${CustomContent.baseUrl}district/city/$cityId");
    return await http.get(url);
  }

}