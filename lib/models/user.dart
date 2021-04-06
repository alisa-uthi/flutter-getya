import 'package:flutter/material.dart';

class User {
  String firstname;
  String lastname;
  String dob;
  String gender;
  String phone;
  String address;
  String email;

  User({
    @required this.dob,
    @required this.firstname,
    @required this.gender,
    @required this.lastname,
    @required this.phone,
    @required this.address,
    this.email,
  });

  static void signUp(
    String firstname,
    String lastname,
    String gender,
    String dob,
    String phone,
    String address,
    String email,
  ) {
    currentUser = User(
      firstname: firstname,
      lastname: lastname,
      gender: gender,
      dob: dob,
      phone: phone,
      address: address,
      email: email,
    );
  }

  static void signIn(
    String email,
    String password,
  ) {
    print(email + " " + password);
  }

  static void updateUserInfo(
    String firstname,
    String lastname,
    String gender,
    String dob,
    String phone,
    String address,
    String email,
  ) {
    currentUser = User(
      firstname: firstname,
      lastname: lastname,
      gender: gender,
      dob: dob,
      phone: phone,
      address: address,
      email: email,
    );
  }
}

User currentUser = User(
  firstname: "Benimaru",
  lastname: "Shinmon",
  gender: "Male",
  phone: "038-485-2394",
  dob: "1999-02-24",
  address: "Kratum Lom, Salaya, Nakhorn Pathom",
);

User dummyUser = currentUser;
