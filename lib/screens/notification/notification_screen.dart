import 'package:flutter/material.dart';
import 'package:getya/constants.dart';
import 'package:getya/screens/notification/components/notification_tile.dart';
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
            NotificationTile(
              icon: Icons.watch_later,
              time: "10 minutes ago",
              message: "Your order is in process",
              iconColor: Colors.amber,
            ),
            NotificationTile(
              icon: Icons.done,
              time: "10 minutes ago",
              message: "Successfully delivered Second shop",
              iconColor: kGreenColor,
            ),
          ],
        ),
      ),
    );
  }
}
