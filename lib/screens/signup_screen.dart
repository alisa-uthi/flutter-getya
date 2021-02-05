import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/widgets/sigup_form.dart';

class SignUpScreen extends StatelessWidget {
  static final routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              size: 30,
            ),
            onPressed: () {
              // TODO: Add Image picker
            },
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please put your info here",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: kDefaultPadding),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
