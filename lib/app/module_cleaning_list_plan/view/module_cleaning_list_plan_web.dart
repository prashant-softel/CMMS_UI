import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_controller.dart';

import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/widgets/action_button.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';

class ModuleCleaningListPlan extends GetView<ModuleCleaningListPlanController> {
  ModuleCleaningListPlan({super.key});

  var controller = Get.find<ModuleCleaningListPlanController>();

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
                child:
                    Text(" / MODULE CLEANING", style: Styles.greyMediumLight12),
              ),
              Text(" / MODULE CLEANING PLANNING",
                  style: Styles.greyMediumLight12)
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Module Cleaning Planning",
                          style: Styles.blackBold16,
                        ),
                        // Container(
                        //   child: Icon(
                        //     Icons.filter_alt_sharp,
                        //     // color: ColorValues.,
                        //   ),
                        // ),
                        ActionButton(
                          icon: Icons.add,
                          label: "Add New",
                          onPressed: () {
                            //  Get.offNamed(Routes.addUser);
                          },
                          color: ColorValues.appGreenColor,
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
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                          backgroundColor: ColorValues.appLightBlueColor,
                          onPressed: () {},
                          text: 'columnVisibility'.tr,
                        ),
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
                        // paginationController:
                        //     controller.paginationController,
                        columns: [
                          "Plan ID",
                          "Plan Title",
                          "Order Date",
                          "Activity",
                          "Where Used",
                          "Action",
                        ].map((column) {
                          return TableViewColumn(
                            label: column,
                            minWidth: Get.width * 0.13,
                          );
                        }).toList(),
                        // rows: [],
                        rows: [
                          [
                            "PR1000",
                            "Requested by:Amit\nIssued by:Sujit kumar",
                            "2023-09-08",
                            "String faluire",
                            "Job11122",
                            "Action"
                          ],
                          [
                            "PR1000",
                            "Requested by:Amit\nIssued by:Sujit kumar",
                            "2023-09-08",
                            "String faluire",
                            "Job11122",
                            "Action"
                          ],
                          [
                            "PR1000",
                            "Requested by:Amit\nIssued by:Sujit kumar",
                            "2023-09-08",
                            "String faluire",
                            "Job11122",
                            "Action"
                          ],
                          [
                            "PR1000",
                            "Requested by:Amit\nIssued by:Sujit kumar",
                            "2023-09-08",
                            "String faluire",
                            "Job11122",
                            "Action"
                          ],
                          [
                            "PR1000",
                            "Requested by:Amit\nIssued by:Sujit kumar",
                            "2023-09-08",
                            "String faluire",
                            "Job11122",
                            "Action"
                          ],
                          [
                            "PR1000",
                            "Requested by:Amit\nIssued by:Sujit kumar",
                            "2023-09-08",
                            "String faluire",
                            "Job11122",
                            "Action"
                          ],
                        ].map((record) {
                          return TableViewRow(
                            height: 60,
                            cells: record.map((value) {
                              return TableViewCell(
                                child: value == "Action"
                                    ? TableActionButton(
                                        color: ColorValues.appDarkBlueColor,
                                        icon: Icons.remove_red_eye_outlined,
                                        label: 'View/Edit',
                                        onPress: () {
                                          //   Get.toNamed(Routes
                                          // .calibrationViewScreen);
                                        },
                                      )
                                    : Text(value),
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
