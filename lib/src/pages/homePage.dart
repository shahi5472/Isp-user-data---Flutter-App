import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isp_app/src/configs/appColors.dart';

import 'package:isp_app/src/controllers/loginController.dart';
import 'package:isp_app/src/controllers/userDataController.dart';

import 'package:isp_app/src/tabBarPage/newConnection.dart';
import 'package:isp_app/src/tabBarPage/sendMessage.dart';
import 'package:isp_app/src/tabBarPage/supportTab.dart';
import 'package:isp_app/src/tabBarPage/userDataTab.dart';
import 'package:isp_app/src/widgets/kText.dart';

class HomePage extends StatefulWidget {
  final String? currentUserName;

  HomePage({this.currentUserName});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

//

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //

  final _ = Get.put(LoginController());
  final userC = Get.put(UserDataController());

  @override
  Widget build(BuildContext context) {
    // userC.getuserData();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(104),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Container(
                width: 100,
                child: KText(
                  text: '${widget.currentUserName}',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    _.userSignOut(accessToken: 'accessToken');
                  },
                  icon: CircleAvatar(
                    backgroundColor: black12,
                    child: Icon(
                      Icons.logout,
                      color: black,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: black12,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: TabBar(
                  indicatorColor: Colors.orange,
                  unselectedLabelColor: black,
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                  labelColor: Colors.orange,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'New Connection'),
                    Tab(text: 'Support'),
                    Tab(text: 'User Data'),
                    Tab(text: 'Send Message'),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height * 1.2,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    NewCollectionTab(),
                    SupportTab(),
                    UserDataTab(),
                    SendMessageTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
