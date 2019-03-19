import 'dart:convert';
import 'package:help_me_decide/enums/activity_helper.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IdeasApi {
  Future<Idea> getIdea() async {
    var prefs = await SharedPreferences.getInstance();
    var idea;

    //if activity is 'anything' then don't make a request including it
    var activity = prefs.get("activity");
    if (activity != null && activity != "anything") {
      idea = await http.get(
          "https://www.boredapi.com/api/activity?minprice=${prefs.getDouble("price")}&participants=${prefs.getInt("numOfPeople")}&type=${prefs.get("activity")}");
    } else {
      idea = await http.get(
          "https://www.boredapi.com/api/activity?minprice=${prefs.getDouble("price")}&participants=${prefs.getInt("numOfPeople")}");
    }
    if (idea.statusCode == 200) {
      final jsonResponse = json.decode(idea.body);

      if (jsonResponse["error"] != null) {
        return Idea.empty();
      }
      
      return Idea(
          jsonResponse["activity"],
          jsonResponse["price"].toDouble(),
          jsonResponse["participants"],
          getActivityTypeFromString(jsonResponse["type"]));
    }
    return Idea.empty();
  }
}

IdeasApi api = IdeasApi();
