import 'package:help_me_decide/enums/activity_type.dart';

ActivityType getActivityTypeFromString(String activity) {
    activity = 'ActivityType.$activity';
    return ActivityType.values.firstWhere((f)=> f.toString() == activity, orElse: () => null);
}