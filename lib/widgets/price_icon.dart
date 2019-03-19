import 'package:flutter/material.dart';

class PriceIcon extends StatelessWidget {
  const PriceIcon({Key key, @required this.cost, @required this.size})
      : super(key: key);

  final double cost;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (cost == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(Icons.do_not_disturb, size: size)],
      );
    }
    if (cost <= 0.25) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(Icons.attach_money, size: size)],
      );
    }
    if (cost <= 0.5) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.attach_money),
          Icon(Icons.attach_money, size: size)
        ],
      );
    }
    if (cost <= 0.75) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.attach_money, size: size),
          Icon(Icons.attach_money, size: size),
          Icon(Icons.attach_money, size: size)
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.attach_money, size: size),
        Icon(Icons.attach_money, size: size),
        Icon(Icons.attach_money, size: size),
        Icon(Icons.attach_money, size: size)
      ],
    );
  }
}
