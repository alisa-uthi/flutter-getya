import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/controller/user_controller.dart';
import 'package:getya/screens/home/home_screen.dart';
import 'package:getya/widgets/account_form_fields.dart';
import 'package:getya/widgets/custom_btn.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AccountFields.buildEmailField(
            context,
            (value) => setState(() => _email = value),
          ),
          SizedBox(height: kDefaultPadding),
          AccountFields.buildPasswordField(
            context,
            (value) => setState(() => _password = value),
            false,
          ),
          SizedBox(height: kDefaultPadding * 2),
          CustomBtn(
            text: "Sign in",
            boxColor: kGreenColor,
            textColor: Colors.white,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _userController.signIn(_email, _password);
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
