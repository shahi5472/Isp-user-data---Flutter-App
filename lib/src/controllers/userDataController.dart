import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataController extends GetxController {
  // final _ = Get.put(LoginController());
  final _dio = Dio();
  final customerDataList = RxMap();

  getuserData({required String id}) async {
    print('++++++++++++++++++++++++++++++++++');
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.get('accessToken');

      print(token);

      final res = await _dio.get(
        'http://support.nbox.live:82/data/care_api/v1/$id',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": ' $token'
          },
        ),
      );

      print(res.statusCode);
      print(res.headers);
      // print(res.body);
      // print(res.unauthorized);
      print(res.realUri);
      print(res.statusMessage);
      print(res.data);
      print(res.realUri);
      print(res.requestOptions);

      print('++++++++++++++++++++++++++++++++++');

      if (res.statusCode == 200) {
        print(res.data['data']['customer_info']);

        customerDataList.value = res.data['data']['customer_info'];
      }
    } catch (e) {
      print(e);
    }
  }
}
