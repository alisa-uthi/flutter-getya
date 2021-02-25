import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getya/widgets/circular_progress.dart';

import '../constants.dart';

class SucessScreen extends StatefulWidget {
  final String titleAppBar;
  final String title;
  final String message;
  final String submessage;
  final Function navigation;
  final Widget screen;

  const SucessScreen({
    Key key,
    this.titleAppBar,
    @required this.title,
    @required this.message,
    @required this.submessage,
    this.navigation,
    this.screen,
  }) : super(key: key);

  @override
  _SucessScreenState createState() => _SucessScreenState();
}

class _SucessScreenState extends State<SucessScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.screen != null) {
      startTime();
    }
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget.screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.done,
              size: 120,
              color: kGreenColor,
            ),
            Text(
              widget.message,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.submessage,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            widget.screen == null
                ? GestureDetector(
                    onTap: widget.navigation,
                    child: Text(
                      "Here",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kGreenColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                : CircularProgress(),
          ],
        ),
      ),
    );
  }
}
