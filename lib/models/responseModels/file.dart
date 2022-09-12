class FileModel {
  int? id;
  int? customerId;
  bool? private;
  String? filePath;
  String? folderId;
  String? createdDate;

  FileModel(
      {this.id,
      this.customerId,
      this.private,
      this.filePath,
      this.folderId,
      this.createdDate});

  FileModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    customerId = json['CustomerId'];
    private = json['Private'];
    filePath = json['FilePath'];
    folderId = json['FolderId'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CustomerId'] = customerId;
    data['Private'] = private;
    data['FilePath'] = filePath;
    data['FolderId'] = folderId;
    data['CreatedDate'] = createdDate;
    return data;
  }
}
