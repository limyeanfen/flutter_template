import 'package:flutter/material.dart';

class UiSizeHelper {
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double screenHeightOf(BuildContext context, double ratio) =>
      MediaQuery.of(context).size.height * ratio;
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenWidthOf(BuildContext context, double ratio) =>
      MediaQuery.of(context).size.width * ratio;
}
