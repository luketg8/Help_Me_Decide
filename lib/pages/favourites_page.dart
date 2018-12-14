import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/blocs/favourites_bloc.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:help_me_decide/widgets/favourite_widget.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    final FavouritesBloc _favouritesBloc =
        BlocProvider.of<FavouritesBloc>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Favourites")),
        body: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: StreamBuilder<List<Idea>>(
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
                })));
  }
}
