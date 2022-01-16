import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isp_app/src/configs/appTheme.dart';
import 'package:isp_app/src/pages/splashPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      theme: AppTheme.appTheme,
      home: SplashPage(),
    );
  }
}
