import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/widgets/avartar_with_camera.dart';
import 'package:getya/widgets/custom_drawer.dart';

import 'components/personal_info_form.dart';

class EditProfileScreen extends StatefulWidget {
  static final routeName = "/profile/edit";
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
        padding: EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AvartarWithCamera(),
              PersonalInfoForm(),
            ],
          ),
        ),
      ),
    );
  }
}
