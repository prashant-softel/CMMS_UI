import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/dropdown.dart';

class HeaderWidget extends GetView<HomeController> {
  HeaderWidget({
    super.key,
    /////////
  });
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration:
            new BoxDecoration(color: ColorValues.whiteColor, boxShadow: [
          new BoxShadow(
              color: Color.fromARGB(255, 240, 237, 237),
              offset: Offset(0.0, 0.0)),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  'assets/files/logo.png',
                  // height: 120,
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
                  child: DropdownWidget(
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
                    if (Responsive.isDesktop(context))
                      SizedBox(width: 5), // space between icon and text
                    if (Responsive.isDesktop(context))
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
                    Icon(Icons.keyboard_arrow_down_outlined,
                        color: ColorValues.blackColor),
                  ],
                ),
              ),
            ),
            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              Icon(Icons.notifications_active, color: ColorValues.blackColor),
          ],
        ),
      ),
    );
  }
}
