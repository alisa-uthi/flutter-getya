import 'package:flutter/material.dart';
import 'package:getya/screens/signin_screen.dart';

class SplashScreen extends StatelessWidget {
  static final routeName = '/spash';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/getya_logo.png',
                width: 270,
                height: 270,
              ),
              Text(
                "GETYA",
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
