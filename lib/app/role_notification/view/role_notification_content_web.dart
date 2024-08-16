import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/role_notification/role_notification_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../widgets/custom_swich_toggle.dart';
import '../../widgets/dropdown_web.dart';

class RoleNotificationContentWeb extends GetView<RoleNotificationController> {
  RoleNotificationContentWeb({Key? key}) : super(key: key);
  final RoleNotificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Widget _rowItem(int? defaultValue, {required Function(bool) onCheck}) {
      return Checkbox(
          value: defaultValue == 1 ? true : false,
          checkColor: Colors.white,
          activeColor: ColorValues.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
              width: 1.0,
              color: ColorValues.blackColor,
            ),
          ),
          onChanged: (val) {
            controller.isChecked.value = val!;
            onCheck(val);
          });
    }

    return SelectionArea(
      child: Obx(
        () => Container(
          color: Color.fromARGB(255, 234, 236, 238),
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              HeaderWidget(),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 227, 224, 224),
                    width: 1,
                  ),
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
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: ColorValues.greyLightColor,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed(Routes.home);
                      },
                      child: Text(
                        "DASHBOARD",
                        style: Styles.greyLight14,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed(Routes.masterDashboard);
                      },
                      child: Text(" / MASTER", style: Styles.greyLight14),
                    ),
                    Text(" / ROLE NOTIFICATION ", style: Styles.greyLight14)
                  ],
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    height: Get.height * .8,
                    //height: Get.height - 300,

                    child: Card(
                      color: Color.fromARGB(255, 245, 248, 250),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Role Notification ",
                              style: Styles.blackBold16,
                            ),
                          ),
                          Divider(
                            color: ColorValues.greyLightColour,
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Text(
                                  'Role: ',
                                  style: Styles.blackBold14,
                                ),
                                Dimens.boxWidth20,
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width * .2),
                                  child: DropdownWebWidget(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: const Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                      ),
                                      BoxShadow(
                                        color: ColorValues.whiteColor,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                    controller: controller,
                                    dropdownList: controller.roleList,
                                    isValueSelected:
                                        controller.isSelectedRole.value,
                                    selectedValue:
                                        controller.selectedRole.value,
                                    onValueChanged: controller.onValueChanged,
                                  ),
                                ),
                                Spacer(),
                                // Dimens.boxWidth15,
                                Text(
                                  'Apply to Existing User: ',
                                  style: Styles.blackBold14,
                                ),
                                Dimens.boxWidth10,
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CustomSwitchTroggle(
                                      value: controller.isExistingusers.value,
                                      onChanged: (value) {
                                        controller.existingusertoggle();
                                      }),
                                ),
                                Spacer(),
                                // Dimens.boxWidth15,
                                Text(
                                  'Apply to Role: ',
                                  style: Styles.blackBold14,
                                ),
                                Dimens.boxWidth10,
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: CustomSwitchTroggle(
                                      value: controller.isSetRole.value,
                                      onChanged: (value) {
                                        controller.setRoletoggle();
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                  // height: Get.height - 300,
                                  height: Get.height * .5,
                                  width: Get.width,
                                  margin: Dimens.edgeInsets15,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: controller.notificationList.length > 0
                                      ? ScrollableTableView(
                                          columns: [
                                            "Notifications",
                                            "Default Value",
                                            "Can Override",
                                            // "User Preference",
                                          ].map((column) {
                                            return TableViewColumn(
                                              label: column,
                                              minWidth: Get.width * 0.17,
                                            );
                                          }).toList(),
                                          rows: true
                                              ? controller.notificationList
                                                  .map(
                                                      (getnotificationListDetails) =>
                                                          TableViewRow(
                                                              height: 70,
                                                              cells: [
                                                                TableViewCell(
                                                                    child: Text(
                                                                        "${getnotificationListDetails?.feature_name}"
                                                                        " "
                                                                        "${getnotificationListDetails?.notification_name.value}")),
                                                                TableViewCell(
                                                                  child:
                                                                      Obx(() {
                                                                    return _rowItem(
                                                                        getnotificationListDetails
                                                                            ?.default_flag
                                                                            .value,
                                                                        onCheck:
                                                                            (val) {
                                                                      getnotificationListDetails
                                                                          ?.default_flag
                                                                          .value = val ==
                                                                              true
                                                                          ? 1
                                                                          : 0;
                                                                    });
                                                                  }),
                                                                ),
                                                                TableViewCell(
                                                                  child:
                                                                      Obx(() {
                                                                    return _rowItem(
                                                                        getnotificationListDetails
                                                                            ?.can_change
                                                                            .value,
                                                                        onCheck:
                                                                            (val) {
                                                                      getnotificationListDetails
                                                                          ?.can_change
                                                                          .value = val ==
                                                                              true
                                                                          ? 1
                                                                          : 0;
                                                                    });
                                                                  }),
                                                                ),
                                                              ]))
                                                  .toList()
                                              : [],
                                        )
                                      : Dimens.box0),
                              Container(
                                // margin: EdgeInsets.only(bottom: 40, top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor: ColorValues.greenColor,
                                        text: 'Submit',
                                        onPressed: () {
                                          //controller.addUser();
                                          controller.saveRoleNotification();
                                        },
                                      ),
                                    ),
                                    // Dimens.boxWidth20,
                                    SizedBox(width: 20),
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor: ColorValues.redColor,
                                        text: "Cancel",
                                        onPressed: () {
                                          Get.toNamed(Routes.masterDashboard);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
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
