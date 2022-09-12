class OrderModel {
  int? id;
  int? fileId;
  int? customerId;
  int? stationeryId;
  int? statusId;
  int? totalPrice;
  String? createdDate;
  String? deliveryDate;

  OrderModel(
      {this.id,
      this.fileId,
      this.customerId,
      this.stationeryId,
      this.statusId,
      this.totalPrice,
      this.createdDate,
      this.deliveryDate});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    fileId = json['FileId'];
    customerId = json['CustomerId'];
    stationeryId = json['StationeryId'];
    statusId = json['StatusId'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
    deliveryDate = json['DeliveryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['FileId'] = fileId;
    data['CustomerId'] = customerId;
    data['StationeryId'] = stationeryId;
    data['StatusId'] = statusId;
    data['TotalPrice'] = totalPrice;
    data['CreatedDate'] = createdDate;
    data['DeliveryDate'] = deliveryDate;
    return data;
  }
}
