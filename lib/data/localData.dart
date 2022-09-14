// ignore_for_file: file_names, non_constant_identifier_names

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/databaseModel.dart';

class LocalData {
  Database? database;

  Future<Database?> get DB async{
    database ??= await initDatabase();
    return database;
  }

  Future<Database> initDatabase() async{
    String databasePath = join( await getDatabasesPath() , "kirtasite.db");
    var kirtasiteDatabase = await openDatabase(databasePath , version:1, onCreate:CreateDatabase);
    return kirtasiteDatabase;
  }

  Future checkData(int sayi) async {
    var db = await DB;
    var maps = await db!.query("Models" , columns:["userId"] , where:"userId = ?", whereArgs:[sayi]);
    if(maps.isNotEmpty){
      return false;
    }else{
      return true;
    } 
  }

  Future<List<DatabaseModel>> getData() async {
    var db = await DB;
    var result = await db?.query("Models");
    return List.generate(result!.length , (i) {
      // this method updating will be need
      // DatbaseModel => CustomerModel || StationeryModel casting 
      Map data = result[i];
      if(data["role"] == "CUSTOMER"){
        return DatabaseModel.fromObjectToCustomer(result[i]);
      }else{
      return DatabaseModel.fromObjectToStationery(result[i]);
      }
    });
  }

  Future<void> CreateDatabase(Database db , int version) async{
    await db.execute("create table Models(userId integer,name text,image_path text,mail text,phone text,role text , token text, score integer, addressId integer)");
  }

  Future InsertData(DatabaseModel dbmodel) async{
    var db = await DB;
    bool status = await checkData(dbmodel.id);
    if(!status){
      await DeleteData(dbmodel.id);
    }
    var result =  await db?.rawInsert("insert into Models(userId , name, image_path , mail , phone , role , token, score, addressId) values (?,?,?,?,?,?,?,?,?)" , [
      dbmodel.id, dbmodel.name, dbmodel.image,dbmodel.mail,dbmodel.phone,dbmodel.role,dbmodel.token, dbmodel.score, dbmodel.addressId
    ]);
    return result;
  }

  Future DeleteData(int dataId ) async{
    var db =  await DB;
    var result =  await db?.rawDelete("delete from Models where userId = $dataId");
    return result;
  }
}