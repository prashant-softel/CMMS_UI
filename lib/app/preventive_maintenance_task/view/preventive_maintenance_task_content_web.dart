import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/table_action_button.dart';
import '../preventive_maintenance_task_controller.dart';

class PreventiveMaintenanceTaskContentWeb
    extends GetView<PreventiveMaintenanceTaskController> {
  PreventiveMaintenanceTaskContentWeb({super.key});

  ///
  var controller = Get.find<PreventiveMaintenanceTaskController>();
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
                child: Text(" / Preventive Maintenance".toUpperCase(),
                    style: Styles.greyMediumLight12),
              ),
              Text(" / PM TASKS", style: Styles.greyMediumLight12)
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
                          "PM Tasks ",
                          style: Styles.blackBold16,
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
                        width: (Get.width * .1) - 60,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'Copy'),
                      ),
                      Container(
                        width: (Get.width * .1) - 60,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'Excel'),
                      ),
                      Container(
                        width: (Get.width * .1) - 70,
                        margin: EdgeInsets.only(left: 10),
                        child: CustomElevatedButton(
                            backgroundColor: ColorValues.appLightBlueColor,
                            onPressed: () {},
                            text: 'PDF'),
                      ),
                      Container(
                        width: (Get.width * .2) - 100,
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
                        columns: [
                          "Maintenance Order Number",
                          "Due Date",
                          "Done Date",
                          "Equipment Name",
                          "Order Frequency",
                          "Responsibility",
                          "Lasr Done Date",
                          "PTW",
                          "Action",
                        ].map((column) {
                          return TableViewColumn(
                            label: column,
                            minWidth: Get.width * 0.15,
                          );
                        }).toList(),
                        rows: [
                          [
                            "PMSCh0002345",
                            "2023-03-26",
                            "2023-03-26",
                            "Demo_Block_0012",
                            "Day",
                            "Amit Yadav",
                            "2023-03-26",
                            "PTW001",
                            "Action"
                          ],
                          [
                            "PMSCh0002345",
                            "2023-03-26",
                            "2023-03-26",
                            "Demo_Block_0012",
                            "Day",
                            "Amit Yadav",
                            "2023-03-26",
                            "PTW001",
                            "Action"
                          ],
                          [
                            "PMSCh0002345",
                            "2023-03-26",
                            "2023-03-26",
                            "Demo_Block_0012",
                            "Day",
                            "Amit Yadav",
                            "2023-03-26",
                            "PTW001",
                            "Action"
                          ],
                          [
                            "PMSCh0002345",
                            "2023-03-26",
                            "2023-03-26",
                            "Demo_Block_0012",
                            "Day",
                            "Amit Yadav",
                            "2023-03-26",
                            "PTW001",
                            "Action"
                          ],
                          [
                            "PMSCh0002345",
                            "2023-03-26",
                            "2023-03-26",
                            "Demo_Block_0012",
                            "Day",
                            "Amit Yadav",
                            "2023-03-26",
                            "PTW001",
                            "Action"
                          ],
                          [
                            "PMSCh0002345",
                            "2023-03-26",
                            "2023-03-26",
                            "Demo_Block_0012",
                            "Day",
                            "Amit Yadav",
                            "2023-03-26",
                            "PTW001",
                            "Action"
                          ],
                          [
                            "PMSCh0002345",
                            "2023-03-26",
                            "2023-03-26",
                            "Demo_Block_0012",
                            "Day",
                            "Amit Yadav",
                            "2023-03-26",
                            "PTW001",
                            "Action"
                          ],
                        ].map((record) {
                          return TableViewRow(
                            height: 90,
                            cells: record.map((value) {
                              return TableViewCell(
                                child: (value == "Action")
                                    ? Wrap(children: [
                                        TableActionButton(
                                          color: ColorValues.appGreenColor,
                                          icon: Icons.remove_red_eye_outlined,
                                          label: 'View checklist',
                                          onPress: () {},
                                        ),
                                        TableActionButton(
                                          color: ColorValues.appRedColor,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                          onPress: () {},
                                        ),
                                        TableActionButton(
                                          color: ColorValues.appLightBlueColor,
                                          icon:
                                              Icons.access_time_filled_outlined,
                                          label: 'History',
                                          onPress: () {},
                                        ),
                                        // TableActionButton(
                                        //   color: ColorValues.appGreenColor,
                                        //   icon: Icons.remove_red_eye_outlined,
                                        //   label: 'Execute',
                                        //   onPress: () {},
                                        // ),
                                        TableActionButton(
                                          color: ColorValues.appDarkBlueColor,
                                          icon: Icons.link_sharp,
                                          label: 'Link To Permit',
                                          onPress: () {},
                                        ),
                                        TableActionButton(
                                          color: ColorValues.appYellowColor,
                                          icon: Icons.numbers_outlined,
                                          label: 'PM Pending Jobs',
                                          onPress: () {},
                                        ),
                                      ])
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
