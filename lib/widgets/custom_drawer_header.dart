import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/models/user.dart';
import 'package:getya/widgets/avartar_image.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding / 2, 5, 0),
      child: Row(
        children: [
          AvartarImage(),
          SizedBox(width: 20),
          Text(
            currentUser != null
                ? currentUser.firstname + "\n" + currentUser.lastname
                : "Benimaru\nShinmon",
            style: Theme.of(context).textTheme.headline1,
          ),
          Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 5,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
