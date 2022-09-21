import 'package:kirtasite/models/responseModels/address.dart';
import 'package:kirtasite/models/responseModels/user.dart';

class StationeryModel {
  int? userId;
  int? addressId;
  String? companyName;
  double? score;
  UserModel? user;
  AddressModel? address;

  StationeryModel({this.userId, this.addressId, this.companyName, this.score});

  StationeryModel.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    addressId = json['AddressId'];
    companyName = json['CompanyName'];
    score = json['Score'];
    user = json['User'] != null ? UserModel.fromJson(json['User']) : null;
    address = json['Address'] != null ? AddressModel.fromJson(json['Address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['AddressId'] = addressId;
    data['CompanyName'] = companyName;
    data['Score'] = score;
    if(user != null){
      data['User'] = user!.toJson();
    }
    if(address != null){
      data["Address"] = address!.toJson();
    }
    return data;
  }
}
