import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/new_permit_list/permit_status_constants.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_mobile.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/permit_approved_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/permit_close_dialog.dart';
import 'package:cmms/app/widgets/permit_extend_dialog.dart';
import 'package:cmms/app/widgets/permit_reject_dialog.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:cmms/app/widgets/view_sop_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';

class ViewPermitMobile extends GetView<ViewPermitController> {
  ViewPermitMobile({super.key});
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => Column(
            children: [
              Dimens.boxHeight5,
              HeaderWidgetMobile(),
              Container(
                padding: EdgeInsets.only(left: 40, top: 20),
                width: Get.width,
                child: Text(
                  "Permit Details",
                  style: TextStyle(
                    color: ColorValues.appDarkBlueColor,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimens.eighteen,
                  ),
                ),
              ),
              Card(
                color: Colors.lightBlue.shade50,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.only(
                    left: 15, right: 15, top: 20, bottom: 50),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text1: "Start Date: ",
                        text2: '${controller.startDateTimeCtrlr.text}',
                      ),
                      Dimens.boxHeight3,
                      CustomText(
                        text1: "Valid Till: ",
                        text2: '${controller.validTillTimeCtrlr.text}',
                      ),
                      Dimens.boxHeight3,
                      CustomText(
                        text1: "Permit No: ",
                        text2:
                            '${controller.viewPermitDetailsModel.value?.permitNo}',
                      ),
                      Dimens.boxHeight3,
                      CustomText(
                        text1: "Permit Type: ",
                        text2:
                            '${controller.viewPermitDetailsModel.value?.permitTypeName}',
                      ),
                      Dimens.boxHeight3,
                      CustomText(
                        text1: "Plant: ",
                        text2:
                            '${controller.viewPermitDetailsModel.value?.siteName}',
                      ),
                      Dimens.boxHeight3,
                      CustomText(
                        text1: "Block: ",
                        text2:
                            '${controller.viewPermitDetailsModel.value?.blockName}',
                      ),
                      Dimens.boxHeight3,
                      CustomText(
                        text1: "Site Permit No: ",
                        text2:
                            '${controller.viewPermitDetailsModel.value?.sitePermitNo}',
                      ),
                      Dimens.boxHeight3,
                      Row(
                        children: [
                          Text(
                            "Equipment Category: ",
                            style: Styles.black14,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: []..addAll(
                                controller.listCategory!.map((element) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${element?.equipmentCat} ",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: ColorValues.appDarkBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: Dimens.fourteen,
                                          ),
                                        )
                                      ],
                                    ))),
                          ),
                        ],
                      ),
                      Dimens.boxHeight3,
                      CustomText(
                        text1: "Permit Description: ",
                        text2:
                            '${controller.viewPermitDetailsModel.value?.description}',
                      ),
                      Dimens.boxHeight10,
                      controller.listAssociatedPm!.isEmpty
                          ? Dimens.box0
                          : Card(
                              color: Colors.white70,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 15),
                                  height:
                                      ((controller.listAssociatedPm?.length ??
                                                  0) *
                                              50) +
                                          125,
                                  width: Get.width * 3.25,
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, bottom: 10),
                                        child: Text(
                                          "PM Task Linked To This Permit",
                                          style: Styles.blue700,
                                        ),
                                      ),
                                      Expanded(
                                        child: DataTable2(
                                          border: TableBorder.all(
                                            color: Color.fromARGB(
                                                255, 128, 128, 128),
                                          ),
                                          columns: [
                                            DataColumn2(
                                              fixedWidth: Get.width * .2,
                                              label: Text(
                                                "PM Task Id",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .5,
                                              label: Text(
                                                "PM Task Title",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .4,
                                              label: Text(
                                                "Equipment\nCategory",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .7,
                                              label: Text(
                                                "Equipment",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .4,
                                              label: Text(
                                                "Start Date",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .4,
                                              label: Text(
                                                "Assigned To",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .4,
                                              label: Text(
                                                "Status",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller
                                                    .listAssociatedPm?.length ??
                                                0,
                                            (index) => DataRow(
                                              cells: [
                                                DataCell(
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .clearStoreDataPMtaskId();
                                                      Get.toNamed(
                                                        Routes.pmTaskView,
                                                        arguments: {
                                                          'pmTaskId': controller
                                                              .listAssociatedPm?[
                                                                  index]
                                                              ?.pmId,
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      "PMT${controller.listAssociatedPm?[index]?.pmId}",
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationStyle:
                                                            TextDecorationStyle
                                                                .solid,
                                                        color: Color.fromARGB(
                                                            255, 5, 92, 163),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    controller
                                                            .listAssociatedPm?[
                                                                index]
                                                            ?.title
                                                            .toString() ??
                                                        '',
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    controller
                                                            .listAssociatedPm?[
                                                                index]
                                                            ?.equipmentCat
                                                            .toString() ??
                                                        '',
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    controller
                                                            .listAssociatedPm?[
                                                                index]
                                                            ?.equipment
                                                            .toString() ??
                                                        '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    controller
                                                            .listAssociatedPm?[
                                                                index]
                                                            ?.startDate
                                                            .toString() ??
                                                        '',
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    controller
                                                            .listAssociatedPm?[
                                                                index]
                                                            ?.assignedTo
                                                            .toString() ??
                                                        '',
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    controller
                                                            .listAssociatedPm?[
                                                                index]
                                                            ?.status_short
                                                            .toString() ??
                                                        '',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      Dimens.boxHeight10,
                      Card(
                        color: Colors.white70,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, top: 7),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Isolation Required ',
                                        style: Styles.black12,
                                      ),
                                      Checkbox(
                                        value: controller.isCheckedLoto.value,
                                        onChanged: (value) {},
                                      ),
                                      Text(
                                        'Loto Applied ',
                                        style: Styles.black12,
                                      ),
                                      Checkbox(
                                        value: controller.isCheckedLoto.value,
                                        onChanged: (value) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Isolated Equipments: ',
                                    style: Styles.blue700,
                                  ),
                                  Row(
                                    children: []..addAll(
                                        controller.listIsolation!.map(
                                          (element) => Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "${element?.isolationAssetsCatName}",
                                                  style: Styles.blue17)
                                            ],
                                          ),
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                height:
                                    ((controller.listLoto?.length ?? 0) * 40) +
                                        140,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        ColorValues.lightGreyColorWithOpacity35,
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
                                            'Isolated Category',
                                            style: Styles.black14,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: DataTable2(
                                        border: TableBorder.all(
                                          color: Color.fromARGB(
                                              255, 128, 128, 128),
                                        ),
                                        columns: [
                                          DataColumn(
                                            label: Text(
                                              "Loto Applied On",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              "Loto Lock Sr. No.",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller.listLoto?.length ?? 0,
                                          (index) => DataRow(
                                            cells: [
                                              DataCell(
                                                Text(controller.listLoto?[index]
                                                        ?.loto_Key
                                                        .toString() ??
                                                    ''),
                                              ),
                                              DataCell(
                                                Text(controller.listLoto?[index]
                                                        ?.loto_lock_number
                                                        .toString() ??
                                                    ''),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Dimens.boxHeight15,
                      controller.safetyMeasureList.isEmpty
                          ? Dimens.box0
                          : Card(
                              color: Colors.white70,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 10, bottom: 10),
                                    child: Text(
                                      "Permit Type Checklist",
                                      style: Styles.blue700,
                                    ),
                                  ),
                                  Dimens.boxHeight10,
                                  Wrap(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: []..addAll(
                                            controller.safetyMeasureList.map(
                                              (element) => Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 5),
                                                child: SizedBox(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      checkBoxMethod(1),
                                                      Expanded(
                                                        child: Text(
                                                            "${element.name}"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ),
                                      Dimens.boxHeight5,
                                    ],
                                  ),
                                  Dimens.boxHeight10,
                                ],
                              ),
                            ),
                      Dimens.boxHeight15,
                      Card(
                        color: Colors.white70,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tool Box Talk", style: Styles.blue700),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  Text("Job Type: ", style: Styles.black13),
                                  Text(
                                    '${controller.viewPermitDetailsModel.value?.job_type_name ?? 'No Data Found'}',
                                    style: TextStyle(
                                      color: ColorValues.appDarkBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimens.thirteen,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("SOP: ", style: Styles.black13),
                                  Text(
                                    '${controller.viewPermitDetailsModel.value?.sop_type_name ?? 'No Data Found'}',
                                    style: TextStyle(
                                      color: ColorValues.appDarkBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimens.thirteen,
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Row(
                                children: [
                                  Spacer(),
                                  CustomElevatedButton(
                                    backgroundColor: ColorValues.navyBlueColor,
                                    text: "Create JSA",
                                    onPressed: () {
                                      Get.dialog<void>(ViewJSADialog());
                                    },
                                  ),
                                  Spacer(),
                                  CustomElevatedButton(
                                    backgroundColor: ColorValues.navyBlueColor,
                                    text: "View SOP",
                                    onPressed: () {
                                      Get.dialog<void>(ViewSOPDialog());
                                    },
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Dimens.boxHeight15,
                      Card(
                        color: Colors.white70,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tool Box Talk (TBT) / PRE-JOB DISCUSSION",
                                style: TextStyle(
                                  color: ColorValues.appDarkBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: Dimens.fourteen,
                                ),
                              ),
                              Dimens.boxHeight10,
                              Row(
                                children: [
                                  Text(
                                    'Conducted At Job-Site By: ',
                                    style: Styles.blackBold12,
                                  ),
                                  Text(
                                    '${controller.viewPermitDetailsModel.value?.tbT_Done_By}',
                                    style: Styles.black12,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Date & Time: ',
                                    style: Styles.blackBold12,
                                  ),
                                  Text(
                                    '${controller.viewPermitDetailsModel.value?.tbT_Done_At}',
                                    style: Styles.black12,
                                  ),
                                ],
                              ),
                              Dimens.boxHeight5,
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                height:
                                    ((controller.listEmployee?.length ?? 0) *
                                            40) +
                                        130,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        ColorValues.lightGreyColorWithOpacity35,
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
                                            'TBT Training Attended By',
                                            style: TextStyle(
                                              color:
                                                  ColorValues.appDarkBlueColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: Dimens.thirteen,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: DataTable2(
                                        border: TableBorder.all(
                                          color: Color.fromARGB(
                                              255, 128, 128, 128),
                                        ),
                                        columns: [
                                          DataColumn2(
                                            label: Text(
                                              "Employee Name",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          DataColumn2(
                                            label: Text(
                                              "Responsibility",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller.listEmployee?.length ?? 0,
                                          (index) => DataRow(
                                            cells: [
                                              DataCell(
                                                Text(controller
                                                        .listEmployee?[index]
                                                        ?.empName
                                                        .toString() ??
                                                    ''),
                                              ),
                                              DataCell(
                                                Text(controller
                                                        .listEmployee?[index]
                                                        ?.resp
                                                        .toString() ??
                                                    ''),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Dimens.boxHeight15,
                      Card(
                        color: Colors.white70,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "All Files Upload",
                                  style: TextStyle(
                                    color: ColorValues.appDarkBlueColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Dimens.fourteen,
                                  ),
                                ),
                                Dimens.boxHeight5,
                                FileUploadWidgetWithDropzone(),
                                Dimens.boxHeight10,
                                FileUploadDetailsWidgetMobile(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight15,
                      controller.historyList!.isEmpty
                          ? Dimens.box0
                          : Card(
                              color: Colors.white70,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 15),
                                  height:
                                      ((controller.historyList?.length ?? 0) *
                                              50) +
                                          125,
                                  width: Get.width * 2.3,
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, bottom: 10),
                                        child: Text(
                                          "Permit History ",
                                          style: Styles.blue700,
                                        ),
                                      ),
                                      Expanded(
                                        child: DataTable2(
                                          border: TableBorder.all(
                                              color: Color.fromARGB(
                                                  255, 206, 229, 234)),
                                          columns: [
                                            DataColumn2(
                                              fixedWidth: Get.width * .5,
                                              label: Text(
                                                "Time Stamp",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .4,
                                              label: Text(
                                                "Posted By",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .4,
                                              label: Text(
                                                "Comment",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .4,
                                              label: Text(
                                                "Location",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .4,
                                              label: Text(
                                                "Status",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.historyList?.length ?? 0,
                                            (index) => DataRow(
                                              cells: [
                                                DataCell(
                                                  Text(controller
                                                          .historyList?[index]
                                                          ?.createdAt
                                                          .toString() ??
                                                      ''),
                                                ),
                                                DataCell(
                                                  Text(controller
                                                          .historyList?[index]
                                                          ?.createdByName
                                                          .toString() ??
                                                      ''),
                                                ),
                                                DataCell(
                                                  Text(controller
                                                          .historyList?[index]
                                                          ?.comment
                                                          .toString() ??
                                                      ''),
                                                ),
                                                DataCell(Text('--')),
                                                DataCell(
                                                  Text(controller
                                                          .historyList?[index]
                                                          ?.status_name
                                                          .toString() ??
                                                      ''),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      Dimens.boxHeight15,
                      Column(
                        children: [
                          CustomText(
                            text1: 'Requested By: ',
                            text2:
                                '${controller.viewPermitDetailsModel.value?.requestedByName}',
                          ),
                          CustomText(
                            text1: 'Date of Requesting: ',
                            text2:
                                '${controller.viewPermitDetailsModel.value?.issue_at}',
                          ),
                        ],
                      ),
                      controller.viewPermitDetailsModel.value?.ptwStatus ==
                                  PermitStatusConstants.PTW_APPROVE //125
                              ||
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
                                  PermitStatusConstants.PTW_CLOSED //126
                              ||
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
                                  PermitStatusConstants
                                      .PTW_CANCELLED_BY_APPROVER //129
                          ? Column(
                              children: [
                                CustomText(
                                  text1: 'Approved By: ',
                                  text2:
                                      '${controller.viewPermitDetailsModel.value?.approvedByName}',
                                ),
                                CustomText(
                                  text1: 'Date of Approval: ',
                                  text2:
                                      '${controller.viewPermitDetailsModel.value?.approve_at}',
                                )
                              ],
                            )
                          : Dimens.box0,
                      controller.viewPermitDetailsModel.value?.ptwStatus ==
                                  PermitStatusConstants
                                      .PTW_CANCELLED_BY_APPROVER //129
                              ||
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
                                  PermitStatusConstants.PTW_CLOSED //126
                          ? Column(
                              children: [
                                CustomText(
                                  text1: 'Cancelled By: ',
                                  text2:
                                      '${controller.viewPermitDetailsModel.value?.cancelRequestByName}',
                                ),
                                CustomText(
                                  text1: 'Date of Cancellation: ',
                                  text2:
                                      '${controller.viewPermitDetailsModel.value?.cancel_at}',
                                )
                              ],
                            )
                          : Dimens.box0,
                      controller.viewPermitDetailsModel.value?.ptwStatus ==
                              PermitStatusConstants.PTW_CLOSED //126
                          ? Column(
                              children: [
                                CustomText(
                                  text1: 'Closed By: ',
                                  text2:
                                      '${controller.viewPermitDetailsModel.value?.closedByName}',
                                ),
                                CustomText(
                                  text1: 'Date of Closing: ',
                                  text2:
                                      '${controller.viewPermitDetailsModel.value?.close_at}',
                                )
                              ],
                            )
                          : Dimens.box0,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => Wrap(
          spacing: 5,
          children: [
            controller.viewPermitDetailsModel.value?.ptwStatus ==
                    PermitStatusConstants.PTW_APPROVE
                ? CustomElevatedButton(
                    icon: Icons.print_outlined,
                    backgroundColor: ColorValues.appDarkBlueColor,
                    text: "Print",
                    onPressed: () {
                      controller.generateInvoice();
                    },
                  )
                : Dimens.box0,
            varUserAccessModel.value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kPermitFeatureId &&
                                e.approve ==
                                    UserAccessConstants.kHaveApproveAccess)
                            .length >
                        0 &&
                    controller.viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CREATED
                ? CustomElevatedButton(
                    backgroundColor: ColorValues.appGreenColor,
                    text: "Approve",
                    icon: Icons.add,
                    onPressed: () {
                      // controller
                      //     .createNewPermit();
                      Get.dialog(PermitApprovedDialog(
                          permitId:
                              controller.viewPermitDetailsModel.value?.permitNo,
                          ptwStatus:
                              '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                          jobId: controller.jobId.value,
                          type: controller.type.value));
                    },
                  )
                : Dimens.box0,
            varUserAccessModel.value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kPermitFeatureId &&
                                e.approve ==
                                    UserAccessConstants.kHaveApproveAccess)
                            .length >
                        0 &&
                    controller.viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_EXTEND_REQUESTED
                ? CustomElevatedButton(
                    backgroundColor: ColorValues.appGreenColor,
                    text: "Extend Approve",
                    icon: Icons.add,
                    onPressed: () {
                      Get.dialog(PermitApprovedDialog(
                        permitId:
                            controller.viewPermitDetailsModel.value?.permitNo,
                        ptwStatus:
                            '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                        jobId: controller.jobId.value,
                      ));
                    },
                  )
                : Dimens.box0,
            varUserAccessModel.value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kPermitFeatureId &&
                                e.approve ==
                                    UserAccessConstants.kHaveApproveAccess)
                            .length >
                        0 &&
                    controller.viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_EXTEND_REQUESTED
                ? CustomElevatedButton(
                    backgroundColor: ColorValues.appRedColor,
                    text: "Extend Reject",
                    icon: Icons.close,
                    onPressed: () {
                      // controller
                      //     .createNewPermit();
                      Get.dialog(PermitRejectDialog(
                        permitId:
                            controller.viewPermitDetailsModel.value?.permitNo,
                        ptwStatus:
                            '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                        jobId: controller.jobId.value,
                      ));
                    },
                  )
                : Dimens.box0,
            controller.viewPermitDetailsModel.value?.isExpired == 1 ||
                    controller.viewPermitDetailsModel.value?.requester_id ==
                            varUserAccessModel.value.user_id &&
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants.PTW_APPROVE //125
                        &&
                        varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.edit ==
                                        UserAccessConstants.kHaveEditAccess)
                                .length >
                            0
                ? CustomElevatedButton(
                    backgroundColor: ColorValues.appDarkBlueColor,
                    text: "Extend",
                    icon: Icons.expand_outlined,
                    onPressed: () {
                      // controller
                      Get.dialog(PermitExtendDialog(
                        permitId:
                            '${controller.viewPermitDetailsModel.value?.permitNo}',
                        jobId: controller.jobId.value,
                      ));
                    },
                  )
                : Dimens.box0,
            varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.add == UserAccessConstants.kHaveAddAccess)
                                .length >
                            0 &&
                        controller.viewPermitDetailsModel.value?.permitNo !=
                            null &&
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants
                                .PTW_CANCEL_REQUEST_REJECTED //121
                    ||
                    controller.viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_EXTEND_REQUEST_REJECTED
                ? CustomElevatedButton(
                    backgroundColor: ColorValues.appcloseRedColor,
                    text: "Close",
                    icon: Icons.close,
                    onPressed: () {
                      Get.dialog(PermitCloseDialog(
                        permitId:
                            '${controller.viewPermitDetailsModel.value?.permitNo}',
                        jobId: controller.jobId.value,
                      ));
                    },
                  )
                : Dimens.box0,
            varUserAccessModel.value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kPermitFeatureId &&
                                e.approve ==
                                    UserAccessConstants.kHaveApproveAccess)
                            .length >
                        0 &&
                    controller.viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CREATED
                ? CustomElevatedButton(
                    backgroundColor: ColorValues.appRedColor,
                    text: "Reject",
                    icon: Icons.close,
                    onPressed: () {
                      // controller
                      //     .createNewPermit();
                      Get.dialog(PermitRejectDialog(
                        permitId:
                            controller.viewPermitDetailsModel.value?.permitNo,
                        ptwStatus:
                            '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                        jobId: controller.jobId.value,
                      ));
                    },
                  )
                : Dimens.box0,
            varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.approve ==
                                        UserAccessConstants.kHaveApproveAccess)
                                .length >
                            0 &&
                        varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.edit ==
                                        UserAccessConstants.kHaveEditAccess)
                                .length >
                            0 ||
                    varUserAccessModel.value.access_list!
                                .where((e) =>
                                    e.feature_id ==
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.edit ==
                                        UserAccessConstants.kHaveEditAccess)
                                .length >
                            0 &&
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants.PTW_APPROVE //125
                    ||
                    controller.viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CREATED //121
                    ||
                    controller.viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_EXTEND_REQUEST_REJECTED ||
                    controller.viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CANCEL_REQUEST_REJECTED
                ? CustomElevatedButton(
                    backgroundColor: ColorValues.appRedColor,
                    text: "Cancel",
                    icon: Icons.close,
                    onPressed: () {
                      Get.dialog(
                        PermitCancelReQuestDialog(
                          permitId:
                              '${controller.viewPermitDetailsModel.value?.permitNo}',
                          jobId: controller.jobId.value,
                        ),
                      );
                    },
                  )
                : Dimens.box0,
            varUserAccessModel.value.access_list!
                            .where((e) =>
                                e.feature_id ==
                                    UserAccessConstants.kPermitFeatureId &&
                                e.edit == UserAccessConstants.kHaveAddAccess)
                            .length >
                        0 &&
                    controller.viewPermitDetailsModel.value?.ptwStatus ==
                        PermitStatusConstants.PTW_CREATED
                ? CustomElevatedButton(
                    backgroundColor: ColorValues.appYellowColor,
                    text: "Edit",
                    icon: Icons.close,
                    onPressed: () {
                      controller.editNewPermit(
                          permitId:
                              controller.viewPermitDetailsModel.value?.permitNo,
                          isChecked: controller.isChecked.value);
                    },
                  )
                : Dimens.box0,
          ],
        ),
      ),
    );
  }

  checkBoxMethod(int position) {
    return Checkbox(
        value: position == 1
            ? controller.isChecked1.value = true
            : position == 2
                ? controller.isChecked2.value = true
                : position == 3
                    ? controller.isChecked3.value = true
                    : position == 4
                        ? controller.isChecked4.value = true
                        : position == 5
                            ? controller.isChecked5.value = true
                            : position == 6
                                ? controller.isChecked6.value = true
                                : position == 7
                                    ? controller.isChecked7.value = true
                                    : null,
        onChanged: (bool? value) {
          position == 1
              ? controller.toggleCheckbox1()
              : position == 2
                  ? controller.toggleCheckbox2()
                  : position == 3
                      ? controller.toggleCheckbox3()
                      : position == 4
                          ? controller.toggleCheckbox4()
                          : position == 5
                              ? controller.toggleCheckbox5()
                              : position == 6
                                  ? controller.toggleCheckbox6()
                                  : position == 7
                                      ? controller.toggleCheckbox7()
                                      : null;
        });
  }

  competenessMethod() {
    return SelectionArea(
      child: Container(
        height: 30,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(color: Colors.blue),
          ],
        ),
        child: Center(
            child: Text(
          'View Competeness',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text1,
            style: Styles.black14,
          ),
        ),
        Expanded(
          child: Text(
            text2,
            style: TextStyle(
              color: ColorValues.appDarkBlueColor,
              fontWeight: FontWeight.w700,
              fontSize: Dimens.fourteen,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
