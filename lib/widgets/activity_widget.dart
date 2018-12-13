import 'package:flutter/material.dart';
import 'package:help_me_decide/enums/activity_type.dart';

Icon getIconForActivityType(ActivityType type, double size) {
    switch (type) {
      case ActivityType.busywork:
        return Icon(Icons.calendar_today, size: size);
      case ActivityType.charity:
        return Icon(Icons.pan_tool, size: size);
      case ActivityType.cooking:
        return Icon(Icons.fastfood, size: size);
      case ActivityType.diy:
        return Icon(Icons.format_paint, size: size);
      case ActivityType.education:
        return Icon(Icons.school, size: size);
      case ActivityType.music:
        return Icon(Icons.music_note, size: size);
      case ActivityType.recreational:
        return Icon(Icons.rowing, size: size);
      case ActivityType.relaxation:
        return Icon(Icons.airline_seat_recline_extra, size: size);
      case ActivityType.social:
        return Icon(Icons.games, size: size);
      case ActivityType.anything:
        return Icon(Icons.do_not_disturb, size: size);
    }
  }