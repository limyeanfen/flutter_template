import 'package:flutter/material.dart';
import 'package:flutter_template/features/main.dart';
import 'package:flutter_template/infrastructure/locator.dart';

startup() {
  setupLocator();
  runApp(MyApp());
}
