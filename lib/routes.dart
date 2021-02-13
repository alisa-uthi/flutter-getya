import 'package:flutter/material.dart';
import 'package:getya/screens/edit_personal_info_screen.dart';
import 'package:getya/screens/home_screen.dart';
import 'package:getya/screens/notification_screen.dart';
import 'package:getya/screens/pharmacy_products_screen.dart';
import 'package:getya/screens/product_detail_screen.dart';
import 'package:getya/screens/profile_screen.dart';
import 'package:getya/screens/signup_screen.dart';
import 'package:getya/screens/signup_success_screen.dart';
import 'package:getya/screens/splash_screen.dart';

import 'screens/signin_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignUpSuccessScreen.routeName: (context) => SignUpSuccessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  PharmacyProductsScreen.routeName: (context) => PharmacyProductsScreen(),
  ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  EditPersonalInfoScreen.routeName: (context) => EditPersonalInfoScreen(),
};
