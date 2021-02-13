import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/widgets/custom_drawer.dart';

class ReportSucessScreen extends StatelessWidget {
  static final routeName = "/report_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          "Report Issues",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "The feedback has been received",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.done,
              size: 120,
              color: kGreenColor,
            ),
            Text(
              "We will get back within 3 days",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
