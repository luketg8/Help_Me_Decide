import 'dart:async';
import 'package:help_me_decide/api/favourites.dart';
import 'package:help_me_decide/api/ideas_api.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/models/idea.dart';

class IdeaBloc implements BlocBase{
  Idea _idea;

  // Streams to handle the idea
  StreamController<Idea> _ideaController = StreamController<Idea>.broadcast();
  Sink<Idea> get _inIdea => _ideaController.sink;
  Stream<Idea> get outIdea => _ideaController.stream;

  IdeaBloc(){
    api.getIdea().then((idea){
      _idea = idea;
      _inIdea.add(_idea);
    });
  }

  @override
  void dispose() {
    _ideaController.close();
  }

  void getNewIdea(){
    _inIdea.add(null);
    api.getIdea().then((idea){
      _idea = idea;
      _inIdea.add(_idea);
    });
  }

  void favourite(){
    _inIdea.add(null);
    favouritesApi.saveData(_idea);
    _inIdea.add(_idea);
  }
}