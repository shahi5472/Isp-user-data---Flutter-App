import 'package:flutter/material.dart';
import 'package:isp_app/src/widgets/kText.dart';

class SupportTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: KText(
          text: 'Support Tab',
          color: Colors.black,
        ),
      ),
    );
  }
}
