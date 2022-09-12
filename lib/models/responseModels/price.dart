class PriceModel {
  int? id;
  int? stationeryId;
  String? info;
  double? price;

  PriceModel({this.id, this.stationeryId, this.info, this.price});

  PriceModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    stationeryId = json['StationeryId'];
    info = json['Info'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['StationeryId'] = stationeryId;
    data['Info'] = info;
    data['Price'] = price;
    return data;
  }
}
