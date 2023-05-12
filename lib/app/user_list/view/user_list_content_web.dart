import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../user_list_controller.dart';

class UserListContentWeb extends GetView<UserListController> {
  UserListContentWeb({super.key});

  ///
  var controller = Get.find<UserListController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 227, 224, 224),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
              Text(
                "DASHBOARD",
                style: Styles.greyLight14,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(" / SETTING", style: Styles.greyMediumLight12),
              ),
              Text(" / USER LIST", style: Styles.greyMediumLight12),
            ],
          ),
        ),
        Flexible(
          child: Container(
            width: Get.width * 7,
            margin: EdgeInsets.only(left: 10, top: 30),
            height: Get.height,
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
                    child: Row(
                      children: [
                        Text(
                          "User List ",
                          style: Styles.blackBold16,
                        ),
                        Spacer(),
                        ActionButton(
                          icon: Icons.add,
                          label: "Add New",
                          onPressed: () {
                            Get.offNamed(Routes.addUser);
                          },
                          color: ColorValues.greenlightColor,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: ColorValues.greyLightColour,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.appLightBlueColor,
                          onPressed: () {},
                          text: 'columnVisibility'.tr,
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'Copy'),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'Excel'),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'PDF'),
                      ),
                      Spacer(),
                      Container(
                        width: 200,
                        height: 40,
                        margin: Dimens.edgeInsets0_0_16_0,
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            contentPadding: Dimens.edgeInsets10_0_0_0,
                            hintText: 'search'.tr,
                            hintStyle: Styles.grey12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      margin: Dimens.edgeInsets15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorValues.lightGreyColorWithOpacity35,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorValues.appBlueBackgroundColor,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ScrollableTableView(
                        columns: [
                          "Profile",
                          "User Log in ID",
                          "User Role",
                          "Contact Number",
                          "Created On",
                          "Updated On",
                          "Status",
                          "Action"
                        ].map((column) {
                          return TableViewColumn(
                            label: column,
                            minWidth: Get.width * 0.15,
                          );
                        }).toList(),
                        rows: [
                          [
                            "Profile_Img",
                            "Sujit@softeltech.in",
                            "User",
                            "+91 1234486502",
                            "2023-03-26",
                            "2023-05-26",
                            "Active",
                            "Action"
                          ],
                          [
                            "Profile_Img",
                            "Sujit@softeltech.in",
                            "User",
                            "+91 1234486502",
                            "2023-03-26",
                            "2023-05-26",
                            "Active",
                            "Action"
                          ],
                          [
                            "Profile_Img",
                            "Sujit@softeltech.in",
                            "User",
                            "+91 1234486502",
                            "2023-03-26",
                            "2023-05-26",
                            "Active",
                            "Action"
                          ],
                          [
                            "Profile_Img",
                            "Sujit@softeltech.in",
                            "User",
                            "+91 1234486502",
                            "2023-03-26",
                            "2023-05-26",
                            "Active",
                            "Action"
                          ],
                          [
                            "Profile_Img",
                            "Sujit@softeltech.in",
                            "User",
                            "+91 1234486502",
                            "2023-03-26",
                            "2023-05-26",
                            "Active",
                            "Action"
                          ],
                          [
                            "Profile_Img",
                            "Sujit@softeltech.in",
                            "User",
                            "+91 1234486502",
                            "2023-03-26",
                            "2023-05-26",
                            "Active",
                            "Action"
                          ],
                          [
                            "Profile_Img",
                            "Sujit@softeltech.in",
                            "User",
                            "+91 1234486502",
                            "2023-03-26",
                            "2023-05-26",
                            "Active",
                            "Action"
                          ],
                        ].map((record) {
                          return TableViewRow(
                            height: 65,
                            cells: record.map((value) {
                              return TableViewCell(
                                child: (value == "Action")
                                    ? Wrap(children: [
                                        TableActionButton(
                                          color: ColorValues.appDarkBlueColor,
                                          icon: Icons.remove_red_eye_outlined,
                                          label: 'view',
                                          onPress: () {
                                            Get.offNamed(Routes.viewUserDetail);
                                          },
                                        ),
                                        TableActionButton(
                                          color: ColorValues.appYellowColor,
                                          icon: Icons.edit,
                                          label: 'Edit',
                                          onPress: () {
                                            Get.offNamed(Routes.addUser);
                                          },
                                        ),
                                        TableActionButton(
                                          color: ColorValues.appRedColor,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                          onPress: () {},
                                        )
                                      ])
                                    : (value == "Profile_Img")
                                        ? Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              color:
                                                  ColorValues.appDarkGreyColor,
                                              border: Border.all(
                                                color: ColorValues
                                                    .appDarkGreyColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Center(
                                                child: Icon(
                                                  Icons.person,
                                                  size: 25,
                                                  color: ColorValues
                                                      .appBlueBackgroundColor,
                                                ),
                                              ), //Circ
                                            ),
                                          )
                                        : Text(value),
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
