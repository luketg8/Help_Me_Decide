import 'package:help_me_decide/models/idea.dart';
import 'package:sqflite/sqflite.dart';

class Favourites {
  Future<Idea> getIdea() async {
    return Idea.empty();
  }
}

Favourites api = Favourites();
