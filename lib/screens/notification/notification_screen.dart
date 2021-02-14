import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/widgets/custom_drawer.dart';

class NotificationScreen extends StatelessWidget {
  static final routeName = "/notification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notification",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
          vertical: kDefaultPadding,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "10 minutes ago",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
            ListTile(
              dense: true,
              title: Text("Your order is in process",
                  style: Theme.of(context).textTheme.bodyText1),
              leading: Icon(
                Icons.watch_later,
                color: Colors.amber,
                size: 40,
              ),
            ),
            Divider(
              color: Colors.grey[700],
              thickness: 2,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "10 minutes ago",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),
            ListTile(
              dense: true,
              title: Text("Successfully delivered Second shop)",
                  style: Theme.of(context).textTheme.bodyText1),
              leading: Icon(
                Icons.done,
                color: kGreenColor,
                size: 40,
              ),
            ),
            Divider(
              color: Colors.grey[700],
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
