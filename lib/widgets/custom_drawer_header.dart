import 'package:flutter/material.dart';
import 'package:getya/constants.dart';

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
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/beni_avartar.png"),
            radius: 50,
          ),
          SizedBox(width: 20),
          Text(
            "Benimaru\nShinmon",
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
