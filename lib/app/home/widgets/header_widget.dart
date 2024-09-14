import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../navigators/app_pages.dart';

class HeaderWidget extends GetView<HomeController> {
  HeaderWidget({super.key});

  final HomeController controller = Get.find<HomeController>();
  var repository = Get.find<Repository>();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
        () => Container(
          height: 60,
          decoration: BoxDecoration(
            color: ColorValues.whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Icon(Icons.menu),
                    onTap: () {
                      controller.menuButton.toggle();
                    },
                  ),
                ),
              Spacer(),
              if (Responsive.isDesktop(context)) Text("Select Plant:"),
              if (Responsive.isDesktop(context))
                SizedBox(
                  width: 10,
                ),
              if (Responsive.isDesktop(context))
                Obx(
                  () => Container(
                    width: Get.width * .2,
                    height: 35,
                    child: DropdownWebWidget(
                      controller: controller,
                      dropdownList: controller.facilityList,
                      isValueSelected: controller.isFacilitySelected.value,
                      selectedValue: controller.selectedFacility.value,
                      onValueChanged: controller.onValueChanged,
                    ),
                  ),
                ),
              Spacer(),
              if (Responsive.isDesktop(context))
                Icon(Icons.notifications_active,
                    color: ColorValues.greyLightColor),
              InkWell(
                onTap: () {
                  Get.dialog(
                    Stack(children: [
                      Positioned(
                        right: 1,
                        top: 70,
                        child: Container(
                          width: 200,
                          child: AlertDialog(
                            insetPadding: EdgeInsets.symmetric(horizontal: 5.w),
                            contentPadding: EdgeInsets.all(20),
                            backgroundColor: ColorValues.appDarkBlueColor,
                            content: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.clearStoreData();

                                    Get.toNamed(Routes.profile, arguments: {
                                      'userId':
                                          varUserAccessModel.value.user_id,
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.person,
                                          color: Color(0xffD2D0D0)),
                                      SizedBox(width: 10),
                                      Text("Profile",
                                          style: TextStyle(
                                            color: Color(0xffD2D0D0),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                ),
                                Divider(color: Color(0xffD2D0D0)),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.setting);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.settings,
                                          color: Color(0xffD2D0D0)),
                                      SizedBox(width: 10),
                                      Text("Settings",
                                          style: TextStyle(
                                            color: Color(0xffD2D0D0),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                ),
                                Divider(color: Color(0xffD2D0D0)),
                                InkWell(
                                  onTap: () {
                                    _isDeleteDialog();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.logout,
                                          color: Color(0xffD2D0D0)),
                                      SizedBox(width: 10),
                                      Text("Log Out",
                                          style: TextStyle(
                                            color: Color(0xffD2D0D0),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  );
                },
                child: Card(
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
                        ),
                        if (Responsive.isDesktop(context)) SizedBox(width: 5),
                        if (Responsive.isDesktop(context))
                          Text(
                            "${varUserAccessModel.value.user_name}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        Icon(Icons.keyboard_arrow_down_outlined,
                            color: ColorValues.blackColor),
                      ],
                    ),
                  ),
                ),
              ),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                Icon(Icons.notifications_active, color: ColorValues.blackColor),
            ],
          ),
        ),
      ),
    );
  }

  _isDeleteDialog() {
    Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.logout_outlined, size: 35, color: ColorValues.redColor),
          SizedBox(height: 10),
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
