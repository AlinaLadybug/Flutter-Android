import 'dart:io';

import 'package:first_app/models/user.dart';
import 'package:first_app/pages/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class EditForm extends StatefulWidget {
  EditForm();
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  String _fullName;
  String _phone;
  String _email;
  String _id;
  _EditFormState() {}

  Future readFromFile() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      var jsonFile = new File('${dir.path}/user.json');
      print("Read from file!");
      if (jsonFile.existsSync()) {
        print("File exists");
        var value = jsonFile.readAsStringSync();
        var content = json.decode(value);
        User userModel = User.fromJson(content);
        _id = userModel.id;
        _fullName = userModel.fullName;
        _phone = userModel.phone;
        _email = userModel.email;
        print("Data is read");
      } else {
        print("File does not exist!");
      }
    } on FileSystemException {
      return 0;
    }
  }

  Widget info() {
    readFromFile();

    return new Column(
      children: <Widget>[
        new ListTile(
          leading: const Icon(Icons.person),
          title: Text(_fullName),
          subtitle: const Text('Full Name'),
        ),
        new ListTile(
          leading: const Icon(Icons.phone),
          title: Text(_phone),
          subtitle: const Text('Phone'),
        ),
        new ListTile(
          leading: const Icon(Icons.email),
          title: Text(_email),
          subtitle: const Text('Email'),
        ),
        const Divider(
          height: 1.0,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var info2 = info();
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Profile"),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  var user = new User(
                      id: _id,
                      fullName: _fullName,
                      phone: _phone,
                      email: _email);
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new RegistrationForm(user)));
                })
          ],
        ),
        body: new Container(
            child: new Column(children: <Widget>[new Expanded(child: info2)])));
  }
}
