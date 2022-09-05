import 'package:kirtasite/models/responseModels/role.dart';

class UserModel {
  int? id;
  int? roleId;
  String? password;
  String? imagePath;
  String? phone;
  String? mail;
  RoleModel? role;

  UserModel(
      {this.id,
      this.roleId,
      this.password,
      this.imagePath,
      this.phone,
      this.mail,
      this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    roleId = json['RoleId'];
    password = json['Password'];
    imagePath = json['ImagePath'];
    phone = json['Phone'];
    mail = json['Mail'];
    role = json['Role'] != null ? RoleModel.fromJson(json['Role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Id'] = id;
    data['RoleId'] = roleId;
    data['Password'] = password;
    data['ImagePath'] = imagePath;
    data['Phone'] = phone;
    data['Mail'] = mail;
    data["Role"] = role;
    return data;
  }
}
