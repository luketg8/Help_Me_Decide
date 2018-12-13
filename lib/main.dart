import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/blocs/idea_bloc.dart';
import 'package:help_me_decide/pages/idea_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(HelpMeDecideApp());
  });
}

class HelpMeDecideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help Me Decide',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Color.fromRGBO(244, 244, 244, 1.0)),
      home: BlocProvider(bloc: IdeaBloc(), child: IdeaPage()),
    );
  }
}
