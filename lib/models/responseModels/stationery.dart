class StationeryModel {
  int? userId;
  int? addressId;
  String? companyName;
  double? score;

  StationeryModel({this.userId, this.addressId, this.companyName, this.score});

  StationeryModel.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    addressId = json['AddressId'];
    companyName = json['CompanyName'];
    score = json['Score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['AddressId'] = addressId;
    data['CompanyName'] = companyName;
    data['Score'] = score;
    return data;
  }
}
