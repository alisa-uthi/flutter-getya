import 'package:flutter/material.dart';
import 'package:getya/screens/splash_screen.dart';

import 'screens/signin_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
};
