import 'package:flutter/material.dart';
import 'package:flutter_template/domain/i18n.dart';
import 'package:flutter_template/infrastructure/router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    I18n i18n = I18n.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.mainScreenTitle),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(i18n.mainScreenCheckRecordSummary),
          onPressed: () =>
              Navigator.of(context).pushNamed(Router.recordSummaryScreenRoute),
        ),
      ),
    );
  }
}
