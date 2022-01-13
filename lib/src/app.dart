import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isp_app/src/configs/appTheme.dart';
import 'package:isp_app/src/pages/homePage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: HomePage(),
    );
  }
}
