import 'package:flutter_template/infrastructure/repository/record_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerSingleton(RecordRepository('http://www.example.com'));
}
