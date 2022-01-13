import 'package:flutter/material.dart';
import 'package:isp_app/src/widgets/kText.dart';

class SendMessageTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: KText(
          text: 'Send Message Tab',
          color: Colors.black,
        ),
      ),
    );
  }
}
