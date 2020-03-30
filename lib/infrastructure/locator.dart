import 'package:flutter_template/model/app_settings.dart';
import 'package:flutter_template/infrastructure/repository/record_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupLocator(AppSettings appSettings) {
  locator.registerSingleton(RecordRepository(appSettings.baseUrl));
}
