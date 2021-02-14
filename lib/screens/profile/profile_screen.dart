import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/screens/editProfile/edit_profile_screen.dart';
import 'package:getya/widgets/custom_drawer.dart';

import 'components/personal_info_detail.dart';

class ProfileScreen extends StatefulWidget {
  static final routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Personal Information",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
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
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/beni_avartar.png",
                  ),
                  radius: 60,
                ),
              ),
              PersonalInfoDetail(),
            ],
          ),
        ),
      ),
    );
  }
}
