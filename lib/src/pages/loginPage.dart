import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isp_app/src/configs/appColors.dart';
import 'package:isp_app/src/pages/homePage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 40),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Email',
                hintStyle: GoogleFonts.lato(
                  color: Colors.black45,
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.black54,
                  size: 20,
                ),
                prefixStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                fillColor: black12,
                filled: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Password',
                hintStyle: GoogleFonts.lato(
                  color: Colors.black45,
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: Colors.black54,
                  size: 20,
                ),
                fillColor: black12,
                filled: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 55,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () => Get.to(HomePage()),
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
