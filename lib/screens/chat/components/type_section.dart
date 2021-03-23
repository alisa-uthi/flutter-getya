import 'package:flutter/material.dart';

import '../../../constants.dart';

class TypeSection extends StatelessWidget {
  const TypeSection({this.onChanged});

  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding / 2),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kSecondaryColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                decoration: inputDecoration,
                onFieldSubmitted: (value) {
                  _controller.clear();
                  onChanged(value);
                },
              ),
            ),
            SizedBox(width: kDefaultPadding / 2),
            Icon(
              Icons.camera_alt,
              size: 30,
            ),
            SizedBox(width: kDefaultPadding / 2),
            Icon(
              Icons.phone,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
