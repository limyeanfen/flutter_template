import 'package:flutter/material.dart';
import 'package:flutter_template/infrastructure/router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fusionex'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Check User Summary'),
          onPressed: () =>
              Navigator.of(context).pushNamed(Router.summaryScreenRoute),
        ),
      ),
    );
  }
}
