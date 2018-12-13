import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/blocs/favourites_bloc.dart';
import 'package:help_me_decide/models/idea.dart';

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
        appBar: AppBar(
          title: Text("Favourites"),
        ),
        body: StreamBuilder<List<Idea>>(
            stream: _favouritesBloc.outIdea,
            initialData: null,
            builder:
                (BuildContext context, AsyncSnapshot<List<Idea>> snapshot) {
              return snapshot.data == null
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
                        Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(children: <Widget>[
                              Text('${favourite.description}', softWrap: true),
                              Icon(
                                Icons.done,
                              )
                            ]));
                      });
            }));
  }
}
