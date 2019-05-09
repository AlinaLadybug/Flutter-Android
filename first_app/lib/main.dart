import 'package:first_app/models/user.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/registration_form.dart';
import 'package:flutter/material.dart';

void main() {
  var user = new User(id: "", fullName: "", phone: "", email: "");

  runApp(new MaterialApp(
      // Title
      title: "Simple Material App",
      // Home
      home: new RegistrationForm(user)));
}
