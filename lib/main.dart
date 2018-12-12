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
        primarySwatch: Colors.teal,
        cardColor: Colors.blue.shade200
      ),
      home: BlocProvider(bloc: IdeaBloc(), child: IdeaPage()),
    );
  }
}