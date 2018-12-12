import 'package:flutter/material.dart';

Row getPriceIndicator(double price) {
  if (price == 0) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Icon(Icons.do_not_disturb)],
    );
  }
  if (price <= 0.25) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Icon(Icons.attach_money)],
    );
  }
  if (price <= 0.5) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Icon(Icons.attach_money), Icon(Icons.attach_money)],
    );
  }
  if (price <= 0.75) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.attach_money),
        Icon(Icons.attach_money),
        Icon(Icons.attach_money)
      ],
    );
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(Icons.attach_money),
      Icon(Icons.attach_money),
      Icon(Icons.attach_money),
      Icon(Icons.attach_money)
    ],
  );
}
