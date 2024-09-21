import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../approve_return_mrs_controller.dart';

class ApproveReturnMrsContentWeb extends GetView<ApproveReturnMrsController> {
  ApproveReturnMrsContentWeb({Key? key}) : super(key: key);
  final ApproveReturnMrsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SelectionArea(
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
                      Get.offNamed(Routes.stockManagementDashboardScreen);
                    },
                    child:
                        Text(" / STOCK MANAGEMENT ", style: Styles.greyLight14),
                  ),
                  InkWell(
                      onTap: () {
                        String refId = controller
                                .returnMrsDetailsModel.value?.whereUsedTypeId
                                .toString() ??
                            "";
                        controller.type.value == 1
                            ? Get.offNamed('${Routes.jobDetails}/$refId')
                            : controller.type.value == 2
                                ? Get.offNamed('${Routes.pmTaskView}/$refId')
                                : Get.offNamed(Routes.returnMrsList);
                      },
                      child: controller.type.value == 1
                          ? Text(
                              "/ JOB",
                              style: Styles.greyLight14,
                            )
                          : controller.type.value == 2
                              ? Text(
                                  "/ PM TASK",
                                  style: Styles.greyLight14,
                                )
                              : Text(
                                  "/ RETURN MRS LIST",
                                  style: Styles.greyLight14,
                                )),
                  Text(" / RETURN EQUIPMENT DETAILS", style: Styles.greyLight14)
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Container(
                    // height: Get.height,
                    // margin: Dimens.edgeInsets20,
                    color: Color.fromARGB(255, 245, 248, 250),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                "Return Equipment Details ",
                                style: Styles.blackBold16,
                              ),
                              Spacer(),
                              Text(
                                "ID:",
                                style: Styles.black17,
                              ),
                              Dimens.boxWidth2,
                              Text(
                                "RMRS${controller.returnMrsDetailsModel.value?.id ?? ""}",
                                style: Styles.blue17,
                              ),
                              Dimens.boxWidth3,
                              Container(
                                height: 30,
                                child: CustomElevatedButton(
                                  backgroundColor:
                                      ColorValues.appLightBlueColor,
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
                                  controller.returnMrsDetailsModel.value
                                              ?.status ==
                                          321
                                      ? Dimens.box0
                                      : Text(
                                          'Return Approved By: ',
                                          style: Styles.black17,
                                        ),
                                ],
                              ),
                              Dimens.boxWidth2,
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
                                  controller.returnMrsDetailsModel.value
                                              ?.status ==
                                          321
                                      ? Dimens.box0
                                      : Text(
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
                                  controller.returnMrsDetailsModel.value
                                              ?.status ==
                                          321
                                      ? Dimens.box0
                                      : Text(
                                          'Approved Date Time: ',
                                          style: Styles.black17,
                                        ),
                                ],
                              ),
                              Dimens.boxWidth2,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      controller.returnMrsDetailsModel.value
                                              ?.returnDate ??
                                          "",
                                      style: Styles.blue17),
                                  Dimens.boxHeight10,
                                  // Text(
                                  //     "${controller.returnMrsDetailsModel.value?.whereUsedType ?? ""}${controller.returnMrsDetailsModel.value?.whereUsedTypeId ?? ""}",
                                  //     style: Styles.blue17),
                                  Text(
                                    "${controller.returnMrsDetailsModel.value?.whereUsedType == 'JOBCARD' ? 'JC' : controller.returnMrsDetailsModel.value?.whereUsedType == 'PMTASK' ? 'PMT' : ''} ${controller.returnMrsDetailsModel.value?.whereUsedTypeId ?? ""}",
                                    style: Styles.blue17,
                                  ),
                                  Dimens.boxHeight10,
                                  controller.returnMrsDetailsModel.value
                                              ?.status ==
                                          321
                                      ? Dimens.box0
                                      : Text(
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
                            margin: EdgeInsets.all(10.0),
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
                                      "Issued Return Material  ",
                                      style: Styles.blue700,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: DataTable2(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 206, 229, 234)),
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
                                      "Issued Qyt.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Issued Date",
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
                                    DataColumn(
                                        label: Text(
                                      "Remarks",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ))
                                  ],
                                  rows: List<DataRow>.generate(
                                      controller.returnMrsDetailsModel.value!
                                          .cmmrsItems!.length,
                                      (index) => DataRow(cells: [
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .name
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
                                                .issued_qty
                                                .toString())),
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .issued_date
                                                .toString())),
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .returned_qty
                                                .toString())),
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .return_remarks
                                                .toString()))
                                          ])),
                                ),
                              ),
                            ])),
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
                                      "Faulty Return Material  ",
                                      style: Styles.blue700,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: DataTable2(
                                  border: TableBorder.all(
                                      color:
                                          Color.fromARGB(255, 206, 229, 234)),
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
                                      "Remove From",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Material Code",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Serial No.",
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
                                    DataColumn(
                                        label: Text(
                                      "Remarks",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                  rows: List<DataRow>.generate(
                                      controller.returnMrsDetailsModel.value!
                                          .cmmrsFaultyItems!.length,
                                      (index) => DataRow(cells: [
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsFaultyItems![index]
                                                .name
                                                .toString())),
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsFaultyItems![index]
                                                .fromActorName
                                                .toString())),
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsFaultyItems![index]
                                                .asset_code
                                                .toString())),
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsFaultyItems![index]
                                                .serial_number
                                                .toString())),
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsFaultyItems![index]
                                                .returned_qty
                                                .toString())),
                                            DataCell(Text(controller
                                                .returnMrsDetailsModel
                                                .value!
                                                .cmmrsFaultyItems![index]
                                                .return_remarks
                                                .toString())),
                                          ])),
                                ),
                              ),
                            ])),
                        controller.returnMrsDetailsModel.value?.status == 321
                            ? Container(
                                margin: Dimens.edgeInsets15,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomRichText(title: "Comment:"),
                                    Dimens.boxWidth2,
                                    Container(
                                      width: (Get.width * .6),
                                      decoration: BoxDecoration(
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
                                        color: ColorValues.whiteColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: LoginCustomTextfield(
                                        width: (Get.width * .6),
                                        maxLine: 5,
                                        textController: controller.commentCtrlr,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Dimens.box0,
                        controller.returnMrsDetailsModel.value?.status == 321
                            ? Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Container(
                                    //   height: 35,
                                    //   child: CustomElevatedButton(
                                    //     backgroundColor: ColorValues.cancelColor,
                                    //     text: "Cancel",
                                    //     onPressed: () {},
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.approveColor,
                                        text: 'Approve',
                                        onPressed: () {
                                          controller.approveReturnMrs();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.rejectColor,
                                        text: 'Reject',
                                        onPressed: () {
                                          controller.rejectRetrunMrs();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Dimens.box0
                      ],
                    ),
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
