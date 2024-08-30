import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/new_permit_list/permit_status_constants.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
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
import 'package:url_launcher/url_launcher.dart';

class ViewPermitMobile extends GetView<ViewPermitController> {
  ViewPermitMobile({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => Column(
            children: [
              Dimens.boxHeight5,
              HeaderWidgetMobile(),
              // Container(
              //   padding: EdgeInsets.only(left: 40, top: 20),
              //   width: Get.width,
              //   child: Text(
              //     "Permit Details",
              //     style: TextStyle(
              //       color: ColorValues.appDarkBlueColor,
              //       fontWeight: FontWeight.w700,
              //       fontSize: Dimens.eighteen,
              //     ),
              //   ),
              // ),
              Padding(
                padding: Dimens.edgeInsets10,
                child: (controller.viewPermitDetailsModel.value != null)
                    ? SingleChildScrollView(
                        child: Container(
                          // height: Get.height,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        JobDetailField(
                                          title: 'Permit No',
                                          value:
                                              "${controller.viewPermitDetailsModel.value?.sitePermitNo}",
                                        ),
                                        JobDetailField(
                                          title: 'Plant Name',
                                          value:
                                              "${controller.viewPermitDetailsModel.value?.siteName}",
                                        ),
                                        JobDetailField(
                                          title: 'Start Date',
                                          value:
                                              "${controller.startDateTimeCtrlr.text}",
                                        ),
                                        JobDetailField(
                                          title: 'Permit Description',
                                          value:
                                              "${controller.viewPermitDetailsModel.value?.description}",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        JobDetailField(
                                          title: 'Permit Type',
                                          value:
                                              "${controller.viewPermitDetailsModel.value?.permitTypeName}",
                                        ),
                                        JobDetailField(
                                          title: 'Block',
                                          value:
                                              "${controller.viewPermitDetailsModel.value?.blockName}",
                                        ),
                                        JobDetailField(
                                          title: 'Valid Till',
                                          value:
                                              "${controller.validTillTimeCtrlr.text}",
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Equipment Category:",
                                              style: Styles.appDarkGrey12,
                                            ),
                                            Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              children: []..addAll(
                                                  controller.listCategory!.map(
                                                    (element) => Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          "${element?.equipmentCat} ",
                                                          style: Styles
                                                              .appDarkBlue12,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              controller.listAssociatedPm!.isEmpty
                                  ? Dimens.box0
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "PM Task Linked To The Permit",
                                          style: Styles.blue700,
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .listAssociatedPm?.length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              color: Colors.lightBlue.shade50,
                                              elevation: 10,
                                              shadowColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "PM Task Id: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "PMT${controller.listAssociatedPm?[index]?.pmId}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "PM Task Title: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedPm?[index]?.title}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Equipment Category: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedPm?[index]?.equipmentCat}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Equipment: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedPm?[index]?.equipment}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Start Date: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedPm?[index]?.startDate}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Assigned To: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedPm?[index]?.assignedTo}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                              controller.listAssociatedJobs!.isEmpty
                                  ? Dimens.box0
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Job Linked To The Permit",
                                          style: Styles.blue700,
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .listAssociatedJobs?.length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              color: Colors.lightBlue.shade50,
                                              elevation: 10,
                                              shadowColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Job Id: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "JOB${controller.listAssociatedJobs?[index]?.jobId}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Job Title: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedJobs?[index]?.title}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Equipment Category: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedJobs?[index]?.equipmentCat}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Equipment: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedJobs?[index]?.equipment}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Breakdown Time: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedJobs?[index]?.breakdownTime}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Assigned To: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedJobs?[index]?.assignedTo}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Status: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.listAssociatedJobs?[index]?.status_short}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                              Dimens.boxHeight5,
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
                                    ],
                                  ),
                                  Dimens.boxWidth20,
                                  Row(
                                    children: [
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
                                                "${element?.isolationAssetsCatName} ",
                                                style: Styles.appDarkBlue12,
                                              ),
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
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              "Loto Lock Sr. No.",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller.listLoto?.length ?? 0,
                                          (index) => DataRow(
                                            cells: [
                                              DataCell(
                                                Text(
                                                  controller.listLoto?[index]
                                                          ?.loto_Key
                                                          .toString() ??
                                                      '',
                                                ),
                                              ),
                                              DataCell(
                                                Text(
                                                  controller.listLoto?[index]
                                                          ?.loto_lock_number
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
                              controller.safetyMeasureList.isEmpty
                                  ? Dimens.box0
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 6, bottom: 5),
                                          child: Text(
                                            "Permit Type: ${controller.viewPermitDetailsModel.value?.permitTypeName}",
                                            style: Styles.blue700,
                                          ),
                                        ),
                                        Card(
                                          color: Colors.lightBlue.shade50,
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child:
                                              controller.safetyMeasureList
                                                          .length >
                                                      0
                                                  ? GetBuilder<
                                                      ViewPermitController>(
                                                      init: controller,
                                                      builder: (ctrl) {
                                                        return Column(
                                                          children: controller
                                                              .viewPermitDetailsModel
                                                              .value!
                                                              .safety_question_list!
                                                              .map(
                                                            (element) {
                                                              return Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    child: Row(
                                                                      children: [
                                                                        checkBoxMethod(
                                                                          element.ischeck == 1
                                                                              ? true
                                                                              : false,
                                                                          (value) {
                                                                            element.ischeck == value ??
                                                                                false;
                                                                            controller.update();
                                                                          },
                                                                        ),
                                                                        Dimens
                                                                            .boxWidth5,
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${element.saftyQuestionName}",
                                                                            maxLines:
                                                                                5,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ).toList(),
                                                        );
                                                      },
                                                    )
                                                  : Dimens.box0,
                                        ),
                                      ],
                                    ),
                              Dimens.boxHeight10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("SOP / JSA", style: Styles.blue700),
                                  Card(
                                    color: Colors.lightBlue.shade50,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Job Type: ",
                                                  style: Styles.black13),
                                              Text(
                                                '${controller.viewPermitDetailsModel.value?.job_type_name ?? 'No Data Found'}',
                                                style: TextStyle(
                                                  color: ColorValues
                                                      .appDarkBlueColor,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: Dimens.thirteen,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("SOP: ",
                                                  style: Styles.black13),
                                              Text(
                                                '${controller.viewPermitDetailsModel.value?.sop_type_name ?? 'No Data Found'}',
                                                style: TextStyle(
                                                  color: ColorValues
                                                      .appDarkBlueColor,
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
                                                backgroundColor:
                                                    ColorValues.navyBlueColor,
                                                text: "View JSA",
                                                onPressed: () async {
                                                  // String baseUrl =
                                                  //     'http://65.0.20.19/CMMS_API/';
                                                  String baseUrl =
                                                      'http://172.20.43.9:83/';
                                                  String endpoint =
                                                      '${controller.jsaData}';
                                                  String fullUrl =
                                                      baseUrl + endpoint;
                                                  print('JSAUrl:$fullUrl');
                                                  if (await canLaunch(
                                                      fullUrl)) {
                                                    await launch(fullUrl);
                                                  }
                                                },
                                              ),
                                              Spacer(),
                                              CustomElevatedButton(
                                                backgroundColor:
                                                    ColorValues.navyBlueColor,
                                                text: "View SOP",
                                                onPressed: () async {
                                                  // final url = '${controller.jsaData}';
                                                  // "https://www.w3.org/1999/xhtml/"
                                                  // String baseUrl =
                                                  //     'http://65.0.20.19/CMMS_API/';
                                                  String baseUrl =
                                                      'http://172.20.43.9:83/';
                                                  String endpoint =
                                                      '${controller.sopData}';

                                                  // Concatenate the links
                                                  String fullUrl =
                                                      baseUrl + endpoint;
                                                  // final url =
                                                  //     'http://65.0.20.19/O3_Files${controller.jsaData}';
                                                  print('JSAUrl:$fullUrl');
                                                  if (await canLaunch(
                                                      fullUrl)) {
                                                    await launch(fullUrl);
                                                  }
                                                },
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Dimens.boxHeight10,
                              controller.file_list!.isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Files Uploaded",
                                          style: Styles.blue700,
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .viewPermitDetailsModel
                                              .value
                                              ?.file_list
                                              ?.length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              color: Colors.lightBlue.shade50,
                                              elevation: 10,
                                              shadowColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(
                                                        "${controller.file_list?[index]?.description}",
                                                        style: Styles
                                                            .appDarkGrey12,
                                                      ),
                                                    ),
                                                  ),
                                                  TableActionButton(
                                                    color: ColorValues
                                                        .appDarkBlueColor,
                                                    icon: Icons.visibility,
                                                    message: 'View Permit',
                                                    onPress: () async {
                                                      // String baseUrl =
                                                      //     "http://65.0.20.19/CMMS_API/";
                                                      String baseUrl =
                                                          'http://172.20.43.9:83/';
                                                      String fileName =
                                                          controller
                                                                  .file_list![
                                                                      index]
                                                                  ?.fileName ??
                                                              "";
                                                      String fullUrl =
                                                          baseUrl + fileName;
                                                      if (await canLaunch(
                                                          fullUrl)) {
                                                        await launch(fullUrl);
                                                      } else {
                                                        throw 'Could not launch $fullUrl';
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    )
                                  : Dimens.box0,
                              Dimens.boxHeight10,
                              controller.viewPermitDetailsModel.value
                                          ?.ptwStatus ==
                                      121
                                  ? Dimens.box0
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height:
                                                10), // Replacing Dimens.boxHeight10 for simplicity
                                        Text(
                                          "Tool Box Talk (TBT) / PRE-JOB DISCUSSION",
                                          style: TextStyle(
                                            color: ColorValues.appDarkBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: Dimens.fourteen,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                2), // Replacing Dimens.boxHeight2 for simplicity
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Conducted At Job-Site By: ',
                                                style: Styles.blackBold12,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${controller.viewPermitDetailsModel.value?.tbT_Done_By}',
                                                  style: Styles.black12,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Date & Time: ',
                                                style: Styles.blackBold12,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${controller.viewPermitDetailsModel.value?.tbT_Done_At}',
                                                  style: Styles.black12,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                8), // Replacing Dimens.boxHeight8 for simplicity
                                        Text(
                                          "Employees",
                                          style: TextStyle(
                                            color: ColorValues.appDarkBlueColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: Dimens.fourteen,
                                          ),
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller
                                                  .viewPermitDetailsModel
                                                  .value
                                                  ?.employee_list
                                                  ?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            var employee =
                                                controller.listEmployee?[index];
                                            return Card(
                                              color: Colors.lightBlue.shade50,
                                              elevation: 4,
                                              shadowColor: Colors.black54,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 6, horizontal: 8),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Employee Name",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            "${employee?.empName ?? ''}",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 8),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Responsibility",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            "${employee?.resp ?? ''}",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                              Dimens.boxHeight15,
                              controller.historyList!.isEmpty
                                  ? Dimens.box0
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Permit History",
                                          style: Styles.blue700,
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .listAssociatedPm?.length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              color: Colors.lightBlue.shade50,
                                              elevation: 10,
                                              shadowColor: Colors.black87,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Time Stamp:",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.historyList?[index]?.createdAt?.result.toString() ?? ''}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Posted By:",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.historyList?[index]?.createdByName.toString() ?? ''}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Comment: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.historyList?[index]?.comment.toString() ?? ''}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Location: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.historyList?[index]?.comment.toString() ?? ''}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            "Status: ",
                                                            style: Styles
                                                                .appDarkGrey12,
                                                          ),
                                                        ),
                                                        Dimens.boxWidth5,
                                                        Expanded(
                                                          child: Text(
                                                            "${controller.historyList?[index]?.status_name.toString() ?? ''}",
                                                            style: Styles
                                                                .appDarkBlue12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
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
                              controller.viewPermitDetailsModel.value
                                              ?.ptwStatus ==
                                          PermitStatusConstants
                                              .PTW_APPROVE //125
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
                              controller.viewPermitDetailsModel.value
                                              ?.ptwStatus ==
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
                              controller.viewPermitDetailsModel.value
                                          ?.ptwStatus ==
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
                              Dimens.boxHeight40,
                            ],
                          ),
                        ),
                      )
                    : Dimens.box0,
              ),
              Wrap(
                spacing: 2,
                runSpacing: 2,
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.19,
                  // ),

                  // controller.viewPermitDetailsModel.value?.ptwStatus ==
                  //         PermitStatusConstants.PTW_APPROVE //125
                  //     ///Printing functionality
                  //     ? Padding(
                  //         padding: const EdgeInsets.only(left: 5),
                  //         child: Container(
                  //           height: 45,
                  //           child: CustomElevatedButton(
                  //             icon: Icons.print_outlined,
                  //             backgroundColor: ColorValues.appDarkBlueColor,
                  //             text: "Print",
                  //             onPressed: () {
                  //               controller.generateInvoice();
                  //             },
                  //           ),
                  //         ),
                  //       )
                  //     : Dimens.box0,

                  ///Approve Button
                  varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kPermitFeatureId &&
                                      e.approve ==
                                          UserAccessConstants
                                              .kHaveApproveAccess)
                                  .length >
                              0 &&
                          controller.viewPermitDetailsModel.value?.ptwStatus ==
                              PermitStatusConstants.PTW_CREATED //121
                      // ||
                      // controller.viewPermitDetailsModel.value?.ptwStatus ==
                      //     PermitStatusConstants.PTW_EXTEND_REQUESTED //133
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                text: "Approve Permit",
                                icon: Icons.check,
                                onPressed: () {
                                  // controller
                                  //     .createNewPermit();
                                  Get.dialog(PermitApprovedDialog(
                                      permitId: controller
                                          .viewPermitDetailsModel
                                          .value
                                          ?.permitNo,
                                      ptwStatus:
                                          '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                                      jobId: controller.jobId.value,
                                      type: controller.type.value));
                                },
                              )),
                        )
                      : Dimens.box0,

                  varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kPermitFeatureId &&
                                      e.approve ==
                                          UserAccessConstants
                                              .kHaveApproveAccess)
                                  .length >
                              0 &&
                          controller.viewPermitDetailsModel.value?.ptwStatus ==
                              PermitStatusConstants.PTW_EXTEND_REQUESTED //133
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                text: "Extend Approve",
                                icon: Icons.check,
                                onPressed: () {
                                  // controller
                                  //     .createNewPermit();
                                  Get.dialog(PermitApprovedDialog(
                                    permitId: controller
                                        .viewPermitDetailsModel.value?.permitNo,
                                    ptwStatus:
                                        '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                                    jobId: controller.jobId.value,
                                  ));
                                },
                              )),
                        )
                      : Dimens.box0,

