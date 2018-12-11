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
        body: StreamBuilder<Idea>(
            stream: _favouritesBloc.outIdea,
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot<Idea> snapshot) {
              return snapshot.data == null
                  ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Icon(Icons.favorite_border),
                        Text("No Favourites to Show")
                      ]))
                  : Dismissible(
                      key: Key(snapshot.data.description),
                      child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[ Text('${snapshot.data.description}',
                              softWrap: true),
                              Icon(Icons.done,)
                              ])),
                      onDismissed: (direction) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Removed ${snapshot.data.description} from favourites')));
                      },
                      // Show a red background as the item is swiped away
                      background: Icon(Icons.delete, color: Colors.red),
                    );
            }));
  }
}
