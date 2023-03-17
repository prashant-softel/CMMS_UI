import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends GetView<HomeController> {
  const HeaderWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: ColorsValue.whiteColor, boxShadow: [
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
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: CustomDropDownButton(
                    value: controller.selectedFacility.value,
                    onChange: (String? selectedValue) {
                      controller.isFacilitySelected.value = true;
                      controller.selectedFacility.value = selectedValue ?? '';
                    },
                    item: controller.facilityList
                        .map<DropdownMenuItem<String>>((facility) {
                      return DropdownMenuItem<String>(
                        value: facility?.name ?? '',
                        child: Text(facility?.name ?? ''),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          Spacer(),
          if (Responsive.isDesktop(context))
            Icon(Icons.notifications_active, color: ColorsValue.greyLightColor),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: ColorsValue.blueMediumColor,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Color.fromARGB(255, 206, 200, 200),
                    child:
                        Icon(Icons.person, color: ColorsValue.blueMediumColor),
                  ), // icon
                  if (Responsive.isDesktop(context))
                    SizedBox(width: 5), // space between icon and text
                  if (Responsive.isDesktop(context))
                    GestureDetector(
                      onTap: () {
                        print("${constUserAccessModel.value.user_name ?? ""}");
                      },
                      child: Text(
                        "${constUserAccessModel.value.user_name ?? "ddffff"}",
                        style: TextStyle(
                          color: Colors.black, // text color
                          fontSize: 12, // text size
                          fontWeight: FontWeight.w500, // text weight
                        ),
                      ),
                    ),
                  Icon(Icons.keyboard_arrow_down_outlined,
                      color: ColorsValue.blackColor),
                ],
              ),
            ),
          ),
          if (Responsive.isMobile(context) || Responsive.isTablet(context))
            Icon(Icons.notifications_active, color: ColorsValue.blackColor),
        ],
      ),
    );
  }
}
