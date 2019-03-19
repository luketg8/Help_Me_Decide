import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/favourites_bloc.dart';
import 'package:help_me_decide/models/idea.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({
    Key key,
    @required FavouritesBloc favouritesBloc,
  }) : _favouritesBloc = favouritesBloc, super(key: key);

  final FavouritesBloc _favouritesBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Idea>>(
        stream: _favouritesBloc.outIdea,
        initialData: null,
        builder:
        (BuildContext context, AsyncSnapshot<List<Idea>> snapshot) {
        }
    );
  }
}