import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/controller/user_controller.dart';
import 'package:getya/models/user.dart';
import 'package:getya/screens/signup/components/gender_radio.dart';
import 'package:getya/screens/signup/signup_success_screen.dart';
import 'package:getya/widgets/account_form_fields.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:getya/widgets/personal_info_form_fields.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String _firstname, _lastname, _address, _phone;
  String _username, _email, _password, _confirmedPass;
  String _gender = "Male";
  final ValueNotifier<String> _dob = ValueNotifier('');
  final UserController _userController = UserController();

  void _handleDatePicker() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1800, 1, 1),
        maxTime: DateTime(2020, 12, 31),
        theme: DatePickerTheme(
          itemStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          doneStyle: TextStyle(color: Colors.black, fontSize: 16),
        ), onConfirm: (date) {
      _dob.value = date.toString().split(" ")[0];
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPersonalFields(),
          SizedBox(height: kDefaultPadding),
          buildAccountFields(),
          SizedBox(height: kDefaultPadding * 2),
          CustomBtn(
            boxColor: kGreenColor,
            text: "Confirm",
            textColor: Colors.white,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                User user = await _userController.signUp(
                  _firstname,
                  _lastname,
                  _gender,
                  _dob.value,
                  _phone,
                );
                Navigator.pushNamed(
                  context,
                  SignUpSuccessScreen.routeName,
                );
              }
            },
          ),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }

  Widget buildPersonalFields() {
    return Column(
      children: [
        PersonalInfoFields.buildGeneralField(
          'Name',
          (value) => setState(() => _firstname = value),
          null,
          context,
        ),
        SizedBox(height: kDefaultPadding),
        PersonalInfoFields.buildGeneralField(
          'Surname',
          (value) => setState(() => _lastname = value),
          null,
          context,
        ),
        SizedBox(height: kDefaultPadding),
        PersonalInfoFields.buildGeneralField(
          'Address',
          (value) => setState(() => _address = value),
          null,
          context,
        ),
        SizedBox(height: kDefaultPadding),
        PersonalInfoFields.buildPhoneField(
          null,
          (value) => setState(() => _phone = value),
          context,
        ),
        SizedBox(height: kDefaultPadding),
        GenderRadio(
          callBack: (value) => setState(() => _gender = value),
        ),
        SizedBox(height: kDefaultPadding),
        PersonalInfoFields.buildDobField(
          _dob,
          context,
          () => _handleDatePicker(),
        ),
      ],
    );
  }

  Widget buildAccountFields() {
    return Column(
      children: [
        AccountFields.buildEmailField(
          context,
          (value) => setState(() => _email = value),
        ),
        SizedBox(height: kDefaultPadding),
        PersonalInfoFields.buildGeneralField(
          'Username',
          (value) => setState(() => _username = value),
          null,
          context,
        ),
        SizedBox(height: kDefaultPadding),
        AccountFields.buildPasswordField(
          context,
          (value) => setState(() => _password = value),
          true,
        ),
        SizedBox(height: kDefaultPadding),
        AccountFields.buildConfirmedPasswordField(
            context, (value) => setState(() => _confirmedPass = value),
            (value) {
          if (value.isEmpty) {
            return kPassNullError;
          }
          if (_password != _confirmedPass) {
            return kMatchPassError;
          }
          return null;
        }),
      ],
    );
  }
}
