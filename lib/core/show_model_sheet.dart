import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Future<void> showModelSheet(BuildContext context,
    {Function()? func1, Function()? func2}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => SizedBox(
        height: 100,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: func1,
              child: Text('انتخاب از دوربین'),
            ),
            Divider(),
            InkWell(
              onTap: func2,
              child: Text('انتخاب از گالری'),
            )
          ],
        ))),
  );
}
