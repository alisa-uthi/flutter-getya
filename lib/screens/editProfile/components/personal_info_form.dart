import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:getya/models/user.dart';
import 'package:getya/widgets/personal_info_form_fields.dart';

import '../../../constants.dart';
import 'confirm_cancel_btn.dart';

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
  String _address = currentUser.address;
  ValueNotifier<String> _dob = ValueNotifier(currentUser.dob);

  void _handleDatePicker() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PersonalInfoFields.buildGeneralField(
              "Firstname",
              (value) => setState(() => _firstname = value),
              _firstname,
              context,
            ),
            SizedBox(height: kDefaultPadding / 2),
            PersonalInfoFields.buildGeneralField(
              "Lastname",
              (value) => setState(() => _lastname = value),
              _lastname,
              context,
            ),
            SizedBox(height: kDefaultPadding / 2),
            PersonalInfoFields.buildGeneralField(
              "Address",
              (value) => setState(() => _address = value),
              _address,
              context,
            ),
            SizedBox(height: kDefaultPadding / 2),
            PersonalInfoFields.buildDobField(
              _dob,
              context,
              () => _handleDatePicker(),
            ),
            SizedBox(height: kDefaultPadding / 2),
            PersonalInfoFields.buildGeneralField(
              "Gender",
              (value) => setState(() => _gender = value),
              _gender,
              context,
            ),
            SizedBox(height: kDefaultPadding / 2),
            PersonalInfoFields.buildPhoneField(
              _phone,
              (value) => setState(() => _phone = value),
              context,
            ),
            SizedBox(height: kDefaultPadding * 2),
            ConfirmCancelBtn(
              formKey: _formKey,
              dob: _dob,
              firstname: _firstname,
              lastname: _lastname,
              gender: _gender,
              phone: _phone,
              address: _address,
            ),
            SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
