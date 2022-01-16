import 'package:dio/dio.dart';

// Dio createDio() {
//   return Dio(BaseOptions(
//       connectTimeout: 5000,
//       receiveTimeout: 5000,
//       baseUrl: "http://support.nbox.live:82/login/"));
// }
//  void Function(RequestOptions, RequestInterceptorHandler)   Dio addInterceptors(Dio dio) {
//   return dio
//     ..interceptors.add(InterceptorsWrapper(
//         onRequest: (RequestOptions options) => requestInterceptor(options),
//         onResponse: (Response response) => responseInterceptor(response),
//         onError: (DioError dioError) => errorInterceptor(dioError)));
// }



// Future<Response> fetchItems() {
//   return Dio().("https://some-website.com/listing");
// }