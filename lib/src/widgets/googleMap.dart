import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class GMapDefaultOpen {
  GMapDefaultOpen._();

  static Future<void> openMap({
    required String latitudeAndLongitude,
  }) async {
    try {
      String googleMapUrl =
          'https://www.google.com/maps/search/?api=1&query=$latitudeAndLongitude';
      if (await canLaunch(googleMapUrl)) {
        await launch(googleMapUrl);
      }
    } on Exception catch (e) {
      print(e);

      Get.snackbar('Error', 'Could not open the map');
    }
  }
}
