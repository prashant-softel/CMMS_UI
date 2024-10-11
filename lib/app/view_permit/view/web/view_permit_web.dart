import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/new_permit_list/permit_status_constants.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/permit_approved_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/permit_close_dialog.dart';
import 'package:cmms/app/widgets/permit_extend_dialog.dart';
import 'package:cmms/app/widgets/permit_reject_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cmms/app/utils/url_path.dart';

class ViewPermitWeb extends GetView<ViewPermitController> {
  ViewPermitWeb({super.key});
  final ViewPermitController controller = Get.find();
  final HomeController homecontroller = Get.find();
  final FileUploadController dropzoneController = Get.put(FileUploadController(
    apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',
  ));
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
          body: Column(
            children: [
              HeaderWidget(),
              Container(
                width: Get.width,
                height: Get.height * .9,
                child: Card(
                    color: Color.fromARGB(255, 245, 248, 250),
                    //  elevation: 20,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SingleChildScrollView(
                      child: Obx(
                        () => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      color: Color.fromARGB(255, 236, 234, 234)
                                          .withOpacity(0.5),
                                      //  spreadRadius: 2,
                                      //  blurRadius: 5,
                                      //  offset: Offset(0, 2),
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
                                    // controller.type.value == 1
                                    //     ? InkWell(
                                    //         onTap: () {
                                    //           Get.offAllNamed(
                                    //               Routes.pmTaskView);
                                    //         },
                                    //         child: Text(" / VIEW PM TASK",
                                    //             style: Styles.greyLight14),
                                    //       )
                                    //     :
                                    InkWell(
                                        onTap: () {
                                          String taskId = controller
                                                  .listAssociatedPm!.isEmpty
                                              ? ""
                                              : controller.listAssociatedPm?[0]
                                                      ?.pmId
                                                      .toString() ??
                                                  "";
                                          String jobId = controller
                                                  .listAssociatedJobs!.isEmpty
                                              ? ""
                                              : controller
                                                      .listAssociatedJobs![0]
                                                      ?.jobId
                                                      .toString() ??
                                                  '';
                                          var vegexe;
                                          var mcid;
                                          var vegplan;
                                          controller.type.value == 1
                                              ? Get.offNamed(
                                                  '${Routes.jobDetails}/$jobId')
                                              : controller.type.value == 2
                                                  ? Get.offNamed(
                                                      '${Routes.pmTaskView}/$taskId')
                                                  : controller.type.value == 6
                                                      ? Get.offAllNamed(
                                                          '${Routes.vegExecutionScreen}/${vegexe}/${vegplan}')
                                                      : controller.type.value ==
                                                              4
                                                          ? Get.offAllNamed(
                                                              Routes
                                                                  .addModuleCleaningExecutionContentWeb,
                                                              arguments: {
                                                                  'mcid': mcid
                                                                })
                                                          : Get.offNamed(Routes
                                                              .newPermitList);
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
                                                : controller.type.value == 5
                                                    ? Text(
                                                        "/ VEG TASK",
                                                        style:
                                                            Styles.greyLight14,
                                                      )
                                                    : controller.type.value == 4
                                                        ? Text(
                                                            "/ MC TASK",
                                                            style: Styles
                                                                .greyLight14,
                                                          )
                                                        : Text(
                                                            "/ PERMIT LIST",
                                                            style: Styles
                                                                .greyLight14,
                                                          )),

                                    Text(" / VIEW PERMIT",
                                        style: Styles.greyLight14)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Site Permit No: ',
                                          style: Styles.black17,
                                        ),
                                        Text(
                                            '${controller.viewPermitDetailsModel.value?.sitePermitNo}',
                                            style: Styles.blue17),
                                      ],
                                    ),
                                    // Text(
                                    //   '${controller.viewPermitDetailsModel.value?.title}',
                                    //   style: Styles.blackBold16,
                                    // ),
                                    Spacer(),
                                    Container(
                                      // height: 30,
                                      // width: MediaQuery.of(context)
                                      //         .size
                                      //         .width /
                                      //     5,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: (controller
                                                            .viewPermitDetailsModel
                                                            .value
                                                            ?.ptwStatus ==
                                                        PermitStatusConstants
                                                            .PTW_APPROVE) &&
                                                    (controller
                                                            .viewPermitDetailsModel
                                                            .value
                                                            ?.tbT_Done_Check ==
                                                        0) // tbt not done but approved
                                                ? ColorValues.createsColor
                                                : controller.viewPermitDetailsModel
                                                            .value?.ptwStatus ==
                                                        PermitStatusConstants
                                                            .PTW_APPROVE //125
                                                    ? ColorValues.approveColor
                                                    : controller
                                                                .viewPermitDetailsModel
                                                                .value
                                                                ?.ptwStatus ==
                                                            PermitStatusConstants
                                                                .PTW_CREATED //121
                                                        ? ColorValues
                                                            .yellowColor
                                                        : controller
                                                                    .viewPermitDetailsModel
                                                                    .value
                                                                    ?.ptwStatus ==
                                                                PermitStatusConstants
                                                                    .PTW_EXTEND_REQUEST_APPROVE //135
                                                            ? Color.fromARGB(
                                                                255, 181, 129, 179)
                                                            : controller.viewPermitDetailsModel.value?.ptwStatus == PermitStatusConstants.PTW_CLOSED //135
                                                                ? ColorValues.closeColor
                                                                : ColorValues.appRedColor,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                          child: Text(
                                        '${controller.viewPermitDetailsModel.value?.current_status_short}',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.lightGreyColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "This permit is valid only when issued Et approved by an authorized issuer. This permit must be obtained before a specified work is started Et it must be closed immediately after completion of the work or at the end of the shift as agreed by the parties identified on this permit. Refer PTW SOP",
                                      style: Styles.grey15,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        String pdfUrl =
                                            // 'http://65.0.20.19/CMMS_API/Upload/1779/0/0/Ptw%20sop%20file%20pdf.pdf';
                                            "http://172.20.43.9:83/Upload/1/0/0/Ptw%20sop%20file%20pdf.pdf";
                                        // String pdfPath =
                                        //     html.window.location.origin +
                                        //         '/' +
                                        //         pdfUrl;
                                        // html.window.open(pdfPath, '_blank');
                                        if (await canLaunch(pdfUrl)) {
                                          await launch(pdfUrl);
                                        } else {
                                          throw 'Could not launch $pdfUrl';
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/files/pdf2.png',
                                        width: 45, // Set the desired width
                                        height: 35, // Set the desired height
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Plant: ',
                                          style: Styles.black17,
                                        ),
                                        Text(
                                          'Start Date: ',
                                          style: Styles.black17,
                                        ),
                                        Dimens.boxHeight5,
                                        Text(
                                          'Equipment Categories: ',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${controller.viewPermitDetailsModel.value?.siteName}',
                                            overflow: TextOverflow.clip,
                                            style: Styles.blue17),
                                        SizedBox(
                                          child: Text(
                                              '${controller.startDateTimeCtrlr.text}',
                                              style: Styles.blue17),
                                        ),
                                        Dimens.boxHeight5,

                                        // Dimens.boxHeight5,

                                        Dimens.boxHeight5,

                                        //  SizedBox(
                                        //     width: 150,
                                        //     child: Text(
                                        //       'Inverter, SCADA',
                                        //       style: TextStyle(
                                        //           color: Color
                                        //               .fromARGB(
                                        //                   255,
                                        //                   5,
                                        //                   92,
                                        //                   163)),
                                        //     ),
                                        //   ),

                                        controller.permitId != null
                                            ? SizedBox(
                                                width: 200,
                                                child: Wrap(
                                                  alignment:
                                                      WrapAlignment.start,
                                                  spacing: 100,
                                                  children: []..addAll(
                                                      controller.listCategory!
                                                          .map((element) => Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 20,
                                                                    child: Text(
                                                                      "${element?.equipmentCat}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: Styles
                                                                          .blue17,
                                                                    ),
                                                                  )
                                                                ],
                                                              ))),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Block: ',
                                          style: Styles.black17,
                                        ),
                                        Text(
                                          'Valid Till: ',
                                          style: Styles.black17,
                                        ),
                                        Dimens.boxHeight5,
                                        // Text(
                                        //   'Permit Type: ',
                                        //   style: Styles.black17,
                                        // ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${controller.viewPermitDetailsModel.value?.blockName}',
                                            style: Styles.blue17),
                                        Text(
                                            '${controller.validTillTimeCtrlr.text}',
                                            style: Styles.blue17),
                                        // Text(
                                        //     '${controller.viewPermitDetailsModel.value?.permitTypeName}',
                                        //     style: Styles.blue17),

                                        Dimens.boxHeight5,
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Permit No: ',
                                          style: Styles.black17,
                                        ),
                                        Dimens.boxHeight5,
                                        Text(
                                          'Permit Type: ',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Text(
                                              '${controller.viewPermitDetailsModel.value?.permitNo}',
                                              style: Styles.blue17),
                                        ),
                                        // Text(
                                        //     '${controller.viewPermitDetailsModel.value?.siteName}',
                                        //     overflow: TextOverflow.clip,
                                        //     style: Styles.blue17),
                                        Dimens.boxHeight5,
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        Text(
                                            '${controller.viewPermitDetailsModel.value?.permitTypeName}',
                                            style: Styles.blue17),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Dimens.boxHeight5,

                              Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Permit Description: ',
                                      style: Styles.black17,
                                    ),
                                    Dimens.boxHeight5,
                                    Container(
                                      child: Text(
                                          '${controller.viewPermitDetailsModel.value?.description}',
                                          style: Styles.blue17),
                                    ),
                                  ],
                                ),
                              ),

                              ///Jobs Linked to this permit
                              controller.listAssociatedJobs!.isEmpty
                                  ? Dimens.box0
                                  : Container(
                                      margin: Dimens.edgeInsets20,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
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
                                                  style:
                                                      Styles.blue700.copyWith(
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
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Job ID with clickable functionality
                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () {
                                                            controller.viewJobDetails(
                                                                controller
                                                                    .listAssociatedJobs?[
                                                                        index]
                                                                    ?.jobId);
                                                          },
                                                          child: Text(
                                                            'JOB${controller.listAssociatedJobs?[index]?.jobId?.toString() ?? ''}',
                                                            style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              fontSize:
                                                                  15, // Adjusted font size
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      5,
                                                                      92,
                                                                      163),
                                                            ),
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
                                                              controller
                                                                      .showMore
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
                                                                  onPressed:
                                                                      () {
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

                              controller.listAssociatedPm!.isEmpty
                                  ? Dimens.box0
                                  : Container(
                                      width: Get.width * .9,
                                      margin: Dimens.edgeInsets20,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
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
                                                      child: InkWell(
                                                        onTap: () {
                                                          String refId = controller
                                                                  .listAssociatedPm?[
                                                                      index]
                                                                  ?.pmId
                                                                  .toString() ??
                                                              "";
                                                          controller
                                                              .clearStoreDataPMtaskId();
                                                          controller.type
                                                                      .value ==
                                                                  AppConstants
                                                                      .kAudit
                                                              ? Get.toNamed(
                                                                  Routes
                                                                      .viewAuditTask,
                                                                  arguments: {
                                                                      'auditTaskId': controller
                                                                          .listAssociatedPm?[
                                                                              index]
                                                                          ?.pmId,
                                                                      'type': controller
                                                                          .type
                                                                          .value,
                                                                    })
                                                              : Get.offAllNamed(
                                                                  '${Routes.pmTaskView}/$refId');
                                                        },
                                                        child: Text(
                                                          controller.type
                                                                      .value ==
                                                                  AppConstants
                                                                      .kAudit
                                                              ? "AUD${controller.listAssociatedPm?[index]?.pmId?.toString() ?? ''}"
                                                              : "PMT${controller.listAssociatedPm?[index]?.pmId?.toString() ?? ''}",
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
                                                        controller.type.value ==
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

                              //Mc linked to this permit
                              controller.lstAssociatedMc!.isEmpty
                                  ? Dimens.box0
                                  : Container(
                                      margin: Dimens.edgeInsets20,
                                      height: ((controller.lstAssociatedMc
                                                      ?.length ??
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
                                                              .clearStoreDataPMtaskId();
                                                          Get.offAllNamed(
                                                              Routes
                                                                  .addModuleCleaningExecutionContentWeb,
                                                              arguments: {
                                                                'mcid': controller
                                                                    .lstAssociatedMc?[
                                                                        index]
                                                                    ?.plan_id
                                                              });
                                                        },
                                                        child: Text(
                                                          "MCT${controller.lstAssociatedMc?[index]?.executionId.toString() ?? ''}",
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
                                                        ),
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

                              //veg linked to ptw
                              controller.lstAssociatedVc!.isEmpty
                                  ? Dimens.box0
                                  : Container(
                                      margin: Dimens.edgeInsets20,
                                      height: ((controller.lstAssociatedVc
                                                      ?.length ??
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
                                                          controller
                                                              .clearStoreDataPMtaskId();
                                                          Get.offAllNamed(
                                                              '${Routes.vegExecutionScreen}/${controller.lstAssociatedVc?[index]!.executionId}/${controller.lstAssociatedVc?[index]!.plan_id}');
                                                        },
                                                        child: Text(
                                                          "VE${controller.lstAssociatedVc?[index]?.executionId.toString() ?? ''}",
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

                              ///Loto Applied List
                              Container(
                                margin: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Isolation Required ',
                                      style: Styles.blue700,
                                    ),
                                    Checkbox(
                                      value: controller.isCheckedLoto.value,
                                      onChanged: (value) {},
                                    ),
                                    Spacer(),
                                    Text(
                                      'LOTO Applied ',
                                      style: Styles.blue700,
                                    ),
                                    Checkbox(
                                      value: controller.isCheckedLoto.value,
                                      onChanged: (value) {},
                                    ),
                                    Spacer(),
                                    Text(
                                      'Isolated Equipments: ',
                                      style: Styles.blue700,
                                    ),
                                    Row(
                                      children: []..addAll(controller
                                          .listIsolation!
                                          .map((element) => Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "${element?.isolationAssetsCatName?.split(',')}",
                                                      style: Styles.blue17)
                                                ],
                                              ))),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: Dimens.edgeInsets20,
                                height:
                                    ((controller.listLoto?.length ?? 0) * 40) +
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
                                            'Isolated Category',
                                            style: Styles.blue700,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: DataTable2(
                                        border: TableBorder.all(
                                            color: Color.fromARGB(
                                                255, 206, 229, 234)),
                                        columns: [
                                          DataColumn(
                                              label: Text(
                                            "LOTO Applied On",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                          DataColumn(
                                              label: Text(
                                            "LOTO Lock Sr. No.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller.listLoto?.length ?? 0,
                                          (index) => DataRow(cells: [
                                            DataCell(Text(controller
                                                    .listLoto?[index]?.loto_Key
                                                    .toString() ??
                                                '')),
                                            DataCell(Text(controller
                                                    .listLoto?[index]
                                                    ?.loto_lock_number
                                                    .toString() ??
                                                '')),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Safety measures
                              controller.safetyMeasureList.isEmpty
                                  ? Dimens.box0
                                  : SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 1,
                                      child: Container(
                                        margin: EdgeInsets.all(20),
                                        // margin: Dimens.edgeInsets20,
                                        // height: ((controller
                                        //             .safetyMeasureList
                                        //             .length) *
                                        //         28) +
                                        //     180,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // CustomAppBar(
                                            //   title: 'Following safety Measures taken to carry out the work'.tr,
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10, top: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Permit Type: ',
                                                    style: Styles.blue700,
                                                  ),
                                                  Dimens.boxWidth3,
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.permitTypeName}',
                                                    style: Styles.blue700,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       left: 10, right: 10, top: 10),
                                            //   child: Text(
                                            //     'Permit Checkpoints',
                                            //     style: Styles.blue700,
                                            //   ),
                                            // ),
                                            Dimens.boxHeight10,
                                            IgnorePointer(
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
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              checkBoxMethod(element.ischeck == 1 ? true : false, (value) {
                                                                                element.ischeck == value ?? false;
                                                                                controller.update();
                                                                              }),
                                                                              Dimens.boxWidth10,
                                                                              Text("${element.saftyQuestionName}"),
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

                                            // Wrap(
                                            //   children: [
                                            //     Column(
                                            //       children: [
                                            //         controller.permitId != null
                                            //             ? Column(
                                            //                 // alignment: WrapAlignment.start,
                                            //                 // spacing: 100,
                                            //                 children: []
                                            //                   ..addAll(controller
                                            //                       .safetyMeasureList
                                            //                       .map(
                                            //                           (element) =>
                                            //                               Column(
                                            //                                 // mainAxisSize: MainAxisSize.min,
                                            //                                 mainAxisAlignment:
                                            //                                     MainAxisAlignment.start,
                                            //                                 crossAxisAlignment:
                                            //                                     CrossAxisAlignment.start,
                                            //                                 children: [
                                            //                                   Padding(
                                            //                                     padding: const EdgeInsets.only(left: 20),
                                            //                                     child: SizedBox(
                                            //                                       // width: 200,
                                            //                                       child: Row(
                                            //                                         children: [
                                            //                                           checkBoxMethod(1),
                                            //                                           // Text("${l = l! + 1}. "),
                                            //                                           Expanded(child: Text("${element.name}"))
                                            //                                         ],
                                            //                                       ),
                                            //                                     ),
                                            //                                   )
                                            //                                 ],
                                            //                               ))),
                                            //               )
                                            //             : Container(),
                                            //         SizedBox(
                                            //           height: 20,
                                            //         ),
                                            //       ],
                                            //     )
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),

                              //Tool box talk
                              Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(.3)),
                                ),
                                child: Container(
                                  color: ColorValues.appBlueBackgroundColor,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "SOP / JSA",
                                        style: Styles.blue700,
                                      ),
                                      Dimens.boxHeight10,
                                      Wrap(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment
                                                //         .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text('Job Type: '),
                                                  SizedBox(
                                                    width: 5,
                                                  ),

                                                  SizedBox(
                                                    width: 150,
                                                    child: Text(
                                                        '${controller.viewPermitDetailsModel.value?.job_type_name ?? 'No Data Found'}',
                                                        style: Styles.blue17),
                                                  ),

                                                  SizedBox(
                                                    width: 120,
                                                  ),
                                                  Text('SOP: '),
                                                  SizedBox(
                                                    width: 5,
                                                  ),

                                                  SizedBox(
                                                    width: 200,
                                                    child: Text(
                                                        '${controller.viewPermitDetailsModel.value?.sop_type_name ?? 'No Data Found'}',
                                                        style: Styles.blue17),
                                                  ),
                                                  // Checkbox(
                                                  //   value: controller
                                                  //       .isCheckedLoto
                                                  //       .value,
                                                  //   onChanged:
                                                  //       (value) {},
                                                  // ),
                                                  SizedBox(
                                                    width: 90,
                                                  ),
                                                  // Text(
                                                  //   'Breakdown Maintenance - Demo Plant',
                                                  //   style: TextStyle(
                                                  //       color: Color.fromARGB(
                                                  //           255,
                                                  //           5,
                                                  //           92,
                                                  //           163)),
                                                  // ),
                                                  // Checkbox(
                                                  //   value: controller
                                                  //       .isCheckedLoto
                                                  //       .value,
                                                  //   onChanged:
                                                  //       (value) {},
                                                  // )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Container(
                                                      height: 30,
                                                      child:
                                                          CustomElevatedButton(
                                                        backgroundColor:
                                                            ColorValues
                                                                .navyBlueColor,
                                                        text: "View SOP",
                                                        onPressed: () async {
                                                          // final url = '${controller.jsaData}';
                                                          // "https://www.w3.org/1999/xhtml/"
                                                          // String baseUrl =
                                                          //     'http://65.0.20.19/CMMS_API/';
                                                          String baseUrl =
                                                              UrlPath.deployUrl;
                                                          String endpoint =
                                                              '${controller.sopData}';

                                                          // Concatenate the links
                                                          String fullUrl =
                                                              baseUrl +
                                                                  endpoint;
                                                          // final url =
                                                          //     'http://65.0.20.19/O3_Files${controller.jsaData}';
                                                          print(
                                                              'JSAUrl:$fullUrl');
                                                          if (await canLaunch(
                                                              fullUrl)) {
                                                            await launch(
                                                                fullUrl);
                                                          }
                                                        },
                                                      )),
                                                  SizedBox(
                                                    width: 230,
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .navyBlueColor,
                                                      text: "View JSA",
                                                      onPressed: () async {
                                                        // String baseUrl =
                                                        //     'http://65.0.20.19/CMMS_API/';
                                                        String baseUrl =
                                                            UrlPath.deployUrl;
                                                        String endpoint =
                                                            '${controller.jsaData}';
                                                        String fullUrl =
                                                            baseUrl + endpoint;
                                                        print(
                                                            'JSAUrl:$fullUrl');
                                                        if (await canLaunch(
                                                            fullUrl)) {
                                                          await launch(fullUrl);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //Tool box talk / Pre Job Discussion
                              // controller.viewPermitDetailsModel.value
                              //             ?.tbT_Done_By ==
                              //         null
                              //     ? Dimens.box0
                              //     :

                              Dimens.boxHeight10,

                              controller.viewPermitDetailsModel.value
                                          ?.ptwStatus ==
                                      121
                                  ? Dimens.box0
                                  : Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(.3)),
                                          ),
                                          child: Container(
                                            color: ColorValues
                                                .appBlueBackgroundColor,
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Tool Box Talk (TBT) / PRE-JOB DISCUSSION",
                                                  style: Styles.blue700,
                                                ),
                                                Dimens.boxHeight10,
                                                Wrap(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    'Conducted At Job-Site By:',
                                                                    style: Styles
                                                                        .blackBold17,
                                                                  ),
                                                                  Dimens
                                                                      .boxHeight10,
                                                                  Text(
                                                                    '${controller.viewPermitDetailsModel.value?.tbT_Done_By}',
                                                                    style: Styles
                                                                        .black17,
                                                                  ),
                                                                  // SizedBox(
                                                                  //   width: MediaQuery.of(
                                                                  //               context)
                                                                  //           .size
                                                                  //           .width /
                                                                  //       7,
                                                                  //   child: Obx(
                                                                  //     () =>
                                                                  //         DropdownWebWidget(
                                                                  //       dropdownList:
                                                                  //           controller
                                                                  //               .employeeList,
                                                                  //       isValueSelected:
                                                                  //           controller
                                                                  //               .isemployeeListSelected
                                                                  //               .value,
                                                                  //       selectedValue:
                                                                  //           controller
                                                                  //               .selectedEmployeeList
                                                                  //               .value,
                                                                  //       onValueChanged:
                                                                  //           controller
                                                                  //               .onValueChanged,
                                                                  //     ),
                                                                  //   ),
                                                                  // ),
                                                                ],
                                                              ),
                                                              Spacer(),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            450),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Date & Time',
                                                                      style: Styles
                                                                          .blackBold17,
                                                                    ),

                                                                    Text(
                                                                      controller.viewPermitDetailsModel.value?.tbT_Done_At !=
                                                                              null
                                                                          ? DateFormat('yyyy-MM-dd HH:mm').format(controller
                                                                              .viewPermitDetailsModel
                                                                              .value!
                                                                              .tbT_Done_At!)
                                                                          : '',
                                                                      style: Styles
                                                                          .black17,
                                                                    ),
                                                                    // _buildDateTimeField_web(
                                                                    //     context),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: Dimens
                                                              .edgeInsets20,
                                                          height: ((controller
                                                                          .listEmployee
                                                                          ?.length ??
                                                                      0) *
                                                                  40) +
                                                              130,
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
                                                                offset: Offset(
                                                                    0, 2),
                                                              ),
                                                            ],
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10.0),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      'TBT Training Attended By',
                                                                      style: Styles
                                                                          .blue700,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    DataTable2(
                                                                  border: TableBorder.all(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234)),
                                                                  columns: [
                                                                    DataColumn(
                                                                        label:
                                                                            Text(
                                                                      "Employee Name",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                                    DataColumn(
                                                                        label:
                                                                            Text(
                                                                      "Designation",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                                  ],
                                                                  rows: List<
                                                                      DataRow>.generate(
                                                                    controller
                                                                            .listEmployee
                                                                            ?.length ??
                                                                        0,
                                                                    (index) =>
                                                                        DataRow(
                                                                            cells: [
                                                                          DataCell(Text(controller.listEmployee?[index]?.empName.toString() ??
                                                                              '')),
                                                                          DataCell(Text(controller.listEmployee?[index]?.resp.toString() ??
                                                                              '')),
                                                                        ]),
                                                                  ),
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
                                        IgnorePointer(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            height: ((controller
                                                        .rowTBTTrainingOtherPersonItem
                                                        .value
                                                        .length) *
                                                    70) +
                                                140,
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
                                            child: Column(children: [
                                              // Column(
                                              //     children: []..addAll(controller.rowTBTTrainingOtherPersonItem.value.map((e) {
                                              //         return Text(jsonEncode(e));
                                              //       }))),
                                              // Text(jsonEncode(controller.dropdownMapperData)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "TBT Training Attended By Other Person ",
                                                      style: Styles.blue700,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: DataTable2(
                                                  // minWidth: 1700,
                                                  dataRowHeight: 50,
                                                  // columnSpacing: 10,
                                                  border: TableBorder.all(
                                                      color: Color.fromARGB(
                                                          255, 206, 229, 234)),
                                                  columns: [
                                                    DataColumn2(
                                                        label: Text(
                                                      "Employee Name",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn2(
                                                        label: Text(
                                                      "Contact Number",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn2(
                                                        label: Text(
                                                      "Responsibility",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn2(
                                                        fixedWidth: 100,
                                                        label: Text(
                                                          "Action",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                  ],
                                                  rows: controller
                                                      .rowTBTTrainingOtherPersonItem
                                                      .value
                                                      .map((record) {
                                                    return DataRow(
                                                      // height: 130,
                                                      cells:
                                                          record.map((mapData) {
                                                        return DataCell(
                                                          (mapData['key'] ==
                                                                      "Employee Name") ||
                                                                  (mapData[
                                                                          'key'] ==
                                                                      "Contact Number") ||
                                                                  (mapData[
                                                                          'key'] ==
                                                                      "Responsibility")
                                                              ? Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                              top: 10),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                          decoration:
                                                                              BoxDecoration(
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
                                                                            color:
                                                                                ColorValues.whiteColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          child:
                                                                              LoginCustomTextfield(
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            maxLine:
                                                                                1,
                                                                            textController:
                                                                                new TextEditingController(text: mapData["value"] ?? ''),
                                                                            onChanged:
                                                                                (txt) {
                                                                              mapData["value"] = txt;
                                                                            },
                                                                          )),
                                                                    ],
                                                                  ),
                                                                )
                                                              : (mapData['key'] ==
                                                                      "Action ")
                                                                  ? Padding(
                                                                      padding: EdgeInsets
                                                                          .only(
                                                                              top: 10),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          TableActionButton(
                                                                            color:
                                                                                ColorValues.appRedColor,
                                                                            icon:
                                                                                Icons.delete,
                                                                            label:
                                                                                '',
                                                                            message:
                                                                                '',
                                                                            onPress:
                                                                                () {
                                                                              controller.rowTBTTrainingOtherPersonItem.remove(record);
                                                                            },
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : Text(mapData[
                                                                          'key'] ??
                                                                      ''),
                                                        );
                                                      }).toList(),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ],
                                    ),

                              //   SizedBox(height: 10),

                              ////Extend Conditions List

                              // controller.viewPermitDetailsModel.value
                              //                 ?.ptwStatus ==
                              //             PermitStatusConstants
                              //                 .PTW_EXTEND_REQUESTED //133
                              //         ||
                              //         controller.viewPermitDetailsModel.value
                              //                 ?.ptwStatus ==
                              //             PermitStatusConstants
                              //                 .PTW_EXTEND_REQUEST_APPROVE //135
                              //     ? SizedBox(
                              //         width:
                              //             MediaQuery.of(context).size.width / 1,
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(20),
                              //           child: Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.start,
                              //             children: [
                              //               // CustomAppBar(
                              //               //   title: 'Following safety Measures taken to carry out the work'.tr,
                              //               // ),
                              //               Text(
                              //                 'Extend Condition List',
                              //                 style: Styles.blue700,
                              //               ),
                              //               Dimens.boxHeight10,
                              //               Column(
                              //                 children: [
                              //                   Column(
                              //                     children: [
                              //                       Column(
                              //                         // alignment: WrapAlignment.start,
                              //                         // spacing: 100,
                              //                         children: []
                              //                           ..addAll(controller
                              //                               .listExtendCondition!
                              //                               .map(
                              //                                   (element) =>
                              //                                       Column(
                              //                                         // mainAxisSize: MainAxisSize.min,
                              //                                         mainAxisAlignment:
                              //                                             MainAxisAlignment
                              //                                                 .start,
                              //                                         crossAxisAlignment:
                              //                                             CrossAxisAlignment
                              //                                                 .start,
                              //                                         children: [
                              //                                           SizedBox(
                              //                                             // width: 200,
                              //                                             child:
                              //                                                 Row(
                              //                                               children: [
                              //                                                 checkBoxMethods(1),
                              //                                                 // Text("${l = l! + 1}. "),
                              //                                                 Expanded(child: Text("${element!.name}")),
                              //                                               ],
                              //                                             ),
                              //                                           ),
                              //                                         ],
                              //                                       ))),
                              //                       ),
                              //                       // : Dimens.box0,
                              //                       SizedBox(
                              //                         height: 20,
                              //                       ),
                              //                       Padding(
                              //                         padding:
                              //                             const EdgeInsets.only(
                              //                                 left: 10,
                              //                                 right: 10),
                              //                         child: Row(
                              //                           crossAxisAlignment:
                              //                               CrossAxisAlignment
                              //                                   .start,
                              //                           children: [
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Attached Files',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   'anas zia.jpeg',
                              //                                   style: TextStyle(
                              //                                       decoration:
                              //                                           TextDecoration
                              //                                               .underline,
                              //                                       decorationStyle:
                              //                                           TextDecorationStyle
                              //                                               .solid,
                              //                                       color: Color
                              //                                           .fromARGB(
                              //                                               255,
                              //                                               5,
                              //                                               92,
                              //                                               163),
                              //                                       fontSize: Dimens
                              //                                           .seventeen),
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                             Spacer(),
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Comment/Remark',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   'Extended Conditions',
                              //                                   style: Styles
                              //                                       .black17,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                             Spacer(),
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Approver Name',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   '${controller.viewPermitDetailsModel.value?.requestedByName}',
                              //                                   style: Styles
                              //                                       .black17,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                             Spacer(),
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Date & Time',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   '${controller.viewPermitDetailsModel.value?.start_datetime}',
                              //                                   style: Styles
                              //                                       .black17,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   )
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       )
                              //     : Dimens.box0,

                              ///Cancel Condition List
                              // controller.viewPermitDetailsModel.value
                              //                 ?.ptwStatus ==
                              //             PermitStatusConstants
                              //                 .PTW_CANCELLED_BY_APPROVER //129
                              //         ||
                              //         controller.viewPermitDetailsModel.value
                              //                 ?.ptwStatus ==
                              //             PermitStatusConstants
                              //                 .PTW_CANCEL_REQUESTED //130
                              //     ? SizedBox(
                              //         width:
                              //             MediaQuery.of(context).size.width / 1,
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(20),
                              //           child: Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.start,
                              //             children: [
                              //               // CustomAppBar(
                              //               //   title: 'Following safety Measures taken to carry out the work'.tr,
                              //               // ),
                              //               Text(
                              //                 'Cancel Condition List',
                              //                 style: Styles.blue700,
                              //               ),
                              //               Dimens.boxHeight10,
                              //               Column(
                              //                 children: [
                              //                   Column(
                              //                     children: [
                              //                       // controller.permitId != null
                              //                       //     ?
                              //                       Column(
                              //                         // alignment: WrapAlignment.start,
                              //                         // spacing: 100,
                              //                         children: []
                              //                           ..addAll(controller
                              //                               .listCancelCondition!
                              //                               .map(
                              //                                   (element) =>
                              //                                       Column(
                              //                                         // mainAxisSize: MainAxisSize.min,
                              //                                         mainAxisAlignment:
                              //                                             MainAxisAlignment
                              //                                                 .start,
                              //                                         crossAxisAlignment:
                              //                                             CrossAxisAlignment
                              //                                                 .start,
                              //                                         children: [
                              //                                           SizedBox(
                              //                                             // width: 200,
                              //                                             child:
                              //                                                 Row(
                              //                                               children: [
                              //                                                 checkBoxMethods(1),
                              //                                                 // Text("${l = l! + 1}. "),
                              //                                                 Expanded(child: Text("${element!.name}"))
                              //                                               ],
                              //                                             ),
                              //                                           )
                              //                                         ],
                              //                                       ))),
                              //                       ),
                              //                       // : Container(),
                              //                       SizedBox(
                              //                         height: 20,
                              //                       ),
                              //                       Padding(
                              //                         padding:
                              //                             const EdgeInsets.only(
                              //                                 left: 10,
                              //                                 right: 10),
                              //                         child: Row(
                              //                           crossAxisAlignment:
                              //                               CrossAxisAlignment
                              //                                   .start,
                              //                           children: [
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Attached Files',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   'anas zia.jpeg',
                              //                                   style: TextStyle(
                              //                                       decoration:
                              //                                           TextDecoration
                              //                                               .underline,
                              //                                       decorationStyle:
                              //                                           TextDecorationStyle
                              //                                               .solid,
                              //                                       color: Color
                              //                                           .fromARGB(
                              //                                               255,
                              //                                               5,
                              //                                               92,
                              //                                               163),
                              //                                       fontSize: Dimens
                              //                                           .seventeen),
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                             Spacer(),
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Comment/Remark',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   'cancel Conditions',
                              //                                   style: Styles
                              //                                       .black17,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                             Spacer(),
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Approver Name',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   '${controller.viewPermitDetailsModel.value?.requestedByName}',
                              //                                   style: Styles
                              //                                       .black17,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                             Spacer(),
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Date & Time',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   '${controller.viewPermitDetailsModel.value?.start_datetime}',
                              //                                   style: Styles
                              //                                       .black17,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   )
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       )
                              //     : Dimens.box0,

                              ///Close Condition List
                              ///TODO
                              // controller.viewPermitDetailsModel.value
                              //             ?.ptwStatus ==
                              //         PermitStatusConstants.PTW_CLOSED //126
                              //     ? SizedBox(
                              //         width:
                              //             MediaQuery.of(context).size.width / 1,
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(20),
                              //           child: Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.start,
                              //             children: [
                              //               // CustomAppBar(
                              //               //   title: 'Following safety Measures taken to carry out the work'.tr,
                              //               // ),
                              //               Text(
                              //                 'Close Condition List',
                              //                 style: Styles.blue700,
                              //               ),
                              //               Dimens.boxHeight10,
                              //               Column(
                              //                 children: [
                              //                   Column(
                              //                     children: [
                              //                       // controller.permitId != null
                              //                       //     ?
                              //                       Column(
                              //                         // alignment: WrapAlignment.start,
                              //                         // spacing: 100,
                              //                         children: []
                              //                           ..addAll(controller
                              //                               .listCloseCondition!
                              //                               .map(
                              //                                   (element) =>
                              //                                       Column(
                              //                                         // mainAxisSize: MainAxisSize.min,
                              //                                         mainAxisAlignment:
                              //                                             MainAxisAlignment
                              //                                                 .start,
                              //                                         crossAxisAlignment:
                              //                                             CrossAxisAlignment
                              //                                                 .start,
                              //                                         children: [
                              //                                           SizedBox(
                              //                                             // width: 200,
                              //                                             child:
                              //                                                 Row(
                              //                                               children: [
                              //                                                 checkBoxMethods(1),
                              //                                                 // Text("${l = l! + 1}. "),
                              //                                                 Expanded(child: Text("${element!.name}"))
                              //                                               ],
                              //                                             ),
                              //                                           )
                              //                                         ],
                              //                                       ))),
                              //                       ),
                              //                       // : Container(),
                              //                       SizedBox(
                              //                         height: 20,
                              //                       ),
                              //                       Padding(
                              //                         padding:
                              //                             const EdgeInsets.only(
                              //                                 left: 10,
                              //                                 right: 10),
                              //                         child: Row(
                              //                           crossAxisAlignment:
                              //                               CrossAxisAlignment
                              //                                   .start,
                              //                           children: [
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Attached Files',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   'anas zia.jpeg',
                              //                                   style: TextStyle(
                              //                                       decoration:
                              //                                           TextDecoration
                              //                                               .underline,
                              //                                       decorationStyle:
                              //                                           TextDecorationStyle
                              //                                               .solid,
                              //                                       color: Color
                              //                                           .fromARGB(
                              //                                               255,
                              //                                               5,
                              //                                               92,
                              //                                               163),
                              //                                       fontSize: Dimens
                              //                                           .seventeen),
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                             Spacer(),
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Comment/Remark',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   'Close Conditions',
                              //                                   style: Styles
                              //                                       .black17,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                             Spacer(),
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Approver Name',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   '${controller.viewPermitDetailsModel.value?.requestedByName}',
                              //                                   style: Styles
                              //                                       .black17,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                             Spacer(),
                              //                             Column(
                              //                               crossAxisAlignment:
                              //                                   CrossAxisAlignment
                              //                                       .end,
                              //                               children: [
                              //                                 Text(
                              //                                   'Date & Time',
                              //                                   style: Styles
                              //                                       .blackBold17,
                              //                                 ),
                              //                                 Text(
                              //                                   '${controller.viewPermitDetailsModel.value?.start_datetime}',
                              //                                   style: Styles
                              //                                       .black17,
                              //                                 ),
                              //                               ],
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   )
                              //                 ],
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       )
                              //     : Dimens.box0,

                              ///File Upload
                              Container(
                                margin: Dimens.edgeInsets20,
                                height:
                                    ((controller.file_list?.length ?? 0) * 40) +
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
                                            'All Files Uploaded',
                                            style: Styles.blue700,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: DataTable2(
                                        border: TableBorder.all(
                                          color: Color.fromARGB(
                                              255, 206, 229, 234),
                                        ),
                                        columns: [
                                          DataColumn(
                                            label: Text(
                                              "File Description",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              "View Image",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller.file_list?.length ?? 0,
                                          (index) => DataRow(
                                            cells: [
                                              DataCell(Text(
                                                controller.file_list![index]
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
                                                      icon: Icons.visibility,
                                                      message: 'View Permit',
                                                      onPress: () async {
                                                        // String baseUrl =
                                                        //     "http://65.0.20.19/CMMS_API/";
                                                        String baseUrl =
                                                            UrlPath.deployUrl;
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
                                                        // String baseUrl = UrlPath.deployUrl;
                                                      },
                                                    )
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
                              SizedBox(
                                height: 10,
                              ),
                              //Permit History
                              controller.historyList!.isEmpty
                                  ? Dimens.box0
                                  : Container(
                                      margin: Dimens.edgeInsets20,
                                      height:
                                          ((controller.historyList?.length ??
                                                      0) *
                                                  50) +
                                              125,
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
                                                  "Permit History ",
                                                  style: Styles.blue700,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: ColorValues.greyLightColour,
                                          ),
                                          // Column(
                                          //   children: [
                                          //     Row(
                                          //       children: [
                                          //         Text(
                                          //             "Time Stamp"),
                                          //         Text(
                                          //             "Posted By"),
                                          //         Text("Comment"),
                                          //         Text(
                                          //             "Location"),
                                          //         Text("Status"),
                                          //       ],
                                          //     )
                                          //   ]..addAll([
                                          //       ...(controller
                                          //               .historyList?.value ??
                                          //           [])
                                          //     ].map((e) {
                                          //       return Row(
                                          //         children: [
                                          //           Text(
                                          //               "${e?.createdAt??''}"),
                                          //           Text(
                                          //               "${e?.createdByName}"),
                                          //           Text(
                                          //               "${e?.comment}"),
                                          //           Text(
                                          //               "--"),
                                          //           Text(
                                          //               "${e?.status_name ??''}"),
                                          //         ],
                                          //       );
                                          //     })),
                                          // ),

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
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  "Posted By",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  "Comment",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                DataColumn(
                                                    label: Text(
                                                  "Status",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ],
                                              rows: List<DataRow>.generate(
                                                controller
                                                        .historyList?.length ??
                                                    0,
                                                (index) => DataRow(cells: [
                                                  DataCell(
                                                    Text(
                                                      controller
                                                                  .historyList?[
                                                                      index]
                                                                  ?.createdAt
                                                                  ?.result !=
                                                              null
                                                          ? DateFormat(
                                                                  'yyyy-MM-dd HH:mm')
                                                              .format(controller
                                                                  .historyList![
                                                                      index]!
                                                                  .createdAt!
                                                                  .result!)
                                                          : '',
                                                    ),
                                                  ),
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

                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Comments: ',
                                      style: Styles.black17,
                                    ),
                                    Dimens.boxHeight5,
                                    Container(
                                      child: Text(
                                          '${controller.viewPermitDetailsModel.value?.physical_iso_remark}',
                                          style: Styles.blue17),
                                    ),
                                  ],
                                ),
                              ),
                              Dimens.boxHeight10,
                              Container(
                                margin: EdgeInsets.all(20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text('Requested By: '),
                                        // Text('Issued By: '),

                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_APPROVE //125
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129
                                            ? Text('Approved By: ')
                                            : Dimens.box0,
                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                            ? Text('Cancelled By: ')
                                            : Dimens.box0,
                                        controller.viewPermitDetailsModel.value
                                                    ?.ptwStatus ==
                                                PermitStatusConstants
                                                    .PTW_CLOSED //126
                                            ? Text('Closed By: ')
                                            : Dimens.box0,
                                      ],
                                    ),
                                    Dimens.boxWidth2,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.viewPermitDetailsModel.value?.requestedByName}',
                                        ),
                                        // Text(
                                        //   '${controller.viewPermitDetailsModel.value?.issuedByName}',
                                        // ),
                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_APPROVE //125
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129
                                            ? Text(
                                                '${controller.viewPermitDetailsModel.value?.approvedByName}',
                                              )
                                            : Dimens.box0,
                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                            ? Text(
                                                '${controller.viewPermitDetailsModel.value?.cancelRequestByName}',
                                              )
                                            : Dimens.box0,
                                        controller.viewPermitDetailsModel.value
                                                    ?.ptwStatus ==
                                                PermitStatusConstants
                                                    .PTW_CLOSED //126
                                            ? Text(
                                                '${controller.viewPermitDetailsModel.value?.closedByName}',
                                              )
                                            : Dimens.box0
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text('Date / Time: '),

                                        //Issued by
                                        // Text('Date / Time: '),

                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_APPROVE //125
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129
                                            ? Text('Date / Time: ')
                                            : Dimens.box0,
                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                            ? Text('Date / Time: ')
                                            : Dimens.box0,
                                        controller.viewPermitDetailsModel.value
                                                    ?.ptwStatus ==
                                                PermitStatusConstants
                                                    .PTW_CLOSED //126
                                            ? Text('Date / Time: ')
                                            : Dimens.box0,
                                      ],
                                    ),
                                    Dimens.boxWidth2,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                                      .viewPermitDetailsModel
                                                      .value
                                                      ?.request_datetime !=
                                                  null
                                              ? DateFormat('yyyy-MM-dd HH:mm')
                                                  .format(controller
                                                      .viewPermitDetailsModel
                                                      .value!
                                                      .request_datetime!)
                                              : '',
                                          style: Styles.black17,
                                        ),
                                        // Text(
                                        //   '${controller.viewPermitDetailsModel.value?.issue_at}',
                                        // ),
                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_APPROVE //125
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129

                                            ? Text(
                                                controller.viewPermitDetailsModel
                                                            .value?.approve_at !=
                                                        null
                                                    ? DateFormat(
                                                            'yyyy-MM-dd HH:mm')
                                                        .format(controller
                                                            .viewPermitDetailsModel
                                                            .value!
                                                            .approve_at!)
                                                    : '',
                                                style: Styles.black17,
                                              )
                                            : Dimens.box0,
                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                            ? Text(
                                                controller.viewPermitDetailsModel
                                                            .value?.cancel_at !=
                                                        null
                                                    ? DateFormat(
                                                            'yyyy-MM-dd HH:mm')
                                                        .format(controller
                                                            .viewPermitDetailsModel
                                                            .value!
                                                            .cancel_at!)
                                                    : '',
                                                style: Styles.black17,
                                              )
                                            : Dimens.box0,

                                        controller.viewPermitDetailsModel.value
                                                    ?.ptwStatus ==
                                                PermitStatusConstants
                                                    .PTW_CLOSED //126
                                            ? Text(
                                                '${controller.viewPermitDetailsModel.value?.close_at}',
                                              )
                                            : Dimens.box0,
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text('Signature: '),

                                        //Issued at
                                        // Text('Signature: '),

                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_APPROVE //125
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129
                                            ? Text('Signature: ')
                                            : Dimens.box0,
                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CANCELLED_BY_APPROVER //129
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_CLOSED //126
                                            ? Text('Signature: ')
                                            : Dimens.box0,
                                        controller.viewPermitDetailsModel.value
                                                    ?.ptwStatus ==
                                                PermitStatusConstants
                                                    .PTW_CLOSED //126
                                            ? Text('Signature: ')
                                            : Dimens.box0,
                                      ],
                                    ),
                                    Spacer()
                                    // Dimens.boxWidth50
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 90,
                              ),

                              ////
                            ]),
                      ),
                    )),
              ),
            ],
          ),
          floatingActionButton: Obx(
            () => controller.hseMis == 1
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.19,
                      // ),

                      controller.viewPermitDetailsModel.value?.ptwStatus ==
                              PermitStatusConstants.PTW_APPROVE //125
                          ///Printing functionality
                          ? Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                height: 45,
                                child: CustomElevatedButton(
                                  icon: Icons.print_outlined,
                                  backgroundColor: ColorValues.appDarkBlueColor,
                                  text: "Print",
                                  onPressed: () {
                                    controller.generateInvoice();
                                  },
                                ),
                              ),
                            )
                          : Dimens.box0,

                      // Dimens.boxWidth5,

                      // Container(
                      //     height: 45,
                      //     child: CustomElevatedButton(
                      //       backgroundColor: Colors.red,
                      //       text: "Cancel",
                      //       onPressed: () {
                      //         // controller
                      //         //     .createNewPermit();
                      //       },
                      //     )),
                      // SizedBox(
                      //   width: 10,
                      // ),

                      ////Issue Button
                      // varUserAccessModel.value.access_list!
                      //                 .where((e) => e.feature_id == 3 && e.issue == 1)
                      //                 .length >
                      //             0 &&
                      //         controller.viewPermitDetailsModel.value?.ptwStatus == 121
                      //         ||
                      //         controller.viewPermitDetailsModel.value?.ptwStatus == 122
                      //         ||
                      //         controller.viewPermitDetailsModel.value?.ptwStatus == 124

                      //     ? Container(
                      //         height: 45,
                      //         child: CustomElevatedButton(
                      //           backgroundColor: ColorValues.appDarkBlueColor,
                      //           text: "Issue",
                      //           icon: Icons.check,
                      //           onPressed: () {
                      //             // controller
                      //             //     .createNewPermit();
                      //             Get.dialog(PermitIssueDialog(
                      //                 permitId:
                      //                     '${controller.viewPermitDetailsModel.value?.permitNo}'));
                      //           },
                      //         ))
                      //     : Container(),

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
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
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
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
                                  PermitStatusConstants
                                      .PTW_EXTEND_REQUESTED //133
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
                                            .viewPermitDetailsModel
                                            .value
                                            ?.permitNo,
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
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
                                  PermitStatusConstants
                                      .PTW_EXTEND_REQUESTED //133
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
                                            .viewPermitDetailsModel
                                            .value
                                            ?.permitNo,
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
                              controller.viewPermitDetailsModel.value
                                      ?.requester_id ==
                                  varUserAccessModel.value.user_id &&
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
                                  PermitStatusConstants.PTW_APPROVE &&
                              varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id ==
                                          UserAccessConstants
                                              .kPermitFeatureId &&
                                      e.edit ==
                                          UserAccessConstants.kHaveEditAccess)
                                  .isNotEmpty &&
                              (controller.viewPermitDetailsModel.value
                                      ?.isExpired ==
                                  0) &&
                              (controller.viewPermitDetailsModel.value
                                              ?.lstAssociatedJobs !=
                                          null &&
                                      controller.viewPermitDetailsModel.value!
                                          .lstAssociatedJobs!.isNotEmpty &&
                                      controller
                                              .viewPermitDetailsModel
                                              .value!
                                              .lstAssociatedJobs![0]!
                                              .jc_status ==
                                          152)

                                  // &&
                                  // controller.isOneHour(
                                  //         controller.validTillTimeCtrlr.text)
                                  ==
                                  true
                          ? Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                  height: 45,
                                  child: CustomElevatedButton(
                                    backgroundColor:
                                        ColorValues.appDarkBlueColor,
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
                                  controller.viewPermitDetailsModel.value
                                          ?.permitNo !=
                                      null &&
                                  controller.viewPermitDetailsModel.value
                                          ?.ptwStatus ==
                                      PermitStatusConstants
                                          .PTW_CANCEL_REQUEST_REJECTED //121
                              ||
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
                                  PermitStatusConstants
                                      .PTW_EXTEND_REQUEST_REJECTED
                          ? Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                  height: 45,
                                  child: CustomElevatedButton(
                                    backgroundColor:
                                        ColorValues.appcloseRedColor,
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
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
                                  PermitStatusConstants.PTW_CREATED //121
                          // ||
                          // controller.viewPermitDetailsModel.value?.ptwStatus ==
                          //     PermitStatusConstants.PTW_EXTEND_REQUESTED //133
                          // ||
                          // controller.viewPermitDetailsModel.value?.ptwStatus == 130
                          // varUserAccessModel.value.access_list!
                          //         .where((e) =>
                          //             e.feature_id ==
                          //                 UserAccessConstants.kPermitFeatureId &&
                          //             e.delete ==
                          //                 UserAccessConstants.kHaveDeleteAccess)
                          //         .length >
                          //     0
                          ? Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                  height: 45,
                                  child: CustomElevatedButton(
                                    backgroundColor: ColorValues.appRedColor,
                                    text: "Reject Permit",
                                    icon: Icons.close,
                                    onPressed: () {
                                      String taskId =
                                          controller.listAssociatedPm!.isEmpty
                                              ? ""
                                              : controller.listAssociatedPm?[0]
                                                      ?.pmId
                                                      .toString() ??
                                                  "";
                                      String jobId =
                                          controller.listAssociatedJobs!.isEmpty
                                              ? ""
                                              : controller
                                                      .listAssociatedJobs![0]
                                                      ?.jobId
                                                      .toString() ??
                                                  '';
                                      // controller
                                      //     .createNewPermit();
                                      Get.dialog(PermitRejectDialog(
                                          permitId: controller
                                              .viewPermitDetailsModel
                                              .value
                                              ?.permitNo,
                                          ptwStatus:
                                              '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                                          jobId: int.tryParse(jobId),
                                          taskId: taskId));
                                    },
                                  )),
                            )
                          : Dimens.box0,

                      // Dimens.boxWidth5,

                      ///Permit cancel by Issuer
                      // varUserAccessModel.value.access_list!
                      //                 .where((e) => e.feature_id == 3 && e.issue == 1)
                      //                 .length >
                      //             0 &&
                      //         controller.viewPermitDetailsModel.value?.ptwStatus == 121
                      //     ? Container(
                      //         height: 45,
                      //         child: CustomElevatedButton(
                      //           backgroundColor: ColorValues.appRedColor,
                      //           text: "Cancel",
                      //           icon: Icons.close,
                      //           onPressed: () {
                      //             // controller
                      //             //     .createNewPermit();
                      //             Get.dialog(PermitCancelByIssuerDialog(
                      //                 permitId:
                      //                     '${controller.viewPermitDetailsModel.value?.permitNo}'));
                      //           },
                      //         ))
                      //     : Container(),

                      /// Permit Cancel By approver & Permit Request
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
                              (controller.viewPermitDetailsModel.value
                                      ?.ptwStatus !=
                                  PermitStatusConstants
                                      .PTW_CANCEL_REQUEST_APPROVED) &&
                              (controller.viewPermitDetailsModel.value
                                      ?.ptwStatus !=
                                  PermitStatusConstants
                                      .PTW_EXTEND_REQUEST_REJECTED) &&
                              (controller.viewPermitDetailsModel.value
                                      ?.ptwStatus !=
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
                                              UserAccessConstants
                                                  .kHaveAddAccess)
                                      .length >
                                  0 &&
                              controller.viewPermitDetailsModel.value
                                      ?.ptwStatus ==
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
                                          isChecked:
                                              controller.isChecked.value);
                                    },
                                  )),
                            )
                          : Dimens.box0,

                      // ////cancel approver
                      // varUserAccessModel.value.access_list!
                      //                 .where((e) =>
                      //                     e.feature_id ==
                      //                         UserAccessConstants.kPermitFeatureId &&
                      //                     e.approve ==
                      //                         UserAccessConstants.kHaveApproveAccess)
                      //                 .length >
                      //             0 &&
                      //         controller.viewPermitDetailsModel.value?.ptwStatus ==
                      //             PermitStatusConstants.PTW_CANCEL_REQUESTED

                      //     //130
                      //     ? Container(
                      //         height: 45,
                      //         child: CustomElevatedButton(
                      //           backgroundColor: ColorValues.appGreenColor,
                      //           text: "Permit Cancel Approve",
                      //           icon: Icons.close,
                      //           onPressed: () {
                      //             // controller
                      //             //     .createNewPermit();
                      //             Get.dialog(PermitCancelByApproverDialog(
                      //               permitId: controller
                      //                   .viewPermitDetailsModel.value?.permitNo,
                      //               ptwStatus:
                      //                   '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                      //             ));
                      //           },
                      //         ),
                      //       )
                      //     : Dimens.box0,
                      // Dimens.boxWidth20,
                      // varUserAccessModel.value.access_list!
                      //                 .where((e) =>
                      //                     e.feature_id ==
                      //                         UserAccessConstants.kPermitFeatureId &&
                      //                     e.approve ==
                      //                         UserAccessConstants.kHaveApproveAccess)
                      //                 .length >
                      //             0 &&
                      //         controller.viewPermitDetailsModel.value?.ptwStatus ==
                      //             PermitStatusConstants.PTW_CANCEL_REQUESTED
                      //     //130
                      //     ? Container(
                      //         height: 45,
                      //         child: CustomElevatedButton(
                      //           backgroundColor: ColorValues.appRedColor,
                      //           text: "Permit Cancel Reject",
                      //           icon: Icons.close,
                      //           onPressed: () {
                      //             // controller
                      //             //     .createNewPermit();
                      //             Get.dialog(PermitCancelRejectDialog(
                      //               permitId: controller
                      //                   .viewPermitDetailsModel.value?.permitNo,
                      //             ));
                      //           },
                      //         ),
                      //       )
                      //     : Dimens.box0

                      // // //Permit Extend Approve
                      // varUserAccessModel.value.access_list!
                      //                 .where((e) => e.feature_id == 3 && e.approve == 0)
                      //                 .length >
                      //             0 &&
                      //         controller.viewPermitDetailsModel.value?.ptwStatus == 133
                      // ?
                      // Container(
                      //         height: 45,
                      //         child: CustomElevatedButton(
                      //           backgroundColor: ColorValues.appGreenColor,
                      //           text: "Extend Approve",
                      //           icon: Icons.expand_outlined,
                      //           onPressed: () {
                      //             // controller
                      //             //     .createNewPermit();
                      //             Get.dialog(PermitExtendDialog(
                      //                 permitId:
                      //                     '${controller.viewPermitDetailsModel.value?.permitNo}'));
                      //           },
                      //         ))
                      // // TableActionButton(
                      // //   color: ColorValues.appDarkBlueColor,
                      // //   icon: Icons.expand_outlined,
                      // //   label: 'Extend Approve',
                      // //   onPress: () {

                      // //     // Get.dialog(PermitExtendDialog(
                      // //     //     permitId:
                      // //     //         '${controller.viewPermitDetailsModel.value?.permitNo}'));
                      // //   },
                      // // )
                      // : Container()
                    ],
                  ),
          )),
    );
  }

