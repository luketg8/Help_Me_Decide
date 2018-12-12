import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/idea_bloc.dart';
import 'package:help_me_decide/enums/acitivity_type.dart';
import 'package:help_me_decide/models/idea.dart';
import 'package:help_me_decide/widgets/activity_widget.dart';
import 'package:help_me_decide/widgets/price_widget.dart';

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
            ? Icon(Icons.lightbulb_outline, color: Colors.grey, size: 100)
            : Dismissible(
                key: Key(snapshot.data.description),
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Card(
                              child: Column(children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                                child: getIconForActivityType(
                                    snapshot.data.activityType, 50.0)),
                            Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 100,
                                  child: Text('${snapshot.data.description}',
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    )))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                getPriceIndicator(snapshot.data.cost),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.people)),
                                    Text(
                                        snapshot.data.numberOfPeople.toString(),
                                        style: TextStyle(color: Colors.black54))
                                  ],
                                )),
                            card_options(context)
                          ])))
                    ])),
                onDismissed: (DismissDirection direction) {
                  ideaBloc.getNewIdea();
                  if (direction == DismissDirection.startToEnd) {
                    favourite_snackbar(context);
                  } else {}
                });
      },
    );
  }

  ButtonTheme card_options(BuildContext context) {
    return ButtonTheme.bar(
        child: ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.delete, color: Colors.black),
          onPressed: () {
            ideaBloc.getNewIdea();
          },
        ),
        IconButton(
          alignment: Alignment.bottomRight,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onPressed: () {
            ideaBloc.favourite();
            ideaBloc.getNewIdea();
            favourite_snackbar(context);
          },
        )
      ],
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> favourite_snackbar(
      BuildContext context) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 250),
      content:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.favorite)),
        Text(
          "Favourite Added",
          textAlign: TextAlign.center,
        )
      ]),
      backgroundColor: Colors.red,
    ));
  }
}
