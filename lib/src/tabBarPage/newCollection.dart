import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isp_app/src/configs/appColors.dart';
import 'package:isp_app/src/widgets/kText.dart';

class NewCollectionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(
            text: 'Main',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 6,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: 'Test',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            KText(
                              text: 'name : ',
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                            KText(
                              text: 'Lorem Ipsum',
                              fontSize: 16,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            KText(
                              text: 'description : ',
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                            KText(
                              text: 'Lorem Ipsum Dolor Sit',
                              fontSize: 16,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            KText(
                              text: 'id : ',
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                            KText(
                              text: '21537',
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    height: 80,
                    width: Get.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: black12,
                          backgroundImage: AssetImage(
                            'assets/img/profile_avatar.jpg',
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              text: 'Lorem Ipsum',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 3),
                            KText(
                              text: 'Lorem Ipsum Dolor Sit amet',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 3),
                            KText(
                              text: '21537',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
