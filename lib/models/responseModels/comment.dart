class CommentModel {
  int? id;
  int? customerId;
  int? stationeryId;
  String? content;
  String? createdDate;
  int? score;

  CommentModel(
      {this.id,
      this.customerId,
      this.stationeryId,
      this.content,
      this.createdDate,
      this.score});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    customerId = json['CustomerId'];
    stationeryId = json['StationeryId'];
    content = json['Content'];
    createdDate = json['CreatedDate'];
    score = json['Score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CustomerId'] = customerId;
    data['StationeryId'] = stationeryId;
    data['Content'] = content;
    data['CreatedDate'] = createdDate;
    data['Score'] = score;
    return data;
  }
}
