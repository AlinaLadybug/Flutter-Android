import 'dart:io';

import 'package:first_app/models/user.dart';
import 'package:first_app/pages/edit_form.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class RegistrationForm extends StatefulWidget {
  RegistrationForm(this.userModel);
  final User userModel;

  @override
  _RegistrationFormState createState() =>
      _RegistrationFormState(this.userModel);
}

class _RegistrationFormState extends State<RegistrationForm> {
  String _fullName;
  String _phone;
  String _email;
  String _id;
  final User userModel;

  _RegistrationFormState(this.userModel) {
    _id = userModel.id;
    _fullName = userModel.fullName;
    _phone = userModel.phone;
    _email = userModel.email;
  }
  Widget fields() {
    return new Column(
      children: <Widget>[
        new ListTile(
          leading: const Icon(Icons.person),
          title: new TextField(
            onChanged: (text) {
              _fullName = text;
              text = "blakabul";
            },
            decoration: new InputDecoration(
              labelText: _fullName,
              hintText: "Name",
            ),
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.phone),
          title: new TextField(
            onChanged: (text) {
              _phone = text;
            },
            decoration: new InputDecoration(
              labelText: _phone,
              hintText: "Phone",
            ),
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.email),
          title: new TextField(
            onChanged: (text) {
              _email = text;
            },
            decoration: new InputDecoration(
              labelText: _email,
              hintText: "Email",
            ),
          ),
        ),
        const Divider(
          height: 1.0,
        ),
      ],
    );
  }

  Future writeToFile(User user) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      var jsonFile = new File('${dir.path}/user.json');
      print("Writing to file!");
      jsonFile.writeAsStringSync(json.encode(user.toJson()));
      if (jsonFile.existsSync()) {
        print("File exists");
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new EditForm()));
      } else {
        print("File does not exist!");
      }
    } on FileSystemException {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Register"),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                String _id =
                    new DateTime.now().millisecondsSinceEpoch.toString();
                var user = new User(
                    id: _id, fullName: _fullName, phone: _phone, email: _email);
                writeToFile(user);
              })
        ],
      ),
      body: new Container(
          child: new Column(children: <Widget>[new Expanded(child: fields())])),
    );
  }
}
