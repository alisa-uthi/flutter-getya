import 'package:flutter/material.dart';
import 'package:getya/methods/account_method.dart';
import 'package:getya/widgets/custom_btn.dart';

import '../../../constants.dart';
import '../report_success_screen.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();
  String _email, _problem, _detail;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        child: Column(
          children: [
            AccountMethods.buildEmailField(
              context,
              (value) => setState(() => _email = value),
            ),
            SizedBox(height: kDefaultPadding),
            buildProblemField(context),
            SizedBox(height: kDefaultPadding),
            buildDetailField(context),
            SizedBox(height: kDefaultPadding * 3),
            CustomBtn(
              text: "Submit",
              textColor: Colors.white,
              boxColor: kGreenColor,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // TODO: Implement logic
                  Navigator.pushReplacementNamed(
                    context,
                    ReportSucessScreen.routeName,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Column buildProblemField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Problems",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        TextFormField(
          decoration: inputDecoration.copyWith(hintText: "Problems"),
          validator: (value) {
            if (value.isEmpty) {
              return "The problem must not be empty";
            }
            return null;
          },
          onChanged: (value) => setState(() => _problem = value),
        ),
      ],
    );
  }

  Column buildDetailField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Details",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        TextFormField(
          decoration: inputDecoration.copyWith(
            hintText: "Details",
          ),
          minLines: 5,
          maxLines: 7,
          onChanged: (value) => setState(() => _detail = value),
        ),
      ],
    );
  }
}
