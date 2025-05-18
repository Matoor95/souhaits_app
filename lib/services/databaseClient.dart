import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:souhaits_app/Models/Article.dart';
import 'package:souhaits_app/Models/ItemList.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseClient {
  // on va avoir deux table
  //table 1 =>liste de mes envies. Ex listes informatique  (id , nom)
  // tbale 2 => listes des objects . un ps5 (nom, prix , magasin, image , id de la liste des envies )
  // INTEGER , TEXT, REAL
  // INTEGER PRIMARY KEY POUR ID UNIQUE
  // TEXT NOT NULL

  // POUR CREER UNE PAGE DE DONNEES ON DOIT ACCEDER A LA DATABASE

  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    return await createDatabase();
  }

  Future<Database> createDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'database.db');
    return await openDatabase(path, version: 1, onCreate: onCreate);
  }

  onCreate(Database database, int version) async {
    //table 1
    await database.execute('''
    CREATE TABLE list (
    id INTEGER PRIMARY KEY ,
    name TEXT NOT NULL

    )
    ''');
    await database.execute('''
    CREATE TABLE article (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    price REAL,
    shop TEXT,
    image TEXT,
    list INTEGER
    )
    ''');
  }

  // obtenir leds donnes des listes
  Future<List<ItemList>> allItems() async {
    Database db = await database;
    const query = " SELECT *  FROM list";
    List<Map<String, dynamic>> mapList = await db.rawQuery(query);
    return mapList.map((map) => ItemList.fromMap(map)).toList();
  }

  // obtenir la liste des aticles pour une listes
  Future<List<Article>> articleFrromId(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> mapList =
        await db.query('article', where: "list = ?", whereArgs: [id]);
    return mapList.map((map) => Article.fromMap(map)).toList();
  }

  // ajouter list
  Future<bool> addItemList(String text) async {
    Database db = await database;
    await db.insert('list', {"name": text});
    return true;
  }

  // ajouter un article
  Future<bool> upsert(Article article) async {
    Database db = await database;
    (article.id == null)
        ? article.id = await db.insert('article', article.toMap())
        : await db.update('article', article.toMap(),
            where: 'id= ?', whereArgs: [article.id]);
    return true;
  }

  Future<bool> removeItem(ItemList itemList) async {
    Database db = await database;
    await db.delete('list', where: 'id = ?', whereArgs: [itemList.id]);
    // supprimer tout les articles associes
    await db.delete('article', where: 'list = ?', whereArgs: [itemList.id]);
    return true;
  }
}
