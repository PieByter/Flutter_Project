import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'user.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY,username TEXT,email TEXT,password TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<int> register(
    String username,
    String email,
    String password,
  ) async {
    final db = await DBHelper.initDB();
    return db.insert('users', {
      'username': username,
      'email': email,
      'password': password,
    });
  }

  static Future<Map<String, dynamic>?> login(
    String email,
    String password,
  ) async {
    final db = await initDB();
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) return result.first;
    return null;
  }
}
