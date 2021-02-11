import 'package:flutter/material.dart';
import 'package:getya/widgets/custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  final List<Icon> icons = [
    Icon(Icons.home, size: 30),
    Icon(Icons.shopping_cart, size: 30),
    Icon(Icons.directions_car, size: 30),
    Icon(Icons.notifications, size: 30),
    Icon(Icons.person, size: 30),
    Icon(Icons.logout, size: 30),
  ];

  final List<String> titles = [
    "Home",
    "Shopping Cart",
    "Delivery Status",
    "Notification",
    "Profile",
    "Sign Out",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Drawer(
        child: Column(
          children: [
            CustomDrawerHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // TODO: Navigate to each screen
                    },
                    child: ListTile(
                      leading: icons[index],
                      title: Text(titles[index]),
                      trailing: index != 5 ? Icon(Icons.arrow_forward) : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
