import 'package:flutter/material.dart';
import 'package:flutter_template/model/record.dart';
import 'package:flutter_template/model/record_repository.dart';

class RecordSummaryScreenViewModel with ChangeNotifier {
  RecordSummaryScreenViewModel({this.recordRepository});

  final RecordRepository recordRepository;

  Future<List<Record>> get listRecord => Future.delayed(
        Duration(seconds: 1),
        () => this.recordRepository.list(0, 0),
      );
}
