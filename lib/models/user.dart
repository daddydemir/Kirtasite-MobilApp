// ignore_for_file: non_constant_identifier_names

class User{
  late int id;
  late String username;
  late String password;
  late String image;
  late String mail;
  late String phone;

  User.Empty();

  User.fromObject(dynamic d){
    id = d["id"];
    username = d["username"];
    password = d["password"];
    image = d["image_path"];
    mail = d["mail"];
    phone = d["tel_no"];
  }

  User.fromJson(Map m){
    
  }
  
}