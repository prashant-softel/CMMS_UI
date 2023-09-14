import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../view_return_mrs_controller.dart';

class MrsReturnViewContentWeb extends GetView<MrsReturnViewController> {
  MrsReturnViewContentWeb({Key? key}) : super(key: key);
  final MrsReturnViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
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
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Container(
                  height: Get.height,
                  // margin: Dimens.edgeInsets20,
                  color: Color.fromARGB(255, 245, 248, 250),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              "Return Material Requisition Slip View ",
                              style: Styles.blackBold16,
                            ),
                            Spacer(),
                            Text(
                              "MRS ID:",
                              style: Styles.black17,
                            ),
                            Text(
                              "${controller.returnMrsDetailsModel.value?.id ?? ""}",
                              style: Styles.blue17,
                            ),
                            Dimens.boxWidth8,
                            Container(
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appLightBlueColor,
                                onPressed: () async {},
                                text:
                                    "${controller.returnMrsDetailsModel.value?.status_short ?? ""}",
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
                                  'Return Approved By: ',
                                  style: Styles.black17,
                                ),
                              ],
                            ),
                            Dimens.boxWidth20,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller.returnMrsDetailsModel.value
                                            ?.requested_by_name ??
                                        "",
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(
                                    controller.returnMrsDetailsModel.value
                                            ?.activity ??
                                        "",
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(
                                    controller.returnMrsDetailsModel.value
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
                              ],
                            ),
                            Dimens.boxWidth20,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    controller.returnMrsDetailsModel.value
                                            ?.requestd_date ??
                                        "",
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(controller.whereUsedType,
                                    style: Styles.blue17),
                                Dimens.boxHeight10,
                                Text(
                                    controller.returnMrsDetailsModel.value
                                            ?.approval_date ??
                                        "",
                                    style: Styles.blue17),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: Dimens.edgeInsets20,
                          height: ((controller.returnMrsDetailsModel.value!
                                          .cmmrsItems?.length ??
                                      0) *
                                  40) +
                              120,
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
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Material  ",
                                    style: Styles.blue700,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: DataTable2(
                                border: TableBorder.all(
                                    color: Color.fromARGB(255, 206, 229, 234)),
                                columns: [
                                  DataColumn(
                                      label: Text(
                                    "Material Name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "Asset Type",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "Serial Number",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "Available Qyt.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "Return Qty.",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                                rows: List<DataRow>.generate(
                                    controller.returnMrsDetailsModel.value!
                                        .cmmrsItems!.length,
                                    (index) => DataRow(cells: [
                                          DataCell(Text(controller
                                              .returnMrsDetailsModel
                                              .value!
                                              .cmmrsItems![index]
                                              .asset_name
                                              .toString())),
                                          DataCell(Text(controller
                                              .returnMrsDetailsModel
                                              .value!
                                              .cmmrsItems![index]
                                              .asset_type
                                              .toString())),
                                          DataCell(Text(controller
                                              .returnMrsDetailsModel
                                              .value!
                                              .cmmrsItems![index]
                                              .requested_qty
                                              .toString())),
                                          DataCell(Text(controller
                                              .returnMrsDetailsModel
                                              .value!
                                              .cmmrsItems![index]
                                              .available_qty
                                              .toString())),
                                          DataCell(Text(controller
                                              .returnMrsDetailsModel
                                              .value!
                                              .cmmrsItems![index]
                                              .issued_qty
                                              .toString())),
                                        ])),
                              ),
                            ),
                          ])),
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
          ),
        ],
      ),
    );
  }
}
