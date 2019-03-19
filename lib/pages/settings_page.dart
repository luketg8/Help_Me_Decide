import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/blocs/settings_bloc.dart';
import 'package:help_me_decide/enums/activity_type.dart';
import 'package:help_me_decide/widgets/activity_icon.dart';
import 'package:help_me_decide/widgets/price_icon.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int current_step = 0;
  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings Page')
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                      Text("Idea Preferences", style: TextStyle(fontSize: 25))),
              Stepper(
                onStepContinue: () {
                  if (current_step < 2) {
                    setState(() {
                      current_step++;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                },
                onStepTapped: (step) {
                  setState(() {
                    current_step = step;
                  });
                },
                onStepCancel: () {},
                steps: settings_steps(settingsBloc),
                currentStep: current_step,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context);
            }));
  }

  List<Step> settings_steps(SettingsBloc settingsBloc) {
    return <Step>[
      Step(
          isActive: true,
          title: Text("Number of people"),
          content: StreamBuilder<int>(
            stream: settingsBloc.outNumberOfPeople,
            initialData: 1,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Column(children: <Widget>[
                Text(snapshot.data.toString()),
                Slider(
                    onChanged: (value) {
                      settingsBloc.changeNumberOfPeople(value.toInt());
                    },
                    divisions: 7,
                    min: 1,
                    value: snapshot.data.toDouble(),
                    max: 8)
              ]);
            },
          )),
      Step(
          isActive: true,
          title: Text("How much do you want to spend?"),
          content: StreamBuilder<double>(
              stream: settingsBloc.outPrice,
              initialData: 0,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                return Column(children: <Widget>[
                  PriceIcon(cost: snapshot.data, size: 25),
                  Slider(
                      onChanged: (value) {
                        settingsBloc.changePrice(value);
                      },
                      value: snapshot.data,
                      divisions: 4,
                      max: 1.0)
                ]);
              })),
      Step(
          isActive: true,
          title: Text("Activity"),
          content: StreamBuilder<ActivityType>(
              stream: settingsBloc.outActivity,
              initialData: ActivityType.anything,
              builder:
                  (BuildContext context, AsyncSnapshot<ActivityType> snapshot) {
                return DropdownButton<ActivityType>(
                  value: snapshot.data,
                  items: <ActivityType>[
                    ActivityType.anything,
                    ActivityType.busywork,
                    ActivityType.charity,
                    ActivityType.cooking,
                    ActivityType.diy,
                    ActivityType.education,
                    ActivityType.music,
                    ActivityType.recreational,
                    ActivityType.relaxation,
                    ActivityType.social
                  ].map((ActivityType value) {
                    return DropdownMenuItem<ActivityType>(
                      value: value,
                      child: activity_indicator(value),
                    );
                  }).toList(),
                  onChanged: (_) {
                    settingsBloc.changeActivity(_);
                  },
                );
              })),
    ];
  }

  Row activity_indicator(ActivityType value) {
    return Row(children: <Widget>[
      Padding(
          padding: EdgeInsets.all(8.0),
          child: ActivityIcon(type: value, size:20.0)),
      Text(value.toString().split('.')[1])
    ]);
  }
}
