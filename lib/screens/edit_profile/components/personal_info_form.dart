import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:getya/methods/personal_info_methods.dart';
import 'package:getya/models/user.dart';
import 'package:getya/widgets/custom_btn.dart';

import '../../../constants.dart';
import '../../profile_screen.dart';

class PersonalInfoForm extends StatefulWidget {
  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _formKey = GlobalKey<FormState>();
  String _firstname = currentUser.firstname;
  String _lastname = currentUser.lastname;
  String _gender = currentUser.gender;
  String _phone = currentUser.phone;
  ValueNotifier<String> _dob = ValueNotifier(currentUser.dob);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonalInfoMethods.buildGeneralField(
              "Firstname",
              (value) => setState(() => _firstname = value),
              _firstname,
              context,
            ),
            SizedBox(height: kDefaultPadding / 2),
            PersonalInfoMethods.buildGeneralField(
              "Lastname",
              (value) => setState(() => _lastname = value),
              _lastname,
              context,
            ),
            SizedBox(height: kDefaultPadding / 2),
            PersonalInfoMethods.buildDobField(_dob, context, () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1800, 1, 1),
                  maxTime: DateTime(2020, 12, 31),
                  theme: DatePickerTheme(
                    itemStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    doneStyle: TextStyle(color: Colors.black, fontSize: 16),
                  ), onConfirm: (date) {
                _dob.value = date.toString().split(" ")[0];
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            }),
            SizedBox(height: kDefaultPadding / 2),
            PersonalInfoMethods.buildGeneralField(
              "Gender",
              (value) => setState(() => _gender = value),
              _gender,
              context,
            ),
            SizedBox(height: kDefaultPadding / 2),
            PersonalInfoMethods.buildPhoneField(
              _phone,
              (value) => setState(() => _phone = value),
              context,
            ),
            SizedBox(height: kDefaultPadding * 2),
            Column(
              children: [
                CustomBtn(
                  text: "Confirm",
                  boxColor: kGreenColor,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      currentUser = User(
                        dob: _dob.value,
                        firstname: _firstname,
                        lastname: _lastname,
                        gender: _gender,
                        phone: _phone,
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
            ),
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
