import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/widgets/custom_drawer.dart';

import 'components/edit_section.dart';
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
              EditSection(),
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
