import 'package:get/get.dart';
import 'package:isp_app/src/controllers/userDataController.dart';

class BaseController {
  final userDataC = Get.put(UserDataController(),permanent: true);
}
