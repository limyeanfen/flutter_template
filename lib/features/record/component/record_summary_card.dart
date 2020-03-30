import 'package:flutter/material.dart';
import 'package:flutter_template/model/record.dart';

class RecordSummaryCard extends StatelessWidget {
  const RecordSummaryCard(this.record);

  final Record record;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(record.id),
        ),
      ),
    );
  }
}
