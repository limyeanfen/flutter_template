import 'package:flutter/material.dart';
import 'package:flutter_template/model/app_settings.dart';
import 'package:flutter_template/features/app.dart';
import 'package:flutter_template/infrastructure/locator.dart';

const String APP_SETTING_JSON = 'appsettings.json';
const String APP_SETTING_LOCAL_JSON = 'appsettings.local.json';

void startup(AppSettings appSettings) {
  setupLocator(appSettings).then((_) => runApp(App()));
}
