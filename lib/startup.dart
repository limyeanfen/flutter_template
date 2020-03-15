import 'package:flutter/material.dart';
import 'package:flutter_template/features/app.dart';
import 'package:flutter_template/infrastructure/locator.dart';

startup() {
  setupLocator();
  runApp(App());
}
