import 'package:flutter/material.dart';
import 'package:flutter_template/domain/i18n.dart';
import 'package:flutter_template/features/record/component/record_summary_list.dart';
import 'package:flutter_template/infrastructure/locator.dart';
import 'package:flutter_template/infrastructure/viewmodel/record/record_summary_screen_view_model.dart';
import 'package:provider/provider.dart';

class RecordSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecordSummaryScreenViewModel recordSummaryScreenViewModel = locator.get();
    I18n i18n = I18n.of(context);
    return ChangeNotifierProvider<RecordSummaryScreenViewModel>(
      create: (_) => recordSummaryScreenViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(i18n.recordSummaryScreenTitle),
        ),
        body: RecordSummaryList(),
      ),
    );
  }
}
