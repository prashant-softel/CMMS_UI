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
                    child: Text(" / STOCK MANAGEMENT ",
                        style: Styles.greyMediumLight12),
                  ),
                  Text(" / RETURN EQUIPMENT APPROVAL AND REJECT",
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
                                "Return Equipment Approval And Reject ",
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
                              // Dimens.boxWidth8,
                              // Container(
                              //   height: 30,
                              //   child: CustomElevatedButton(
                              //     backgroundColor: ColorValues.appLightBlueColor,
                              //     onPressed: () async {},
                              //     text:
                              //         "${controller.returnMrsDetailsModel.value?.status ?? ""}",
                              //   ),
                              // ),
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
                                  Text(
                                      "${controller.whereUsedType}${controller.returnMrsDetailsModel.value?.whereUsedTypeId ?? ""}",
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
                        Container(
                          margin: Dimens.edgeInsets15,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomRichText(title: "Comment:"),
                              Dimens.boxWidth10,
                              LoginCustomTextfield(
                                width: (Get.width * .6),
                                maxLine: 5,
                                textController: controller.commentCtrlr,
                              ),
                            ],
                          ),
                        ),
                        Container(
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
                                  backgroundColor: ColorValues.approveColor,
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
                                  backgroundColor: ColorValues.rejectColor,
                                  text: 'Reject',
                                  onPressed: () {
                                    controller.rejectRetrunMrs();
                                  },
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
