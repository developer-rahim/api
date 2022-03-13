import 'package:flutter/material.dart';
import 'package:flutter_developer_test/homePage/homeScreen.dart';

import 'package:provider/provider.dart';

import 'controller/api_controller.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => WeatherDataModel(),

//     child: MaterialApp(

//       debugShowCheckedModeBanner: false, home: HomePage()),
//   ));
// }
void main() {
  runApp(ChangeNotifierProvider<ApiController>(
      create: (context) => ApiController(),
      child: Builder(
        builder: (context) =>
            MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
      )));
}
