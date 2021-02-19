import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/screens/signup/components/signup_form.dart';
import 'package:getya/widgets/avartar_with_camera.dart';

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
              AvartarWithCamera(),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
