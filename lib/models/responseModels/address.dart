import 'package:kirtasite/models/responseModels/city.dart';
import 'package:kirtasite/models/responseModels/district.dart';

class AddressModel {
  int? id;
  int? cityId;
  int? districtId;
  String? header;
  String? x;
  String? y;
  CityModel? city;
  DistrictModel? district;

  AddressModel(
      {this.id, this.cityId, this.districtId, this.header, this.x, this.y});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    cityId = json['CityId'];
    districtId = json['DistrictId'];
    header = json['Header'];
    x = json['X'];
    y = json['Y'];
    city = json['City'] != null ? CityModel.fromJson(json['City']) : null;
    district = json['District'] != null ? DistrictModel.fromJson(json['District']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Id'] = id;
    data['CityId'] = cityId;
    data['DistrictId'] = districtId;
    data['Header'] = header;
    data['X'] = x;
    data['Y'] = y;
    if(city != null){
      data['City'] = city!.toJson();
    }
    if(district != null){
      data['District'] = district!.toJson();
    }
    return data;
  }
}
