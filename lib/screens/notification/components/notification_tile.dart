import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String message;
  final String time;
  final Color iconColor;

  const NotificationTile({
    Key key,
    @required this.icon,
    @required this.message,
    @required this.time,
    @required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            time,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ),
        ListTile(
          dense: true,
          title: Text(
            message,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          leading: Icon(
            icon,
            color: iconColor,
            size: 40,
          ),
        ),
        Divider(
          color: Colors.grey[700],
          thickness: 2,
        ),
      ],
    );
  }
}
