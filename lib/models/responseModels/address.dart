class AddressModel {
  int? id;
  int? cityId;
  int? districtId;
  String? header;
  String? x;
  String? y;

  AddressModel(
      {this.id, this.cityId, this.districtId, this.header, this.x, this.y});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    cityId = json['CityId'];
    districtId = json['DistrictId'];
    header = json['Header'];
    x = json['X'];
    y = json['Y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Id'] = id;
    data['CityId'] = cityId;
    data['DistrictId'] = districtId;
    data['Header'] = header;
    data['X'] = x;
    data['Y'] = y;
    return data;
  }
}
