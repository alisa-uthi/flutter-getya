import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvartarImage extends StatefulWidget {
  @override
  _AvartarImageState createState() => _AvartarImageState();
}

class _AvartarImageState extends State<AvartarImage> {
  String _imgPath;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _imgPath = prefs.getString("userImage");
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kLightGreyColor,
      backgroundImage: _imgPath != null
          ? FileImage(File(_imgPath))
          : AssetImage(
              "assets/images/beni_avartar.png",
            ),
      radius: 50,
    );
  }
}
