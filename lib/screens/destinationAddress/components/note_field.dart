import 'package:flutter/material.dart';

import '../../../constants.dart';

class NoteField extends StatefulWidget {
  @override
  _NoteFieldState createState() => _NoteFieldState();
}

class _NoteFieldState extends State<NoteField> {
  String _note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add Notes To Our Driver",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: inputDecoration,
          initialValue: _note,
        )
      ],
    );
  }
}
