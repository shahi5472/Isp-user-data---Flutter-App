import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isp_app/src/configs/appTheme.dart';
import 'package:isp_app/src/controllers/userDataController.dart';
import 'package:isp_app/src/pages/splashPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userDataController = Get.put(UserDataController());
    userDataController.getuserData(id: '215');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      theme: AppTheme.appTheme,
      home: SplashPage(),
    );
  }
}
