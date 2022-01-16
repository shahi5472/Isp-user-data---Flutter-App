import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isp_app/src/configs/appColors.dart';

import 'package:isp_app/src/pages/homePage.dart';
import 'package:isp_app/src/pages/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final _dio = Dio();

  //
  final username = RxString('');
  final password = RxString('');

  //
  getLoginUser() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final value = sharedPreferences.get('accessToken');

      final res = await _dio.post(
        'http://support.nbox.live:82/login/',
        data: {
          'username': username.value,
          'password': password.value,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $value'
          },
        ),
      );

      if (res.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Login Success',
        );

        currentUserToken(accessToken: res.data['token']);

        await Get.offAll(HomePage());
      }
    } on Exception catch (e) {
      print(e);

      Get.snackbar(
        'Error',
        'User not found',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: white,
      );
    }
  }

  Future<String?> currentUserToken({
    required String accessToken,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
      'accessToken',
      accessToken,
    );

    // if (accessToken.isNotEmpty) {
    //   Get.offAll(HomePage());
    // }
    print('Current user access token is $accessToken ---');
  }

  userSignOut({required String accessToken}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(accessToken);
    print('signout');
    Get.to(LoginPage());
  }
}
