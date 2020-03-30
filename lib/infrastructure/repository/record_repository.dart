import 'package:flutter_template/model/record.dart';
import 'package:flutter_template/infrastructure/repository/base_repository.dart';

class RecordRepository extends BaseRepository {
  RecordRepository(String baseUrl) : super(baseUrl);

  Future<List<Record>> list(int pageSize, int page) async {
    List<dynamic> records = await super.getAll(
      '/record',
      pageSize: pageSize,
      page: page,
    );

    return records.map((dynamic record) => Record.fromJson(record)).toList();
  }

  Future<Record> read(String id) async {
    dynamic record = await super.get("/record/$id");

    return Record.fromJson(record);
  }

  Future<Record> add(Record record) async {
    dynamic newRecord = await super.post('/record', record.toJson());

    return Record.fromJson(newRecord);
  }

  Future<Record> update(String id, Record record) async {
    dynamic updatedRecord = await super.put("/record/$id", record.toJson());

    return Record.fromJson(updatedRecord);
  }

  Future<void> remove(String id) {
    return super.delete("/record/$id");
  }
}
