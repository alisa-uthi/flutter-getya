import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/methods/account_method.dart';
import 'package:getya/methods/personal_info_methods.dart';
import 'package:getya/models/user.dart';
import 'package:getya/screens/signup/components/gender_radio.dart';
import 'package:getya/screens/signup/signup_success_screen.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
          GenderRadio(
            callBack: (value) => setState(() => _gender = value),
          ),
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
                  gender: _gender,
                  dob: _dob.value,
                  phone: _phone,
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
}
