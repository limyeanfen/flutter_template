import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_template/infrastructure/repository/static_record_repository.dart';
import 'package:flutter_template/infrastructure/viewmodel/record/record_summary_screen_view_model.dart';
import 'package:flutter_template/model/app_settings.dart';
import 'package:flutter_template/model/record.dart';
import 'package:flutter_template/model/record_repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

Future<void> setupLocator(AppSettings appSettings) async {
  List<Record> staticRecords = await _loadRecord();

  RecordRepository recordRepository = StaticRecordRepository(staticRecords);

  locator.registerFactory(
    () => RecordSummaryScreenViewModel(
      recordRepository: recordRepository,
    ),
  );
}

Future<List<Record>> _loadRecord() {
  return rootBundle.loadStructuredData<List<Record>>(
    'static/data/records.json',
    (String json) async => (jsonDecode(json) as List<dynamic>)
        .map((dynamic recordJson) => Record.fromJson(recordJson))
        .toList(),
  );
}
