import 'package:flutter/material.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:help_me_decide/widgets/activity_widget.dart';

class IdeaIcon extends StatelessWidget {
  const IdeaIcon({
    Key key,
    @required this.snapshot,
    @required this.size
  }) : super(key: key);

  final Idea snapshot;
  final double size;

  @override
  Widget build(BuildContext context) {
    return getIconForActivityType(snapshot.activityType, size);
  }
}