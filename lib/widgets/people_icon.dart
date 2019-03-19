import 'package:flutter/material.dart';
import 'package:help_me_decide/models/idea.dart';

class PeopleIcon extends StatelessWidget {
  const PeopleIcon({
    Key key,
    @required this.snapshot,
    @required this.size
  }) : super(key: key);

  final Idea snapshot;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.people, size: size)),
        Text(snapshot.numberOfPeople.toString())
      ],
    );
  }
}