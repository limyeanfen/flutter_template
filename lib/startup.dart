import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_template/domain/app_settings.dart';
import 'package:flutter_template/features/app.dart';
import 'package:flutter_template/infrastructure/locator.dart';
import 'package:flutter_template/seedwork/map_util.dart';

const String APP_SETTING_JSON = 'appsettings.json';
const String APP_SETTING_LOCAL_JSON = 'appsettings.local.json';

startup() {
  WidgetsFlutterBinding.ensureInitialized();
  loadEnvSettings()
      .then((Map<String, dynamic> envConfig) => AppSettings.fromJson(envConfig))
      .then((AppSettings appSettings) => setupLocator(appSettings))
      .then((_) => runApp(App()));
}

Future<Map<String, dynamic>> loadEnvSettings() async {
  List<Map<String, dynamic>> appSettings = await Future.wait([
    loadJson(APP_SETTING_JSON),
    loadJson(APP_SETTING_LOCAL_JSON),
  ]);

  return MapUtil.mergeMap(appSettings);
}

Future<Map<String, dynamic>> loadJson(String fileName) async {
  try {
    return rootBundle.loadStructuredData<Map<String, dynamic>>(
      fileName,
      (String settings) async => jsonDecode(settings),
    );
  } catch (_) {
    return {};
  }
}
