import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isp_app/src/configs/appColors.dart';
import 'package:isp_app/src/controllers/baseController.dart';
import 'package:isp_app/src/pages/homePage.dart';
import 'package:isp_app/src/pages/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SplashPage extends StatefulWidget {
  String? finalToken;
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with BaseController {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
        Duration(seconds: 2),
        () => Get.to(
          widget.finalToken == null || widget.finalToken!.isEmpty
              ? LoginPage()
              : HomePage(
                  currentUserName: widget.finalToken,
                ),
        ),
      );
    });
    super.initState();
  }

  Future getValidationData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString('accessToken');
    setState(() {
      widget.finalToken = obtainedToken;

      print('Current user token is ${widget.finalToken}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 70,
          backgroundColor: white,
          backgroundImage: AssetImage(
            'assets/img/login_logo.png',
          ),
        ),
      ),
    );
  }
}
