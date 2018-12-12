import 'dart:convert';

import 'package:help_me_decide/enums/acitivity_type.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:http/http.dart' as http;

class IdeasApi {
  Future<Idea> getIdea() async {
    final idea = await http.get("https://www.boredapi.com/api/activity");
    if (idea.statusCode == 200) {
      final jsonResponse = json.decode(idea.body);
      ActivityType activityType = getActivityTypeFromString(jsonResponse["type"]);
      Idea _idea = Idea(jsonResponse["activity"], jsonResponse["price"].toDouble(), jsonResponse["participants"], activityType);
      return _idea;
    }
    return Idea.empty();
  }

  ActivityType getActivityTypeFromString(String activity) {
    activity = 'ActivityType.$activity';
    return ActivityType.values.firstWhere((f)=> f.toString() == activity, orElse: () => null);
}
}

IdeasApi api = IdeasApi();
