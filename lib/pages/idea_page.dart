import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/blocs/favourites_bloc.dart';
import 'package:help_me_decide/blocs/idea_bloc.dart';
import 'package:help_me_decide/blocs/settings_bloc.dart';
import 'package:help_me_decide/pages/favourites_page.dart';
import 'package:help_me_decide/pages/settings_page.dart';
import 'package:help_me_decide/widgets/idea_widget.dart';

class IdeaPage extends StatefulWidget {
  @override
  _IdeaPageState createState() => _IdeaPageState();
}

class _IdeaPageState extends State<IdeaPage> {
  @override
  Widget build(BuildContext context) {
    final IdeaBloc ideaBloc = BlocProvider.of<IdeaBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Ideas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          bloc: FavouritesBloc(), child: FavouritesPage())));
            },
          )
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            IdeaWidget(ideaBloc: ideaBloc),
            Container(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.teal.shade200,
                    child: Text("Too Expensive?"),
                    onPressed: (){},
                  ),
                  RaisedButton(
                    color: Colors.teal.shade200,
                    child: Text("Change Activity"),
                    onPressed: (){},
                  )
                ],
              )
            ),])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
          tooltip: "Settings",
          child: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        child: SettingsPage(), bloc: SettingsBloc())));
          }),
    );
  }
}
