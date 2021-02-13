import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/methods/account_method.dart';
import 'package:getya/screens/home_screen.dart';
import 'package:getya/widgets/custom_btn.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AccountMethods.buildEmailField(
            context,
            (value) => setState(() => _email = value),
          ),
          SizedBox(height: kDefaultPadding),
          AccountMethods.buildPasswordField(
            context,
            (value) => setState(() => _password = value),
          ),
          SizedBox(height: kDefaultPadding * 2),
          CustomBtn(
            text: "Sign in",
            boxColor: kGreenColor,
            textColor: Colors.white,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // TODO: Store values in the model
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
