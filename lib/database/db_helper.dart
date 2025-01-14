import 'package:flutter/material.dart';
import 'package:hrd_task_app/database/db_constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../features/posts/model/post_model.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  factory DbHelper() => _instance;
  DbHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    debugPrint('--Database Initilize--');
    if (_database != null) return _database!;
    _database = await _createDatabase();
    return _database!;
  }

  Future<Database> _createDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DbConstant.databaseName);

    return await openDatabase(
      path,
      version: 1, // Increment the version here to ensure upgrade happens
      onCreate: (db, version) async {
        debugPrint('Creating database version $version');
        await _createPostsTable(db);
      },
    );
  }

  //--------Create-Posts-Table--------
  Future<void> _createPostsTable(Database db) async {
    await db.execute(
      '''
          CREATE TABLE ${DbConstant.tablePosts} (
            ${DbConstant.columnId} INTEGER PRIMARY KEY,
            ${DbConstant.columnUserId} INTEGER,
            ${DbConstant.columnTitle} TEXT,
            ${DbConstant.columnBody} TEXT
          )
      ''',
    );
  }

  Future<void> insertPosts(List<PostModel> posts) async {
    final db = await database;
    for (var post in posts) {
      await db.insert(
        DbConstant.tablePosts,
        post.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<PostModel>> getPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(DbConstant.tablePosts);
    return maps.map((map) => PostModel.fromJson(map)).toList();
  }
}
