import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/idea_bloc.dart';
import 'package:help_me_decide/models/idea.dart';

class IdeaWidget extends StatelessWidget {
  const IdeaWidget({
    Key key,
    @required this.ideaBloc,
  }) : super(key: key);

  final IdeaBloc ideaBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Idea>(
      stream: ideaBloc.outIdea,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<Idea> snapshot) {
        return snapshot.data == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    new Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        height: 250,
                        decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.blueAccent)),
                        child: Column(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('${snapshot.data.description}',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.attach_money),
                              Text('${snapshot.data.cost}/1',
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.people),
                                  Text(snapshot.data.numberOfPeople.toString(),
                                      style: TextStyle(color: Colors.grey))
                                ],
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.delete_outline,
                                    color: Colors.black54),
                                onPressed: () {
                                  ideaBloc.getNewIdea();
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  ideaBloc.getNewIdea();
                                },
                              )
                            ],
                          )
                        ]))
                  ]);
      },
    );
  }
}
