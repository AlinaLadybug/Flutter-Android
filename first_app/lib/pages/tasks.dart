import 'package:first_app/models/theoreticalTask.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

class TasksPage extends StatelessWidget {
  final String injectedData;

  TasksPage(this.injectedData);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(injectedData)),
      body: new Center(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Complexity level: " + injectedData,
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 20.0))
            ]),
      ),
    );
  }
}
// class TasksPage extends StatefulWidget {
//   final String pageText;
//   TasksPage(this.pageText);
//   @override
//   TasksPageState createState() => new TasksPageState(this.pageText);
// }

// class TheoryTaskList extends State<TasksPage> {
//   List<TheoryTask> theoryTasks;
//   List taskHeaders = new List();
//   TheoryTaskList(this.theoryTasks);
//   int _radComplex = 0;

//   void _setRadComplex(int value) => setState(() => {
//         _radComplex = value,
//       });
//   @override
//   Widget build(BuildContext context) {
//     Widget makeRadios(TheoryTask task) {
//       List<Widget> list = new List<Widget>();
//       var count = task.variants.length + 1;
//       List<int> indexes = new List<int>();
//       indexes.add(new Random().nextInt(10) % 3);
//       indexes.add((indexes[0] + new Random().nextInt(10) % 2 + 1) % 3);
//       indexes.add(3 - indexes[0] - indexes[1]);

//       var answers = new List<String>();
//       answers.addAll(task.variants);
//       answers.add(task.answer);
//       for (int i = 0; i < count; i++) {
//         list.add(new Column(children: <Widget>[
//           new Text(answers[indexes[i]]),
//           new Radio(
//             value: i,
//             groupValue: _radComplex,
//             onChanged: _setRadComplex,
//           )
//         ]));
//       }

//       Column column = new Column(
//         children: list,
//       );

//       return column;
//     }

//     return new ListView.builder(
//         itemCount: theoryTasks == null ? 0 : theoryTasks.length,
//         itemBuilder: (BuildContext context, int index) {
//           return new Card(
//             child: new Container(
//               child: new Center(
//                   child: new Column(
//                 // Stretch the cards in horizontal axis
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   new Text(
//                     // Read the name field value and set it in the Text widget
//                     theoryTasks[index].question,
//                     // set some style to text
//                     style: new TextStyle(
//                         fontSize: 20.0, color: Colors.lightBlueAccent),
//                   ),
//                   makeRadios(theoryTasks[index]),
//                 ],
//               )),
//               padding: const EdgeInsets.all(15.0),
//             ),
//           );
//         });
//   }
// }

// class TasksPageState extends State<TasksPage> {
//   List<TheoryTask> theoryTasks;
//   // TheoryTaskList(this.theoryTasks);
//   int _radComplex = 0;
//   List taskHeaders = new List();

//   void _setRadComplex(int value) => setState(() => {
//         _radComplex = value,
//       });
//   Widget makeRadios(TheoryTask task) {
//     List<Widget> list = new List<Widget>();
//     var count = task.variants.length + 1;
//     List<int> indexes = new List<int>();
//     indexes.add(new Random().nextInt(10) % 3);
//     indexes.add((indexes[0] + new Random().nextInt(10) % 2 + 1) % 3);
//     indexes.add(3 - indexes[0] - indexes[1]);

//     var answers = new List<String>();
//     answers.addAll(task.variants);
//     answers.add(task.answer);
//     for (int i = 0; i < count; i++) {
//       list.add(new Column(children: <Widget>[
//         new Text(answers[indexes[i]]),
//         new Radio(
//           value: i,
//           groupValue: _radComplex,
//           onChanged: _setRadComplex,
//         )
//       ]));
//     }

//     Column column = new Column(
//       children: list,
//     );

//     return column;
//   }

//   final String pageText;

//   TasksPageState(this.pageText);

//   List<TheoryTask> parseTheoryTasks(String response) {
//     if (response == null) {
//       return [];
//     }
//     final parsedData = json.decode(response);
//     var tasks = parsedData["tasks"];
//     return tasks
//         .map<TheoryTask>((json) => new TheoryTask.fromJson(json))
//         .toList();
//   }

//   void createHeaders(List<TheoryTask> teoryTasks) {
//     theoryTasks.forEach((task) {
//       taskHeaders.add(task.question);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var f = new ListView.builder(
//         itemCount: theoryTasks == null ? 0 : theoryTasks.length,
//         itemBuilder: (BuildContext context, int index) {
//           return new Card(
//             child: new Container(
//               child: new Center(
//                   child: new Column(
//                 // Stretch the cards in horizontal axis
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   new Text(
//                     // Read the name field value and set it in the Text widget
//                     theoryTasks[index].question,
//                     // set some style to text
//                     style: new TextStyle(
//                         fontSize: 20.0, color: Colors.lightBlueAccent),
//                   ),
//                   makeRadios(theoryTasks[index]),
//                 ],
//               )),
//               padding: const EdgeInsets.all(15.0),
//             ),
//           );
//         });
//     return new Scaffold(
//         appBar: new AppBar(title: new Text("TeachUp")),
//         body: new Container(
//             child: new FutureBuilder(
//                 future: DefaultAssetBundle.of(context)
//                     .loadString('data/tasks.json'),
//                 builder: (context, snapshot) {
//                   List<TheoryTask> theoryTasks =
//                       parseTheoryTasks(snapshot.data);
//                   if (theoryTasks.isNotEmpty) {
//                     // createHeaders(theoryTasks);
//                     // createVariants(theoryTasks);
//                     this.theoryTasks = theoryTasks;
//                     return new Column(
//                       children: <Widget>[
//                         new Expanded(
//                           child: new ListView.builder(
//                               itemCount:
//                                   theoryTasks == null ? 0 : theoryTasks.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return new Card(
//                                   child: new Container(
//                                     child: new Center(
//                                         child: new Column(
//                                       // Stretch the cards in horizontal axis
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.stretch,
//                                       children: <Widget>[
//                                         new Text(
//                                           // Read the name field value and set it in the Text widget
//                                           theoryTasks[index].question,
//                                           // set some style to text
//                                           style: new TextStyle(
//                                               fontSize: 20.0,
//                                               color: Colors.lightBlueAccent),
//                                         ),
//                                         makeRadios(theoryTasks[index]),
//                                       ],
//                                     )),
//                                     padding: const EdgeInsets.all(15.0),
//                                   ),
//                                 );
//                               }),
//                         )
//                       ],
//                     );
//                   } else {
//                     return new Center(child: new CircularProgressIndicator());
//                   }
//                 })));
//   }
// }
