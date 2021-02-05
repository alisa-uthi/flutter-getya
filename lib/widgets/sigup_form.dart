import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/screens/signup_success_screen.dart';
import 'package:getya/widgets/custom_btn.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildGeneralField(
              'Name', (value) => setState(() => _firstname = value)),
          SizedBox(height: kDefaultPadding),
          _buildGeneralField(
              'Surname', (value) => setState(() => _lastname = value)),
          SizedBox(height: kDefaultPadding),
          _buildGeneralField(
              'Address', (value) => setState(() => _address = value)),
          SizedBox(height: kDefaultPadding),
          _buildPhoneField(),
          SizedBox(height: kDefaultPadding),
          _buildGenderRadio(),
          SizedBox(height: kDefaultPadding),
          _buildDobField(),
          SizedBox(height: kDefaultPadding),
          _buildEmailField(),
          SizedBox(height: kDefaultPadding),
          _buildGeneralField(
              'Username', (value) => setState(() => _username = value)),
          SizedBox(height: kDefaultPadding),
          _buildPasswordField(),
          SizedBox(height: kDefaultPadding),
          _buildConfirmedPasswordField(),
          SizedBox(height: kDefaultPadding * 2),
          CustomBtn(
            boxColor: kGreenColor,
            text: "Confirm",
            textColor: Colors.white,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // TODO: Store values in the model
                Navigator.pushNamed(context, SignUpSuccessScreen.routeName);
              }
            },
          ),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }

  Column _buildEmailField() {
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

  Column _buildPasswordField() {
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

  Column _buildConfirmedPasswordField() {
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
          validator: (value) {
            if (value.isEmpty) {
              return kPassNullError;
            }
            if (_password != _confirmedPass) {
              return kMatchPassError;
            }
            return null;
          },
          onChanged: (value) => setState(() => _confirmedPass = value),
        ),
      ],
    );
  }

  Column _buildGeneralField(String nameField, Function onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameField,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: inputDecoration.copyWith(hintText: nameField),
          validator: (value) {
            if (value.isEmpty) {
              return kFieldNullError + nameField;
            }
            return null;
          },
          onChanged: onChanged,
        ),
      ],
    );
  }

  Column _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Telephone Number",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        TextFormField(
          obscureText: true,
          decoration: inputDecoration.copyWith(hintText: "XXX-XXX-XXXX"),
          validator: (value) {
            if (value.isEmpty) {
              return kFieldNullError + "Telephone Number";
            }

            return null;
          },
          onChanged: (value) => setState(() => _phone = value),
        ),
      ],
    );
  }

  Widget _buildDobField() {
    return ValueListenableBuilder(
      valueListenable: _dob,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
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
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date of Birth",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: kDefaultPadding / 2.5),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                // height: 20,
                decoration: BoxDecoration(
                  color: kLightGreyColor,
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                ),
                child: _dob.value == ''
                    ? Text(
                        "Select Date of Birth",
                        style: TextStyle(color: kHintTextColor),
                      )
                    : Text(_dob.value),
              )
            ],
          ),
        );
      },
    );
  }

  Row _buildGenderRadio() {
    GenderOption _gender = GenderOption.male;
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
