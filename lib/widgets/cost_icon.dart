import 'package:flutter/material.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:help_me_decide/widgets/price_widget.dart';

class CostIcon extends StatelessWidget {
  const CostIcon({
    Key key,
    @required this.snapshot,
  }) : super(key: key);

  final Idea snapshot;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        getPriceIndicator(snapshot.cost),
      ],
    );
  }
}
