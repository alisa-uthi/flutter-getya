import 'package:flutter/material.dart';
import 'package:getya/screens/chat/chat_screen.dart';
import 'package:getya/screens/confirmOrder/confirm_order_screen.dart';
import 'package:getya/screens/deliveryStatus/delivery_status_screen.dart';
import 'package:getya/screens/destinationAddress/destination_screen.dart';
import 'package:getya/screens/editProfile/edit_profile_screen.dart';
import 'package:getya/screens/home/home_screen.dart';
import 'package:getya/screens/notification/notification_screen.dart';
import 'package:getya/screens/orderComplete/order_complete.dart';
import 'package:getya/screens/pharmacyProducts/pharmacy_products_screen.dart';
import 'package:getya/screens/productDetail/product_detail_screen.dart';
import 'package:getya/screens/profile/profile_screen.dart';
import 'package:getya/screens/reportIssue/report_issue_screen.dart';
import 'package:getya/screens/reportIssue/report_success_screen.dart';
import 'package:getya/screens/shoppingCart/shopping_cart_screen.dart';
import 'package:getya/screens/signup/signup_screen.dart';
import 'package:getya/screens/signup/signup_success_screen.dart';
import 'package:getya/screens/splash_screen.dart';

import 'screens/signin/signin_screen.dart';

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
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  ShoppingCartScreen.routeName: (context) => ShoppingCartScreen(),
  DeliveryStatusScreen.routeName: (context) => DeliveryStatusScreen(),
  ReportIssueScreen.routeName: (context) => ReportIssueScreen(),
  ReportSucessScreen.routeName: (context) => ReportSucessScreen(),
  DestinationScreen.routeName: (context) => DestinationScreen(),
  ConfirmOrderScreen.routeName: (context) => ConfirmOrderScreen(),
  OrderCompleteScreen.routeName: (context) => OrderCompleteScreen(),
  ChatScreen.routeName: (context) => ChatScreen(),
};
