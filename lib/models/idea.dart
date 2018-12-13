import 'package:help_me_decide/enums/activity_helper.dart';
import 'package:help_me_decide/enums/activity_type.dart';

class Idea{
  Idea(this.description, this.cost, this.numberOfPeople, this.activityType){
  }
  Idea.empty(){
    this.description = "No ideas match your current settings";
    this.cost = 0.0;
    this.numberOfPeople = 0;
    this.activityType = ActivityType.anything;
  }
  
  Idea.fromMap(Map<String, dynamic> map) {
    description = map["description"];
    cost = map["cost"];
    numberOfPeople = map["people"];
    activityType = getActivityTypeFromString(map["activityType"]);
  }

  String description;
  double cost;
  int numberOfPeople;
  ActivityType activityType;
}