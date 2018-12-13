import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/favourites_bloc.dart';
import 'package:help_me_decide/models/idea.dart';

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
        height: 75,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${favourite.description}', softWrap: true),
                    Row(children: <Widget>[
                      IconButton(
                          color: Colors.green,
                          icon: Icon(Icons.done),
                          onPressed: () {
                            _favouritesBloc.deleteIdea(favourite);
                          }),
                      IconButton(
                          color: Colors.red,
                          icon: Icon(Icons.delete_forever),
                          onPressed: () {
                            _favouritesBloc.deleteIdea(favourite);
                          })
                    ]),
                  ])
            ]));
  }
}
