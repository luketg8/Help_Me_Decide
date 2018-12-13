import 'dart:convert';

import 'package:help_me_decide/enums/activity_helper.dart';
import 'package:help_me_decide/enums/activity_type.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IdeasApi {
  Future<Idea> getIdea() async {
    var prefs = await SharedPreferences.getInstance();
    var idea;
    if (getActivityTypeFromString(prefs.get("activity")) !=
        ActivityType.anything) {
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

      ActivityType activityType =
          getActivityTypeFromString(jsonResponse["type"]);
      Idea _idea = Idea(
          jsonResponse["activity"],
          jsonResponse["price"].toDouble(),
          jsonResponse["participants"],
          activityType);
      return _idea;
    }
    return Idea.empty();
  }
}

IdeasApi api = IdeasApi();
