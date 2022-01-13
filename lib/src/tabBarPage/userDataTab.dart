import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:isp_app/src/configs/appColors.dart';
import 'package:isp_app/src/controllers/baseController.dart';
import 'package:isp_app/src/widgets/kText.dart';

class UserDataTab extends StatefulWidget {
  @override
  State<UserDataTab> createState() => _UserDataTabState();
}

class _UserDataTabState extends State<UserDataTab> with BaseController {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: black12,
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextFormField(
              onSaved: (val) {
                setState(() {
                  val = _controller.text;

                  userDataC.getuserData(id: _controller.text);
                });
              },
              onFieldSubmitted: (val) {
                setState(() {
                  val = _controller.text;

                  userDataC.getuserData(id: _controller.text);
                });
              },
              controller: _controller,
              onChanged: onSearchTextChanged,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: black12, width: .0),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: black12),
                    borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(
                  EvaIcons.person,
                  color: black12,
                  size: 20,
                ),
                hintText: 'Search user',
                fillColor: white,
                filled: true,
              ),
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 20),
          _controller.text.length == 5
              ? customUserData()
              : Center(
                  child: KText(text: 'No User'),
                )
        ],
      ),
    );
  }

  Widget customUserData() {
    return userDataC.isLoading.value == true
        ? ListView.builder(
            shrinkWrap: true,
            primary: false,
            // itemCount: userDataC.customerDataList.length,
            itemCount: 1,
            itemBuilder: (context, index) {
              final users = userDataC.customerDataList;

              return userDataC.customerDataList.isEmpty
                  ? Obx(
                      () => Card(
                        elevation: 5,
                        child: Container(
                          // decoration: BoxDecoration(
                          //     border: Border.all(color: orange),
                          //     borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: black12,
                                  backgroundImage: AssetImage(
                                    'assets/img/profile_avatar.jpg',
                                  ),
                                ),
                                SizedBox(height: 20),
                                customUserInfo(
                                  icon: EvaIcons.checkmarkCircle2,
                                  title: 'user id :',
                                  text: users['idNumber'],
                                  textColor: orange,
                                ),
                                SizedBox(height: 10),
                                customUserInfo(
                                  icon: EvaIcons.person,
                                  title: 'user name :',
                                  text: users['first_name'],
                                  textColor: black,
                                ),
                                SizedBox(height: 10),
                                customUserInfo(
                                  icon: EvaIcons.pin,
                                  title: 'address :',
                                  text: users['address'],
                                  textColor: black,
                                ),
                                SizedBox(height: 10),
                                customUserInfo(
                                  icon: EvaIcons.phoneCall,
                                  title: 'mobile number :',
                                  text: users['mobileNumber'],
                                  textColor: black,
                                ),
                                SizedBox(height: 10),
                                customUserInfo(
                                  icon: EvaIcons.phoneCall,
                                  title: 'alernative mobile number :',
                                  text: users['alernative_mobile_number'],
                                  textColor: black,
                                ),
                                SizedBox(height: 10),
                                customUserInfo(
                                  icon: EvaIcons.personDone,
                                  title: 'username :',
                                  text: users['username'],
                                  textColor: black,
                                ),
                                SizedBox(height: 10),
                                customUserInfo(
                                  icon: EvaIcons.lock,
                                  title: 'password :',
                                  text: users['password'],
                                  textColor: black,
                                ),
                                SizedBox(height: 10),
                                customUserInfo(
                                  icon: EvaIcons.radio,
                                  title: 'fiber code :',
                                  text: users['fiber_code'],
                                  textColor: black,
                                ),
                                SizedBox(height: 10),
                                customUserInfo(
                                  icon: EvaIcons.hardDrive,
                                  title: 'fiber length :',
                                  text: users['fiber_length'],
                                  textColor: black,
                                ),
                                SizedBox(height: 10),
                                customUserInfo(
                                  icon: EvaIcons.hardDrive,
                                  title: 'fiber brand :',
                                  text: users['fiber_brand'],
                                  textColor: black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: KText(text: 'No User Found'),
                    );
            })
        : Center(
            child: CircularProgressIndicator(
              color: orange,
            ),
          );
  }

  Widget customUserInfo({
    required IconData icon,
    required String title,
    required String text,
    required Color textColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: black12,
        ),
        SizedBox(width: 5),
        KText(
          text: title,
          fontSize: 12,
          color: Colors.black54,
        ),
        SizedBox(width: 10),
        Expanded(
          child: KText(
            text: text,
            fontSize: 15,
            maxLines: 2,
            color: textColor,
            wordSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  //

  onSearchTextChanged(String text) async {
    userDataC.customerDataList.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    userDataC.customerDataList.forEach((userDetails, data) {
      if (userDetails['idNumber'].contains(text)) {
        userDataC.customerDataList.addAll(userDetails);
      }
    });
    setState(() {});
  }
}
