import 'package:flutter/material.dart';
import 'package:getya/controller/user_controller.dart';
import 'package:getya/screens/profile/profile_screen.dart';
import 'package:getya/widgets/custom_btn.dart';

import '../../../constants.dart';

class ConfirmCancelBtn extends StatelessWidget {
  const ConfirmCancelBtn({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required ValueNotifier<String> dob,
    @required String firstname,
    @required String lastname,
    @required String gender,
    @required String phone,
    @required String address,
  })  : _formKey = formKey,
        _dob = dob,
        _firstname = firstname,
        _lastname = lastname,
        _gender = gender,
        _phone = phone,
        _address = address,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final ValueNotifier<String> _dob;
  final String _firstname;
  final String _lastname;
  final String _gender;
  final String _phone;
  final String _address;

  @override
  Widget build(BuildContext context) {
    UserController _userController = UserController();
    return Column(
      children: [
        CustomBtn(
          text: "Confirm",
          boxColor: kGreenColor,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _userController.updateUserInfo(
                _firstname,
                _lastname,
                _gender,
                _dob.value,
                _phone,
                _address,
              );
              Navigator.pushNamed(context, ProfileScreen.routeName);
            }
          },
        ),
        SizedBox(height: kDefaultPadding / 2),
        CustomBtn(
          text: "Cancel",
          textColor: Colors.white,
          boxColor: kRedColor,
          onPressed: () {
            Navigator.pushNamed(context, ProfileScreen.routeName);
          },
        ),
      ],
    );
  }
}
