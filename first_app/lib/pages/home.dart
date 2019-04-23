import 'package:flutter/material.dart';

import 'tasks.dart';

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> {
  int _radComplex = 0;
  int _radType = 0;

  void _setRadComplex(int value) => setState(
        () => _radComplex = value,
      );
  void _setRadType(int value) => setState(() => _radType = value);

  int currentStep = 0;
  String result = "";
  @override
  Widget build(BuildContext context) {
    List<Text> complexities = <Text>[
      new Text("Low"),
      new Text("Normal"),
      new Text("High")
    ];

    List<Text> types = <Text>[new Text("Theoretical"), new Text("Practical")];

    Widget makeRadioTiles(List<Text> texts, int grpValue, onChg) {
      List<Widget> list = new List<Widget>();

      for (int i = 0; i < texts.length; i++) {
        list.add(new RadioListTile(
            value: i,
            groupValue: grpValue,
            onChanged: onChg,
            activeColor: Colors.green,
            controlAffinity: ListTileControlAffinity.trailing,
            title: texts[i]));
      }

      Column column = new Column(
        children: list,
      );
      return column;
    }

    List<Step> mySteps = [
      new Step(
          title: new Text("Choose the type of task"),
          content: new Column(
            children: <Widget>[makeRadioTiles(types, _radType, _setRadType)],
          ),
          isActive: true),
      new Step(
          title: new Text("Select the level of complexity"),
          content: new Column(children: <Widget>[
            makeRadioTiles(complexities, _radComplex, _setRadComplex)
          ]),
          state: StepState.editing,
          isActive: true),
    ];
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TeachUp"),
      ),
      body: new Container(
          child: new Column(children: <Widget>[
        Expanded(
            child: new Stepper(
          currentStep: this.currentStep,
          steps: mySteps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < mySteps.length - 1) {
                currentStep = currentStep + 1;
              } else {
                currentStep = 0;
              }
            });
          },
        )),
        new Text("Your selection", textAlign: TextAlign.center),
        new Text("Type of task: " + types[_radType].data),
        new Text("Complexity level: " + complexities[_radComplex].data),
        new MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minWidth: double.infinity,
          color: Colors.lightBlue[50],
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new TasksPage(complexities[_radComplex].data)));
          },
          splashColor: Colors.blueGrey,
          child: new Text(
            "START",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        )
      ])),
    );
  }
}
