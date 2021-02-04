import 'package:flutter/material.dart';
import 'package:getya/constants.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Color boxColor;
  final Function onPressed;

  const CustomBtn({
    Key key,
    this.text,
    this.boxColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Center(
            child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.white,
              ),
        )),
      ),
    );
  }
}
