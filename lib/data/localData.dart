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

  Future<void> CreateDatabase(Database db , int version) async{
    await db.execute("create table Models(id integer,name text,image_path text,mail text,phone text,role text , token text)");
  }

  Future InsertData(DatabaseModel dbmodel) async{
    var db = await DB;
    var result =  await db?.rawInsert("insert into Models(id , name, image_path , mail , phone , role , token) values (?,?,?,?,?,?,?)" , [
      dbmodel.id, dbmodel.name, dbmodel.image,dbmodel.mail,dbmodel.phone,dbmodel.role,dbmodel.token
    ]);
    return result;
  }

  Future DeleteData(int dataId ) async{
    var db =  await DB;
    var result =  await db?.rawDelete("delete from Models where id = $dataId");
    return result;
  }
}