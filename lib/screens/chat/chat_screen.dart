import 'package:flutter/material.dart';
import 'package:getya/constants.dart';

import 'components/message_box.dart';
import 'components/type_section.dart';

class ChatScreen extends StatefulWidget {
  static final routeName = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> _myMessage = ['Okay!'];

  void _updateMyMessage(message) {
    print(message);
    setState(() {
      _myMessage.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/images/driver.png",
              width: 30,
              height: 30,
            ),
          )
        ],
        title: Text(
          "Driver Kiang",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kDefaultPadding),
                  MessageBox(
                    message: "I have already received your order!",
                    position: FractionalOffset.bottomLeft,
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  for (var message in _myMessage)
                    MessageBox(
                      message: message,
                      position: FractionalOffset.bottomRight,
                    ),
                ],
              ),
            ),
          ),
          TypeSection(
            onChanged: (message) {
              _updateMyMessage(message);
            },
          ),
        ],
      ),
    );
  }
}
