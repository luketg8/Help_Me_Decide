import 'package:help_me_decide/enums/activity_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  final String _kPricePrefs = "price";
  final String _kNumberOfPeoplePrefs = "numOfPeople";
  final String _kActivityPrefs = "activity";

  /// ------------------------------------------------------------
  /// Save and set price preferences
  /// ------------------------------------------------------------
  Future<double> getPrice() async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();
  	return prefs.getDouble(_kPricePrefs) ?? 1.0;
  }

  Future<bool> setPrice(double value) async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();
  	return prefs.setDouble(_kPricePrefs, value);
  }

  /// ----------------------------------------------------------
  /// Save and set number of people preferences
  /// ----------------------------------------------------------
  Future<int> getNumOfPeople() async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();
  	return prefs.getInt(_kNumberOfPeoplePrefs) ?? 1;
  }

  Future<bool> setNumOfPeople(int value) async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();
  	return prefs.setInt(_kNumberOfPeoplePrefs, value);
  }

  /// ----------------------------------------------------------
  /// Save and set activity preferences
  /// ----------------------------------------------------------
  Future<ActivityType> getActivity() async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();
  	return prefs.get(_kActivityPrefs) ?? ActivityType.anything;
  }

  Future<bool> setActivity(ActivityType value) async {
	final SharedPreferences prefs = await SharedPreferences.getInstance();
  	return prefs.setString(_kActivityPrefs, value.toString());
  }
}