import 'package:get/get.dart';
import 'package:isp_app/src/controllers/connectionContoller.dart';
import 'package:isp_app/src/controllers/loginController.dart';
import 'package:isp_app/src/controllers/userDataController.dart';

class BaseController {
  final userDataC = Get.put(UserDataController() );
  final connectionDataC = Get.put(ConnectionController() );
  final loginC = Get.put(LoginController() );
}
