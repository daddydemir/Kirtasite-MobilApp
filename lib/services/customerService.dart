import 'dart:convert';

import 'package:kirtasite/apis/customerApi.dart';
import 'package:kirtasite/models/responseModels/customer.dart';

class CustomerService{

  var api = CustomerApi();

  Future<List> getCustomers() async {
    var liste = <CustomerModel>[];
    var response = await api.getCustomers();
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      for (var i in data) {
        liste.add(CustomerModel.fromJson(i));
      }
      return liste;
    } else {
      return <CustomerModel>[];
    }
  }

  Future<CustomerModel> getCustomer(var userId) async {
    var response = await api.getCustomerByUserId(userId);
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      return CustomerModel.fromJson(data);
      
    } else {
      return CustomerModel();
    }
  }

  Future addCustomer(CustomerModel cm) async{
    var response = await api.addCustomer(cm);
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      
      
    }
  }

  Future updateCustomer(CustomerModel cm) async{
    var response = await api.updateCustomer(cm, cm.userId);
    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      data = data["data"];
      
      
    }
  }
}