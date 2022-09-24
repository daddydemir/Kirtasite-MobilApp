
import 'package:http/http.dart' as http;
import 'package:kirtasite/Custom/content.dart';
import 'package:kirtasite/models/responseModels/customer.dart';

class CustomerApi{

  Future getCustomers() async {
    var url = Uri.parse("${CustomContent.baseUrl}customers");
    return await http.get(url);
  }

  Future getCustomerByUserId(var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}customer/$id");
    return await http.get(url);
  }

  Future addCustomer(CustomerModel cm) async {
    var url = Uri.parse("${CustomContent.baseUrl}customer");
    return await http.post(url);
  }

  Future updateCustomer(CustomerModel cm, var id) async {
    var url = Uri.parse("${CustomContent.baseUrl}customer/$id");
    return await http.post(url);
  }
}