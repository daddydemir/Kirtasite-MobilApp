import 'package:kirtasite/models/responseModels/user.dart';

class CustomerModel {
  int? userId;
  String? username;
  UserModel? user;

  CustomerModel({this.userId, this.username, this.user});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    username = json['Username'];
    user = json['User'] != null ? UserModel.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['Username'] = username;
    if(user != null){
      data['User'] = user!.toJson();
    }
    return data;
  }
}
