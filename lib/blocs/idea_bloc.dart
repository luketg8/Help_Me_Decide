import 'dart:async';
import 'package:help_me_decide/api/ideas_api.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/models/idea.dart';

class IdeaBloc implements BlocBase{
  Idea _idea;

  // Streams to handle the idea
  StreamController<Idea> _ideaController = StreamController<Idea>.broadcast();
  Sink<Idea> get _inIdea => _ideaController.sink;
  Stream<Idea> get outIdea => _ideaController.stream;

  // Streams to handle the action on the idea
  StreamController<Idea> _updateIdeaController = StreamController();
  Sink<Idea> get updateIdea => _updateIdeaController.sink;


  IdeaBloc(){
    api.getIdea().then((idea){
      _idea = idea;
      _inIdea.add(_idea);
    });
    _updateIdeaController.stream.listen(_updateIdea);
  }

  @override
  void dispose() {
    _ideaController.close();
    _updateIdeaController.close();
  }

  void getNewIdea(){
    api.getIdea().then((idea){
      _idea = idea;
      _inIdea.add(_idea);
    });
  }

  void _updateIdea(Idea idea){
    _idea = idea;
    _inIdea.add(_idea);
  }
}