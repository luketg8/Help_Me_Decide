import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/blocs/idea_bloc.dart';
import 'package:help_me_decide/pages/idea_page.dart';

void main() => runApp(HelpMeDecideApp());

class HelpMeDecideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help Me Decide',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Color.fromRGBO(26,83,92,1.0),
        backgroundColor: Color.fromRGBO(247,255,247,1.0),
        cardColor: Color.fromRGBO(255,230,109,1.0)
      ),
      home: BlocProvider(bloc: IdeaBloc(), child: IdeaPage()),
    );
  }
}