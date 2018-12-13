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

  String description;
  double cost;
  int numberOfPeople;
  ActivityType activityType;
}