//Start Date for mobile
  Future pickDateTime_mobile(BuildContext context) async {
    var dateTime = controller.selectedBreakdownTime.value;
    final date = await pickDate_mobile(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_mobile(context);
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
    controller.selectedBreakdownTime.value = dateTime;
    controller.startDateTimeCtrlr
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate_mobile(BuildContext context) async {
    DateTime? dateTime = controller.selectedBreakdownTime.value;
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

  Future<TimeOfDay?> pickTime_mobile(BuildContext context) async {
    DateTime dateTime = controller.selectedBreakdownTime.value;
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

  // Valid Till for mobile
  Future pickDateTimeTill_mobile(BuildContext context) async {
    var dateTime = controller.selectedValidTillTime.value;
    final date = await pickDateTill_mobile(context);
    if (date == null) {
      return;
    }

    final time = await pickTimeTill_mobile(context);
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
    controller.selectedValidTillTime.value = dateTime;
    controller.validTillTimeCtrlr
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.validTillTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDateTill_mobile(BuildContext context) async {
    DateTime? dateTime = controller.selectedValidTillTime.value;
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

  Future<TimeOfDay?> pickTimeTill_mobile(BuildContext context) async {
    DateTime dateTime = controller.selectedValidTillTime.value;
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

//Start Date and valid Till
  Future pickDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedBreakdownTime.value;
    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context);
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
    controller.selectedBreakdownTime.value = dateTime;
    controller.startDateTimeCtrlr
      ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedBreakdownTime.value;
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

  Future<TimeOfDay?> pickTime_web(BuildContext context) async {
    DateTime dateTime = controller.selectedBreakdownTime.value;
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

  showEquipmentNameAlertBox() {
    return SelectionArea(
      child: StatefulBuilder(builder: ((context, setState) {
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
          content: Builder(builder: (context) {
            return Obx(
              () => Container(
                padding: Dimens.edgeInsets05_0_5_0,
                height: double.infinity,
                width: double.infinity,
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
                        width: MediaQuery.of(context).size.width / 3.5,
                        child: CustomMultiSelectDialogField(
                          buttonText: 'Equipment Name',
                          title: 'Select Equipment Name',
                          initialValue:
                              (controller.selectedEquipmentNameList.isNotEmpty)
                                  ? controller.selectedEquipmentNameIdList
                                  : [],
                          items: controller.equipmentNameList
                              .map(
                                (equipmentName) => MultiSelectItem(
                                  equipmentName?.id,
                                  equipmentName?.name ?? '',
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller
                                .equipmentNameSelected(selectedOptionsList),
                            print(
                                'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                          },
                        ),
                      )
                    ]),
              ),
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
      })),
    );
  }

  AddEmployeeListAlertBox() {
    return SelectionArea(
      child: StatefulBuilder(builder: ((context, setState) {
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
          content: Builder(builder: (context) {
            return Obx(
              () => Container(
                padding: Dimens.edgeInsets05_0_5_0,
                height: double.infinity,
                width: double.infinity,
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
                        width: MediaQuery.of(context).size.width / 3.5,
                        child: CustomMultiSelectDialogField(
                          buttonText: 'Add Employee',
                          title: 'Select Employee',
                          initialValue:
                              (controller.selectedEmployeeNameList.isNotEmpty)
                                  ? controller.selectedEmployeeNameIdList
                                  : [],
                          items: controller.employeeNameList
                              .map(
                                (employeeName) => MultiSelectItem(
                                  employeeName?.id,
                                  employeeName?.name ?? '',
                                ),
                              )
                              .toList(),
                          onConfirm: (selectedOptionsList) => {
                            controller
                                .employeeNameSelected(selectedOptionsList),
                            print(
                                'Employee Name list50: ${controller.selectedEmployeeNameIdList}')
                          },
                        ),
                      )
                    ]),
              ),
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
      })),
    );
  }

  checkBoxMethod(bool isChecked, Function(bool?) onChange) {
    return Checkbox(
      value: isChecked,
      // value: isInitialChecked,
      onChanged: onChange,
    );
  }

  checkBoxMethods(int position) {
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

  // checkBoxInstructionMethod(int position) {
  //   return Checkbox(
  //     value: position == 0
  //         ? controller.isCheckedRequire.value
  //         : position == 1
  //             ? controller.isCheckedRequire1.value
  //             : position == 2
  //                 ? controller.isCheckedRequire2.value
  //                 : position == 3
  //                     ? controller.isCheckedRequire3.value
  //                     : position == 4
  //                         ? controller.isCheckedRequire4.value
  //                         : position == 5
  //                             ? controller.isCheckedRequire5.value
  //                             : position == 6
  //                                 ? controller.isCheckedRequire6.value
  //                                 : position == 7
  //                                     ? controller.isCheckedRequire7.value
  //                                     : position == 8
  //                                         ? controller.isCheckedRequire8.value
  //                                         : position == 9
  //                                             ? controller.isCheckedRequire9.value
  //                                             : null,
  //     onChanged: (bool? value) {
  //       position == 0
  //           ? controller.requiretoggleCheckbox()
  //           : position == 1
  //               ? controller.requiretoggleCheckbox1()
  //               : position == 2
  //                   ? controller.requiretoggleCheckbox2()
  //                   : position == 3
  //                       ? controller.requiretoggleCheckbox3()
  //                       : position == 4
  //                           ? controller.requiretoggleCheckbox4()
  //                           : position == 5
  //                               ? controller.requiretoggleCheckbox5()
  //                               : position == 6
  //                                   ? controller.requiretoggleCheckbox6()
  //                                   : position == 7
  //                                       ? controller.requiretoggleCheckbox7()
  //                                       : position == 8
  //                                           ? controller.requiretoggleCheckbox8()
  //                                           : position == 9
  //                                               ? controller.requiretoggleCheckbox9()
  //                                               : null;
  //     },
  //   );
  // }
}
