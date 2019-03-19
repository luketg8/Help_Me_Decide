import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/blocs/favourites_bloc.dart';
import 'package:help_me_decide/widgets/favourites_list.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    final FavouritesBloc _favouritesBloc =
        BlocProvider.of<FavouritesBloc>(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text("Favourites"),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.favorite)),
                  Tab(icon: Icon(Icons.done))
                ],
              )),
          body: TabBarView(
            children: <Widget>[FavouritesList(favouritesBloc: _favouritesBloc)],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.calendar_today),
            onPressed: (){},
            tooltip: "View Calendar",
          ),
        ));
  }
}
