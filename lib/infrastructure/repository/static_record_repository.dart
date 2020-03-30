import 'package:flutter_template/model/record.dart';
import 'package:flutter_template/model/record_repository.dart';

class StaticRecordRepository implements RecordRepository {
  StaticRecordRepository(this.records);

  final List<Record> records;

  @override
  Future<List<Record>> list(int pageSize, int page) async {
    return records;
  }

  @override
  Future<Record> read(String id) async {
    return records.firstWhere(
      (Record record) => record.id == id,
      orElse: () => null,
    );
  }

  @override
  Future<Record> add(Record record) async {
    records.add(record);
    return record;
  }

  @override
  Future<Record> update(String id, Record record) async {
    record.id = id;

    int index = records.indexWhere((Record record) => record.id == id);
    records.replaceRange(index, 1, [record]);

    return record;
  }

  @override
  Future<void> remove(String id) async {
    return records.removeWhere((Record record) => record.id == id);
  }
}
