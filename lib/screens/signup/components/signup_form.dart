import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/methods/account_method.dart';
import 'package:getya/methods/personal_info_methods.dart';
import 'package:getya/models/user.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../signup_success_screen.dart';

enum GenderOption { female, male, other }

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String _firstname, _lastname, _address, _phone;
  String _username, _email, _password, _confirmedPass;
  final ValueNotifier<String> _dob = ValueNotifier('');
  GenderOption _gender = GenderOption.male;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          PersonalInfoMethods.buildGeneralField(
            'Name',
            (value) => setState(() => _firstname = value),
            null,
            context,
          ),
          SizedBox(height: kDefaultPadding),
          PersonalInfoMethods.buildGeneralField(
            'Surname',
            (value) => setState(() => _lastname = value),
            null,
            context,
          ),
          SizedBox(height: kDefaultPadding),
          PersonalInfoMethods.buildGeneralField(
            'Address',
            (value) => setState(() => _address = value),
            null,
            context,
          ),
          SizedBox(height: kDefaultPadding),
          PersonalInfoMethods.buildPhoneField(
            null,
            (value) => setState(() => _phone = value),
            context,
          ),
          SizedBox(height: kDefaultPadding),
          _buildGenderRadio(),
          SizedBox(height: kDefaultPadding),
          PersonalInfoMethods.buildDobField(_dob, context, () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1800, 1, 1),
                maxTime: DateTime(2020, 12, 31),
                theme: DatePickerTheme(
                  itemStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  doneStyle: TextStyle(color: Colors.black, fontSize: 16),
                ), onConfirm: (date) {
              _dob.value = date.toString().split(" ")[0];
            }, currentTime: DateTime.now(), locale: LocaleType.en);
          }),
          SizedBox(height: kDefaultPadding),
          AccountMethods.buildEmailField(
            context,
            (value) => setState(() => _email = value),
          ),
          SizedBox(height: kDefaultPadding),
          PersonalInfoMethods.buildGeneralField(
            'Username',
            (value) => setState(() => _username = value),
            null,
            context,
          ),
          SizedBox(height: kDefaultPadding),
          AccountMethods.buildPasswordField(
            context,
            (value) => setState(() => _password = value),
          ),
          SizedBox(height: kDefaultPadding),
          AccountMethods.buildConfirmedPasswordField(
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
          SizedBox(height: kDefaultPadding * 2),
          CustomBtn(
            boxColor: kGreenColor,
            text: "Confirm",
            textColor: Colors.white,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // TODO: Store values in the model
                currentUser = User(
                  firstname: _firstname,
                  lastname: _lastname,
                  gender: _gender.toString(),
                  dob: _dob.value,
                  phone: _phone,
                );
                Navigator.pushNamed(context, SignUpSuccessScreen.routeName);
              }
            },
          ),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }

  Row _buildGenderRadio() {
    return Row(
      children: [
        Text(
          "Gender",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Radio(
          value: GenderOption.male,
          groupValue: _gender,
          onChanged: (GenderOption value) {
            setState(() {
              _gender = value;
            });
          },
        ),
        Text(
          "Male",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Radio(
          value: GenderOption.female,
          groupValue: _gender,
          onChanged: (GenderOption value) {
            setState(() {
              _gender = value;
            });
          },
        ),
        Text(
          "Female",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Radio(
          value: GenderOption.other,
          groupValue: _gender,
          onChanged: (GenderOption value) {
            setState(() {
              _gender = value;
            });
          },
        ),
        Text(
          "Other",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
