import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      // Title
      title: "Simple Material App",
      // Home
      home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

//State is information of the application that can change over time or when some actions are taken.
class MyHomeState extends State<MyHome> {
  int _radComplex = 0;
  int _radType = 0;

  void _setRadComplex(int value) => setState(() => {
        _radComplex = value,
      });
  void _setRadType(int value) => setState(() => _radType = value);

  int current_step = 0;
  String result = "";
  @override
  Widget build(BuildContext context) {
    List<Text> complexities = new List<Text>();
    complexities.add(new Text("Low"));
    complexities.add(new Text("Normal"));
    complexities.add(new Text("High"));

    List<Text> types = <Text>[new Text("Test"), new Text("Writing")];
    // Widget makeRadios() {
    //   List<Widget> list = new List<Widget>();

    //   for (int i = 0; i < 3; i++) {
    //     list.add(new Column(children: <Widget>[
    //       complexities[i],
    //       new Radio(
    //         value: i,
    //         groupValue: _radComplex,
    //         onChanged: _setRadComplex,
    //       )
    //     ]));
    //   }

    //   Row column = new Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: list,
    //   );

    //   return column;
    // }

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

    // init the step to 0th position
    List<Step> my_steps = [
      new Step(
          // Title of the Step
          title: new Text("Choose the type of task"),
          // Content, it can be any widget here. Using basic Text for this example
          content: new Column(
            children: <Widget>[makeRadioTiles(types, _radType, _setRadType)],
          ),
          isActive: true),
      new Step(
          title: new Text("Select the level of complexity"),
          content: new Column(children: <Widget>[
            makeRadioTiles(complexities, _radComplex, _setRadComplex)
          ]),
          // You can change the style of the step icon i.e number, editing, etc.
          state: StepState.editing,
          isActive: true),
    ];
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("TeachUp"),
      ),
      // Body
      body: new Container(
          child: new Column(children: <Widget>[
        Expanded(
            child: new Stepper(
          // Using a variable here for handling the currentStep
          currentStep: this.current_step,
          // List the steps you would like to have
          steps: my_steps,
          // Define the type of Stepper style
          // StepperType.horizontal :  Horizontal Style
          // StepperType.vertical   :  Vertical Style
          type: StepperType.vertical,
          // Know the step that is tapped
          onStepTapped: (step) {
            // On hitting step itself, change the state and jump to that step
            setState(() {
              // update the variable handling the current step value
              // jump to the tapped step
              current_step = step;
            });
            // Log function call
            // print("onStepTapped : " + step.toString());
          },
          onStepCancel: () {
            // On hitting cancel button, change the state
            setState(() {
              // update the variable handling the current step value
              // going back one step i.e subtracting 1, until its 0
              if (current_step > 0) {
                current_step = current_step - 1;
              } else {
                current_step = 0;
              }
            });
            // Log function call
            // print("onStepCancel : " + current_step.toString());
          },
          // On hitting continue button, change the state
          onStepContinue: () {
            setState(() {
              // update the variable handling the current step value
              // going back one step i.e adding 1, until its the length of the step
              if (current_step < my_steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
            // Log function call
            // print("onStepContinue : " + current_step.toString());
          },
        )),
        // new TextField(
        //     decoration: new InputDecoration(hintText: "Your selection"),
        //     //onChanged is called whenever we add or delete something on Text Field
        //     onSubmitted: (String str) {
        //       setState(() {
        //         result = str;
        //       });
        //     }),
        //displaying input text
        new Text("Your selection", textAlign: TextAlign.center),

        new Text("Type of task: " + types[_radType].data),
        new Text("Complexity level: " + complexities[_radComplex].data)
      ])),
    );
  }
}
