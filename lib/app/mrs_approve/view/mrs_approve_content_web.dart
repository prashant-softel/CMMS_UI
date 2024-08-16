import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/mrs_approve/mrs_approve_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MrsApproveContentWeb extends GetView<MrsApproveController> {
  // MrsApproveContentWeb({Key? key}) : super(key: key);
  MrsApproveContentWeb({super.key});

  final MrsApproveController controller = Get.find();

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
                      final _flutterSecureStorage =
                          const FlutterSecureStorage();

                      _flutterSecureStorage.delete(key: "mrsId");
                      Get.offNamed(Routes.stockManagementDashboardScreen);
                    },
                    child: Text(" / STOCK MANAGEMENT ",
                        style: Styles.greyMediumLight12),
                  ),
                  InkWell(
                      onTap: () {
                        var taskId;
                        var jobId;
                        controller.type.value == 1
                            ? Get.offAllNamed(Routes.jobDetails,
                                arguments: {'jobId': jobId})
                            : controller.type.value == 2
                                ? Get.offAllNamed(Routes.pmTaskView,
                                    arguments: {'pmTaskId': taskId})
                                : Get.offNamed(Routes.mrsListScreen);
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
                                  "/ MRS LIST",
                                  style: Styles.greyLight14,
                                )),
                  Text(" / MATERIAL REQUISITION SLIP VIEW",
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
                    // margin: Dimens.edgeInsets20,
                    color: Color.fromARGB(255, 245, 248, 250),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              controller.mrsDetailsModel.value?.status == 321
                                  ? Text(
                                      "Material Requisition Approval And Reject ",
                                      style: Styles.blackBold16,
                                    )
                                  : Text(
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
                              Dimens.boxWidth3,
                              Container(
                                height: 30,
                                child: CustomElevatedButton(
                                  backgroundColor:
                                      ColorValues.appLightBlueColor,
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
                                    'Approved By:',
                                    style: Styles.black17,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    'Issued By:',
                                    style: Styles.black17,
                                  ),
                                ],
                              ),
                              Dimens.boxWidth2,
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
                                      controller.mrsDetailsModel.value
                                              ?.activity ??
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
                                              ?.issued_name ??
                                          "",
                                      style: Styles.blue17),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Requested Date Time:',
                                    style: Styles.black17,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    'Where Used:',
                                    style: Styles.black17,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    'Approved Date Time:',
                                    style: Styles.black17,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                    'Issued Date time:',
                                    style: Styles.black17,
                                  ),
                                ],
                              ),
                              Dimens.boxWidth2,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      controller.mrsDetailsModel.value
                                              ?.requestd_date ??
                                          "",
                                      style: Styles.blue17),
                                  Dimens.boxHeight10,
                                  Text(
                                    "${controller.mrsDetailsModel.value?.whereUsedTypeName == 'JOBCARD' ? 'JC' : controller.mrsDetailsModel.value?.whereUsedTypeName == 'PMTASK' ? 'PMT' : ''} ${controller.mrsDetailsModel.value?.whereUsedRefID ?? ""}",
                                    style: Styles.blue17,
                                  ),
                                  Dimens.boxHeight10,
                                  Text(
                                      controller.mrsDetailsModel.value
                                              ?.approval_date ??
                                          "",
                                      style: Styles.blue17),
                                  Dimens.boxHeight10,
                                  Text(
                                      controller.mrsDetailsModel.value
                                              ?.issued_date ??
                                          "",
                                      style: Styles.blue17),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: Dimens.edgeInsets20,
                          height: ((controller.mrsDetailsModel.value!.cmmrsItems
                                          ?.length ??
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
                          child: Column(
                            children: [
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
                                //       // "Image",
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
                                      "Available Qty.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Requested Qty.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Issued Qty.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Consumed Qty.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                  rows: List<DataRow>.generate(
                                      // controller.mrsDetailsModel.value!
                                      //     .cmmrsItems!.length,
                                      controller.mrsDetailsModel.value
                                              ?.cmmrsItems?.length ??
                                          0,
                                      (index) => DataRow(cells: [
                                            DataCell(Text(controller
                                                .mrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .asset_name
                                                .toString())),
                                            DataCell(Text(controller
                                                .mrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .asset_type
                                                .toString())),
                                            DataCell(Text(controller
                                                .mrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .available_qty
                                                .toString())),
                                            DataCell(Text(controller
                                                .mrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .requested_qty
                                                .toString())),
                                            DataCell(Text(controller
                                                .mrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .issued_qty
                                                .toString())),
                                            DataCell(Text(controller
                                                .mrsDetailsModel
                                                .value!
                                                .cmmrsItems![index]
                                                .used_qty
                                                .toString())),
                                          ])),
                                ),
                              ),
                            ],
                          ),
                        ),
                        controller.mrsDetailsModel.value?.status == 321
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: LoginCustomTextfield(
                                          maxLine: 5,
                                          textController:
                                              controller.commentCtrlr,
                                        )),
                                  ],
                                ),
                              )
                            : Dimens.box0,
                        controller.mrsDetailsModel.value?.status == 321 &&
                                varUserAccessModel.value.access_list!
                                        .where((e) =>
                                            e.feature_id ==
                                                UserAccessConstants
                                                    .kMrsFeatureId &&
                                            e.approve ==
                                                UserAccessConstants
                                                    .kHaveApproveAccess)
                                        .length >
                                    0
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
                                          controller.approveMrs();
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
                                          controller.rejectMrs();
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
