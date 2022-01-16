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
      final res = await _dio.post('http://support.nbox.live:82/login/', data: {
        'username': username.value,
        'password': password.value,
      });

      print('++++++++++++++++++++++++++++++++++++++++++++++++');
      print(res.statusCode);
      print(res.statusMessage);
      print(res.data);
      print(res.data['token']);
      print('++++++++++++++++++++++++++++++++++++++++++++++++');

      if (res.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Login Success',
        );

        sharedPreferences.setString(
          'accessToken',
          res.data['token'],
        );

        //currentUserToken(accessToken: res.data['token']);

        print('Read Access Token => ${sharedPreferences.get('accessToken')}');

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

  Future<void> currentUserToken({
    required String accessToken,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
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
