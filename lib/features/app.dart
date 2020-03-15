import 'package:flutter/material.dart';
import 'package:flutter_template/features/main/home.dart';
import 'package:flutter_template/infrastructure/router.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      initialRoute: Router.homeScreenRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
