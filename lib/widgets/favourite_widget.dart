import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/favourites_bloc.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:help_me_decide/widgets/activity_icon.dart';
import 'package:help_me_decide/widgets/favourite_options.dart';
import 'package:help_me_decide/widgets/people_icon.dart';
import 'package:help_me_decide/widgets/price_icon.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    Key key,
    @required this.favourite,
    @required FavouritesBloc favouritesBloc,
  })  : _favouritesBloc = favouritesBloc,
        super(key: key);

  final Idea favourite;
  final FavouritesBloc _favouritesBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          ExpansionTile(
              children: <Widget>[
                PeopleIcon(snapshot: favourite, size: 24.0),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                PriceIcon(cost: favourite.cost, size: 24.0),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                FavouriteOptions(
                    favouritesBloc: _favouritesBloc, favourite: favourite)
              ],
              title: Row(children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ActivityIcon(type: favourite.activityType, size: 20)),
                Flexible(
                    child: Text('${favourite.description}', softWrap: true))
              ])),
        ]));
  }
}
