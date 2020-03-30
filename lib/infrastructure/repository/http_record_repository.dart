import 'package:flutter_template/model/record.dart';
import 'package:flutter_template/model/record_repository.dart';
import 'package:flutter_template/seedwork/http_repository.dart';

class HttpRecordRepository extends HttpRepository implements RecordRepository {
  HttpRecordRepository(String baseUrl) : super(baseUrl);

  @override
  Future<List<Record>> list(int pageSize, int page) async {
    List<dynamic> records = await super.getAll(
      '/record',
      pageSize: pageSize,
      page: page,
    );

    return records.map((dynamic record) => Record.fromJson(record)).toList();
  }

  @override
  Future<Record> read(String id) async {
    dynamic record = await super.get("/record/$id");

    return Record.fromJson(record);
  }

  @override
  Future<Record> add(Record record) async {
    dynamic newRecord = await super.post('/record', record.toJson());

    return Record.fromJson(newRecord);
  }

  @override
  Future<Record> update(String id, Record record) async {
    dynamic updatedRecord = await super.put("/record/$id", record.toJson());

    return Record.fromJson(updatedRecord);
  }

  @override
  Future<void> remove(String id) {
    return super.delete("/record/$id");
  }
}
