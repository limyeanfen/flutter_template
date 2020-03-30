import 'package:flutter/material.dart';
import 'package:flutter_template/model/record.dart';

class RecordSummaryCard extends StatelessWidget {
  const RecordSummaryCard(this.record);

  final Record record;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: null,
        child: Text(record.id),
      ),
    );
  }
}
