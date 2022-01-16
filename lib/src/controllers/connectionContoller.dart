import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  final _dio = Dio();
  final RxList connectionList = [].obs;



  getconnectionList() async {
    try {
      final res = await _dio
          .get('http://support.nbox.live:82/new_connection/?search=test');

      if (res.statusCode == 200) {
        print('-------------------------');
        print('Api data length : ${res.data.length}');
        print('-------------------------');
        print('Get data length : ${connectionList.length}');
        print('-------------------------');

        // connectionList.addAll(res.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
