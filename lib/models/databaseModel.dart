// ignore_for_file: file_names, non_constant_identifier_names

class DatabaseModel{
  late int id;
  late String name;
  late String mail;
  late String phone;
  late String image;
  late String role;
  late String token;

  DatabaseModel.Empty();

  DatabaseModel({
    required this.id,
    required this.name,
    required this.mail,
    required this.phone,
    required this.image,
    required this.role,
    required this.token
  });

  DatabaseModel.fromObject(dynamic d){
    id = d["id"];
    name = d["username"]; // user ve stationery için farklı olacak 
    mail = d["mail"];
    phone = d["phone"];
    image = d["image_path"];
    role = d["role_id"]; // ilerleyen zamanalarda güncellenecek
    token = d["token"];
  }

  DatabaseModel.fromJson(Map m){
    token = m["token"];
    //m = m["data"];
    for(var i in m["data"]){
      id = i["id"];
    name = i["username"]; // user ve stationery için farklı olacak 
    mail = i["mail"];
    phone = m["tel_no"];
    image = m["image_path"];
    if(m["role_id"] == 2){
      role = "USER";
    }else{
      role = "STATIONERY";
    } // ilerleyen zamanalarda güncellenecek
    }
    
  }
}