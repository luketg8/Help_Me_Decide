import 'package:help_me_decide/models/idea.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Favourites {
  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ideas.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
    "CREATE TABLE Favourite(id INTEGER PRIMARY KEY, description TEXT, cost DOUBLE, people INT, activityType TEXT )");
  }
  
  Future<Idea> getFavourites() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Favourite');
    return Idea.empty();
  }

  Future<bool> saveData(Idea idea) async {
    var dbClient = await db;
    dbClient.rawInsert(
      'INSERT INTO Favourite(description, cost, people, activityType) VALUES(?, ?, ?, ?)',
      [idea.description, idea.cost, idea.numberOfPeople, idea.activityType]);
    return true;
  }

  Future<bool> removeData(Idea idea) async {
    return true;
  }
}

Favourites favouritesApi = Favourites();
