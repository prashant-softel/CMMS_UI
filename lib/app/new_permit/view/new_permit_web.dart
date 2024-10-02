import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:cmms/app/widgets/view_sop_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cmms/app/utils/url_path.dart';

class NewPermitWeb extends GetView<NewPermitController> {
  NewPermitWeb({Key? key}) : super(key: key);
  final NewPermitController _controller = Get.find();
  final FileUploadController dropzoneController =
      Get.put(FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',));
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Obx(
        () => Column(
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
                        String taskId = controller.listAssociatedPm!.isEmpty
                            ? controller.pmtaskViewModel?.id.toString() ?? ""
                            : controller.listAssociatedPm?[0]?.pmId
                                    .toString() ??
                                "";
                        String jobId = controller.listAssociatedJobs!.isEmpty
                            ? controller.jobModel?.id.toString() ?? ''
                            : controller.listAssociatedJobs![0]?.jobId
                                    .toString() ??
                                '';
                        var mcid;

                        controller.typee.value == 1
                            ? Get.offNamed('${Routes.jobDetails}/$jobId')
                            : controller.typee.value == 2
                                ? Get.offNamed('${Routes.pmTaskView}/$taskId')
                                : controller.typee.value == AppConstants.kAudit
                                    ? Get.offAllNamed(Routes.viewAuditTask,
                                        arguments: {'auditTaskId': taskId})
                                    : controller.typee.value == 4
                                        ? Get.offAllNamed(
                                            Routes
                                                .addModuleCleaningExecutionContentWeb,
                                            arguments: {
                                                'mcid': mcid
                                              })
                                        : controller.typee.value == 5
                                            ? Get.offAllNamed(
                                                '${Routes.vegExecutionScreen}/${controller.vegExecutionDetailsModel?.executionId}/${controller.vegExecutionDetailsModel?.planId}')
                                            : Get.offNamed(
                                                Routes.newPermitList);
                      },
                      child: controller.typee.value == 1
                          ? Text(
                              "/ JOB",
                              style: Styles.greyLight14,
                            )
                          : controller.typee.value == 2
                              ? Text(
                                  "/ PM TASK",
                                  style: Styles.greyLight14,
                                )
                              : controller.typee.value == AppConstants.kAudit
                                  ? Text(
                                      "/ AUDIT TASK ",
                                      style: Styles.greyLight14,
                                    )
                                  : controller.typee.value == 4
                                      ? Text(
                                          "/ MC TASK ",
                                          style: Styles.greyLight14,
                                        )
                                      : controller.typee.value == 5
                                          ? Text(
                                              "/ VEG TASK ",
                                              style: Styles.greyLight14,
                                            )
                                          : Text(
                                              "/ PERMIT LIST",
                                              style: Styles.greyLight14,
                                            )),
                  controller.newPermitDetailsModel.value?.permitNo == null
                      ? Text(
                          " / ADD NEW PERMIT",
                          style: Styles.greyLight14,
                        )
                      : controller.newPermitDetailsModel.value?.ptwStatus == 125
                          ? Text(
                              " / UPDATE TBT",
                              style: Styles.greyLight14,
                            )
                          : Text(
                              " / UPDATE PERMIT",
                              style: Styles.greyLight14,
                            ),
                  Spacer(),
                  controller.newPermitDetailsModel.value?.permitNo != null
                      ? Text(
                          "Permit Id: ${controller.newPermitDetailsModel.value?.permitNo}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      : Dimens.box0,
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: Get.width * 7,
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  // height: Get.height * 0.7,
                  child: Card(
                    color: ColorValues.cardColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                child: controller.typee.value == 2
                                    ? Text('REQUEST A PERMIT FOR PM',
                                        style: Styles.blackBold14)
                                    : controller.typee.value ==
                                            AppConstants.kAudit
                                        ? Text('REQUEST A PERMIT FOR AUDIT',
                                            style: Styles.blackBold14)
                                        : (controller.jobModel?.id != null)
                                            ? Text('REQUEST A PERMIT FOR JOB',
                                                style: Styles.blackBold14)
                                            : Text('REQUEST A PERMIT TO WORK',
                                                style: Styles.blackBold14),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: ColorValues.greyLightColour,
                        ),

                        controller.pmtaskViewModel?.id != null
                            ? Container(
                                width: Get.width * .9,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Task ID',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Plan Title',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Equipment Category',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Equipment Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Frequency',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Assigned To',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.type ==
                                                      AppConstants.kAudit
                                                  ? controller.viewAudDetails()
                                                  : controller.viewPMTDetails();
                                            },
                                            child: Text(
                                              controller.typee.value ==
                                                      AppConstants.kAudit
                                                  ? 'AUD${int.tryParse('${controller.pmtaskViewModel?.id ?? 0}')}'
                                                  : 'PMT${int.tryParse('${controller.pmtaskViewModel?.id ?? 0}')}',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Color.fromARGB(
                                                    255, 5, 92, 163),
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Plan Title
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${controller.pmtaskViewModel?.plan_title}',
                                          ),
                                        ),

                                        // Equipment Category
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            controller.typee.value ==
                                                    AppConstants.kAudit
                                                ? 'NA'
                                                : '${controller.pmtaskViewModel?.category_name}',
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Obx(() {
                                            final workingAreaList = controller
                                                    .pmtaskViewModel
                                                    ?.schedules ??
                                                [];

                                            // Show first 3 or all depending on the showMore state
                                            final visibleList =
                                                controller.showMore.value
                                                    ? controller.pmtaskViewModel
                                                        ?.schedules
                                                    : controller.pmtaskViewModel
                                                        ?.schedules!
                                                        .take(3)
                                                        .toList();

                                            // Use a Set to track unique checklist names
                                            final uniqueChecklistNames =
                                                <String>{};
                                            final filteredList =
                                                visibleList!.where((element) {
                                              // Add the checklist name to the Set, return true if it's new (i.e., not a duplicate)
                                              return uniqueChecklistNames
                                                  .add(element.name ?? '');
                                            }).toList();

                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ...filteredList
                                                    .map((element) => Text(
                                                          "${element.name}",
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                          maxLines: 2,
                                                        )),
                                              ],
                                            );
                                          }),
                                        ),
                                        // Checklist Name
                                        // Expanded(
                                        //   flex: 2,
                                        //   child: Text(
                                        //     '${controller.allChecklistNames}',
                                        //   ),
                                        // ),

                                        // Frequency
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            '${controller.pmtaskViewModel?.frequency_name}',
                                          ),
                                        ),

                                        // Assigned To
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${controller.pmtaskViewModel?.assigned_to_name}',
                                          ),
                                        ),
                                      ],
                                    ),
                                    if ((controller.pmtaskViewModel
                                                        ?.schedules ??
                                                    [])
                                                .length >
                                            3 ||
                                        (controller.pmtaskViewModel
                                                        ?.schedules ??
                                                    [])
                                                .length >
                                            3)
                                      Obx(() {
                                        return TextButton(
                                          onPressed: () {
                                            controller.toggleShowMore();
                                          },
                                          child: Text(
                                            controller.showMore.value
                                                ? 'Show less'
                                                : '... more',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        );
                                      }),
                                    // Obx(() {
                                    //   final checklistList = controller
                                    //           .pmtaskViewModel?.schedules ??
                                    //       [];
                                    //   final schedulesList = controller
                                    //           .pmtaskViewModel?.schedules ??
                                    //       [];

                                    //   if (checklistList.length > 3 ||
                                    //       schedulesList.length > 3) {
                                    //     return TextButton(
                                    //       onPressed: () {
                                    //         controller.toggleShowMore();
                                    //       },
                                    //       child: Text(
                                    //         controller.showMore.value
                                    //             ? 'Show less'
                                    //             : '... more',
                                    //         style:
                                    //             TextStyle(color: Colors.blue),
                                    //       ),
                                    //     );
                                    //   } else {
                                    //     return SizedBox.shrink();
                                    //   }
                                    // }),
                                  ],
                                ),
                              )
                            : controller.listAssociatedPm!.isEmpty
                                ? Dimens.box0
                                : Container(
                                    width: Get.width * .9,
                                    margin: Dimens.edgeInsets20,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: ColorValues.appBlueBackgroundColor,
                                      border: Border.all(
                                        color: ColorValues
                                            .lightGreyColorWithOpacity35,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.1), // Light shadow effect
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        // Header row
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  'Task ID',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Plan Title',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Equipment Category',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Equipment Name',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  'Start Date',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  'Assigned To',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                            color: ColorValues
                                                .lightGreyColorWithOpacity35), // Optional divider for visual separation
                                        SizedBox(height: 10),

                                        // Data rows
                                        Column(
                                          children: List.generate(
                                              controller.listAssociatedPm
                                                      ?.length ??
                                                  0, (index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Task ID
                                                  Expanded(
                                                    flex: 1,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        controller.type ==
                                                                AppConstants
                                                                    .kAudit
                                                            ? controller
                                                                .viewAudDetails()
                                                            : controller
                                                                .viewPMTDetails();
                                                      },
                                                      child: Text(
                                                        controller.typee
                                                                    .value ==
                                                                AppConstants
                                                                    .kAudit
                                                            ? 'AUD${int.tryParse('${controller.listAssociatedPm?[index]?.pmId ?? 0}')}'
                                                            : 'PMT${int.tryParse('${controller.listAssociatedPm?[index]?.pmId ?? 0}')}',
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163),
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  // Plan Title
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      '${controller.listAssociatedPm?[index]?.title}',
                                                    ),
                                                  ),

                                                  // Equipment Category
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      controller.type ==
                                                              AppConstants
                                                                  .kAudit
                                                          ? "NA"
                                                          : controller
                                                                  .listAssociatedPm?[
                                                                      index]
                                                                  ?.equipmentCat
                                                                  ?.toString() ??
                                                              '',
                                                    ),
                                                  ),

                                                  // Equipment Names (handling "show more/less")
                                                  Expanded(
                                                    flex: 2,
                                                    child: Obx(() {
                                                      final equipmentString =
                                                          controller
                                                                  .listAssociatedPm?[
                                                                      index]
                                                                  ?.equipment ??
                                                              '';
                                                      final equipmentList =
                                                          equipmentString
                                                              .split(',');

                                                      final equipmentToShow =
                                                          controller.showMore
                                                                  .value
                                                              ? equipmentList
                                                              : equipmentList
                                                                  .take(2)
                                                                  .toList();

                                                      return Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          for (var equipment
                                                              in equipmentToShow)
                                                            Text(equipment),
                                                          if (equipmentList
                                                                  .length >
                                                              2)
                                                            TextButton(
                                                              onPressed: () {
                                                                controller
                                                                    .toggleShowMore();
                                                              },
                                                              child: Text(
                                                                controller
                                                                        .showMore
                                                                        .value
                                                                    ? 'Show less'
                                                                    : 'Show more',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue),
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    }),
                                                  ),

                                                  // Start Date
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      controller
                                                              .listAssociatedPm?[
                                                                  index]
                                                              ?.startDate
                                                              ?.toString() ??
                                                          '',
                                                    ),
                                                  ),

                                                  // Assigned To
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      controller
                                                              .listAssociatedPm?[
                                                                  index]
                                                              ?.assignedTo
                                                              ?.toString() ??
                                                          '',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),

                        controller.jobModel?.id != null
                            ? Container(
                                width: Get.width * .9,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Header Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text('Job ID',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text('Job Title',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text('Equipment Category',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text('Block',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text('Equipment Name',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text('Breakdown Time',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text('Assigned To',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10), // For spacing

                                    // Data Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.viewJobDetails();
                                            },
                                            child: Text(
                                              '${int.tryParse('${controller.jobModel?.id ?? 0}')}',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Color.fromARGB(
                                                    255, 5, 92, 163),
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${controller.titleTextCtrlr.text}',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Obx(() {
                                            final equipmentCatList = controller
                                                    .jobModel
                                                    ?.equipmentCatList ??
                                                [];
                                            final visibleList =
                                                controller.showMore.value
                                                    ? equipmentCatList
                                                    : equipmentCatList
                                                        .take(3)
                                                        .toList();
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: visibleList
                                                  .map((element) => Text(
                                                        "${element?.name}",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ))
                                                  .toList(),
                                            );
                                          }),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${controller.selectedBlock}',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Obx(() {
                                            final workingAreaList = controller
                                                    .jobModel
                                                    ?.workingAreaList ??
                                                [];
                                            final visibleList =
                                                controller.showMore.value
                                                    ? workingAreaList
                                                    : workingAreaList
                                                        .take(3)
                                                        .toList();
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: visibleList
                                                  .map((element) => Text(
                                                        "${element?.name}",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ))
                                                  .toList(),
                                            );
                                          }),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${controller.jobModel?.breakdownTime}',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            '${controller.jobModel?.assignedName}',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),

                                    if ((controller.jobModel
                                                        ?.equipmentCatList ??
                                                    [])
                                                .length >
                                            3 ||
                                        (controller.jobModel?.workingAreaList ??
                                                    [])
                                                .length >
                                            3)
                                      Obx(() {
                                        return TextButton(
                                          onPressed: () {
                                            controller.toggleShowMore();
                                          },
                                          child: Text(
                                            controller.showMore.value
                                                ? 'Show less'
                                                : '... more',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        );
                                      }),
                                  ],
                                ),
                              )
                            : controller.listAssociatedJobs!.isEmpty
                                ? Dimens.box0
                                : Container(
                                    margin: Dimens.edgeInsets20,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: ColorValues.appBlueBackgroundColor,
                                      border: Border.all(
                                        color: ColorValues
                                            .lightGreyColorWithOpacity35,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.1), // Light shadow effect
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        // Header row title
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Jobs Linked To This Permit",
                                                style: Styles.blue700.copyWith(
                                                  fontSize:
                                                      18, // Adjust font size
                                                  fontWeight: FontWeight
                                                      .bold, // Bold title
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: ColorValues
                                              .lightGreyColorWithOpacity35, // Divider line
                                          thickness: 1,
                                        ),

                                        // Header Row with titles
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Job ID",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  "Job Title",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  "Equipment Category",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  "Equipment Name",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Breakdown Time",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Assigned To",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Status",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: ColorValues
                                              .lightGreyColorWithOpacity35, // Divider line
                                          thickness: 1,
                                        ),

                                        // Display job data dynamically using rows and columns
                                        Column(
                                          children: List.generate(
                                            controller.listAssociatedJobs
                                                    ?.length ??
                                                0,
                                            (index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Job ID with clickable functionality
                                                    Expanded(
                                                      flex: 1,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .viewJobDetails();
                                                        },
                                                        child: Text(
                                                          'JOB${controller.listAssociatedJobs?[index]?.jobId?.toString() ?? ''}',
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    5,
                                                                    92,
                                                                    163),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),

                                                    // Job Title
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        controller
                                                                .listAssociatedJobs?[
                                                                    index]
                                                                ?.title ??
                                                            '',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .normal, // Consistent font weight
                                                        ),
                                                      ),
                                                    ),

                                                    // Equipment Category
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        controller
                                                                .listAssociatedJobs?[
                                                                    index]
                                                                ?.equipmentCat ??
                                                            '',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),

                                                    // Equipment Names (with "show more/less" functionality)
                                                    Expanded(
                                                      flex: 2,
                                                      child: Obx(() {
                                                        final equipmentString =
                                                            controller
                                                                    .listAssociatedJobs?[
                                                                        index]
                                                                    ?.equipment ??
                                                                '';
                                                        final equipmentList =
                                                            equipmentString
                                                                .split(',');

                                                        final equipmentToShow =
                                                            controller.showMore
                                                                    .value
                                                                ? equipmentList
                                                                : equipmentList
                                                                    .take(2)
                                                                    .toList();

                                                        return Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // Display each equipment name
                                                            for (var equipment
                                                                in equipmentToShow)
                                                              Text(equipment),

                                                            // Show "Show more/less" button if more than 2 items exist
                                                            if (equipmentList
                                                                    .length >
                                                                2)
                                                              TextButton(
                                                                onPressed: () {
                                                                  controller
                                                                      .toggleShowMore();
                                                                },
                                                                child: Text(
                                                                  controller
                                                                          .showMore
                                                                          .value
                                                                      ? 'Show less'
                                                                      : 'Show more',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontSize:
                                                                        14, // Slightly smaller button text
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        );
                                                      }),
                                                    ),

                                                    // Breakdown Time
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        controller
                                                                .listAssociatedJobs?[
                                                                    index]
                                                                ?.breakdownTime
                                                                ?.toString() ??
                                                            '',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),

                                                    // Assigned To
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        controller
                                                                .listAssociatedJobs?[
                                                                    index]
                                                                ?.assignedTo ??
                                                            '',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),

                                                    // Status
                                                    Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        controller
                                                                .listAssociatedJobs?[
                                                                    index]
                                                                ?.status_short ??
                                                            '',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                        // hgvbjn,
                        controller.mcExecutionDetailsModel?.executionId != null
                            ? Container(
                                // alignment: Alignment.centerLeft,
                                width: Get.width * .8,
                                height: Get.height * .2,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 10),
                                padding: EdgeInsets.all(10),
                                // decoration: BoxDecoration(
                                //   border: Border.all(color: Colors.black),
                                // ),
                                child: DataTable2(
                                  minWidth: 1400,
                                  border: TableBorder.all(
                                    color: Colors.black,
                                  ),
                                  columnSpacing: 11,
                                  columns: [
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text('Task Id',
                                            overflow: TextOverflow.ellipsis)),
                                    DataColumn2(
                                        fixedWidth: 200,
                                        label: Text('Plan Title',
                                            overflow: TextOverflow.clip)),
                                    DataColumn2(
                                        fixedWidth: 150,
                                        label: Text('Frequency',
                                            overflow: TextOverflow.ellipsis)),
                                    DataColumn2(
                                        fixedWidth: 200,
                                        label: Text('Planned By',
                                            overflow: TextOverflow.ellipsis)),
                                    DataColumn2(
                                        fixedWidth: 200,
                                        label: Text('Start Date Time',
                                            overflow: TextOverflow.ellipsis)),
                                    DataColumn2(
                                        fixedWidth: 150,
                                        label: Text('Planning Date Time',
                                            overflow: TextOverflow.ellipsis)),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(
                                        GestureDetector(
                                          onTap: () {
                                            controller.viewMCTDetails();
                                          },
                                          child: Text(
                                              'MCT${int.tryParse('${controller.mcExecutionDetailsModel?.executionId ?? 0}')}',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationStyle:
                                                    TextDecorationStyle.solid,
                                                color: Color.fromARGB(
                                                    255, 5, 92, 163),
                                              ),
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          child: Text(
                                              '${controller.mcExecutionDetailsModel!.title ?? ""}',
                                              maxLines: 3),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          // width: Get.width * 0.2,
                                          child: Text(
                                              '${controller.mcExecutionDetailsModel!.frequency ?? ""}',
                                              maxLines: 3),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          child: Text(
                                              '${controller.mcExecutionDetailsModel!.plannedBy ?? ""}',
                                              maxLines: 3),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                            '${controller.mcExecutionDetailsModel!.startedAt ?? ""}',
                                            maxLines: 3),
                                      ),
                                      DataCell(
                                        Text(
                                            '${controller.mcExecutionDetailsModel!.plannedAt ?? ""}',
                                            maxLines: 3),
                                      ),
                                    ]),
                                  ],
                                ),
                              )
                            : controller.lstAssociatedMc!.isEmpty
                                ? Dimens.box0
                                : Container(
                                    margin: Dimens.edgeInsets20,
                                    height:
                                        ((controller.lstAssociatedMc?.length ??
                                                    0) *
                                                50) +
                                            125,
                                    // width: MediaQuery.of(context)
                                    //         .size
                                    //         .width /
                                    //     1.2,
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
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "MC Task Linked To This Permit",
                                                style: Styles.blue700,
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Divider(
                                        //   color: ColorValues.greyLightColour,
                                        // ),
                                        Expanded(
                                          child: DataTable2(
                                            border: TableBorder.all(
                                                color: Color.fromARGB(
                                                    255, 206, 229, 234)),
                                            columns: [
                                              DataColumn(
                                                label: Text(
                                                  "Task Id",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  "Task Title",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  "Equipment\nCategory",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  "Start Date",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  "Assigned To",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
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
                                              controller.lstAssociatedMc
                                                      ?.length ??
                                                  0,
                                              (index) => DataRow(
                                                cells: [
                                                  DataCell(
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .viewMCTDetails();
                                                      },
                                                      child: Text(
                                                          'MCT${int.tryParse('${controller.lstAssociatedMc?[index]?.executionId ?? 0}')}',
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            decorationStyle:
                                                                TextDecorationStyle
                                                                    .solid,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    5,
                                                                    92,
                                                                    163),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(controller
                                                            .lstAssociatedMc?[
                                                                index]
                                                            ?.title
                                                            .toString() ??
                                                        ''),
                                                  ),
                                                  DataCell(
                                                    Text(controller
                                                            .lstAssociatedMc?[
                                                                index]
                                                            ?.equipmentCat
                                                            .toString() ??
                                                        ''),
                                                  ),
                                                  DataCell(
                                                    Text(controller
                                                            .lstAssociatedMc?[
                                                                index]
                                                            ?.startDate
                                                            .toString() ??
                                                        ''),
                                                  ),
                                                  DataCell(
                                                    Text(controller
                                                            .lstAssociatedMc?[
                                                                index]
                                                            ?.assignedTo
                                                            .toString() ??
                                                        ''),
                                                  ),
                                                  DataCell(
                                                    Text(controller
                                                            .lstAssociatedMc?[
                                                                index]
                                                            ?.status_short
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

                        //Mc linked to this permit
                        controller.vegExecutionDetailsModel?.executionId != null
                            ? Container(
                                width: Get.width * .8,
                                height: Get.height * .2,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 9,
                                  vertical: 10,
                                ),
                                padding: EdgeInsets.all(10),
                                child: DataTable2(
                                  minWidth: 1400,
                                  border: TableBorder.all(
                                    color: Colors.black,
                                  ),
                                  columnSpacing: 11,
                                  columns: [
                                    DataColumn2(
                                        fixedWidth: 100,
                                        label: Text('Task Id',
                                            overflow: TextOverflow.ellipsis)),
                                    DataColumn2(
                                        fixedWidth: 200,
                                        label: Text('Plan Title',
                                            overflow: TextOverflow.clip)),
                                    DataColumn2(
                                        fixedWidth: 150,
                                        label: Text('Frequency',
                                            overflow: TextOverflow.ellipsis)),
                                    DataColumn2(
                                        fixedWidth: 200,
                                        label: Text('Planned By',
                                            overflow: TextOverflow.ellipsis)),
                                    DataColumn2(
                                        fixedWidth: 200,
                                        label: Text('Start Date Time',
                                            overflow: TextOverflow.ellipsis)),
                                    DataColumn2(
                                        fixedWidth: 150,
                                        label: Text('Planning Date Time',
                                            overflow: TextOverflow.ellipsis)),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(
                                        InkWell(
                                          onTap: () {
                                            // controller.viewMCTDetails();
                                          },
                                          child: Text(
                                              'VET${int.tryParse('${controller.vegExecutionDetailsModel?.executionId ?? 0}')}',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationStyle:
                                                    TextDecorationStyle.solid,
                                                color: Color.fromARGB(
                                                    255, 5, 92, 163),
                                              ),
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          child: Text(
                                              '${controller.vegExecutionDetailsModel!.title ?? ""}',
                                              maxLines: 3),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          // width: Get.width * 0.2,
                                          child: Text(
                                              '${controller.vegExecutionDetailsModel!.frequency ?? ""}',
                                              maxLines: 3),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          child: Text(
                                              '${controller.vegExecutionDetailsModel!.plannedBy ?? ""}',
                                              maxLines: 3),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                            '${controller.vegExecutionDetailsModel!.scheduledDate ?? ""}',
                                            maxLines: 3),
                                      ),
                                      DataCell(
                                        Text(
                                            '${controller.vegExecutionDetailsModel!.plannedAt ?? ""}',
                                            maxLines: 3),
                                      ),
                                    ]),
                                  ],
                                ),
                              )
                            : controller.lstAssociatedVc!.isEmpty
                                ? Dimens.box0
                                : Container(
                                    margin: Dimens.edgeInsets20,
                                    height:
                                        ((controller.lstAssociatedVc?.length ??
                                                    0) *
                                                50) +
                                            125,
                                    // width: MediaQuery.of(context)
                                    //         .size
                                    //         .width /
                                    //     1.2,
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
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "VEG Task Linked To This Permit",
                                                style: Styles.blue700,
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Divider(
                                        //   color: ColorValues.greyLightColour,
                                        // ),
                                        Expanded(
                                          child: DataTable2(
                                            border: TableBorder.all(
                                                color: Color.fromARGB(
                                                    255, 206, 229, 234)),
                                            columns: [
                                              DataColumn(
                                                label: Text(
                                                  "Task Id",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  "Task Title",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  "Equipment\nCategory",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  "Start Date",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  "Assigned To",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
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
                                              controller.lstAssociatedVc
                                                      ?.length ??
                                                  0,
                                              (index) => DataRow(
                                                cells: [
                                                  DataCell(
                                                    GestureDetector(
                                                      onTap: () {
                                                        // controller
                                                        // .clearStoreDataPMtaskId();
                                                        Get.offAllNamed(
                                                            '${Routes.vegExecutionScreen}/${controller.vegExecutionDetailsModel?.executionId}/${controller.vegExecutionDetailsModel?.planId}');
                                                      },
                                                      child: Text(
                                                        'VET${int.tryParse('${controller.lstAssociatedVc?[index]?.executionId ?? 0}')}',
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
                                                    Text(controller
                                                            .lstAssociatedVc?[
                                                                index]
                                                            ?.title
                                                            .toString() ??
                                                        ''),
                                                  ),
                                                  DataCell(
                                                    Text(controller
                                                            .lstAssociatedVc?[
                                                                index]
                                                            ?.equipmentCat
                                                            .toString() ??
                                                        ''),
                                                  ),
                                                  DataCell(
                                                    Text(controller
                                                            .lstAssociatedVc?[
                                                                index]
                                                            ?.startDate
                                                            .toString() ??
                                                        ''),
                                                  ),
                                                  DataCell(
                                                    Text(controller
                                                            .lstAssociatedVc?[
                                                                index]
                                                            ?.assignedTo
                                                            .toString() ??
                                                        ''),
                                                  ),
                                                  DataCell(
                                                    Text(controller
                                                            .lstAssociatedVc?[
                                                                index]
                                                            ?.status_short
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

                        IgnorePointer(
                          ignoring: controller
                                      .newPermitDetailsModel.value?.ptwStatus ==
                                  125
                              ? true
                              : false,
                          child: Column(
                            children: [
                              Container(
                                // height: Get.height,
                                margin: EdgeInsets.only(right: 30, left: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Dimens.boxWidth15,
                                                  CustomRichText(
                                                      title: 'Block/Plot: '),
                                                  Dimens.boxWidth5,
                                                  IgnorePointer(
                                                    ignoring: controller
                                                                .jobModel?.id !=
                                                            null
                                                        ? true
                                                        : false,
                                                    child: SizedBox(
                                                      width: Get.width * .2,
                                                      child: Obx(
                                                        () => DropdownWebWidget(
                                                          dropdownList:
                                                              controller
                                                                  .blockList,
                                                          isValueSelected:
                                                              controller
                                                                  .isBlockSelected
                                                                  .value,
                                                          selectedValue:
                                                              controller
                                                                  .selectedBlock
                                                                  .value,
                                                          onValueChanged:
                                                              controller
                                                                  .onValueChanged,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              // Spacer(),
                                              Row(
                                                children: [
                                                  Dimens.boxWidth15,
                                                  CustomRichText(
                                                      title:
                                                          'Type of permit: '),
                                                  Dimens.boxWidth5,
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    child: Obx(
                                                      () => DropdownWebWidget(
                                                        dropdownList: controller
                                                            .typePermitList,
                                                        isValueSelected: controller
                                                            .isTypePermitSelected
                                                            .value,
                                                        selectedValue: controller
                                                            .selectedTypePermit
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              Row(
                                                children: [
                                                  Dimens.boxWidth10,
                                                  CustomRichText(
                                                      title:
                                                          'Start Date & Time: '),
                                                  Dimens.boxWidth5,
                                                  _buildStartValidTillDateField_web(
                                                    context,
                                                    0,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Column(
                                                children: [
                                                  controller.typee != 3
                                                      ? Row(
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Equipment Categories: '),
                                                            Dimens.boxWidth5,
                                                            controller.pmtaskViewModel
                                                                            ?.id !=
                                                                        null ||
                                                                    controller
                                                                            .jobModel
                                                                            ?.id !=
                                                                        null
                                                                ? IgnorePointer(
                                                                    child:
                                                                        SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      child:
                                                                          CustomMultiSelectDialogField(
                                                                        title:
                                                                            'Select Equipment Category',
                                                                        // buttonText:
                                                                        //     'Equipment Category',
                                                                        initialValue: ((controller.selectedEquipmentCategoryIdList.isNotEmpty)
                                                                            ? controller.selectedEquipmentCategoryIdList
                                                                            : []),
                                                                        items: controller
                                                                            .equipmentCategoryList
                                                                            .map(
                                                                              (equipmentCategory) => MultiSelectItem(
                                                                                equipmentCategory?.id,
                                                                                equipmentCategory?.name ?? '',
                                                                              ),
                                                                            )
                                                                            .toList(),
                                                                        onConfirm:
                                                                            (selectedOptionsList) =>
                                                                                {
                                                                          controller
                                                                              .equipmentCategoriesSelected(selectedOptionsList),
                                                                          print(
                                                                              'Equipment list ${controller.selectedEquipmentCategoryIdList}')
                                                                        },
                                                                      ),
                                                                    ),
                                                                  )
                                                                : SizedBox(
                                                                    width:
                                                                        Get.width *
                                                                            .2,
                                                                    child: Obx(
                                                                      () {
                                                                        if (controller
                                                                            .equipmentCategoryList
                                                                            .isEmpty) {
                                                                          return CustomMultiSelectDialogField(
                                                                            onConfirm:
                                                                                (selectedOptionsList) {},
                                                                            buttonText:
                                                                                "",
                                                                            initialValue: [],
                                                                            items: [],
                                                                            title:
                                                                                "",
                                                                          );
                                                                        }

                                                                        final initialValue = controller.typee == 4 || controller.typee == 5
                                                                            ? controller.equipmentCategoryList?.where((category) => category?.name == 'Inverter')?.map((category) => category?.id)?.toList() ??
                                                                                []
                                                                            : (controller.selectedEquipmentCategoryIdList.isNotEmpty
                                                                                ? controller.selectedEquipmentCategoryIdList
                                                                                : []);

                                                                        print(
                                                                            'Initial Value: $initialValue');

                                                                        return IgnorePointer(
                                                                          ignoring: controller.lstAssociatedMc?.length != 0 ||
                                                                              controller.lstAssociatedVc?.length != 0 ||
                                                                              controller.typee == 4 ||
                                                                              controller.typee == 5,
                                                                          child:
                                                                              CustomMultiSelectDialogField(
                                                                            title:
                                                                                'Please Select',
                                                                            buttonText:
                                                                                'Equipment Category',
                                                                            initialValue:
                                                                                initialValue,
                                                                            items: controller.equipmentCategoryList
                                                                                    ?.map(
                                                                                      (equipmentCategory) => MultiSelectItem(
                                                                                        equipmentCategory!.id,
                                                                                        equipmentCategory.name,
                                                                                      ),
                                                                                    )
                                                                                    ?.toList() ??
                                                                                [],
                                                                            onConfirm:
                                                                                (selectedOptionsList) {
                                                                              controller.equipmentCategoriesSelected(selectedOptionsList);
                                                                              print('Selected Equipment Categories: $selectedOptionsList');
                                                                              print('Updated Selected Categories in Controller: ${controller.selectedEquipmentCategoryIdList}');
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                          ],
                                                        )
                                                      : Dimens.box0,
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              // Row(
                                              //   children: [
                                              //     CustomRichText(
                                              //         title: 'Equipment Name: '),
                                              //     Dimens.boxWidth10,
                                              //     controller.permitId.value > 0
                                              //         ? SizedBox(
                                              //             width: 250,
                                              //             height: 50,
                                              //             child:
                                              //                 CustomMultiSelectDialogField(
                                              //               // buttonText:
                                              //               //     'Select Equipment Name',
                                              //               title: 'Equipment Name',
                                              //               initialValue: (controller
                                              //                       .selectedEquipmentNameList
                                              //                       .isNotEmpty)
                                              //                   ? controller
                                              //                       .selectedEquipmentNameIdList
                                              //                   : [],
                                              //               items: controller
                                              //                   .equipmentNameList
                                              //                   .map(
                                              //                     (equipmentName) =>
                                              //                         MultiSelectItem(
                                              //                       equipmentName
                                              //                           ?.id,
                                              //                       equipmentName
                                              //                               ?.name ??
                                              //                           '',
                                              //                     ),
                                              //                   )
                                              //                   .toList(),
                                              //               onConfirm:
                                              //                   (selectedOptionsList) =>
                                              //                       {
                                              //                 controller
                                              //                     .equipmentNameSelected(
                                              //                         selectedOptionsList),
                                              //                 print(
                                              //                     'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                                              //               },
                                              //             ),
                                              //           )
                                              //         : SizedBox(
                                              //             width: Get.width * .2,
                                              //             child:
                                              //                 CustomMultiSelectDialogField(
                                              //               buttonText:
                                              //                   'Select Equipment Name',
                                              //               title: 'Please Select',
                                              //               initialValue: (controller
                                              //                       .selectedEquipmentNameList
                                              //                       .isNotEmpty)
                                              //                   ? controller
                                              //                       .selectedEquipmentNameIdList
                                              //                   : [],
                                              //               items: controller
                                              //                   .equipmentNameList
                                              //                   .map(
                                              //                     (equipmentName) =>
                                              //                         MultiSelectItem(
                                              //                       equipmentName
                                              //                           ?.id,
                                              //                       equipmentName
                                              //                               ?.name ??
                                              //                           '',
                                              //                     ),
                                              //                   )
                                              //                   .toList(),
                                              //               onConfirm:
                                              //                   (selectedOptionsList) =>
                                              //                       {
                                              //                 controller
                                              //                         .equipmentNameSelected(
                                              //                         selectedOptionsList),
                                              //                 print(
                                              //                     'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                                              //               },
                                              //             ),
                                              //           ),
                                              //   ],
                                              // ),

                                              // Dimens.boxHeight10,
                                              // Spacer(),
                                              IgnorePointer(
                                                child: Row(
                                                  children: [
                                                    CustomRichText(
                                                        title:
                                                            'Expiry Date & Time: '),
                                                    Dimens.boxWidth5,
                                                    _buildStartValidTillDateField_web(
                                                        context, 1),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Dimens.boxHeight10,
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 55, right: 30),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title:
                                                      'Permit Description: '),
                                              Expanded(
                                                child:
                                                    _buildPermitDescriptionField_web(
                                                        context),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title:
                                                      'Electrical Isolation Required ',
                                                  includeAsterisk: false),
                                              Switch(
                                                value: _controller
                                                    .isToggleOn.value,
                                                onChanged: (value) {
                                                  _controller.toggle();
                                                },
                                                activeColor: Colors.white,
                                                activeTrackColor: Colors.green,
                                                inactiveThumbColor:
                                                    Colors.white,
                                                inactiveTrackColor: Colors.red,
                                              )
                                            ],
                                          ),
                                          Dimens.boxHeight10,
                                          controller.isToggleOn == true
                                              ? Row(
                                                  children: [
                                                    CustomRichText(
                                                        title:
                                                            'Equipment Isolation '),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      child:
                                                          CustomMultiSelectDialogField(
                                                        buttonText:
                                                            'Select Equipment Isolation',
                                                        title:
                                                            'Equipment Isolation',
                                                        initialValue: (controller
                                                                .selectedEquipmentIsolationIdList
                                                                .isNotEmpty)
                                                            ? controller
                                                                .selectedEquipmentIsolationIdList
                                                            : [],
                                                        items: controller
                                                            .equipmentIsolationList
                                                            .map(
                                                              (equipmentIsolation) =>
                                                                  MultiSelectItem(
                                                                equipmentIsolation
                                                                    ?.id,
                                                                equipmentIsolation
                                                                        ?.name ??
                                                                    '',
                                                              ),
                                                            )
                                                            .toList(),
                                                        onConfirm:
                                                            (selectedOptionsList) {
                                                          controller
                                                              .equipmentIsolationSelected(
                                                                  selectedOptionsList);
                                                          print(
                                                              'Equipment Isolation list5: ${controller.equipmentIsolationList}');
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Center(
                                                  child: Text(
                                                      'No Isolation Equipment'),
                                                ),
                                        ],
                                      ),
                                    ),
                                    Dimens.boxHeight10,
                                    controller.isToggleOn == true
                                        // loto apply
                                        ? Center(
                                            child: SizedBox(
                                              // height: ((controller
                                              //             .filteredEquipmentNameList
                                              //             .length) *
                                              //         30) +
                                              //     200,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2,
                                              child: Center(
                                                child: Container(
                                                  // margin: Dimens.edgeInsets16,
                                                  // height: Get.height,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(.3)),
                                                  ),
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1400,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      CustomAppBar(
                                                        title:
                                                            'LOTO Equipment List'
                                                                .tr,
                                                        action: Row(
                                                          children: [
                                                            // CustomRichText(
                                                            //     title:
                                                            //         "Add new"),
                                                            // Dimens.boxWidth10,
                                                            // SizedBox(
                                                            //   width: 250,
                                                            //   height: 50,
                                                            //   child:
                                                            //       CustomMultiSelectDialogField(
                                                            //     buttonText:
                                                            //         'Select Equipment Name',
                                                            //     title:
                                                            //         'Equipment Name',
                                                            //     initialValue: (controller
                                                            //             .selectedEquipmentNameList
                                                            //             .isNotEmpty)
                                                            //         ? controller
                                                            //             .selectedEquipmentNameIdList
                                                            //         : [],
                                                            //     items: controller
                                                            //         .equipmentNameList
                                                            //         .map(
                                                            //           (equipmentName) =>
                                                            //               MultiSelectItem(
                                                            //             equipmentName
                                                            //                 ?.id,
                                                            //             equipmentName?.name ??
                                                            //                 '',
                                                            //           ),
                                                            //         )
                                                            //         .toList(),
                                                            //     onConfirm:
                                                            //         (selectedOptionsList) =>
                                                            //             {
                                                            //       controller
                                                            //           .equipmentNameSelected(
                                                            //               selectedOptionsList),
                                                            //       print(
                                                            //           'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                                                            //     },
                                                            //   ),
                                                            // )
                                                            ActionButton(
                                                                label:
                                                                    'Add New',
                                                                icon: Icons.add,
                                                                onPressed: () {
                                                                  // showEquipmentNameAlertBox();
                                                                  Get.dialog<
                                                                          void>(
                                                                      showEquipmentNameAlertBox());
                                                                },
                                                                color: ColorValues
                                                                    .appGreenColor),
                                                          ],
                                                        ),
                                                      ),
                                                      Dimens.boxHeight10,
                                                      // Wrap(
                                                      //   children: [
                                                      Wrap(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              SingleChildScrollView(
                                                                child: SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      2,
                                                                  child:
                                                                      Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                            minHeight:
                                                                                110),
                                                                    // height: ((controller
                                                                    //         .filteredEquipmentNameList
                                                                    //         .length) *
                                                                    //     60),
                                                                    // 90,
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          DataTable(
                                                                        columns: [
                                                                          DataColumn(
                                                                            label:
                                                                                Text("LOTO Applied On"),
                                                                          ),
                                                                          DataColumn(
                                                                            label:
                                                                                Text("Serial Number"),
                                                                          ),
                                                                          DataColumn(
                                                                            label:
                                                                                Text("Action"),
                                                                          ),
                                                                        ],
                                                                        rows: List<
                                                                            DataRow>.generate(
                                                                          controller
                                                                              .filteredEquipmentNameList
                                                                              .length,
                                                                          (index) {
                                                                            var inventoryEquipmentName =
                                                                                controller.filteredEquipmentNameList[index];
                                                                            controller.id.value =
                                                                                inventoryEquipmentName?.id ?? 0;
                                                                            print('Equipment Isss5:${controller.id.value}');
                                                                            return DataRow(
                                                                              cells: [
                                                                                DataCell(
                                                                                  Text('${inventoryEquipmentName?.name ?? ''}'),
                                                                                ),
                                                                                DataCell(
                                                                                  Text('${inventoryEquipmentName?.serialNumber ?? ''}'),
                                                                                ),
                                                                                DataCell(
                                                                                  Wrap(
                                                                                    children: [
                                                                                      TableActionButton(
                                                                                        color: Colors.red,
                                                                                        icon: Icons.delete_outline,
                                                                                        message: 'Remove',
                                                                                        onPress: () {
                                                                                          controller.removeItem(index);
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              // SizedBox(
                                                              //   width:
                                                              //       MediaQuery.of(context).size.width / 1.2,
                                                              //   child:
                                                              //       Divider(
                                                              //     thickness:
                                                              //         2,
                                                              //   ),
                                                              // ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Center(
                                            child: Text('Nothing to show !!'),
                                          ),
                                    Dimens.boxHeight10,
                                    controller.safetyMeasureList.isEmpty
                                        // ||  controller
                                        // .safetyList!
                                        // .isEmpty

                                        ? Dimens.box0
                                        : Center(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2,
                                              margin: EdgeInsets.all(16),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    CustomAppBar(
                                                        title:
                                                            'Permit Type Checklist'
                                                                .tr),
                                                    Dimens.boxHeight10,
                                                    controller.safetyMeasureList
                                                                .length >
                                                            0
                                                        ? GetBuilder<
                                                                NewPermitController>(
                                                            init: controller,
                                                            builder: (ctrl) {
                                                              return Column(
                                                                children: controller
                                                                    .safetyMeasureList
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
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            checkBoxMethod(element.isChecked ?? false,
                                                                                (value) {
                                                                              element.isChecked = value ?? false;

                                                                              controller.update();
                                                                            }),
                                                                            Dimens.boxWidth2,
                                                                            Text("${element.name}"),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                }).toList(),
                                                              );
                                                            })
                                                        : Dimens.box0,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                    Dimens.boxHeight10
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  margin: EdgeInsets.all(16),
                                  // margin: Dimens
                                  //     .edgeInsets16,
                                  // height: Get.height,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(.3)),
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth: 1280,
                                  ),
                                  child: Column(
                                    children: [
                                      CustomAppBar(
                                        title: 'SOP'.tr,
                                      ),
                                      Dimens.boxHeight10,
                                      Wrap(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text('JOB Type: '),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    child: Obx(
                                                      () => DropdownWebWidget(
                                                        dropdownList: controller
                                                            .jobTypeList,
                                                        isValueSelected: controller
                                                            .isJobTypeListSelected
                                                            .value,
                                                        selectedValue:
                                                            controller
                                                                .selectedJobType
                                                                .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),

                                                    // LoginCustomTextfield(),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text('SOP: '),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    child: Obx(
                                                      () => DropdownWebWidget(
                                                        dropdownList: controller
                                                            .sopPermitList,
                                                        isValueSelected: controller
                                                            .isSopPermitListSelected
                                                            .value,
                                                        selectedValue: controller
                                                            .selectedSopPermit
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                    // LoginCustomTextfield(),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        height: 30,
                                                        child:
                                                            CustomElevatedButton(
                                                          backgroundColor:
                                                              ColorValues
                                                                  .navyBlueColor,
                                                          text: "Create JSA",
                                                          onPressed: () {
                                                            // controller.createNewPermit();
                                                            Get.dialog<void>(
                                                                ViewJSADialog());
                                                          },
                                                        )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      child:
                                                          CustomElevatedButton(
                                                        backgroundColor:
                                                            ColorValues
                                                                .navyBlueColor,
                                                        text: "View SOP",
                                                        onPressed: () {
                                                          Get.dialog<void>(
                                                              ViewSOPDialog());
                                                          // controller.createNewPermit();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 22,
                                              ),
                                              controller.permitId.value > 0 &&
                                                      controller
                                                              .newPermitDetailsModel
                                                              .value
                                                              ?.ptwStatus ==
                                                          125
                                                  ? Dimens.box0
                                                  : Container(
                                                      height: Get.height * 0.2,
                                                      width: Get.width,
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child:
                                                                FileUploadWidgetWithDropzone(),
                                                          ),
                                                          Dimens.boxWidth5,
                                                          Expanded(
                                                            flex: 8,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 15),
                                                              child:
                                                                  FileUploadDetailsWidgetWeb2(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Dimens.boxHeight10,
                              controller.permitId.value > 0 &&
                                      controller.newPermitDetailsModel.value!
                                              .file_list!.length >
                                          0
                                  ? Center(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        height:
                                            ((controller.file_list!.length) *
                                                    41) +
                                                117,
                                        margin: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(.3)),
                                        ),
                                        constraints: BoxConstraints(
                                          maxWidth: 1280,
                                        ),
                                        child: Column(
                                          children: [
                                            CustomAppBar(
                                              title: 'Images Uploaded'.tr,
                                            ),
                                            Expanded(
                                              child: DataTable2(
                                                border: TableBorder.all(
                                                  color: Color.fromARGB(
                                                      255, 206, 229, 234),
                                                ),
                                                dataRowHeight: 40,
                                                columns: [
                                                  DataColumn(
                                                    label: Text(
                                                      "File Description",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                    label: Text(
                                                      "View Image",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                rows: List<DataRow>.generate(
                                                  controller
                                                          .file_list?.length ??
                                                      0,
                                                  (index) => DataRow(
                                                    cells: [
                                                      DataCell(Text(
                                                        controller
                                                                .file_list![
                                                                    index]
                                                                ?.description
                                                                .toString() ??
                                                            '',
                                                      )),
                                                      DataCell(
                                                        // Text("View Image"),
                                                        Wrap(
                                                          children: [
                                                            TableActionButton(
                                                              color: ColorValues
                                                                  .appDarkBlueColor,
                                                              icon: Icons
                                                                  .visibility,
                                                              message: 'view',
                                                              onPress:
                                                                  () async {
                                                                // String
                                                                //     baseUrl =
                                                                //     "http://65.0.20.19/CMMS_API/";
                                                                String baseUrl =
                                                                    UrlPath
                                                                        .deployUrl;
                                                                String
                                                                    fileName =
                                                                    controller
                                                                            .file_list![index]
                                                                            ?.fileName ??
                                                                        "";
                                                                String fullUrl =
                                                                    baseUrl +
                                                                        fileName;
                                                                if (await canLaunch(
                                                                    fullUrl)) {
                                                                  await launch(
                                                                      fullUrl);
                                                                } else {
                                                                  throw 'Could not launch $fullUrl';
                                                                }
                                                                // String baseUrl = UrlPath.deployUrl;
                                                              },
                                                            ),
                                                            controller
                                                                        .newPermitDetailsModel
                                                                        .value!
                                                                        .ptwStatus ==
                                                                    125
                                                                ? Dimens.box0
                                                                : TableActionButton(
                                                                    color: ColorValues
                                                                        .deleteColor,
                                                                    icon: Icons
                                                                        .delete_outline_outlined,
                                                                    message:
                                                                        'remove',
                                                                    onPress:
                                                                        () {
                                                                      controller.removeImage(
                                                                          controller
                                                                              .file_list![index]
                                                                              ?.id,
                                                                          index);
                                                                    },
                                                                  ),
                                                          ],
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
                                    )
                                  : Dimens.box0,
                            ],
                          ),
                        ),
                        Dimens.boxHeight10,
                        controller.newPermitDetailsModel.value?.ptwStatus ==
                                    125 &&
                                controller.newPermitDetailsModel.value
                                        ?.is_TBT_Expire ==
                                    true
                            ? Container(
                                decoration: BoxDecoration(
                                    color: ColorValues.appRedColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                height: 25,
                                child: Text(
                                  "  Your Time For TBT Taken Is Expire So Please Cancel The Permit  ",
                                ),
                              )
                            : Dimens.box0,
                        Dimens.boxHeight10,

                        controller.newPermitDetailsModel.value?.ptwStatus ==
                                    125 &&
                                controller.newPermitDetailsModel.value!
                                        .is_TBT_Expire ==
                                    false &&
                                controller.newPermitDetailsModel.value!
                                        .tbt_start ==
                                    1
                            ? Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  margin: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(.3)),
                                  ),
                                  child: Container(
                                    // color: ColorValues.appBlueBackgroundColor,
                                    // padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomAppBar(
                                          title:
                                              "Tool Box Talk (TBT) / PRE-JOB DISCUSSION",
                                        ),
                                        // Text(
                                        //   "Tool Box Talk (TBT) / PRE-JOB DISCUSSION",
                                        //   style: Styles.blue700,
                                        // ),
                                        Dimens.boxHeight10,
                                        Wrap(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            'Conducted At Job-Site By:',
                                                            style: Styles
                                                                .blackBold17,
                                                          ),
                                                          SizedBox(width: 5),
                                                          // Text(
                                                          //   'Ramesh Singh',
                                                          //   style: Styles.black17,
                                                          // ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                7,
                                                            child: Obx(
                                                              () =>
                                                                  DropdownWebWidget(
                                                                dropdownList:
                                                                    controller
                                                                        .employeeNameList,
                                                                isValueSelected:
                                                                    controller
                                                                        .isemployeeNameListSelected
                                                                        .value,
                                                                selectedValue:
                                                                    controller
                                                                        .selectedEmployeeNamesList
                                                                        .value,
                                                                onValueChanged:
                                                                    controller
                                                                        .onValueTbtConductedChanged,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Row(
                                                        // crossAxisAlignment:
                                                        //     CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            'Date & Time: ',
                                                            style: Styles
                                                                .blackBold17,
                                                          ),
                                                          _buildDateTimeField_web(
                                                              context),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                ///TBT Training Attended By
                                                // controller.permitId.value <=
                                                //         0
                                                //     ?
                                                Container(
                                                  margin: Dimens.edgeInsets20,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(.3)),
                                                  ),
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1100,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      CustomAppBar(
                                                        title:
                                                            'TBT Training Attended By'
                                                                .tr,
                                                        action: Row(
                                                          children: [
                                                            //   CustomRichText(
                                                            //       title:
                                                            //           "Add Employee"),
                                                            //   Dimens
                                                            //       .boxWidth10,
                                                            ActionButton(
                                                              color: ColorValues
                                                                  .appGreenColor,
                                                              label: "Add New",
                                                              icon: Icons.add,
                                                              onPressed: () {
                                                                Get.dialog<
                                                                    void>(
                                                                  AddEmployeeListAlertBox(),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Dimens.boxHeight10,
                                                      Wrap(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    2,
                                                                child:
                                                                    Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                          minHeight:
                                                                              90),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        DataTable(
                                                                      columns: [
                                                                        DataColumn(
                                                                            label:
                                                                                Text("Employee Name")),
                                                                        DataColumn(
                                                                            label:
                                                                                Text("Contact No")),
                                                                        DataColumn(
                                                                            label:
                                                                                Text("Designation")),
                                                                        DataColumn(
                                                                            label:
                                                                                Text("Action")),
                                                                      ],
                                                                      rows: List<
                                                                          DataRow>.generate(
                                                                        controller
                                                                            .filteredEmployeeNameList
                                                                            .length,
                                                                        (index) {
                                                                          var employeeNameDetails =
                                                                              controller.filteredEmployeeNameList[index];
                                                                          return DataRow(
                                                                              cells: [
                                                                                DataCell(Text('${employeeNameDetails?.name ?? ''}')),
                                                                                DataCell(Text('${employeeNameDetails?.mobileNumber ?? ''}')),
                                                                                DataCell(Text('${employeeNameDetails?.designation ?? 'NO Designation'}')),
                                                                                DataCell(
                                                                                  Wrap(
                                                                                    children: [
                                                                                      TableActionButton(
                                                                                        color: Colors.red,
                                                                                        icon: Icons.delete_outline,
                                                                                        message: 'Remove',
                                                                                        onPress: () {
                                                                                          // Call the removeItem method of the controller
                                                                                          _removeRow(index);
                                                                                          print("index");
                                                                                        },
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ]);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      child: Text(
                                                        'TBT Training Attended By Other Person',
                                                        style:
                                                            Styles.blackBold15,
                                                      ),
                                                    ),
                                                    Switch(
                                                      value: _controller
                                                          .isTBTTrainingAttendedByOtherPersonOn
                                                          .value,
                                                      onChanged: (value) {
                                                        _controller
                                                            .toggleTBTTrainingAttendedByOtherPersonOn();
                                                      },
                                                      activeColor: Colors.white,
                                                      activeTrackColor:
                                                          Colors.green,
                                                      inactiveThumbColor:
                                                          Colors.white,
                                                      inactiveTrackColor:
                                                          Colors.red,
                                                    )
                                                  ],
                                                ),
                                                Dimens.boxHeight10,
                                                controller.isTBTTrainingAttendedByOtherPersonOn ==
                                                        true
                                                    ? Container(
                                                        margin: EdgeInsets.only(
                                                            left: 50,
                                                            right: 50,
                                                            bottom: 20),
                                                        height: ((controller
                                                                    .rowTBTTrainingOtherPersonItem
                                                                    .value
                                                                    .length) *
                                                                70) +
                                                            140,
                                                        decoration:
                                                            BoxDecoration(
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
                                                              offset:
                                                                  Offset(0, 2),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                            children: [
                                                              // Column(
                                                              //     children: []..addAll(controller.rowTBTTrainingOtherPersonItem.value.map((e) {
                                                              //         return Text(jsonEncode(e));
                                                              //       }))),
                                                              // Text(jsonEncode(controller.dropdownMapperData)),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "TBT Training Attended By Other Person ",
                                                                      style: Styles
                                                                          .blue700,
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .addRowItem();
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            25,
                                                                        width:
                                                                            70,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              ColorValues.addNewColor,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                ColorValues.lightGreyColorWithOpacity35,
                                                                            width:
                                                                                1,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5)),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            " + Add ",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w100,
                                                                                color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    DataTable2(
                                                                  // minWidth: 1700,
                                                                  dataRowHeight:
                                                                      50,
                                                                  // columnSpacing: 10,
                                                                  border: TableBorder.all(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                                  columns: [
                                                                    DataColumn2(
                                                                        label:
                                                                            Text(
                                                                      "Employee Name",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                                    DataColumn2(
                                                                        label:
                                                                            Text(
                                                                      "Contact Number",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                                    DataColumn2(
                                                                        label:
                                                                            Text(
                                                                      "Designation",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                                    DataColumn2(
                                                                        fixedWidth:
                                                                            100,
                                                                        label:
                                                                            Text(
                                                                          "Action",
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.bold),
                                                                        )),
                                                                  ],
                                                                  rows: controller
                                                                      .rowTBTTrainingOtherPersonItem
                                                                      .value
                                                                      .map(
                                                                          (record) {
                                                                    return DataRow(
                                                                      // height: 130,
                                                                      cells: record
                                                                          .map(
                                                                              (mapData) {
                                                                        return DataCell(
                                                                          (mapData['key'] == "Employee Name") || (mapData['key'] == "Responsibility")
                                                                              ? Padding(
                                                                                  padding: EdgeInsets.only(top: 10),
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Container(
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
                                                                                            ],
                                                                                            color: ColorValues.whiteColor,
                                                                                            borderRadius: BorderRadius.circular(5),
                                                                                          ),
                                                                                          child: LoginCustomTextfield(
                                                                                            keyboardType: TextInputType.number,
                                                                                            maxLine: 1,
                                                                                            textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                            onChanged: (txt) {
                                                                                              mapData["value"] = txt;
                                                                                            },
                                                                                          )),
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              : (mapData['key'] == "Contact Number")
                                                                                  ? Padding(
                                                                                      padding: EdgeInsets.only(top: 10),
                                                                                      child: Column(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Container(
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
                                                                                                ],
                                                                                                color: ColorValues.whiteColor,
                                                                                                borderRadius: BorderRadius.circular(5),
                                                                                              ),
                                                                                              child: LoginCustomTextfield(
                                                                                                keyboardType: TextInputType.number,
                                                                                                maxLine: 1,
                                                                                                inputFormatters: <TextInputFormatter>[
                                                                                                  FilteringTextInputFormatter.digitsOnly
                                                                                                ],
                                                                                                textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                                onChanged: (txt) {
                                                                                                  mapData["value"] = txt;
                                                                                                },
                                                                                              )),
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                  : (mapData['key'] == "Action ")
                                                                                      ? Padding(
                                                                                          padding: EdgeInsets.only(top: 10),
                                                                                          child: Column(
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              TableActionButton(
                                                                                                color: ColorValues.appRedColor,
                                                                                                icon: Icons.delete,
                                                                                                label: '',
                                                                                                message: '',
                                                                                                onPress: () {
                                                                                                  controller.rowTBTTrainingOtherPersonItem.remove(record);
                                                                                                },
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        )
                                                                                      : Text(mapData['key'] ?? ''),
                                                                        );
                                                                      }).toList(),
                                                                    );
                                                                  }).toList(),
                                                                ),
                                                              ),
                                                            ]),
                                                      )
                                                    : Dimens.box0
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Dimens.box0,

                        controller.historyList!.isEmpty
                            ? Dimens.box0
                            : Container(
                                margin: Dimens.edgeInsets20,
                                height: ((controller.historyList?.length ?? 0) *
                                        50) +
                                    125,
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
                                            "Permit History ",
                                            style: Styles.blue700,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: ColorValues.greyLightColour,
                                    ),
                                    Expanded(
                                      child: DataTable2(
                                        border: TableBorder.all(
                                            color: Color.fromARGB(
                                                255, 206, 229, 234)),
                                        columns: [
                                          DataColumn(
                                              label: Text(
                                            "Time Stamp",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataColumn(
                                              label: Text(
                                            "Posted By",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataColumn(
                                              label: Text(
                                            "Comment",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataColumn(
                                              label: Text(
                                            "Status",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller.historyList?.length ?? 0,
                                          (index) => DataRow(cells: [
                                            DataCell(Text(controller
                                                    .historyList?[index]
                                                    ?.createdAt
                                                    ?.result
                                                    .toString() ??
                                                '')),
                                            DataCell(Text(controller
                                                    .historyList?[index]
                                                    ?.createdByName
                                                    .toString() ??
                                                '')),
                                            DataCell(Text(controller
                                                    .historyList?[index]
                                                    ?.comment
                                                    .toString() ??
                                                '')),
                                            DataCell(Text(controller
                                                    .historyList?[index]
                                                    ?.status_name
                                                    .toString() ??
                                                '')),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60, right: 60),
                            child: Row(
                              children: [
                                CustomRichText(title: 'Comments: '),
                                Expanded(
                                  child: _buildWorkPermitCommentTextField_web(
                                      context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Dimens.boxHeight20,
                        controller.mcExecutionDetailsModel?.id != null &&
                                controller.permitId.value == 0
                            ? Center(
                                child: Container(
                                    height: 45,
                                    child: CustomElevatedButton(
                                      backgroundColor:
                                          ColorValues.appGreenColor,
                                      text: "Submit",
                                      onPressed: () {
                                        controller.isFormInvalid.value = false;
                                        controller.checkForm() == true &&
                                                controller.isCheckedJSA.value ==
                                                    true &&
                                                controller.isCheckedSOP.value ==
                                                    true
                                            ? controller.createNewPermitForPm(
                                                pmTaskId:
                                                    controller.scheduleID.value,
                                                fileIds:
                                                    dropzoneController.fileIds)
                                            : controller.isCheckedJSA.value ==
                                                        true &&
                                                    controller.isCheckedSOP
                                                            .value ==
                                                        true
                                                ? print("condiation failed")
                                                : Get.dialog<void>(
                                                    checkboxAlertBox(),
                                                  );
                                        // var jobId = controller.jobModel?.id ?? 0;
                                        // print('JobId'),
                                        // controller.isFormInvalid.value =
                                        //     false;
                                        // controller.isCheckedJSA.value ==
                                        //             true &&
                                        //         controller
                                        //                 .isCheckedSOP.value ==
                                        //             true
                                        //     ? controller
                                        //         .createNewPermitForJob(
                                        //             jobId: controller
                                        //                 .jobModel?.id,
                                        //             fileIds:
                                        //                 dropzoneController
                                        //                     .fileIds)
                                        //     : Get.dialog<void>(
                                        //         checkboxAlertBox());
                                        // controller.linkToPermit(jobId: controller.jobModel?.id);
                                      },
                                    )),
                              )
                            : controller.vegExecutionDetailsModel
                                            ?.executionId !=
                                        null &&
                                    controller.permitId.value == 0
                                ? Center(
                                    child: Container(
                                        height: 45,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appGreenColor,
                                          text: "Submit",
                                          onPressed: () {
                                            controller.isFormInvalid.value =
                                                false;
                                            controller.checkForm() == true &&
                                                    controller.isCheckedJSA
                                                            .value ==
                                                        true &&
                                                    controller.isCheckedSOP
                                                            .value ==
                                                        true
                                                ? controller
                                                    .createNewPermitForPm(
                                                        pmTaskId: controller
                                                            .scheduleID.value,
                                                        fileIds:
                                                            dropzoneController
                                                                .fileIds)
                                                : controller.isCheckedJSA
                                                                .value ==
                                                            true &&
                                                        controller.isCheckedSOP
                                                                .value ==
                                                            true
                                                    ? print("condiation failed")
                                                    : Get.dialog<void>(
                                                        checkboxAlertBox(),
                                                      );
                                          },
                                        )),
                                  )
                                : controller.jobModel?.id != null &&
                                        controller.permitId.value == 0
                                    ? Center(
                                        child: Container(
                                            height: 45,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appGreenColor,
                                              text: "Submit For Approval",
                                              onPressed: () {
                                                controller.isFormInvalid.value =
                                                    false;
                                                controller
                                                                .checkForm() ==
                                                            true &&
                                                        controller.isCheckedJSA
                                                                .value ==
                                                            true &&
                                                        controller.isCheckedSOP
                                                                .value ==
                                                            true
                                                    ? controller
                                                        .createNewPermitForJob(
                                                            jobId: controller
                                                                .jobModel?.id,
                                                            fileIds:
                                                                dropzoneController
                                                                    .fileIds)
                                                    : controller.isCheckedJSA
                                                                    .value ==
                                                                true &&
                                                            controller
                                                                    .isCheckedSOP
                                                                    .value ==
                                                                true
                                                        ? print(
                                                            "condiation failed")
                                                        : Get.dialog<void>(
                                                            checkboxAlertBox(),
                                                          );
                                                // var jobId = controller.jobModel?.id ?? 0;
                                                // print('JobId'),
                                                // controller.isFormInvalid.value =
                                                //     false;
                                                // controller.isCheckedJSA.value ==
                                                //             true &&
                                                //         controller
                                                //                 .isCheckedSOP.value ==
                                                //             true
                                                //     ? controller
                                                //         .createNewPermitForJob(
                                                //             jobId: controller
                                                //                 .jobModel?.id,
                                                //             fileIds:
                                                //                 dropzoneController
                                                //                     .fileIds)
                                                //     : Get.dialog<void>(
                                                //         checkboxAlertBox());
                                                // controller.linkToPermit(jobId: controller.jobModel?.id);
                                              },
                                            )),
                                      )
                                    : controller.pmtaskViewModel?.id != null &&
                                            controller.permitId.value <= 0
                                        ? Center(
                                            child: Container(
                                                height: 45,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.appGreenColor,
                                                  text: "Submit For Approval ",
                                                  onPressed: () {
                                                    controller.isFormInvalid
                                                        .value = false;
                                                    controller.checkForm() == true &&
                                                            controller
                                                                    .isCheckedJSA
                                                                    .value ==
                                                                true &&
                                                            controller
                                                                    .isCheckedSOP
                                                                    .value ==
                                                                true
                                                        ? controller.createNewPermitForPm(
                                                            pmTaskId: controller
                                                                .pmtaskViewModel
                                                                ?.id,
                                                            activity: controller
                                                                .pmtaskViewModel
                                                                ?.plan_title,
                                                            fileIds:
                                                                dropzoneController
                                                                    .fileIds)
                                                        : controller.isCheckedJSA
                                                                        .value ==
                                                                    true &&
                                                                controller
                                                                        .isCheckedSOP
                                                                        .value ==
                                                                    true
                                                            ? print(
                                                                "condiation failed")
                                                            : Get.dialog<void>(
                                                                checkboxAlertBox(),
                                                              );
                                                    // var jobId = controller.jobModel?.id ?? 0;
                                                    // print('JobId'),
                                                    // controller.isFormInvalid.value =
                                                    //     false;
                                                    // controller.isCheckedJSA
                                                    //                 .value ==
                                                    //             true &&
                                                    //         controller.isCheckedSOP
                                                    //                 .value ==
                                                    //             true
                                                    //     ? controller
                                                    //         .createNewPermitForPm(
                                                    //             pmTaskId: controller
                                                    //                 .pmtaskViewModel
                                                    //                 ?.id,
                                                    //             activity:
                                                    //                 controller
                                                    //                     .pmtaskViewModel
                                                    //                     ?.plan_title,
                                                    //             fileIds:
                                                    //                 dropzoneController
                                                    //                     .fileIds)
                                                    //     : Get.dialog<void>(
                                                    //         checkboxAlertBox());
                                                    // controller.linkToPermit(jobId: controller.jobModel?.id);
                                                  },
                                                )),
                                          )
                                        : controller.permitId.value <= 0
                                            ? Center(
                                                child: Container(
                                                    height: 45,
                                                    child: CustomElevatedButton(
                                                        backgroundColor:
                                                            ColorValues
                                                                .appGreenColor,
                                                        text:
                                                            "Submit For Approval",
                                                        onPressed: () {
                                                          controller
                                                              .isFormInvalid
                                                              .value = false;
                                                          controller
                                                                          .checkForm() ==
                                                                      true &&
                                                                  controller
                                                                          .isCheckedJSA
                                                                          .value ==
                                                                      true &&
                                                                  controller
                                                                          .isCheckedSOP
                                                                          .value ==
                                                                      true
                                                              ? controller
                                                                  .createNewPermit(
                                                                      fileIds:
                                                                          dropzoneController
                                                                              .fileIds)
                                                              : controller.isCheckedJSA
                                                                              .value ==
                                                                          true &&
                                                                      controller
                                                                              .isCheckedSOP
                                                                              .value ==
                                                                          true
                                                                  ? print(
                                                                      "condiation failed")
                                                                  : Get.dialog<
                                                                      void>(
                                                                      checkboxAlertBox(),
                                                                    );
                                                        })),
                                              )
                                            : Row(
                                                children: [
                                                  Spacer(),
                                                  controller.newPermitDetailsModel
                                                              .value?.ptwStatus ==
                                                          121
                                                      ? Center(
                                                          child: Container(
                                                              height: 45,
                                                              child:
                                                                  CustomElevatedButton(
                                                                backgroundColor:
                                                                    ColorValues
                                                                        .appDarkBlueColor,
                                                                text: "Update",
                                                                onPressed: () {
                                                                  controller.updateNewPermit(
                                                                      fileIds:
                                                                          dropzoneController
                                                                              .fileIds);
                                                                },
                                                              )),
                                                        )
                                                      : Dimens.box0,
                                                  controller.newPermitDetailsModel.value
                                                                  ?.ptwStatus ==
                                                              125 &&
                                                          controller
                                                                  .newPermitDetailsModel
                                                                  .value
                                                                  ?.is_TBT_Expire ==
                                                              false &&
                                                          controller
                                                                  .newPermitDetailsModel
                                                                  .value
                                                                  ?.tbT_Done_Check ==
                                                              0
                                                      ? Center(
                                                          child: Container(
                                                            height: 45,
                                                            child:
                                                                CustomElevatedButton(
                                                              backgroundColor:
                                                                  ColorValues
                                                                      .appDarkBlueColor,
                                                              text:
                                                                  "Update TBT",
                                                              onPressed: () {
                                                                if (controller
                                                                            .tbtDateTimeCtrlrBuffer ==
                                                                        null ||
                                                                    controller
                                                                            .selectedTbtConductedId ==
                                                                        0 ||
                                                                    controller
                                                                        .tbtDateTimeCtrlrBuffer
                                                                        .isEmpty ||
                                                                    controller
                                                                            .tbtDateTimeCtrlrBuffer ==
                                                                        "") {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            "Select Time"),
                                                                        content: controller.selectedTbtConductedId ==
                                                                                0
                                                                            ? Text("Select TBT Conducted By")
                                                                            : Text("Can't do TBT without entering the time."),
                                                                        actions: <Widget>[
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                Text("OK"),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  return null;
                                                                } else if (controller
                                                                        .newPermitDetailsModel
                                                                        .value!
                                                                        .requester_id !=
                                                                    varUserAccessModel
                                                                        .value
                                                                        .user_id) {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            "Invalid User"),
                                                                        // content: Text("Please select a Start Date & Time in the future."),
                                                                        actions: <Widget>[
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                Text("OK"),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  controller.updateNewPermit(
                                                                      fileIds:
                                                                          dropzoneController
                                                                              .fileIds);
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        )
                                                      : Dimens.box0,
                                                  // Dimens.boxWidth20,
                                                  // controller.newPermitDetailsModel.value
                                                  //                 ?.ptwStatus ==
                                                  //             125 &&
                                                  //         controller
                                                  //                 .newPermitDetailsModel
                                                  //                 .value
                                                  //                 ?.is_TBT_Expire ==
                                                  //             true
                                                  //     ? Container(
                                                  //         height: 45,
                                                  //         child:
                                                  //             CustomElevatedButton(
                                                  //           backgroundColor:
                                                  //               ColorValues
                                                  //                   .appRedColor,
                                                  //           text:
                                                  //               "Cancel Permit",
                                                  //           icon: Icons.close,
                                                  //           onPressed: () {
                                                  //             Get.dialog(
                                                  //               PermitCancelReQuestDialog(
                                                  //                 permitId:
                                                  //                     '${controller.permitId.value}',
                                                  //                 // jobId: controller
                                                  //                 //         .jobModel!
                                                  //                 //         .id ??
                                                  //                 //     0,
                                                  //               ),
                                                  //             );
                                                  //             print(
                                                  //                 "Permit ID TO Cancel: ${controller.permitId.value}");
                                                  //             print(
                                                  //                 "JobId To cancel: ${controller.jobModel!.id}");
                                                  //           },
                                                  //         ))
                                                  //     : Dimens.box0,
                                                  Dimens.boxWidth20,
                                                  controller
                                                                  .newPermitDetailsModel.value?.ptwStatus ==
                                                              124 ||
                                                          controller
                                                                  .newPermitDetailsModel
                                                                  .value
                                                                  ?.ptwStatus ==
                                                              132 ||
                                                          controller
                                                                      .newPermitDetailsModel
                                                                      .value
                                                                      ?.ptwStatus ==
                                                                  126 &&
                                                              controller
                                                                      .newPermitDetailsModel
                                                                      .value
                                                                      ?.lstAssociatedPM![
                                                                          0]!
                                                                      .status ==
                                                                  163 ||
                                                          controller
                                                                      .newPermitDetailsModel
                                                                      .value
                                                                      ?.ptwStatus ==
                                                                  126 &&
                                                              controller
                                                                      .newPermitDetailsModel
                                                                      .value
                                                                      ?.lstAssociatedPM![
                                                                          0]!
                                                                      .status ==
                                                                  164
                                                      ? Center(
                                                          child: Container(
                                                            height: 45,
                                                            child:
                                                                CustomElevatedButton(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          116,
                                                                          78,
                                                                          130),
                                                              text:
                                                                  "Re submit Permit",
                                                              onPressed: () {
                                                                dynamic startDateTime = DateFormat(
                                                                        "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                                                                    .format(DateTime.parse(controller
                                                                        .startDateTimeCtrlr
                                                                        .text
                                                                        .trim()));
                                                                dynamic
                                                                    startDateTimeCtrlrBuffer1 =
                                                                    '${DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.parse('${controller.newPermitDetailsModel.value?.start_datetime}')).toString()}';

                                                                print({
                                                                  "startDateTimeCtrlr expir":
                                                                      startDateTime
                                                                });
                                                                print({
                                                                  "startDateTimeCtrlrBuffer expir":
                                                                      startDateTimeCtrlrBuffer1
                                                                });
                                                                if (controller.newPermitDetailsModel.value!.is_TBT_Expire ==
                                                                            true &&
                                                                        startDateTime ==
                                                                            startDateTimeCtrlrBuffer1 ||
                                                                    controller.newPermitDetailsModel.value!.ptwStatus ==
                                                                            132 &&
                                                                        controller.newPermitDetailsModel.value!.is_TBT_Expire ==
                                                                            true &&
                                                                        startDateTime ==
                                                                            startDateTimeCtrlrBuffer1) {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(15.0)),
                                                                        ),
                                                                        insetPadding:
                                                                            Dimens.edgeInsets00_04_04_04,
                                                                        contentPadding:
                                                                            EdgeInsets.zero,
                                                                        title:
                                                                            Text(
                                                                          'Alert',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                        content:
                                                                            Builder(builder:
                                                                                (context) {
                                                                          return Container(
                                                                            padding:
                                                                                Dimens.edgeInsets05_0_5_0,
                                                                            height:
                                                                                80,
                                                                            width:
                                                                                double.infinity,
                                                                            child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch, //
                                                                                children: [
                                                                                  Divider(
                                                                                    color: ColorValues.greyLightColour,
                                                                                    thickness: 1,
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Center(
                                                                                    child: Text(
                                                                                      'Need to change the start date and time before resubmision',
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                    ),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                ]),
                                                                          );
                                                                        }),
                                                                        actions: [
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center, //
                                                                              children: [
                                                                                ElevatedButton(
                                                                                  style: Styles.navyBlueElevatedButtonStyle,
                                                                                  onPressed: () {
                                                                                    Get.back();
                                                                                  },
                                                                                  child: const Text('ok'),
                                                                                ),
                                                                              ]),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                } else if (controller
                                                                        .newPermitDetailsModel
                                                                        .value!
                                                                        .requester_id ==
                                                                    varUserAccessModel
                                                                        .value
                                                                        .user_id) {
                                                                  controller.resubmitPermit(
                                                                      fileIds:
                                                                          dropzoneController
                                                                              .fileIds);
                                                                } else {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            "Invalid User"),
                                                                        // content: Text("Please select a Start Date & Time in the future."),
                                                                        actions: <Widget>[
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Get.back();
                                                                            },
                                                                            child:
                                                                                Text("OK"),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }

                                                                // DateTime
                                                                //     currentTime =
                                                                //     DateTime
                                                                //         .now();
                                                                // DateTime
                                                                //     selected =
                                                                //     DateTime.parse(
                                                                //         controller
                                                                //             .startDateTimeCtrlrBuffer);
                                                                // if (currentTime
                                                                //         .isAfter(
                                                                //             selected) ||
                                                                //     currentTime
                                                                //         .isAtSameMomentAs(
                                                                //             selected)) {
                                                                //   showDialog(
                                                                //     context:
                                                                //         context,
                                                                //     builder:
                                                                //         (BuildContext
                                                                //             context) {
                                                                //       return AlertDialog(
                                                                //         title:
                                                                //             Text("Invalid Start Date & Time"),
                                                                //         content:
                                                                //             Text("Please select a Start Date & Time in the future."),
                                                                //         actions: <Widget>[
                                                                //           TextButton(
                                                                //             onPressed: () {
                                                                //               Navigator.of(context).pop();
                                                                //             },
                                                                //             child: Text("OK"),
                                                                //           ),
                                                                //         ],
                                                                //       );
                                                                //     },
                                                                //   );
                                                                //   return null;
                                                                // } else {
                                                                //   controller.resubmitPermit(
                                                                //       fileIds:
                                                                //           dropzoneController.fileIds);
                                                                // }
                                                              },
                                                            ),
                                                          ),
                                                        )
                                                      : Dimens.box0,
                                                  Spacer(),
                                                ],
                                              ),
                        SizedBox(
                          height: 50,
                        ),
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

  Widget _buildStartValidTillDateField_web(
    BuildContext context,
    int position,
  ) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.050,
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
              ), //BoxShadow
            ],
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SizedBox(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 5
                : MediaQuery.of(context).size.width / 1.0,
            child: TextField(
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 16.0, height: 1.0, color: Colors.black),
                ),
                onTap: () {
                  position == 0
                      ? pickDateTime_web(context, 0)
                      : pickDateTime_web(context, 1);
                },
                controller: position == 0
                    ? controller.startDateTimeCtrlr
                    : controller.validTillTimeCtrlr,
                autofocus: false,
                decoration: InputDecoration(
                  fillColor: ColorValues.whiteColor,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: controller.isstartdateInvalid.value
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: ColorValues.redColorDark,
                          ),
                        )
                      : InputBorder.none,
                  errorBorder: controller.isstartdateInvalid.value
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: ColorValues.redColorDark,
                          ),
                        )
                      : null,
                  errorText: controller.isstartdateInvalid.value
                      ? "Required field"
                      : null,
                ),
                onChanged: (value) {
                  if (controller.startDateTimeCtrlr.text.trim() == '' &&
                      controller.validTillTimeCtrlr.text.trim() == '') {
                    controller.isstartdateInvalid.value = false;
                  } else {
                    controller.isstartdateInvalid.value = true;
                  }
                }),
          ),
        ),
        Dimens.boxHeight20,
      ],
    );
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

    final time = await pickTime_web(context, position, date);
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
    if (controller.startDateTimeCtrlrBuffer != null) {
      controller.isstartdateInvalid.value = false;
    }
  }

  Future<DateTime?> pickDate_web(BuildContext context, int position) async {
    DateTime? dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    // final currentDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    print('New Date hai: $newDate');
    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTime_web(
      BuildContext context, int position, DateTime? selectedDate) async {
    DateTime dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    print('New Date new time : $newTime');
    if (newTime == null) {
      return null;
    }

    final currentTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      TimeOfDay.now().hour,
      TimeOfDay.now().minute,
    );
    final selected = DateTime(
      selectedDate?.year ?? DateTime.now().year,
      selectedDate?.month ?? DateTime.now().month,
      selectedDate?.day ?? DateTime.now().day,
      newTime.hour,
      newTime.minute,
    );

    // If date is today and time is in the past, show an error message
    print('seklected time : $selected');
    if (currentTime.isAfter(selected)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Time"),
            content: Text("Please select a time in the future."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return null;
    }

    return newTime;
  }

  Widget _buildPermitDescriptionField_web(BuildContext context) {
    return Column(//
        children: [
      Obx(
        () => Container(
          margin: EdgeInsets.only(left: 5, right: 18),
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
            width: MediaQuery.of(context).size.width / 1,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              controller: controller.permitDescriptionCtrlr,
              focusNode: controller.descFocus,
              scrollController: controller.descScroll,
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
                if (value.trim().length > 1) {
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

  Widget _buildDateTimeField_web(
    BuildContext context,
  ) {
    return Column(//
        children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
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
            width: MediaQuery.of(context).size.width / 7,
            height: 30,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onTap: () {
                pickDateTimeTBT_web(context);
              },
              controller: controller.dateTimeCtrlr,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                // hintText: controller.selectedDateTime.value.toString(),
                // hintText: DateFormat('yyyy-MM-dd HH:mm')
                //     .format(controller.selectedDateTime.value),
                hintStyle: TextStyle(
                  // You can apply any TextStyle properties herex
                  color: Colors.black,
                  // fontWeight: FontWeight.bold
                ),
                contentPadding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 5.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ),
    ]);
  }

//Start Date and valid Till
  Future pickDateTimeTBT_web(BuildContext context) async {
    var dateTime = controller.selectedDateTime.value;
    final date = await pickDateTBT_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTimeTBT_web(context);
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

    controller.dateTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime);
    controller.tbtDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print('TBT DateTime:${controller.dateTimeCtrlr.text}');
  }

  Future<DateTime?> pickDateTBT_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedDateTime.value;
    //final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: dateTime,
      lastDate: dateTime,
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay?> pickTimeTBT_web(BuildContext context) async {
    DateTime startTime = DateTime.parse(controller.startDateTimeCtrlr.text);
    DateTime tbtTime = startTime.add(Duration(hours: 1));
    DateTime dateTime = controller.selectedDateTime.value;
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

    if (TimeOfDayToDateTime(newTime, dateTime)!.isBefore(startTime) ||
        TimeOfDayToDateTime(newTime, dateTime)!.isAfter(tbtTime)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Time"),
            content: Text(
                "Please select the time within one hour from Start Time (${controller.startDateTimeCtrlr.text.trim()})."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return null;
    }

    return newTime;
  }

  DateTime? TimeOfDayToDateTime(TimeOfDay timeOfDay, DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, timeOfDay.hour,
        timeOfDay.minute);
  }

  Widget _buildWorkPermitCommentTextField_web(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(left: 10, right: 18),
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
          width: MediaQuery.of(context).size.width / 1,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            controller: controller.workPermitRemarkTextCtrlr,
            focusNode: controller.commentFocus,
            scrollController: controller.commentScroll,
            keyboardType: TextInputType.multiline,
            autofocus: controller.newPermitDetailsModel.value?.ptwStatus == 125
                ? true
                : false,
            maxLines: 5,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isWorPermitNumberTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isWorPermitNumberTextInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText: controller.isWorPermitNumberTextInvalid.value
                  ? "Required field"
                  : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isWorPermitNumberTextInvalid.value = false;
              } else {
                controller.isWorPermitNumberTextInvalid.value = true;
              }
            },
          ),
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }

  showEquipmentNameAlertBox() {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Select Equipment Name',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(
          builder: (context) {
            return Obx(
              () => Container(
                padding: Dimens.edgeInsets05_0_5_0,
                height: 300,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 250,
                      height: 120,
                      child: CustomMultiSelectDialogField(
                        buttonText: 'Select Equipment Name',
                        title: 'Equipment Name',
                        initialValue:
                            controller.selectedEquipmentNameIdList.value,
                        items: controller.equipmentNameList
                            .map(
                              (equipmentName) => MultiSelectItem(
                                equipmentName?.id,
                                equipmentName?.name ?? '',
                              ),
                            )
                            .toList(),
                        onConfirm: (selectedOptionsList) => {
                          controller.equipmentNameSelected(selectedOptionsList),
                          controller.selectedEquipmentNameIdList.value =
                              selectedOptionsList.cast<int>().toList(),
                          // setState(() {}),
                          print(
                              'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    }));
  }

  checkboxAlertBox() {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'JSA & SOP is not Accepted !!',
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: Responsive.isDesktop(context) ? 100 : 120,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Text(
                      'Please check the JSA and SOP Terms and Condition. \n Please click on View JSA and View SOP Button.')
                ]),
          );
        }),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    }));
  }

  AddEmployeeListAlertBox() {
    return StatefulBuilder(
      builder: ((context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: Dimens.edgeInsets10_0_10_0,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Select Employee Name',
            textAlign: TextAlign.center,
            // style: TextStyle(color: Colors.green),
          ),
          content: Builder(
            builder: (context) {
              return Obx(
                () => Container(
                  padding: Dimens.edgeInsets05_0_5_0,
                  height: 150,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Divider(
                        color: ColorValues.greyLightColour,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: CustomMultiSelectDialogField(
                          buttonText: 'Add Employee',
                          title: 'Select Employee',
                          initialValue:
                              controller.selectedEmployeeNameIdList.value,
                          items: controller.employeeNameListt
                              .map(
                                (employeeName) => MultiSelectItem(
                                  employeeName?.id,
                                  employeeName?.name ?? '',
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller
                                .employeeNameSelectedoftbt(selectedOptionsList),
                            controller.selectedEmployeeNameIdList.value =
                                selectedOptionsList.cast<int>().toList(),
                            print(
                                'Employee Name list50: ${controller.selectedEmployeeNameIdList}')
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          actions: [
            Center(
              child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  checkBoxMethod(bool isChecked, Function(bool?) onChange) {
    return Checkbox(
      value: isChecked,
      // value: isInitialChecked,
      onChanged: onChange,
    );
  }

  void _removeRow(int index) {
    controller.filteredEmployeeNameList.removeAt(index);
    controller.selectedEmployeeNameIdList.removeAt(index);
  }
}

extension DateTimeExtensions on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return this.year == now.year &&
        this.month == now.month &&
        this.day == now.day;
  }
}
