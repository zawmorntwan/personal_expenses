import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final String text;
  final Function() handler;
  const AdaptiveTextButton(
      {required this.text, required this.handler, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(text),
            onPressed: handler,
          )
        : TextButton(
            onPressed: handler,
            child: Text(text),
          );
  }
}
