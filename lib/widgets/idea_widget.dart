import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/idea_bloc.dart';
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
        return Column(children: <Widget>[
          Container(
              height: 400,
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
                          : idea_card(snapshot)),
                  onDismissed: (DismissDirection direction) {
                    ideaBloc.getNewIdea();
                    if (direction == DismissDirection.startToEnd) {
                      favourite_snackbar(context);
                    } else {}
                  })),
          card_options(context)
        ]);
      },
    );
  }

  Card idea_card(AsyncSnapshot<Idea> snapshot) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.all(0.0),
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.only(top:48.0),),
          idea_icon(snapshot),
          description_section(snapshot),
          Padding(padding: EdgeInsets.only(top:48.0),),
          cost_icon(snapshot),
          Padding(padding: EdgeInsets.only(top:48.0),),
          number_of_people_icon(snapshot)
        ]));
  }

  Row number_of_people_icon(AsyncSnapshot<Idea> snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 8.0), child: Icon(Icons.people)),
        Text(snapshot.data.numberOfPeople.toString())
      ],
    );
  }

  Row cost_icon(AsyncSnapshot<Idea> snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        getPriceIndicator(snapshot.data.cost),
      ],
    );
  }

  Icon idea_icon(AsyncSnapshot<Idea> snapshot) {
    return getIconForActivityType(snapshot.data.activityType, 50.0);
  }

  Container description_section(AsyncSnapshot<Idea> snapshot) {
    return Container(
        alignment: Alignment.center,
        height: 100,
        child: Text('${snapshot.data.description}',
            softWrap: true,
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            )));
  }

  ButtonTheme card_options(BuildContext context) {
    return ButtonTheme.bar(
        child: ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          iconSize: 50,
          icon: Icon(Icons.delete, color: Colors.black),
          onPressed: () {
            ideaBloc.getNewIdea();
          },
        ),
        IconButton(
          iconSize: 50,
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
}
