import 'package:flutter/material.dart';
import 'package:getya/screens/destinationAddress/destination_screen.dart';
import 'package:getya/screens/editProfile/edit_profile_screen.dart';
import 'package:getya/screens/home/home_screen.dart';
import 'package:getya/screens/pharmacyProducts/pharmacy_products_screen.dart';
import 'package:getya/screens/reportIssue/report_issue_screen.dart';
import 'package:getya/screens/shoppingCart/shopping_cart_screen.dart';
import 'package:getya/screens/signin/signin_screen.dart';
import 'package:getya/screens/signup/signup_screen.dart';
import 'package:getya/screens/signup/signup_success_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getya/screens/splash_screen.dart';

import 'constants.dart';
import 'routes.dart';
import 'scroll_behavior_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GETYA',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: themeData.copyWith(
        textTheme:
            GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme).copyWith(
          headline1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyText1: TextStyle(fontSize: 18, color: Colors.black),
          bodyText2: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollBehaviorConfiguration(),
          child: child,
        );
      },
      home: DestinationScreen(),
    );
  }
}
