import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/user.dart';
import 'package:getya/screens/signin_screen.dart';
import 'package:getya/widgets/custom_btn.dart';

class PersonalInfoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGeneralField(context, "Firstname", currentUser.firstname),
          SizedBox(height: kDefaultPadding / 2),
          _buildGeneralField(context, "Lastname", currentUser.lastname),
          SizedBox(height: kDefaultPadding / 2),
          _buildGeneralField(context, "Date of Birth", currentUser.dob),
          SizedBox(height: kDefaultPadding / 2),
          _buildGeneralField(context, "Gender", currentUser.gender),
          SizedBox(height: kDefaultPadding / 2),
          _buildGeneralField(context, "Phone number", currentUser.phone),
          SizedBox(height: kDefaultPadding * 2),
          CustomBtn(
            text: "Sign Out",
            textColor: Colors.white,
            boxColor: kRedColor,
            onPressed: () {
              // TODO: Implement logic
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          )
        ],
      ),
    );
  }

  Column _buildGeneralField(
      BuildContext context, String nameField, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameField,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Colors.grey[500],
              ),
        ),
        SizedBox(height: kDefaultPadding / 2.5),
        Padding(
          padding: const EdgeInsets.only(left: kDefaultPadding / 2),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
