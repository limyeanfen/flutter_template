import 'package:flutter/material.dart';
import 'package:flutter_template/features/record/component/record_summary_card.dart';
import 'package:flutter_template/infrastructure/viewmodel/record/record_summary_screen_view_model.dart';
import 'package:flutter_template/model/record.dart';
import 'package:provider/provider.dart';

class RecordSummaryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecordSummaryScreenViewModel recordSummaryScreenViewModel = Provider.of(
      context,
      listen: false,
    );
    return Center(
      child: FutureBuilder(
        future: recordSummaryScreenViewModel.listRecord,
        builder: (BuildContext context, AsyncSnapshot<List<Record>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
          }

          List<Record> records = snapshot.data;

          return ListView.separated(
            padding: const EdgeInsets.all(20),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10);
            },
            itemBuilder: (BuildContext context, int index) {
              return RecordSummaryCard(records[index]);
            },
            itemCount: records.length,
          );
        },
      ),
    );
  }
}
