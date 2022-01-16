import 'dart:io';

import 'package:flutter/material.dart';
 
import 'package:webview_flutter/webview_flutter.dart';

class WebViewMap extends StatefulWidget {
  final String latitudeAndLongitude;
  WebViewMap({
    required this.latitudeAndLongitude,
  });
  @override
  WebViewMapState createState() => WebViewMapState();
}

class WebViewMapState extends State<WebViewMap> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl:
              'https://www.google.com/maps/search/?api=1&query=${widget.latitudeAndLongitude}',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
