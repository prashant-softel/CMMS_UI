import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/domain/repositories/repository.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../navigators/app_pages.dart';

class HeadingProfileAppBar extends GetView<HomeController> {
  HeadingProfileAppBar({
    required this.title,
    super.key,
  });

  final HomeController controller = Get.find<HomeController>();  var repository = Get.find<Repository>();

  String title;
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: Get.width / 4,
              child: Text(
                title,
                overflow: TextOverflow.clip,
              ),
            ),
            Spacer(),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: ColorValues.blueMediumColor,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Color.fromARGB(255, 206, 200, 200),
                      child: Icon(Icons.person,
                          color: ColorValues.blueMediumColor),
                    ), // icon

                    SizedBox(width: 5), // space between icon and text

                    GestureDetector(
                      onTap: () {
                        print("${varUserAccessModel.value.user_name ?? ""}");
                      },
                      child: Text(
                        "${varUserAccessModel.value.user_name}",
                        style: TextStyle(
                          color: Colors.black, // text color
                          fontSize: 12, // text size
                          fontWeight: FontWeight.w500, // text weight
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(
                          Stack(children: [
                            Positioned(
                              right: 1,
                              top: 70,
                              child: Container(
                                width: 200,
                                child: AlertDialog(
                                  insetPadding: Dimens.edgeInsets10_0_10_0,
                                  contentPadding: EdgeInsets.all(20),
                                  backgroundColor: ColorValues.appDarkBlueColor,
                                  content: Column(
                                      // mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.clearStoreData();

                                            Get.toNamed(Routes.profile,
                                                arguments: {
                                                  'userId': varUserAccessModel
                                                      .value.user_id,
                                                });
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: Color(0xffD2D0D0),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Profile",
                                                  style: TextStyle(
                                                    color: Color(0xffD2D0D0),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Color(0xffD2D0D0),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              Routes.setting,
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.settings,
                                                color: Color(0xffD2D0D0),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Settings",
                                                  style: TextStyle(
                                                    color: Color(0xffD2D0D0),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Color(0xffD2D0D0),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _isDeleteDialog();
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.logout,
                                                color: Color(0xffD2D0D0),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Log Out",
                                                  style: TextStyle(
                                                    color: Color(0xffD2D0D0),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ]),
                        );
                      },
                      child: Icon(Icons.keyboard_arrow_down_outlined,
                          color: ColorValues.blackColor),
                    ),
                  ],
                ),
              ),
            ),
            Icon(Icons.notifications_active, color: ColorValues.greyLightColor),
          ],
        ),
      ),
    );
  }

  _isDeleteDialog() {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.logout_outlined, size: 35, color: ColorValues.redColor),
          SizedBox(
            height: 10,
          ),
          Text(
            'Are you sure you want to logout?',
            style: Styles.blackBold14w500,
          ),
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('NO'),
              ),
              TextButton(
                onPressed: () {repository.deleteAllSecuredValues();
                  Get.offAllNamed(Routes.login);
                },
                child: Text('YES'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
