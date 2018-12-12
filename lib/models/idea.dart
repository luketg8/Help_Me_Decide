import 'package:help_me_decide/enums/activity_type.dart';

class Idea{
  Idea(this.description, this.cost, this.numberOfPeople, this.activityType, this.link){
    this.favourited = false;
  }
  Idea.empty(){
    this.description = "";
    this.cost = 0.0;
    this.numberOfPeople = 1;
    this.activityType = ActivityType.social;
    this.favourited = false;
  }

  String description;
  String link;
  double cost;
  int numberOfPeople;
  ActivityType activityType;
  bool favourited;
}