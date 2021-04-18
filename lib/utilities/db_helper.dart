import 'dart:io';
import 'package:flutter_app_alif/models/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  String tableName = "to_do_list_table";
  String id = "id";
  String title = "title";
  String description = "description";
  String status = "status";
  String date = "date";

  static DataBaseHelper _dataBaseHelper;

  DataBaseHelper._createInstance();

  factory DataBaseHelper() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = DataBaseHelper._createInstance();
    }
    return _dataBaseHelper;
  }

  Database _database; // singleton

  get database async {
    if (_database == null) {
      _database = await initalizeDatabase();
    }
    return _database;
  }

  Future<Database> initalizeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "my_todo_list_database.db";
    return await openDatabase(path, version: 1, onCreate: _create);
  }

  _create(Database database, int version) async {
    return await database.execute(
        "CREATE TABLE $tableName ($id INTEGER PRIMARY KEY AUTOINCREMENT , $title TEXT, $description TEXT, $status TEXT, $date TEXT )");
  }

  Future<int> insert(Model model) async {
    Database database = await this.database;
    var results = database.insert(tableName, model.toMap());
    print("Data Inserted");
    return results;
  }

  Future<List<Map<String, dynamic>>> getDatainMaps() async {
    Database database = await this.database;
    return database.query(tableName);
  }

  Future<List<Model>> getModelsFromMapList() async {
    List<Map<String, dynamic>> mapList = await getDatainMaps();

    List<Model> toDoListModel = [];

    for (int i = 0; i < mapList.length; i++) {
      toDoListModel.add(Model.fromMap(mapList[i]));
    }

    return toDoListModel;
  }

  Future<int> updateItem(Model toDoModel) async {
    Database database = await this.database;
    return database.update(tableName, toDoModel.toMap(),
        where: "$id = ? ", whereArgs: [toDoModel.id]);
  }

  Future<int> delete(Model toDoModel) async {
    Database database = await this.database;
    return database
        .delete(tableName, where: "$id = ? ", whereArgs: [toDoModel.id]);
  }
}
