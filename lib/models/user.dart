import 'package:flutter/material.dart';

class User {
  String firstname;
  String lastname;
  String dob;
  String gender;
  String phone;

  User({
    @required this.dob,
    @required this.firstname,
    @required this.gender,
    @required this.lastname,
    @required this.phone,
  });

  static void signUp(
    String firstname,
    String lastname,
    String gender,
    String dob,
    String phone,
  ) {
    currentUser = User(
      firstname: firstname,
      lastname: lastname,
      gender: gender,
      dob: dob,
      phone: phone,
    );
  }

  static void signIn(
    String email,
    String password,
  ) {
    print(email + " " + password);
  }
}

User currentUser = User(
  firstname: "Benimaru",
  lastname: "Shinmon",
  gender: "Male",
  phone: "038-485-2394",
  dob: "1999-02-24",
);
