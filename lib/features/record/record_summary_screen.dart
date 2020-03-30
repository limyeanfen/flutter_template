import 'package:flutter/material.dart';
import 'package:flutter_template/features/record/component/record_summary_list.dart';
import 'package:flutter_template/infrastructure/locator.dart';
import 'package:flutter_template/infrastructure/viewmodel/record/record_summary_screen_view_model.dart';
import 'package:provider/provider.dart';

class RecordSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecordSummaryScreenViewModel recordSummaryScreenViewModel = locator.get();
    return ChangeNotifierProvider<RecordSummaryScreenViewModel>(
      create: (_) => recordSummaryScreenViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Record Summary'),
        ),
        body: RecordSummaryList(),
      ),
    );
  }
}
