import 'dart:async';

import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/enums/activity_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBloc implements BlocBase{
  // Streams to handle the number of people
  StreamController<int> _numberOfPeopleController = StreamController<int>();
  Sink<int> get _inNumberOfPeople => _numberOfPeopleController.sink;
  Stream<int> get outNumberOfPeople => _numberOfPeopleController.stream;

  // Streams to handle the price
  StreamController<double> _priceController = StreamController<double>();
  Sink<double> get _inPrice => _priceController.sink;
  Stream<double> get outPrice => _priceController.stream;

  // Streams to handle the activity type
  StreamController<ActivityType> _activityController = StreamController<ActivityType>();
  Sink<ActivityType> get _inActivity => _activityController.sink;
  Stream<ActivityType> get outActivity => _activityController.stream;


  SettingsBloc(){
    //get initial data from shared preferences
    getInitialValues();
  }

  @override
  void dispose() {
    _numberOfPeopleController.close();
    _priceController.close();
  }

  void getInitialValues() async {
    var prefs = await SharedPreferences.getInstance();
    var price = prefs.getDouble("price");
    if (price != null)
    {
      _inPrice.add(price);
    }
    var numOfPeople = prefs.getInt("numOfPeople");
    if (numOfPeople != null)
    {
      _inNumberOfPeople.add(numOfPeople);
    }
  }

  void changeNumberOfPeople(int value) async {
    (await SharedPreferences.getInstance()).setInt("numOfPeople", value);
    _inNumberOfPeople.add(value);
  }

  void changePrice(double value) async {
    (await SharedPreferences.getInstance()).setDouble("price", value);
    _inPrice.add(value);
  }

  void changeActivity(ActivityType value){
    _inActivity.add(value);
  }
}