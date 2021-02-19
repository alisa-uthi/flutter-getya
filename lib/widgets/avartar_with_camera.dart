import 'dart:io';
import 'package:getya/constants.dart';
import 'package:getya/models/user.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvartarWithCamera extends StatefulWidget {
  const AvartarWithCamera({
    Key key,
  }) : super(key: key);

  @override
  _AvartarWithCameraState createState() => _AvartarWithCameraState();
}

class _AvartarWithCameraState extends State<AvartarWithCamera> {
  File _image;
  String _userImg;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future selectImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    saveImage();
  }

  Future saveImage() async {
    // Check for valid file
    if (_image == null) return;

    // Get directory where we can duplicate selected file.
    Directory directory = await getTemporaryDirectory();
    String path = directory.path;

    // Copy the file to a application document directory.
    final String fileName = basename(_image.path);
    final File localImage = await _image.copy('$path/$fileName');

    // Save image/file path as string
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("userImage")) {
      prefs.remove("userImage");
    }
    prefs.setString("userImage", localImage.path);

    loadImage();
  }

  Future loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userImg = prefs.getString("userImage");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectImage(),
      child: Stack(children: [
        Center(
          child: CircleAvatar(
            backgroundColor: kLightGreyColor,
            backgroundImage: _userImg != null
                ? FileImage(File(_userImg))
                : AssetImage(
                    "assets/images/beni_avartar.png",
                  ),
            radius: 50,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 130,
          child: Icon(
            Icons.camera_alt,
            size: 30,
            color: Colors.white,
          ),
        ),
      ]),
    );
  }
}
