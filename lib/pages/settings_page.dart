import 'package:flutter/material.dart';
import 'package:help_me_decide/blocs/bloc_provider.dart';
import 'package:help_me_decide/blocs/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stepper(steps: <Step>[
              Step(
                title: Text("Number of people"),
                content: Slider(onChanged: (value) {}, value: 0.5, max: 1.0),
                state: StepState.complete
              ),
              Step(
                  title: Text("Expenditure"),
                  content: Column(children: <Widget>[
                    Text("How much do you want to spend?"),
                    Slider(onChanged: (value) {}, value: 0.5, max: 1.0)
                  ]),
                  state: StepState.complete),
              Step(
                  title: Text("Activity"),
                  content: Column(children: <Widget>[
                    Text("What type of activity?"),
                    DropdownButton<String>(
                      items: <String>['Anything!', 'Sports', 'C', 'D']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ])),
              Step(
                title: Text("Save"),
                content: RaisedButton(
                  onPressed: () {
                  },
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
