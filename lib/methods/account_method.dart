import 'package:flutter/material.dart';

import '../constants.dart';

class AccountMethods {
  static Column buildEmailField(BuildContext context, Function onChange) {
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
          onChanged: onChange,
        ),
      ],
    );
  }

  static Column buildPasswordField(BuildContext context, Function onChange) {
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
          onChanged: onChange,
        ),
      ],
    );
  }

  static Column buildConfirmedPasswordField(
      BuildContext context, Function onChange, Function validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirm Password",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        TextFormField(
          obscureText: true,
          decoration: inputDecoration.copyWith(hintText: "Confirm Password"),
          validator: validator,
          onChanged: onChange,
        ),
      ],
    );
  }
}
