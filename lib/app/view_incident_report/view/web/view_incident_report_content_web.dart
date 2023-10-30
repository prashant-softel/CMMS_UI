// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/navigators.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_incident_report/view_incident_report_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/incident_report_reject_dialog.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ViewIncidentReportContentWeb
    extends GetView<ViewIncidentReportController> {
  ViewIncidentReportContentWeb({super.key});

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  bool valuefirst = false;
  bool _switchValue = false;

  // final homeController = Get.find<HomeController>();
  final ViewIncidentReportController controller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: HeaderWidget(),
          elevation: 0,
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
        ),
        body: Row(
          children: [
            Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Dimens.box0
                : HomeDrawer(),
            Expanded(
              child: RepaintBoundary(
                key: controller.printKey,
                child: Container(
                  // margin: Dimens.edgeInsets16,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: Color.fromARGB(255, 227, 224, 224),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 236, 234, 234)
                                    .withOpacity(0.5),
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
                                "Dashboard",
                                style: Styles.greyLight14,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(" / Incident Report",
                                    style: Styles.greyMediumLight12),
                              ),
                              Text(" / View Incident Report",
                                  style: Styles.greyMediumLight12)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1,
                          // height: MediaQuery.of(context).size.height / 1,
                          child: Card(
                            color: Colors.lightBlue.shade50,
                            child: Wrap(
                              children: [
                                GetBuilder<ViewIncidentReportController>(
                                    id: 'incident-report',
                                    builder: (controller) {
                                      return Obx(
                                        () => Column(
                                          children: [
                                            CustomAppBar(
                                              title: 'View Incident Report'.tr,
                                              action: Container(
                                                height: 30,
                                                width: 170,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                    width: 1,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.green),
                                                  ],
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '${controller.incidentReportDetailsModel.value?.status_short}',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              ),
                                            ),
                                            Dimens.boxHeight10,
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      CustomRichText(
                                                          title: 'Id: '),
                                                      CustomRichText(
                                                          title: 'Plant: '),
                                                      CustomRichText(
                                                          title: 'Block: '),
                                                      CustomRichText(
                                                          title:
                                                              'Incident Date & Time: '),
                                                      CustomRichText(
                                                          title:
                                                              'Incident Description: '),
                                                      CustomRichText(
                                                          title:
                                                              'Victim Name: '),
                                                      CustomRichText(
                                                          title:
                                                              'Incident Investigation Done By: '),
                                                      CustomRichText(
                                                          title: 'Risk Type: '),
                                                      CustomRichText(
                                                          title:
                                                              'Legal Applicability: '),
                                                      CustomRichText(
                                                          title:
                                                              'Damaged Assets cost approx.: '),
                                                      CustomRichText(
                                                          title:
                                                              'Asset Restoration action taken by: '),
                                                      CustomRichText(
                                                          title:
                                                              'Insurance Available: '),
                                                      CustomRichText(
                                                          title:
                                                              'Insurance Status: '),
                                                      CustomRichText(
                                                          title:
                                                              'Insurance Remarks: '),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.id}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.facility_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.block_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentDateTimeCtrlrWeb.text}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    SizedBox(
                                                      width: 150,
                                                      child: Text(
                                                        '${controller.incidentReportDetailsModel.value?.description}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    5,
                                                                    92,
                                                                    163)),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.victim_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.inverstigated_by_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.risk_type_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.legal_applicability_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.damaged_cost} INR',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.action_taken_by_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.is_insurance_applicable_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.insurance_status_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    SizedBox(
                                                      width: 300,
                                                      child: Text(
                                                        '${controller.incidentReportDetailsModel.value?.insurance_remark}',
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    5,
                                                                    92,
                                                                    163)),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                /////
                                                Spacer(),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Title: '),
                                                    CustomRichText(
                                                        title:
                                                            'Equipment Categories: '),
                                                    CustomRichText(
                                                        title:
                                                            'Reporting Date & Time: '),
                                                    CustomRichText(
                                                        title:
                                                            'Incident Severity: '),
                                                    CustomRichText(
                                                        title:
                                                            'Action Taken Date & Time: '),
                                                    CustomRichText(
                                                        title:
                                                            'Incident Investigation Verification done by: '),
                                                    CustomRichText(
                                                        title:
                                                            'ESI Applicability: '),
                                                    CustomRichText(
                                                        title:
                                                            'RCA Upload Required: '),
                                                    Dimens.boxHeight10,
                                                    CustomRichText(
                                                        title:
                                                            'Gen loss due to asset damage: '),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.title}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.equipment_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.reportingDateTimeCtrlrWeb.text}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.severity}',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    Text(
                                                      '${controller.actionTakenDateTimeCtrlrWeb.text}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.verified_by_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.esi_applicability_name}',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${controller.incidentReportDetailsModel.value?.rca_required_name}',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      5,
                                                                      92,
                                                                      163)),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        TableActionButton(
                                                          color: ColorValues
                                                              .appDarkBlueColor,
                                                          icon:
                                                              Icons.visibility,
                                                          message: 'RCA',
                                                          onPress: () {
                                                            // controller.viewIncidentReport(
                                                            //     id: int.tryParse(
                                                            //         '${record[0]}'));
                                                            // print('record:${int.tryParse('${record[0]}')}');
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '${controller.incidentReportDetailsModel.value?.generation_loss} INR',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                            ///Incident Report History
                                            Container(
                                              margin: Dimens.edgeInsets20,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: ColorValues
                                                      .lightGreyColorWithOpacity35,
                                                  width: 1,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: ColorValues
                                                        .appBlueBackgroundColor,
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Incident Report History ",
                                                          style: Styles.blue700,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: ColorValues
                                                        .greyLightColour,
                                                  ),
                                                  Expanded(
                                                    child: ScrollableTableView(
                                                      columns: [
                                                        "Time Stamp",
                                                        "Module Ref ID",
                                                        "Comment",
                                                        "Module Type",
                                                        "Status",
                                                      ].map((column) {
                                                        return TableViewColumn(
                                                          label: column,
                                                          minWidth:
                                                              Get.width * 0.15,
                                                        );
                                                      }).toList(),
                                                      rows: [
                                                        ...List.generate(
                                                          controller.historyList
                                                                  ?.length ??
                                                              0,
                                                          (index) {
                                                            var getHistoryListDetails =
                                                                controller
                                                                        .historyList?[
                                                                    index];
                                                            return [
                                                              '${getHistoryListDetails?.createdAt}',
                                                              '${getHistoryListDetails?.moduleRefId ?? ''}',
                                                              '${getHistoryListDetails?.comment ?? ''}',
                                                              '${getHistoryListDetails?.moduleType ?? ''}',
                                                              '${getHistoryListDetails?.status_name ?? ''}',
                                                            ];
                                                          },
                                                        ),
                                                        // [
                                                      ].map((record) {
                                                        return TableViewRow(
                                                          height: 30,
                                                          cells: record
                                                              .map((value) {
                                                            return TableViewCell(
                                                              child:
                                                                  Text(value),
                                                            );
                                                          }).toList(),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 150,
                                      ),
                                      Container(
                                        height: 28,
                                        child: CustomElevatedButton(
                                          icon: Icons.print_outlined,
                                          backgroundColor:
                                              ColorValues.appDarkBlueColor,
                                          text: "Print",
                                          onPressed: () {
                                            // controller.printScreen();
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appRedColor,
                                        onPressed: () {
                                          Get.offAndToNamed(
                                              Routes.incidentReportListWeb);
                                        },
                                        text: 'Cancel',
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      //           varUserAccessModel.value.access_list!
                                      // .where((e) => e.feature_id == 3 && e.edit == 1)
                                      // .length > 0
                                      // &&
                                      controller.incidentReportDetailsModel
                                                      .value?.id !=
                                                  null &&
                                              varUserAccessModel
                                                      .value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kIncidentReportFeatureId &&
                                                          e.edit ==
                                                              UserAccessConstants
                                                                  .kHaveEditAccess)
                                                      .length >
                                                  0
                                          ? CustomElevatedButton(
                                              icon: Icons.edit,
                                              backgroundColor:
                                                  ColorValues.appYellowColor,
                                              onPressed: () {
                                                // controller.saveAsDraft();
                                                controller.editIncidentReport(
                                                    id: controller
                                                        .incidentReportDetailsModel
                                                        .value
                                                        ?.id);
                                              },
                                              text: 'Edit',
                                            )
                                          : Container(),
                                      SizedBox(
                                        width: 20,
                                      ),

                                      ////Approve Button
                                      varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kIncidentReportFeatureId &&
                                                          e.approve ==
                                                              UserAccessConstants
                                                                  .kHaveApproveAccess)
                                                      .length >
                                                  0 &&
                                              controller
                                                      .incidentReportDetailsModel
                                                      .value
                                                      ?.status ==
                                                  181
                                          ? CustomElevatedButton(
                                              icon: Icons.add,
                                              backgroundColor:
                                                  ColorValues.appGreenColor,
                                              onPressed: () {
                                                // controller.saveAsDraft();
                                                controller
                                                    .incidentReportApproveButton();
                                              },
                                              text: 'Approve',
                                            )
                                          : Container(),
                                      SizedBox(
                                        width: 20,
                                      ),

                                      ////Reject Button
                                      varUserAccessModel.value.access_list!
                                                      .where((e) =>
                                                          e.feature_id ==
                                                              UserAccessConstants
                                                                  .kIncidentReportFeatureId &&
                                                          e.delete ==
                                                              UserAccessConstants
                                                                  .kHaveDeleteAccess)
                                                      .length >
                                                  0 &&
                                              controller
                                                      .incidentReportDetailsModel
                                                      .value
                                                      ?.status ==
                                                  181
                                          ? CustomElevatedButton(
                                              icon: Icons.close,
                                              backgroundColor:
                                                  ColorValues.appRedColor,
                                              onPressed: () {
                                                // controller.saveAsDraft();
                                                Get.dialog(
                                                    IncidentReportRejectDialog(
                                                        id: '${controller.incidentReportDetailsModel.value?.id}'));
                                              },
                                              text: 'Reject',
                                            )
                                          : Container(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // ),
      );

  ///Below All For WEB
  ///
  /// Action Taken date and Time
  Widget _buildActionTakenDateTimeField_web(
    BuildContext context,
  ) {
    return Column(//
        children: [
      // Align(
      //     alignment: Alignment.topLeft,
      //     child: Padding(
      //       padding: const EdgeInsets.only(right: 385),
      //       child: CustomRichText(
      //         title: position == 0 ? '$title1' : '$title2',
      //       ),
      //     )),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 50,
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
              ), //BoxShadow
              BoxShadow(
                color: ColorValues.whiteColor,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SizedBox(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 3.7
                : MediaQuery.of(context).size.width / 1.0,
            child: TextField(
              onTap: () {
                pickActionTakenDateTime_web(context, 0);

                // : null;
              },
              controller: controller.actionTakenDateTimeCtrlr,

              // :null,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                // focusedErrorBorder:
                // hintText: '${position == 1 ? DateFormat.yMEd() : ''}',
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : InputBorder.none,
                // errorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : null,
                // errorText: controller.isJobTitleInvalid.value
                //     ? "Required field"
                //     : null,
              ),
            ),
          ),
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

//Start Date and valid Till
  Future pickActionTakenDateTime_web(BuildContext context, int position) async {
    var dateTime = controller.selectedActionTakenTime.value;

    final date = await pickActionTakenDate_web(context, position);
    if (date == null) {
      return;
    }

    final time = await pickActionTakenTime_web(context, position);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    controller.selectedActionTakenTime.value;

    controller.actionTakenDateTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.actionTakenDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    // controller.validTillTimeCtrlr.text =
    //     DateFormat("yyyy-MM-dd HH:mm").format(dateTime.add(Duration(hours: 8)));
    // controller.validTillTimeCtrlrBuffer =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    //         .format(dateTime.add(Duration(hours: 8)));
    // controller.startDateTimeCtrlrBuffer =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    //         .format(dateTime);
  }

  Future<DateTime?> pickActionTakenDate_web(
      BuildContext context, int position) async {
    DateTime? dateTime = controller.selectedActionTakenTime.value;

    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickActionTakenTime_web(
      BuildContext context, int position) async {
    DateTime dateTime = controller.selectedActionTakenTime.value;

    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

  ///
  /// Incident and Reporting date Time
  Widget _buildStartValidTillDateField_web(
    BuildContext context,
    int position,
  ) {
    return Column(//
        children: [
      // Align(
      //     alignment: Alignment.topLeft,
      //     child: Padding(
      //       padding: const EdgeInsets.only(right: 385),
      //       child: CustomRichText(
      //         title: position == 0 ? '$title1' : '$title2',
      //       ),
      //     )),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 50,
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
              ), //BoxShadow
              BoxShadow(
                color: ColorValues.whiteColor,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SizedBox(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 3.7
                : MediaQuery.of(context).size.width / 1.0,
            child: TextField(
              onTap: () {
                position == 0
                    ? pickDateTime_web(context, 0)
                    : pickDateTime_web(context, 1);
                // : null;
              },
              controller: position == 0
                  ? controller.startDateTimeCtrlr
                  : controller.validTillTimeCtrlr,

              // :null,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                // focusedErrorBorder:
                // hintText: '${position == 1 ? DateFormat.yMEd() : ''}',
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : InputBorder.none,
                // errorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : null,
                // errorText: controller.isJobTitleInvalid.value
                //     ? "Required field"
                //     : null,
              ),
            ),
          ),
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

//Start Date and valid Till
  Future pickDateTime_web(BuildContext context, int position) async {
    var dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    final date = await pickDate_web(context, position);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context, position);
    if (time == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value = dateTime;
    position == 0
        ? controller.startDateTimeCtrlr
        : controller.validTillTimeCtrlr
      ..text = DateFormat("yyyy-MM-dd HH:mm").format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: position == 0
              ? controller.startDateTimeCtrlr.text.length
              : controller.validTillTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    controller.validTillTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime.add(Duration(hours: 8)));
    controller.validTillTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
            .format(dateTime.add(Duration(hours: 8)));
    controller.startDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context, int position) async {
    DateTime? dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(BuildContext context, int position) async {
    DateTime dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    //final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        });

    if (newTime == null) {
      return null;
    }

    return newTime;
  }

  Widget _buildIncidentReportDescriptionField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text: TextSpan(
      //           text: 'Permit Description: ',
      //           style: Styles.blackBold16,
      //           children: [
      //             TextSpan(
      //               text: '*',
      //               style: TextStyle(
      //                 color: ColorValues.orangeColor,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Container(
          // width: 500,
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
          child: SizedBox(
            child: TextField(
              controller: controller.incidentreportDescriptionCtrlr,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: Dimens.edgeInsets05_10,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: controller.isJobDescriptionInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : InputBorder.none,
                errorBorder: controller.isJobDescriptionInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : null,
                errorText: controller.isJobDescriptionInvalid.value
                    ? "Required field"
                    : null,
              ),
              onChanged: (value) {
                if (value.trim().length > 3) {
                  controller.isJobDescriptionInvalid.value = false;
                } else {
                  controller.isJobDescriptionInvalid.value = true;
                }
              },
            ),
          ),
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }

//Insurance Remarks
  Widget _buildInsuranceRemarkField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text: TextSpan(
      //           text: 'Permit Description: ',
      //           style: Styles.blackBold16,
      //           children: [
      //             TextSpan(
      //               text: '*',
      //               style: TextStyle(
      //                 color: ColorValues.orangeColor,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Container(
          // width: 500,
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
          child: SizedBox(
            child: TextField(
              controller: controller.insuranceRemarkTextCtrlr,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: Dimens.edgeInsets05_10,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder:
                    controller.isInsuranceRemarkTextInvalid.value
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: ColorValues.redColorDark,
                            ),
                          )
                        : InputBorder.none,
                errorBorder: controller.isInsuranceRemarkTextInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : null,
                errorText: controller.isInsuranceRemarkTextInvalid.value
                    ? "Required field"
                    : null,
              ),
              onChanged: (value) {
                if (value.trim().length > 3) {
                  controller.isInsuranceRemarkTextInvalid.value = false;
                } else {
                  controller.isInsuranceRemarkTextInvalid.value = true;
                }
              },
            ),
          ),
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }

  Widget _buildIncidentReportTitleTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 45,
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 1.44
              : MediaQuery.of(context).size.width / 1.1,
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            child: TextField(
              controller: controller.titleTextCtrlr,
              keyboardType: TextInputType.multiline,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: Dimens.edgeInsets05_10,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: controller.isTitleTextInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : InputBorder.none,
                errorBorder: controller.isTitleTextInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : null,
                errorText: controller.isTitleTextInvalid.value
                    ? "Required field"
                    : null,
              ),
              onChanged: (value) {
                if (value.trim().length > 3) {
                  controller.isTitleTextInvalid.value = false;
                } else {
                  controller.isTitleTextInvalid.value = true;
                }
              },
            ),
          ),
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }

  Widget _buildVictimNameTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 45,
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 1.44
              : MediaQuery.of(context).size.width / 1.1,
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            child: TextField(
              controller: controller.victimNameTextCtrlr,
              keyboardType: TextInputType.multiline,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: Dimens.edgeInsets05_10,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: controller.isVictimNameTextInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : InputBorder.none,
                errorBorder: controller.isVictimNameTextInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : null,
                errorText: controller.isVictimNameTextInvalid.value
                    ? "Required field"
                    : null,
              ),
              onChanged: (value) {
                if (value.trim().length > 3) {
                  controller.isVictimNameTextInvalid.value = false;
                } else {
                  controller.isVictimNameTextInvalid.value = true;
                }
              },
            ),
          ),
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }

  ///Damaged Aseets cost
  Widget _buildDamagedAssetsCostTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 45,
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 1.44
              : MediaQuery.of(context).size.width / 1.1,
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            child: TextField(
              controller: controller.damagedAssetCostTextCtrlr,
              keyboardType: TextInputType.multiline,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: Dimens.edgeInsets05_10,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder:
                    controller.isDamagedAssetCostTextInvalid.value
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: ColorValues.redColorDark,
                            ),
                          )
                        : InputBorder.none,
                errorBorder: controller.isDamagedAssetCostTextInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : null,
                errorText: controller.isDamagedAssetCostTextInvalid.value
                    ? "Required field"
                    : null,
              ),
              onChanged: (value) {
                if (value.trim().length > 3) {
                  controller.isDamagedAssetCostTextInvalid.value = false;
                } else {
                  controller.isDamagedAssetCostTextInvalid.value = true;
                }
              },
            ),
          ),
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }

  ///Gen Loss Due To Asset Damage
  Widget _buildGenLossAssetDamageTextField_web(BuildContext context) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 10),
      //     child: RichText(
      //       text:
      //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
      //         TextSpan(
      //           text: '*',
      //           style: TextStyle(
      //             color: ColorValues.orangeColor,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ]),
      //     ),
      //   ),
      // ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 45,
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width / 1.44
              : MediaQuery.of(context).size.width / 1.1,
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            child: TextField(
              controller: controller.genLossAssetDamageTextCtrlr,
              keyboardType: TextInputType.multiline,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: Dimens.edgeInsets05_10,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder:
                    controller.isGenLossAssetDamageTextInvalid.value
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: ColorValues.redColorDark,
                            ),
                          )
                        : InputBorder.none,
                errorBorder: controller.isGenLossAssetDamageTextInvalid.value
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: ColorValues.redColorDark,
                        ),
                      )
                    : null,
                errorText: controller.isGenLossAssetDamageTextInvalid.value
                    ? "Required field"
                    : null,
              ),
              onChanged: (value) {
                if (value.trim().length > 3) {
                  controller.isGenLossAssetDamageTextInvalid.value = false;
                } else {
                  controller.isGenLossAssetDamageTextInvalid.value = true;
                }
              },
            ),
          ),
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }
}
