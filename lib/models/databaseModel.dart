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
    var data = m["data"];
    id = int.tryParse(data["Id"].toString())!;
    name = data["Username"]; // user ve stationery için farklı olacak 
    mail = data["Mail"];
    phone = data["Phone"];
    image = data["Image"];
    role = data["Role"];
    // şimdilik bu şekilde çalışıyor    
  }
}