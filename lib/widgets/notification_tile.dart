import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String message;
  final String time;

  const NotificationTile({Key key, this.icon, this.message, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
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
            ],
          );
        },
      ),
    );
  }
}
