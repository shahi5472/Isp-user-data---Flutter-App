import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:isp_app/src/configs/appColors.dart';
import 'package:isp_app/src/controllers/baseController.dart';
import 'package:isp_app/src/widgets/googleMap.dart';
import 'package:isp_app/src/widgets/kText.dart';
import 'package:isp_app/src/widgets/webViewMap.dart';

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
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextFormField(
              onChanged: (val) {
                setState(() {

                  userDataC.getuserData(id: _controller.text);
                });
              },
              controller: _controller,
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
          _controller.text.isNotEmpty
              ? customUserData()
              : Center(
                  child: KText(text: 'No User'),
                ),
        ],
      ),
    );
  }

  Widget customUserData() {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        // itemCount: userDataC.customerDataList.length,
        itemCount: 1,
        itemBuilder: (context, index) {
          final users = userDataC.customerDataList;

          return Obx(() => userDataC.customerDataList.length == 0
              ? Center(
                  child: KText(text: 'No User Found'),
                )
              : Card(
                  elevation: 5,
                  child: Container(
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: orange),
                    //     borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                            title: 'User id :',
                            text: users['idNumber'],
                            textColor: orange,
                          ),
                          customUserInfo(
                            icon: EvaIcons.person,
                            title: 'User name :',
                            text: users['first_name'],
                            textColor: black,
                          ),
                          customUserInfo(
                            icon: EvaIcons.home,
                            title: 'Address :',
                            text: users['address'],
                            textColor: black,
                          ),
                          customUserInfo(
                            icon: EvaIcons.phoneCall,
                            title: 'Mobile number :',
                            text: users['mobileNumber'],
                            textColor: black,
                          ),
                          customUserInfo(
                            icon: EvaIcons.phoneCall,
                            title: 'Alernative mobile number :',
                            text: users['alernative_mobile_number'],
                            textColor: black,
                          ),
                          customUserInfo(
                            icon: EvaIcons.personDone,
                            title: 'Username :',
                            text: users['username'],
                            textColor: black,
                          ),
                          customUserInfo(
                            icon: EvaIcons.lock,
                            title: 'Password :',
                            text: users['password'],
                            textColor: black,
                          ),
                          customUserInfo(
                            icon: EvaIcons.radio,
                            title: 'Fiber code :',
                            text: users['fiber_code'],
                            textColor: black,
                          ),
                          customUserInfo(
                            icon: EvaIcons.hardDrive,
                            title: 'Fiber length :',
                            text: users['fiber_length'],
                            textColor: black,
                          ),
                          customUserInfo(
                            icon: EvaIcons.hardDrive,
                            title: 'Fiber brand :',
                            text: users['fiber_brand'],
                            textColor: black,
                          ),
                          customUserInfo(
                            icon: EvaIcons.pin,
                            title: 'Map location :',
                            text: users['map_location'],
                            textColor: black,
                          ),
                          SizedBox(height: 20),
                          actionButton(
                            alternativeNumber:
                                users['alernative_mobile_number'],
                            callByNumber: users['mobileNumber'],
                            mapLocation: users['map_location'],
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
        });
  }

  Widget customUserInfo({
    required IconData icon,
    required String title,
    required String text,
    required Color textColor,
  }) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
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
        ),
      ],
    );
  }

  //

  actionButton({
    required String callByNumber,
    required String alternativeNumber,
    required String mapLocation,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customButton(
          onTapValue: () async {
            await FlutterPhoneDirectCaller.callNumber(
              callByNumber,
            );
          },
          buttonTitle: 'Number',
          buttonColor: Colors.green,
          iconColor: white,
          icon: Icons.call,
        ),
        customButton(
          onTapValue: () async {
            await FlutterPhoneDirectCaller.callNumber(
              alternativeNumber,
            );
          },
          buttonTitle: 'Alternative No',
          buttonColor: black12,
          iconColor: Colors.green,
          icon: Icons.call,
        ),
        customButton(
          onTapValue: () {
            GMapDefaultOpen.openMap(latitudeAndLongitude: mapLocation);
          },
          buttonTitle: 'Map',
          buttonColor: Colors.green,
          iconColor: white,
          icon: Icons.location_on,
        ),
        customButton(
          onTapValue: () => Get.to(
            WebViewMap(
              latitudeAndLongitude: mapLocation,
            ),
          ),
          buttonTitle: 'WebView Map',
          buttonColor: black12,
          iconColor: Colors.green,
          icon: Icons.location_on,
        ),
      ],
    );
  }

  customButton({
    required void Function()? onTapValue,
    required String buttonTitle,
    required Color buttonColor,
    required Color iconColor,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onTapValue,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: buttonColor,
            ),
            child: Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
          ),
          SizedBox(height: 5),
          KText(
            text: buttonTitle,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