                  // Dimens.boxWidth5,

                  varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kPermitFeatureId &&
                                      e.approve ==
                                          UserAccessConstants
                                              .kHaveApproveAccess)
                                  .length >
                              0 &&
                          controller.viewPermitDetailsModel.value?.ptwStatus ==
                              PermitStatusConstants.PTW_EXTEND_REQUESTED //133
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appRedColor,
                                text: "Extend Reject",
                                icon: Icons.close,
                                onPressed: () {
                                  // controller
                                  //     .createNewPermit();
                                  Get.dialog(PermitRejectDialog(
                                    permitId: controller
                                        .viewPermitDetailsModel.value?.permitNo,
                                    ptwStatus:
                                        '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                                    jobId: controller.jobId.value,
                                  ));
                                },
                              )),
                        )
                      : Dimens.box0,

                  // Dimens.boxWidth5,

                  ///Extend Permit Button

                  // controller.viewPermitDetailsModel.value?.isExpired == 1 ||
                  controller.viewPermitDetailsModel.value!.tbT_Done_Check ==
                              1 &&
                          controller
                                  .viewPermitDetailsModel.value?.requester_id ==
                              varUserAccessModel.value.user_id &&
                          controller.viewPermitDetailsModel.value?.ptwStatus ==
                              PermitStatusConstants.PTW_APPROVE &&
                          varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kPermitFeatureId &&
                                      e.edit ==
                                          UserAccessConstants.kHaveEditAccess)
                                  .length >
                              0 &&
                          controller.isOneHour(
                                  controller.validTillTimeCtrlr.text) ==
                              true
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appDarkBlueColor,
                                text: "Extend Permit",
                                icon: Icons.expand_outlined,
                                onPressed: () {
                                  Get.dialog(PermitExtendDialog(
                                    permitId:
                                        '${controller.viewPermitDetailsModel.value?.permitNo}',
                                    jobId: controller.jobId.value,
                                  ));
                                },
                              )),
                        )
                      : Dimens.box0,

                  // Dimens.boxWidth5,

                  ///Close Permit Request
                  varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants
                                                  .kPermitFeatureId &&
                                          e.add ==
                                              UserAccessConstants
                                                  .kHaveAddAccess)
                                      .length >
                                  0 &&
                              controller
                                      .viewPermitDetailsModel.value?.permitNo !=
                                  null &&
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
                                  PermitStatusConstants
                                      .PTW_CANCEL_REQUEST_REJECTED //121
                          ||
                          controller.viewPermitDetailsModel.value?.ptwStatus ==
                              PermitStatusConstants.PTW_EXTEND_REQUEST_REJECTED
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appcloseRedColor,
                                text: "Close Permit",
                                icon: Icons.close,
                                onPressed: () {
                                  Get.dialog(PermitCloseDialog(
                                    permitId:
                                        '${controller.viewPermitDetailsModel.value?.permitNo}',
                                    jobId: controller.jobId.value,
                                  ));
                                },
                              )),
                        )
                      : Dimens.box0,

                  // Dimens.boxWidth5,

                  ///Reject Button
                  varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kPermitFeatureId &&
                                      e.approve ==
                                          UserAccessConstants
                                              .kHaveApproveAccess)
                                  .length >
                              0 &&
                          controller.viewPermitDetailsModel.value?.ptwStatus ==
                              PermitStatusConstants.PTW_CREATED //121

                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appRedColor,
                                text: "Reject Permit",
                                icon: Icons.close,
                                onPressed: () {
                                  // controller
                                  //     .createNewPermit();
                                  Get.dialog(PermitRejectDialog(
                                    permitId: controller
                                        .viewPermitDetailsModel.value?.permitNo,
                                    ptwStatus:
                                        '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                                    jobId: controller.jobId.value,
                                  ));
                                },
                              )),
                        )
                      : Dimens.box0,

                  (varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants
                                                  .kPermitFeatureId &&
                                          e.approve ==
                                              UserAccessConstants
                                                  .kHaveApproveAccess)
                                      .length >
                                  0 ||
                              varUserAccessModel.value.access_list!
                                      .where((e) =>
                                          e.feature_id ==
                                              UserAccessConstants
                                                  .kPermitFeatureId &&
                                          e.add ==
                                              UserAccessConstants
                                                  .kHaveAddAccess)
                                      .length >
                                  0) &&
                          (controller.viewPermitDetailsModel.value?.ptwStatus !=
                              PermitStatusConstants
                                  .PTW_CANCEL_REQUEST_APPROVED) &&
                          (controller.viewPermitDetailsModel.value?.ptwStatus !=
                              PermitStatusConstants
                                  .PTW_EXTEND_REQUEST_REJECTED) &&
                          (controller.viewPermitDetailsModel.value?.ptwStatus !=
                              PermitStatusConstants.PTW_CLOSED)
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appRedColor,
                                text: "Cancel Permit",
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
                              )),
                        )
                      : Dimens.box0,

                  // Dimens.boxWidth5,

                  /// Edit Button
                  varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kPermitFeatureId &&
                                      e.edit ==
                                          UserAccessConstants.kHaveAddAccess)
                                  .length >
                              0 &&
                          controller.viewPermitDetailsModel.value?.ptwStatus ==
                              PermitStatusConstants.PTW_CREATED //121

                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                              height: 45,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appYellowColor,
                                text: "Edit Permit",
                                icon: Icons.edit,
                                onPressed: () {
                                  controller.editNewPermit(
                                      permitId: controller
                                          .viewPermitDetailsModel
                                          .value
                                          ?.permitNo,
                                      isChecked: controller.isChecked.value);
                                },
                              )),
                        )
                      : Dimens.box0,
                ],
              ),

              Dimens.boxHeight10
            ],
          ),
        ),
      ),
      // floatingActionButton: Obx(
      //   () =>

      // ),
    );
  }

  checkBoxMethod(bool isChecked, Function(bool?) onChange) {
    return Checkbox(
      value: isChecked,
      onChanged: onChange,
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
            style: Styles.black12,
          ),
        ),
        Expanded(
          child: Text(
            text2,
            style: TextStyle(
              color: ColorValues.appDarkBlueColor,
              fontWeight: FontWeight.w700,
              fontSize: Dimens.twelve,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
