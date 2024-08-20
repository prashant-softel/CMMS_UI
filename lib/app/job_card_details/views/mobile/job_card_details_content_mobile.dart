import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_card_details/views/widgets/tbt_done_dialog.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/job_card_approve_dialog.dart';
import 'package:cmms/app/widgets/job_card_reject_dialog.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/file_upload_controller.dart';
import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../../widgets/custom_divider.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/file_upload_details_widget_mobile.dart';
import '../../../widgets/file_upload_with_dropzone_widget.dart';
import '../../../widgets/history_table_widget_mobile.dart';
import '../../job_card_details_controller.dart';
import '../widgets/employee_table_widget.dart';
import '../widgets/isolated_assets_widget.dart';
import '../widgets/loto_applied_assets_widget.dart';
import '../widgets/transposed_table.dart';

class JobCardDetailsContentMobile extends GetView<JobCardDetailsController> {
  JobCardDetailsContentMobile({super.key});

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Container(
          height: Get.height,
          padding: Dimens.edgeInsets10,
          decoration: BoxDecoration(
            color: ColorValues.whiteColor,
            border: Border.all(
              color: ColorValues.appDarkBlueColor,
              style: BorderStyle.solid,
              width: 3,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TABLE - PLANT DETAILS
                Row(
                  children: [
                    Text('Plant Details', style: Styles.blackBold16),
                  ],
                ),
                TransposedTable(controller.plantDetails),
                Dimens.boxHeight20,

                // TABLE - JOB DETAILS
                Row(
                  children: [
                    Text('Job Details', style: Styles.blackBold16),
                  ],
                ),
                TransposedTable(controller.jobDetails),
                Dimens.boxHeight20,
                // TABLE - PERMIT DETAILS
                Row(
                  children: [
                    Text('Permit Details', style: Styles.blackBold16),
                  ],
                ),
                TransposedTable(controller.permitDetails),
                Dimens.boxHeight20,
                // ISOLATED ASSETS TABLE WIDGET
                (controller.isolationAssetsCategoryList.isNotEmpty)
                    ? IsolatedAssetsWidget()
                    : Dimens.boxHeight0,
                // LOTO APPLIED ASSETS TABLE WIDGET
                (controller.lotoAppliedAssets.isNotEmpty)
                    ? LotoAppliedAssetsWidget()
                    : Dimens.boxHeight20,
                CustomDivider(),
                Row(
                  children: [
                    Text(
                      "Team Deployed to Carry Out Job",
                      style: Styles.blue700,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.addEmployeesDeployed();
                      },
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: ColorValues.addNewColor,
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            " + Add ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight5,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.employeesDeployed.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromARGB(255, 232, 239, 242),
                      elevation: 10,
                      shadowColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: controller.employeesDeployed[index]
                              .map<Widget>((mapData) {
                            return Column(
                              children: [
                                (mapData['key'] == "Employee Name")
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Employee Name:"),
                                          Dimens.boxHeight2,
                                          DropdownWebWidget(
                                            dropdownList:
                                                controller.employeeList,
                                            selectedValue: mapData["value"],
                                            onValueChanged:
                                                (list, selectedValue) {
                                              mapData["value"] = selectedValue;
                                              controller.deployedEmployeeMapperData[
                                                      selectedValue] =
                                                  list.firstWhere(
                                                (element) =>
                                                    element.name ==
                                                    selectedValue,
                                                orElse: null,
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    : (mapData['key'] == "Designation")
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Responsibility: "),
                                                Dimens.boxWidth2,
                                                Obx(
                                                  () {
                                                    final employeeName = controller
                                                            .employeesDeployed[
                                                        index][0]['value'];
                                                    final designation = controller
                                                            .deployedEmployeeMapperData[
                                                                employeeName]
                                                            ?.designation ??
                                                        "No Designation";
                                                    return Text(designation);
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        : (mapData['key'] == "Action")
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TableActionButton(
                                                    color:
                                                        ColorValues.appRedColor,
                                                    icon: Icons.delete,
                                                    label: '',
                                                    message: '',
                                                    onPress: () {
                                                      controller
                                                          .employeesDeployed
                                                          .removeAt(index);
                                                    },
                                                  )
                                                ],
                                              )
                                            : Text(
                                                mapData['key'] ?? '',
                                              ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                Dimens.boxHeight20,
                CustomDivider(),
                Row(
                  children: [
                    Text(
                      "Material Used For ",
                      style: Styles.blue700,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.addRowItem();
                      },
                      child: Container(
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: ColorValues.addNewColor,
                          border: Border.all(
                            color: ColorValues.lightGreyColorWithOpacity35,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            " + Add ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight5,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.rowItem.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromARGB(255, 232, 239, 242),
                      elevation: 10,
                      shadowColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              controller.rowItem[index].map<Widget>((mapData) {
                            return Column(
                              children: [
                                (mapData['key'] == "Drop_down")
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Material Name:"),
                                          Dimens.boxHeight2,
                                          DropdownWebWidget(
                                            dropdownList: controller.cmmrsItems,
                                            selectedValue: mapData["value"],
                                            onValueChanged:
                                                (list, selectedValue) {
                                              mapData["value"] = selectedValue;
                                              controller.dropdownMapperData[
                                                      selectedValue] =
                                                  list.firstWhere(
                                                (element) =>
                                                    element.name ==
                                                    selectedValue,
                                                orElse: null,
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    : (mapData['key'] == "Drop_down_eq")
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Equipment: "),
                                              Dimens.boxHeight2,
                                              DropdownWebWidget(
                                                dropdownList: controller
                                                    .workingAreaList!
                                                    .where((p0) {
                                                      return !controller.rowItem
                                                          .map((p0) =>
                                                              p0[0]["value"])
                                                          .contains(p0.name);
                                                    })
                                                    .toList()
                                                    .obs,
                                                selectedValue: mapData["value"],
                                                onValueChanged:
                                                    (list, selectedValue) {
                                                  mapData["value"] =
                                                      selectedValue;
                                                  controller.dropdownMapperDataworkingArea[
                                                          selectedValue] =
                                                      list.firstWhere(
                                                    (element) =>
                                                        element.name ==
                                                        selectedValue,
                                                    orElse: null,
                                                  );
                                                },
                                              ),
                                            ],
                                          )
                                        : (mapData['key'] == "Sr_No")
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Sr No: "),
                                                    Dimens.boxWidth2,
                                                    Obx(
                                                      () {
                                                        final material =
                                                            controller.rowItem[
                                                                    index][0]
                                                                ['value'];
                                                        final serial_number = controller
                                                                .dropdownMapperData[
                                                                    material]
                                                                ?.serial_number ??
                                                            "";
                                                        return Text(
                                                            serial_number);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : (mapData['key'] == "code")
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 10,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("MDM Code: "),
                                                        Dimens.boxWidth2,
                                                        Obx(
                                                          () {
                                                            final material =
                                                                controller.rowItem[
                                                                        index][
                                                                    0]['value'];
                                                            final asset_MDM_code = controller
                                                                    .dropdownMapperData[
                                                                        material]
                                                                    ?.asset_MDM_code ??
                                                                "";
                                                            return Text(
                                                                asset_MDM_code);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : (mapData['key'] ==
                                                        "Material_Type")
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 10,
                                                        ),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "Material Type: "),
                                                            Dimens.boxWidth2,
                                                            Obx(
                                                              () {
                                                                final material =
                                                                    controller.rowItem[
                                                                            index][0]
                                                                        [
                                                                        'value'];
                                                                final asset_type = controller
                                                                        .dropdownMapperData[
                                                                            material]
                                                                        ?.asset_type ??
                                                                    "";
                                                                return Text(
                                                                    asset_type);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : (mapData['key'] ==
                                                            "Issued_Qty")
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 10,
                                                            ),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "Issued Qty: "),
                                                                Dimens
                                                                    .boxWidth2,
                                                                Obx(
                                                                  () {
                                                                    final material =
                                                                        controller.rowItem[index][0]
                                                                            [
                                                                            'value'];
                                                                    final issued_qty =
                                                                        controller.dropdownMapperData[material]?.issued_qty ??
                                                                            "";
                                                                    return Text(
                                                                      issued_qty
                                                                          .toString(),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        : (mapData['key'] ==
                                                                "Used_Qty")
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 10,
                                                                ),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        "Used Qty: "),
                                                                    Dimens
                                                                        .boxWidth2,
                                                                    Obx(
                                                                      () {
                                                                        final material =
                                                                            controller.rowItem[index][0]['value'];
                                                                        final used_qty =
                                                                            controller.dropdownMapperData[material]?.used_qty ??
                                                                                "";
                                                                        return Text(
                                                                            used_qty.toString());
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            : (mapData['key'] ==
                                                                    "Consumed_Qty")
                                                                ? Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "Consumed Qty:"),
                                                                      Dimens
                                                                          .boxHeight2,
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
                                                                            inputFormatters: <TextInputFormatter>[
                                                                              FilteringTextInputFormatter.digitsOnly
                                                                            ],
                                                                            maxLine:
                                                                                1,
                                                                            textController:
                                                                                new TextEditingController(text: mapData["value"] ?? ''),
                                                                            onChanged:
                                                                                (txt) {
                                                                              mapData["value"] = txt;
                                                                            },
                                                                          ))
                                                                    ],
                                                                  )
                                                                : (mapData['key'] ==
                                                                        "Action ")
                                                                    ? Column(
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
                                                                              controller.rowItem.removeAt(index);
                                                                            },
                                                                          )
                                                                        ],
                                                                      )
                                                                    : Text(
                                                                        mapData['key'] ??
                                                                            '',
                                                                      ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                Dimens.boxHeight20,
                CustomDivider(),
                // FILE UPLOAD WIDGET
                (Text('File Upload', style: Styles.blackBold16)),
                Container(
                  width: Get.width,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FileUploadWidgetWithDropzone(),
                        Dimens.boxHeight10,
                        Flexible(
                          child: FileUploadDetailsWidgetMobile(),
                        ),
                      ],
                    ),
                  ),
                ),
                Dimens.boxHeight10,
                CustomDivider(),

                ///HISTORY
                Text('History', style: Styles.blackBold16),
                (controller.historyList != null &&
                        controller.historyList!.isNotEmpty)
                    ? ListView.builder(
                        //physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.historyList! != null
                            ? controller.historyList!.length
                            : 0,
                        itemBuilder: (context, index) {
                          final historyList = (controller.historyList! != null)
                              ? controller.historyList![index]
                              : HistoryModel();
                          return Card(
                            color: Colors.lightBlue.shade50,
                            elevation: 10,
                            shadowColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      Text('Time Stamp: ',
                                          style: Styles.appDarkGrey12),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                            '${historyList?.createdAt?.result}'
                                            '',
                                            style: Styles.appDarkBlue12),
                                      ),
                                    ]),
                                    Row(//
                                        children: [
                                      Text('Posted By: ',
                                          style: Styles.appDarkGrey12),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                            historyList?.createdByName ?? '',
                                            style: Styles.appDarkBlue12),
                                      )
                                    ]),
                                    Row(children: [
                                      Text('Comments: ',
                                          style: Styles.appDarkGrey12),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                            "${historyList?.comment ?? ''}",
                                            style: Styles.appDarkBlue12),
                                      )
                                    ]),
                                    Row(children: [
                                      Text('Status: ',
                                          style: Styles.appDarkGrey12),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                            "${historyList?.status_name ?? ''}",
                                            style: Styles.appDarkBlue12),
                                      )
                                    ]),
                                  ]),
                            ),
                          );
                        })
                    : Text('No Data'),
                Dimens.boxHeight10,

                /// DESCRIPTION OF WORK DONE
                Wrap(
                  children: [
                    Text('Description of work done: '),
                    SizedBox(
                      width: Get.width * .95,
                      child: TextField(
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 16.0,
                            height: 1.0,
                            color: Colors.black,
                          ),
                        ),
                        controller: controller.descriptionOfWorkDoneCtrlr,
                        // enabled: controller.isJobCardStarted.value,
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorValues.appLightGreyColor,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorValues.appLightBlueColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorValues.appLightBlueColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        // keyboardType: TextInputType.multiline,
                        minLines: 5,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight20,

                /// START JOB CARD BUTTON
                controller.jobCardDetailsModel.value!.status == 151 &&
                        controller.permitList
                                ?.firstWhere(
                                    (element) => element.permitId != null)
                                .status ==
                            125
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomElevatedButton(
                            text: 'Start Job Card',
                            onPressed: () {
                              var employeesNotDeployed =
                                  controller.employeesDeployed.value.length ==
                                      0;
                              bool anyEmployeeNotSelected = false;
                              if (employeesNotDeployed == false) {
                                anyEmployeeNotSelected = controller
                                    .employeesDeployed.value
                                    .any((employeeList) => employeeList.any(
                                        (employee) =>
                                            employee['key'] ==
                                                "Employee Name" &&
                                            employee['value'] ==
                                                "Please Select"));
                              }

                              var permitCondition = controller.permitList
                                      ?.firstWhere(
                                          (element) => element.permitId != null)
                                      .tbTDoneCheck ==
                                  1;

                              if ((permitCondition &&
                                      anyEmployeeNotSelected == true &&
                                      employeesNotDeployed == false ||
                                  permitCondition &&
                                      employeesNotDeployed == true)) {
                                Get.defaultDialog(
                                  radius: 5,
                                  title: 'Alert',
                                  middleText: 'Please select team members!',
                                  textConfirm: 'OK',
                                  onConfirm: () {
                                    Get.back(); // Close the dialog
                                  },
                                  buttonColor: ColorValues.appGreenColor,
                                  confirmTextColor: Colors.white,
                                );
                              } else if ((controller.permitList
                                          ?.firstWhere((element) =>
                                              element.permitId != null)
                                          .tbTDoneCheck ==
                                      1) &&
                                  // employeesNotDeployed == true &&
                                  anyEmployeeNotSelected == false &&
                                  employeesNotDeployed == false) {
                                controller.startJobCard(
                                  jcCard: controller.jobCardId.value,
                                  fileIds: dropzoneController.fileIds,
                                );
                              } else if (controller.permitList
                                      ?.firstWhere(
                                          (element) => element.permitId != null)
                                      .tbTDoneCheck ==
                                  0) {
                                Get.dialog<void>(TbtDoneBMDialog(
                                  ptw_id: controller
                                          .jobCardDetailsModel.value?.ptwId ??
                                      0,
                                  id: controller
                                          .jobCardDetailsModel.value?.id ??
                                      0,
                                ));
                              }
                            },
                            // => controller.createJobCard(),
                            backgroundColor: ColorValues.appGreenColor,
                          ),
                          Dimens.boxWidth10,
                        ],
                      )
                    : controller.jobCardDetailsModel.value!.status == 157 ||
                            controller.jobCardDetailsModel.value!.status ==
                                152 ||
                            controller.jobCardDetailsModel.value!.status == 154
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  CustomElevatedButton(
                                    text: 'Cancel',
                                    onPressed: () =>
                                        controller.startStopJobCard(),
                                    backgroundColor: ColorValues.appRedColor,
                                  ),
                                  SizedBox(width: 10),
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kJobCardFeatureId &&
                                                  e.edit ==
                                                      UserAccessConstants
                                                          .kHaveEditAccess)
                                              .length >
                                          0
                                      ? CustomElevatedButton(
                                          text: 'Update',
                                          onPressed: () async {
                                            bool? confirmed =
                                                await showConfirmationDialog(
                                              context,
                                              'Are you sure you want to Update job ?',
                                            );
                                            if (confirmed == true) {
                                              controller.updateJobCard(
                                                  fileIds: dropzoneController
                                                      .fileIds);
                                              if (controller.listMrsByTaskId!
                                                          .value
                                                          .firstWhereOrNull(
                                                            (element) =>
                                                                element?.jobCardId !=
                                                                    0 ||
                                                                element?.pmId !=
                                                                    0,
                                                          )
                                                          ?.mrs_return_ID ==
                                                      0 &&
                                                  controller.allTrue.value ==
                                                      false &&
                                                  controller
                                                      .cmmrsItems!.isNotEmpty) {
                                                controller.transferItem();
                                              }
                                              Text(
                                                  'Are you sure you want to Update job ?');
                                            }
                                          },
                                          backgroundColor:
                                              ColorValues.appYellowColor,
                                        )
                                      : Dimens.box0,
                                  SizedBox(width: 10),
                                  varUserAccessModel.value.access_list!
                                              .where((e) =>
                                                  e.feature_id ==
                                                      UserAccessConstants
                                                          .kJobCardFeatureId &&
                                                  e.add ==
                                                      UserAccessConstants
                                                          .kHaveAddAccess)
                                              .length >
                                          0
                                      ? CustomElevatedButton(
                                          text: 'Close Job',
                                          onPressed: () async {
                                            bool? confirmed =
                                                await showConfirmationDialog(
                                              context,
                                              'Are you sure you want to Close Job ?',
                                            );
                                            if (confirmed == true) {
                                              if (controller.listMrsByTaskId !=
                                                      null &&
                                                  controller.listMrsByTaskId!
                                                      .isNotEmpty) {
                                                var element = controller
                                                    .listMrsByTaskId!
                                                    .firstWhereOrNull(
                                                        (element) => (element!
                                                                    .jobCardId !=
                                                                0 ||
                                                            element.pmId != 0));
                                                if (element != null &&
                                                    element.mrs_return_ID ==
                                                        0 &&
                                                    controller.allTrue.value ==
                                                        false) {
                                                  Get.defaultDialog(
                                                    radius: 5,
                                                    title: 'Alert',
                                                    middleText:
                                                        'Please return all items first!',
                                                    textConfirm: 'OK',
                                                    onConfirm: () {
                                                      Get.back();
                                                    },
                                                    buttonColor: ColorValues
                                                        .appGreenColor,
                                                    confirmTextColor:
                                                        Colors.white,
                                                  );
                                                } else {
                                                  controller.closeJob(
                                                    fileIds: dropzoneController
                                                        .fileIds,
                                                  );
                                                }
                                              } else {
                                                controller.closeJob(
                                                  fileIds: dropzoneController
                                                      .fileIds,
                                                );
                                              }
                                              Text(
                                                  'Are you sure you want to Close Job ?');
                                            }
                                          },
                                          backgroundColor:
                                              ColorValues.appGreenColor,
                                        )
                                      : Dimens.box0,
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CustomElevatedButton(
                                    backgroundColor:
                                        ColorValues.appLightBlueColor,
                                    text: 'Carry Forward Job',
                                    onPressed: () async {
                                      bool? confirmed =
                                          await showConfirmationDialog(
                                        context,
                                        'Are you sure you want to Carry Forward Job ?',
                                      );
                                      if (confirmed == true) {
                                        // Check if the listMrsByTaskId is not null and is not empty
                                        if (controller.listMrsByTaskId !=
                                                null &&
                                            controller
                                                .listMrsByTaskId!.isNotEmpty) {
                                          // Find the first element that meets the condition
                                          var element = controller
                                              .listMrsByTaskId!
                                              .firstWhereOrNull(
                                            (element) =>
                                                (element!.jobCardId != 0 ||
                                                    element.pmId != 0),
                                          );
                                          if (element != null &&
                                              element.mrs_return_ID == 0 &&
                                              controller.allTrue.value ==
                                                  false) {
                                            Get.defaultDialog(
                                              radius: 5,
                                              title: 'Alert',
                                              middleText:
                                                  'Please return all items first!',
                                              textConfirm: 'OK',
                                              onConfirm: () {
                                                Get.back();
                                              },
                                              buttonColor:
                                                  ColorValues.appGreenColor,
                                              confirmTextColor: Colors.white,
                                            );
                                          } else {
                                            controller.carryForwardJob(
                                              fileIds:
                                                  dropzoneController.fileIds,
                                            );
                                          }
                                        } else {
                                          controller.carryForwardJob(
                                              fileIds:
                                                  dropzoneController.fileIds);
                                        }
                                        Text(
                                            'Are you sure you want to Close Job ?');
                                      }
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  controller.listMrsByTaskId!.value
                                                  .firstWhereOrNull(
                                                    (element) =>
                                                        element?.jobCardId !=
                                                            0 ||
                                                        element?.pmId != 0,
                                                  )
                                                  ?.mrs_return_ID ==
                                              0 &&
                                          controller.allTrue.value == false
                                      ? CustomElevatedButton(
                                          icon: Icons.keyboard_return_outlined,
                                          backgroundColor:
                                              ColorValues.linktopermitColor,
                                          text: "Return Mrs",
                                          onPressed: () {
                                            controller.getMrsListByModule(
                                                jobId: controller
                                                        .jobCardDetailsModel
                                                        .value
                                                        ?.jobId ??
                                                    0);
                                            Get.toNamed(
                                              Routes.mrsReturnScreen,
                                              arguments: {
                                                'type': 1,
                                                'jobId': controller.jobId.value,
                                                "whereUsed": 4,
                                                "fromActorTypeId": 4,
                                                "to_actor_type_id": 2,
                                                "pmTaskId":
                                                    controller.jobCardId.value,
                                                "activity": controller
                                                    .jobDetailsModel
                                                    .value
                                                    ?.jobTitle,
                                                "mrsId": controller
                                                        .listMrsByTaskId!
                                                        .firstWhere(
                                                            (element) =>
                                                                element
                                                                    ?.mrsId !=
                                                                0,
                                                            orElse: null)!
                                                        .mrsId ??
                                                    0
                                              },
                                            );
                                          },
                                        )
                                      : Dimens.box0,
                                ],
                              ),
                            ],
                          )
                        : controller.jobCardDetailsModel.value!.status == 153
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //
                                children: [
                                  CustomElevatedButton(
                                    text: 'Cancel',
                                    onPressed: () =>
                                        controller.startStopJobCard(),
                                    backgroundColor: ColorValues.appRedColor,
                                  ),
                                  SizedBox(width: 10),
                                  CustomElevatedButton(
                                    backgroundColor: ColorValues.appYellowColor,
                                    text: 'Update',
                                    onPressed: () async {
                                      bool? confirmed =
                                          await showConfirmationDialog(
                                        context,
                                        'Are you sure you want to Update job ?',
                                      );
                                      if (confirmed == true) {
                                        controller.updateJobCard(
                                            fileIds:
                                                dropzoneController.fileIds);
                                        Text(
                                            'Are you sure you want to Update job ?');
                                      }
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id == 4 &&
                                                      e.approve == 1)
                                                  .length >
                                              0 &&
                                          controller.jobCardDetailsModel.value!
                                                  .status ==
                                              153
                                      ? Container(
                                          height: 30,
                                          child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appGreenColor,
                                            text: "Approve",
                                            icon: Icons.check,
                                            onPressed: () {
                                              Get.dialog(
                                                JobCardApproveDialog(
                                                  JobCardId:
                                                      '${controller.jobCardId.value}',
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(width: 10),
                                  varUserAccessModel.value.access_list!
                                                  .where((e) =>
                                                      e.feature_id == 4 &&
                                                      e.approve == 1)
                                                  .length >
                                              0 &&
                                          controller.jobCardDetailsModel.value!
                                                  .status ==
                                              153
                                      ? Container(
                                          height: 30,
                                          child: CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.rejectColor,
                                            text: "Reject",
                                            icon: Icons.add,
                                            onPressed: () {
                                              Get.dialog(
                                                JobCardRejectDialog(
                                                  JobCardId:
                                                      '${controller.jobCardId.value}',
                                                ),
                                              );
                                            },
                                          ))
                                      : Container(),
                                ],
                              )
                            : controller.jobCardDetailsModel.value!.status ==
                                    156
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.appGreenColor,
                                          text: "Approve",
                                          icon: Icons.check,
                                          onPressed: () {
                                            Get.dialog(
                                              JobCardApproveDialog(
                                                JobCardId:
                                                    '${controller.jobCardId.value}',
                                                type: 1,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 30,
                                        child: CustomElevatedButton(
                                          backgroundColor:
                                              ColorValues.rejectColor,
                                          text: "Reject",
                                          icon: Icons.add,
                                          onPressed: () {
                                            Get.dialog(
                                              JobCardRejectDialog(
                                                JobCardId:
                                                    '${controller.jobCardId.value}',
                                                type: 1,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  )
                                : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> showConfirmationDialog(
      BuildContext context, String message) async {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
