import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController {
  final _dio = Dio();
  final customerDataList = RxMap();
  final isLoading = RxBool(false);

  getuserData({String? query, String? id}) async {
    try {
      if (isLoading.value = true) {
        final res = await _dio.get(
            'https://care.novusnk.net/api/web/v1/api/customer?idNumber=$id');

        if (res.statusCode == 200) {
          print(res.data['data']['customer_info']);

          var results =
              customerDataList.value = res.data['data']['customer_info'];

          isLoading.value = false;

          print('-----------------------------');
          print(results);
          print('-----------------------------');

          if (query != null) {
            results = results
                .where((element) => element['idNumber']
                    .toLowerCase()
                    .contains((query.toLowerCase())))
                .toList();
          }
        }
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }
}
