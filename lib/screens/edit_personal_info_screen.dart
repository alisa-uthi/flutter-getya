import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:getya/constants.dart';
import 'package:getya/screens/edit_profile/components/personal_info_form.dart';
import 'package:getya/widgets/custom_drawer.dart';

import 'edit_profile/components/avartar_with_camera.dart';

class EditPersonalInfoScreen extends StatefulWidget {
  static final routeName = "/profile/edit";
  @override
  _EditPersonalInfoScreenState createState() => _EditPersonalInfoScreenState();
}

class _EditPersonalInfoScreenState extends State<EditPersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
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
