import 'package:flutter/material.dart';
import 'package:getya/screens/editProfile/edit_profile_screen.dart';

import '../../../constants.dart';

class EditSection extends StatelessWidget {
  const EditSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FlatButton.icon(
        icon: Icon(
          Icons.edit,
          color: kGreenColor,
        ),
        label: Text(
          "Edit",
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: kGreenColor),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            EditProfileScreen.routeName,
          );
        },
        height: 10,
      ),
    );
  }
}
