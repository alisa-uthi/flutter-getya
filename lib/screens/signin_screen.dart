import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/signin_form.dart';

class SignInScreen extends StatelessWidget {
  static final routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding * 2,
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/getya_logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: kDefaultPadding),
              SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
