// ignore_for_file: file_names, non_constant_identifier_names

import 'package:kirtasite/models/responseModels/customer.dart';
import 'package:kirtasite/models/responseModels/stationery.dart';

class DatabaseModel{
  late int id;
  late String name;
  late String mail;
  late String phone;
  late String image;
  late String role;
  late String token;
  late double score;
  late int addressId;

  DatabaseModel.Empty();

  DatabaseModel({
    required this.id,
    required this.name,
    required this.mail,
    required this.phone,
    required this.image,
    required this.role,
    required this.token
  });

  DatabaseModel.fromObjectToCustomer(dynamic d){
    id = d["userId"];
    name = d["name"];
    mail = d["mail"];
    phone = d["phone"];
    image = d["image_path"];
    role = d["role"];
  }

  DatabaseModel.fromObjectToStationery(dynamic d){
    id = d["userId"];
    name = d["name"];
    mail = d["mail"];
    phone = d["phone"];
    image = d["image_path"];
    role = d["role"];
    score = d["score"];
    addressId = d["addressId"];
  }

  DatabaseModel.CustomerAdapter(CustomerModel cm, String tkn){
    id = cm.userId!;
    name = cm.username!;
    mail = cm.user?.mail ?? "";
    phone = cm.user?.phone ?? "";
    image = cm.user?.imagePath ?? "";
    role = cm.user?.role?.name ?? "";
    score = 0;
    addressId = 0;
    token = tkn;
  }

  DatabaseModel.StationeryAdapter(StationeryModel sm, String tkn){
    id =  sm.userId!;
    name = sm.companyName!;
    mail = sm.user?.mail ?? "";
    phone = sm.user?.phone ?? "";
    image = sm.user?.imagePath ?? "";
    role = sm.user?.role?.name ?? "";
    score = sm.score!;
    addressId = sm.addressId!;
    token = tkn;
  }
}