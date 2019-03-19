import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/favourites_bloc.dart';
import 'package:help_me_decide/models/idea.dart';

class FavouriteOptions extends StatelessWidget {
  const FavouriteOptions({
    Key key,
    @required FavouritesBloc favouritesBloc,
    @required this.favourite,
  })  : _favouritesBloc = favouritesBloc,
        super(key: key);

  final FavouritesBloc _favouritesBloc;
  final Idea favourite;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      IconButton(
          tooltip: "Schedule Activity",
          iconSize: 32,
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2018),
                lastDate: DateTime(2101));
          }),
      IconButton(
          tooltip: "Mark as Done",
          iconSize: 32,
          color: Colors.green,
          icon: Icon(Icons.done),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds: 500),
              content: Text(
                "Marked as Done!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              backgroundColor: Theme.of(context).primaryColorLight,
            ));
            _favouritesBloc.markIdeaAsDone(favourite);
          })
    ]);
  }
}