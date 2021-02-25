import 'package:flutter/material.dart';
import 'package:getya/models/user.dart';
import 'package:getya/screens/deliveryStatus/delivery_status_screen.dart';
import 'package:getya/screens/home/home_screen.dart';
import 'package:getya/screens/notification/notification_screen.dart';
import 'package:getya/screens/profile/profile_screen.dart';
import 'package:getya/screens/reportIssue/report_issue_screen.dart';
import 'package:getya/screens/shoppingCart/shopping_cart_screen.dart';
import 'package:getya/screens/signin/signin_screen.dart';
import 'package:getya/widgets/custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  final List<Icon> icons = [
    Icon(Icons.home, size: 30),
    Icon(Icons.shopping_cart, size: 30),
    Icon(Icons.directions_car, size: 30),
    Icon(Icons.notifications, size: 30),
    Icon(Icons.person, size: 30),
    Icon(Icons.report_problem, size: 30),
    Icon(Icons.logout, size: 30),
  ];

  final List<String> titles = [
    "Home",
    "Shopping Cart",
    "Delivery Status",
    "Notification",
    "Profile",
    "Report Issue",
    "Sign Out",
  ];

  final List<String> routeNames = [
    HomeScreen.routeName,
    ShoppingCartScreen.routeName,
    DeliveryStatusScreen.routeName,
    NotificationScreen.routeName,
    ProfileScreen.routeName,
    ReportIssueScreen.routeName,
    SignInScreen.routeName,
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
                      Navigator.pushNamed(
                        context,
                        routeNames[index],
                      );
                      if (titles[index] == "Sign Out") {
                        currentUser = dummyUser;
                      }
                    },
                    child: ListTile(
                      leading: icons[index],
                      title: Text(titles[index]),
                      trailing: index != 6 ? Icon(Icons.arrow_forward) : null,
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
