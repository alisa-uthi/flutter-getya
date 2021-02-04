import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
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
          _BuildEmailField(),
          SizedBox(height: kDefaultPadding),
          _BuildPasswordField(),
          SizedBox(height: kDefaultPadding * 2),
          CustomBtn(
            text: "Sign in",
            boxColor: kGreenColor,
            textColor: Colors.white,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // TODO: Navigate to home screen

              }
            },
          ),
        ],
      ),
    );
  }

  Column _BuildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: inputDecoration.copyWith(hintText: "Email"),
          validator: (value) {
            if (value.isEmpty) {
              return kEmailNullError;
            }
            if (!emailPattern.hasMatch(value)) {
              return kInvalidEmailError;
            }
            return null;
          },
          onChanged: (value) => setState(() => _email = value),
        ),
      ],
    );
  }

  Column _BuildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        TextFormField(
          obscureText: true,
          decoration: inputDecoration.copyWith(hintText: "Password"),
          validator: (value) {
            if (value.isEmpty) {
              return kPassNullError;
            }
            if (value.length < 8) {
              return kShortPassError;
            }
            return null;
          },
          onChanged: (value) => setState(() => _password = value),
        ),
      ],
    );
  }
}
