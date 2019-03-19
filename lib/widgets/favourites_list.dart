import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/favourites_bloc.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:help_me_decide/widgets/favourite_widget.dart';

class FavouritesList extends StatelessWidget {
  const FavouritesList({
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
          return snapshot.data == null || snapshot.data.length == 0
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Icon(Icons.favorite_border),
                      Text("No Favourites to Show")
                    ]))
              : ListView.builder(
                  itemCount:
                      snapshot.data != null ? snapshot.data.length : 0,
                  itemBuilder: (context, i) {
                    final favourite = snapshot.data[i];
                    return FavouriteWidget(
                          favourite: favourite,
                          favouritesBloc: _favouritesBloc);
                  });
        });
  }
}