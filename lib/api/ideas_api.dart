import 'dart:convert';

import 'package:help_me_decide/models/idea.dart';
import 'package:http/http.dart' as http;

class IdeasApi {
  Future<Idea> getIdea() async {
    final idea = await http.get("https://www.boredapi.com/api/activity");
    if (idea.statusCode == 200) {
      final jsonResponse = json.decode(idea.body);
      Idea _idea = Idea(jsonResponse["activity"], jsonResponse["price"].toDouble(), jsonResponse["participants"]);
      return _idea;
    }
    return Idea.empty();
  }
}

IdeasApi api = IdeasApi();
