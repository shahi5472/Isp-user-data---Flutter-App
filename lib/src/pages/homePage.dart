import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isp_app/src/configs/appColors.dart';

import 'package:isp_app/src/pages/loginPage.dart';
import 'package:isp_app/src/tabBarPage/newCollection.dart';
import 'package:isp_app/src/tabBarPage/sendMessage.dart';
import 'package:isp_app/src/tabBarPage/supportTab.dart';
import 'package:isp_app/src/tabBarPage/userDataTab.dart';
import 'package:isp_app/src/widgets/kText.dart';

class HomePage extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(104),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: KText(
                text: 'MOSHIUR SAZZAD SOHAN',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: black,
              ),
              actions: [
                IconButton(
                  onPressed: () => Get.to(LoginPage()),
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
                  labelColor: Colors.orange,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: 'New Collection'),
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
