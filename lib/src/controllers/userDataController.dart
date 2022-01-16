
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataController extends GetxController {
  // final _ = Get.put(LoginController());
  final _dio = Dio();
  final customerDataList = RxMap();

  getuserData({String? id}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final value = sharedPreferences.get('accessToken');

      final token = sharedPreferences.get('accessToken');
     

      final res = await _dio.get(
        'http://support.nbox.live:82/data/care_api/v1/$id',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $token'
          },
        ),
      );
      print('-----------------------');
      print(value);
      print('-----------------------');

      if (res.statusCode == 200) {
        print(res.data['data']['customer_info']);

        customerDataList.value = res.data['data']['customer_info'];
      }
    } catch (e) {
      print(e);
    }
  }
}
