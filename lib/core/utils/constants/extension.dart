import 'package:flutter/material.dart';

extension Router on BuildContext {
  pushReplacement(Widget destination) {
    Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (context) => destination));
  }
}
