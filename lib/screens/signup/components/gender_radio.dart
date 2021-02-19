import 'package:flutter/material.dart';

enum GenderOption { female, male, other }

class GenderRadio extends StatefulWidget {
  final Function callBack;
  GenderRadio({this.callBack});

  @override
  _GenderRadioState createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  GenderOption _genderOption = GenderOption.male;

  void _handleGenderChange(GenderOption value, String gender) {
    widget.callBack(gender);
    setState(() {
      _genderOption = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Gender",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Radio(
          value: GenderOption.male,
          groupValue: _genderOption,
          onChanged: (value) => _handleGenderChange(value, "Male"),
        ),
        Text(
          "Male",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Radio(
          value: GenderOption.female,
          groupValue: _genderOption,
          onChanged: (value) => _handleGenderChange(value, "Female"),
        ),
        Text(
          "Female",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Radio(
          value: GenderOption.other,
          groupValue: _genderOption,
          onChanged: (value) => _handleGenderChange(value, "Other"),
        ),
        Text(
          "Other",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
