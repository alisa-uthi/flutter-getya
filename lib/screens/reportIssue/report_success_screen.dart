import 'package:flutter/material.dart';
import 'package:getya/screens/home/home_screen.dart';
import 'package:getya/widgets/success_screen.dart';

class ReportSucessScreen extends StatelessWidget {
  static final routeName = "/report_success";

  @override
  Widget build(BuildContext context) {
    return SucessScreen(
      titleAppBar: "Report Issue",
      title: "The feedback has been received",
      message: "We will get back within 3 days",
      submessage: "You can return to home page",
      navigation: () {
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
    );
  }
}
