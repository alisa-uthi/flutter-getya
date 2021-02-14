import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/methods/account_method.dart';
import 'package:getya/screens/reportIssue/components/report_form.dart';
import 'package:getya/screens/reportIssue/report_success_screen.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:getya/widgets/custom_drawer.dart';

class ReportIssueScreen extends StatefulWidget {
  static final routeName = "/report_issue";
  @override
  _ReportIssueScreenState createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Report Issues",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReportForm(),
          ],
        ),
      ),
    );
  }
}
