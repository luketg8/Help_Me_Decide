import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/idea_bloc.dart';
import 'package:help_me_decide/enums/activity_type.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:help_me_decide/widgets/activity_icon.dart';
import 'package:help_me_decide/widgets/people_icon.dart';
import 'package:help_me_decide/widgets/price_icon.dart';

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
        return Column(children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Dismissible(
                  key: Key(snapshot.data.toString()),
                  child: Padding(
                      padding:
                          EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                      child: snapshot.data == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                  IconButton(
                                      iconSize: 100,
                                      onPressed: () {
                                        ideaBloc.getNewIdea();
                                      },
                                      icon: Icon(Icons.lightbulb_outline),
                                      color: Colors.grey),
                                  Text("Powered by http://www.boredapi.com/",
                                      textAlign: TextAlign.end)
                                ])
                          : idea_card(context, snapshot)),
                  onDismissed: (DismissDirection direction) {
                    ideaBloc.getNewIdea();
                    if (snapshot.data == null ||
                        snapshot.data.activityType == ActivityType.anything) {
                      return;
                    }
                    if (direction == DismissDirection.startToEnd) {
                      ideaBloc.favourite();
                      ideaBloc.getNewIdea();
                      favourite_snackbar(context);
                    } else {}
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                iconSize: 50,
                disabledColor: Colors.grey,
                color: Colors.black,
                icon: Icon(Icons.delete),
                onPressed: snapshot.data == null ||
                        snapshot.data.activityType == ActivityType.anything
                    ? null
                    : () {
                        ideaBloc.getNewIdea();
                      },
              ),
              IconButton(
                iconSize: 50,
                alignment: Alignment.bottomRight,
                disabledColor: Colors.grey,
                color: Colors.red,
                icon: Icon(
                  Icons.favorite,
                ),
                onPressed: snapshot.data == null ||
                        snapshot.data.activityType == ActivityType.anything
                    ? null
                    : () {
                        ideaBloc.favourite();
                        ideaBloc.getNewIdea();
                        favourite_snackbar(context);
                      },
              )
            ],
          )
        ]);
      },
    );
  }

  Card idea_card(BuildContext context, AsyncSnapshot<Idea> snapshot) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.all(0.0),
        child: Column(children: <Widget>[
          Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height) *
                      0.05),
          ActivityIcon(
              type: snapshot.data.activityType,
              size: MediaQuery.of(context).size.height * 0.05),
          description_section(snapshot.data),
          Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height) *
                      0.05),
          PriceIcon(
              cost: snapshot.data.cost,
              size: MediaQuery.of(context).size.height * 0.05),
          Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height) *
                      0.05),
          PeopleIcon(
              snapshot: snapshot.data,
              size: MediaQuery.of(context).size.height * 0.05)
        ]));
  }

  Container description_section(Idea snapshot) {
    return Container(
        alignment: Alignment.center,
        height: 100,
        child: Text('${snapshot.description}',
            softWrap: true,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            )));
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> favourite_snackbar(
    BuildContext context) {
  return Scaffold.of(context).showSnackBar(SnackBar(
    duration: Duration(milliseconds: 500),
    content:
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.favorite,
            color: Colors.black54,
          )),
      Text(
        "Favourite Added",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black54),
      )
    ]),
    backgroundColor: Theme.of(context).primaryColorLight,
  ));
}
