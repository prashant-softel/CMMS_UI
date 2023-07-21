import 'package:cmms/app/app.dart';
import 'package:cmms/app/mrs_view/mrs_view_controller.dart';
import 'package:cmms/app/view_user_detail/view_user_detail_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../navigators/app_pages.dart';

class MrsViewContentWeb extends GetView<MrsViewController> {
  MrsViewContentWeb({Key? key}) : super(key: key);
  final MrsViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: Get.width,
        height: Get.height,
        child: Column(
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
                    child: Text(" / STOCK MANAGEMENT ",
                        style: Styles.greyMediumLight12),
                  ),
                  Text(" / MATERIAL REQUISITION SLIP  VIEW",
                      style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  // margin: Dimens.edgeInsets20,
                  color: Color.fromARGB(255, 245, 248, 250),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              "Material Requisition Slip View ",
                              style: Styles.blackBold16,
                            ),
                            Spacer(),
                            Text(
                              "MRS ID:",
                              style: Styles.black17,
                            ),
                            Text(
                              "${controller.mrsDetailsModel.value?.id ?? ""}",
                              style: Styles.blue17,
                            ),
                            Dimens.boxWidth8,
                            Container(
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () async {},
                                text:
                                    "${controller.mrsDetailsModel.value?.status_short ?? ""}",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 70, top: 20, bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //     margin: Dimens.edgeInsets30_0_0_0,
                            //     child:
                            Dimens.boxWidth30,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Requested By:',
                                  style: Styles.black17,
                                ),
                                Dimens.boxHeight10,
                                Text(
                                  'Activity:',
                                  style: Styles.black17,
                                ),
                                Dimens.boxHeight10,
                                Text(
                                  'Approved By: ',
                                  style: Styles.black17,
                                ),
                                Dimens.boxHeight10,
                                Text(
                                  'Issued By: ',
                                  style: Styles.black17,
                                ),
                              ],
                            ),
                            Dimens.boxWidth20,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller.mrsDetailsModel.value
                                            ?.requested_by_name ??
                                        "",
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(
                                    controller
                                            .mrsDetailsModel.value?.activity ??
                                        "",
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(
                                    controller.mrsDetailsModel.value
                                            ?.approver_name ??
                                        "",
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(
                                    controller.mrsDetailsModel.value
                                            ?.approver_name ??
                                        "",
                                    style: Styles.blue17),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Requested Date Time: ',
                                  style: Styles.black17,
                                ),
                                Dimens.boxHeight10,
                                Text(
                                  'Where Used: ',
                                  style: Styles.black17,
                                ),
                                Dimens.boxHeight10,
                                Text(
                                  'Approved Date Time: ',
                                  style: Styles.black17,
                                ),
                                Dimens.boxHeight10,
                                Text(
                                  'Issued Date time: ',
                                  style: Styles.black17,
                                ),
                              ],
                            ),
                            Dimens.boxWidth20,

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller.mrsDetailsModel.value
                                            ?.requestd_date ??
                                        "",
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(controller.whereUsedType,
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(
                                    controller.mrsDetailsModel.value
                                            ?.approval_date ??
                                        "",
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(
                                    controller.mrsDetailsModel.value
                                            ?.approval_date ??
                                        "",
                                    style: Styles.blue17),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        margin: Dimens.edgeInsets20,
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Equipments",
                                    style: Styles.blue700,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Expanded(
                              child: ScrollableTableView(
                                columns: [
                                  "Equipment Name",
                                  "Asset Type",
                                  "Image",
                                  "Requested Qty.",
                                  "Approved Qty.",
                                  "issued Qyt."
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.15,
                                  );
                                }).toList(),
                                rows: [
                                  ...List.generate(
                                    controller.mrsDetailsModel.value!
                                        .cmmrsItems!.length,
                                    (index) {
                                      var equipmentModelListDetails = controller
                                          .mrsDetailsModel
                                          .value!
                                          .cmmrsItems![index];
                                      return [
                                        '${equipmentModelListDetails.asset_name}',
                                        '${equipmentModelListDetails.asset_type}',
                                        "", //'${equipmentModelListDetails.file_path}',
                                        '${equipmentModelListDetails.requested_qty}',
                                        '${equipmentModelListDetails.available_qty}',
                                        '${equipmentModelListDetails.issued_qty}',
                                      ];
                                    },
                                  ),
                                ].map((record) {
                                  return TableViewRow(
                                    height: 90,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        margin: Dimens.edgeInsets20,
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text(
                                    "MRS History",
                                    style: Styles.blue700,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: ColorValues.greyLightColour,
                            ),
                            Expanded(
                              child: ScrollableTableView(
                                columns: [
                                  "Time Stamp",
                                  "Posted By",
                                  "Comment",
                                  "Location",
                                  "Status",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.15,
                                  );
                                }).toList(),
                                rows: [
                                  [
                                    "2023-09-08",
                                    "Sujit Kumar",
                                    "Check Approval",
                                    "--",
                                    "Approve",
                                  ],
                                  [
                                    "2023-09-08",
                                    "Sujit Kumar",
                                    "Check Approval",
                                    "--",
                                    "Approve",
                                  ],
                                  [
                                    "2023-09-08",
                                    "Sujit Kumar",
                                    "Check Approval",
                                    "--",
                                    "Approve",
                                  ],
                                ].map((record) {
                                  return TableViewRow(
                                    height: 90,
                                    cells: record.map((value) {
                                      return TableViewCell(
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight25,
                      Container(
                        margin: EdgeInsets.only(bottom: 30, top: 20),
                        child: Container(
                          height: 35,
                          width: (Get.width * .2) - 170,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.printColor,
                            text: "Print",
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
