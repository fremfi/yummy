import 'package:flutter/material.dart';

extension ParseToString on ThemeMode {
  String toShortString() {
    // ignore: unnecessary_this
    return this.toString().split('.').last;
  }
}
