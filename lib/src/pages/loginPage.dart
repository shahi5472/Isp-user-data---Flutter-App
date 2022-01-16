import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isp_app/src/configs/appColors.dart';
import 'package:isp_app/src/controllers/baseController.dart';

class LoginPage extends StatelessWidget with BaseController {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: white,
                backgroundImage: AssetImage(
                  'assets/img/login_logo.png',
                ),
              ),
              // Image.asset('assets/img/login_logo.jpeg'),
              SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                onChanged: loginC.username,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Username',
                  hintStyle: GoogleFonts.lato(
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    EvaIcons.person,
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
                controller: _passwordController,
                onChanged: loginC.password,
                obscureText: true,
                obscuringCharacter: '*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
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
                    EvaIcons.lock,
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginC.getLoginUser();
                    }
                  },
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
      ),
    );
  }
}
