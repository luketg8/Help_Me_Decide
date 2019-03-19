import 'dart:async';
import 'package:help_me_decide/api/favourites.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/models/idea.dart';

class FavouritesBloc implements BlocBase{
  List<Idea> _idea;

  // Streams to handle the idea
  StreamController<List<Idea>> _ideaController = StreamController<List<Idea>>.broadcast();
  Sink<List<Idea>> get _inIdea => _ideaController.sink;
  Stream<List<Idea>> get outIdea => _ideaController.stream;

  // Streams to handle the action on the idea
  StreamController<Idea> _updateIdeaController = StreamController();
  Sink<Idea> get updateIdea => _updateIdeaController.sink;

  FavouritesBloc(){
    refreshIdeas();
    _updateIdeaController.stream.listen(_updateIdea);
  }

  @override
  void dispose() {
    _ideaController.close();
    _updateIdeaController.close();
  }

  void refreshIdeas(){
    favouritesApi.getFavourites().then((idea){
      _idea = idea;
      _inIdea.add(_idea);
    });
  }

  void _updateIdea(Idea idea){
    _idea.add(idea);
    _inIdea.add(_idea);
  }

  void markIdeaAsDone(Idea idea){
    favouritesApi.markAsDone(idea);
    refreshIdeas();
  }

  void deleteIdea(Idea idea){
    favouritesApi.removeData(idea);
    refreshIdeas();
  }
}