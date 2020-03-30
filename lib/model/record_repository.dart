import 'package:flutter_template/model/record.dart';

abstract class RecordRepository {
  Future<List<Record>> list(int pageSize, int page);

  Future<Record> read(String id);

  Future<Record> add(Record record);

  Future<Record> update(String id, Record record);

  Future<void> remove(String id);
}
