import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFAEE2FF);
const kSecondaryColor = Color(0xFF6FBAE3);
const kGreenColor = Color(0xFF5EA732);
const kRedColor = Color(0xFFFF4242);
const kLightGreyColor = Color(0xFFF0F0F0);
const kHintTextColor = Color(0xFF989898);
const kDefaultPadding = 20.00;

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: kPrimaryColor,
  appBarTheme: AppBarTheme(
    elevation: 0,
    actionsIconTheme: IconThemeData(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
  ),
);

// Form field
InputDecoration inputDecoration = InputDecoration(
  isDense: true,
  fillColor: kLightGreyColor,
  filled: true,
  hintStyle: TextStyle(
    color: kHintTextColor,
  ),
  focusedBorder: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  border: outlineInputBorder,
  errorStyle: TextStyle(
    color: kRedColor,
    fontSize: 12,
  ),
  contentPadding: EdgeInsets.all(10),
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kDefaultPadding),
  borderSide: BorderSide.none,
);

// Form error
final RegExp emailPattern = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter Your Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter Your Password";
const String kShortPassError = "Password must have at least 8 characters";
const String kMatchPassError = "Password doesn't match";
const String kFieldNullError = "Please Enter Your ";
