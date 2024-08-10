import 'package:cmms/app/add_incident_report/add_incident_report_controller.dart';
import 'package:cmms/app/add_incident_report/view/detailsOfInjuredPersonMobile.dart';
import 'package:cmms/app/add_incident_report/view/web/detailsOfOtherInjuredPersonMobile.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textFieldMobile.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_mobile.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// class IRMobile extends StatefulWidget {
//   IRMobile({Key? key}) : super(key: key);
//   final FileUploadController dropzoneController =
//       Get.put(FileUploadController());

//   @override
//   _IRMobileState createState() => _IRMobileState();
// }

// class _IRMobileState extends State<IRMobile> {
//   @override

class IRMobile extends GetView<AddIncidentReportController> {
  IRMobile({super.key});

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddIncidentReportController>(
      id: "module-cleaning-mobile",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Dimens.boxHeight5,
                  HeaderWidgetMobile(),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Incident Report",
                          style: Styles.blackBold18,
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.lightBlue.shade50,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: Get.height * .8,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRichTextMobile(
                              title: "Title: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              textController: controller.titleTextCtrlr,
                              errorText: controller.isTitleTextInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isTitleTextInvalid.value = false;
                                } else {
                                  controller.isTitleTextInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Incident Description: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              textController:
                                  controller.incidentreportDescriptionCtrlr,
                              errorText:
                                  controller.isIncidentDescriptionInvalid.value
                                      ? "Required field"
                                      : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isIncidentDescriptionInvalid
                                      .value = false;
                                } else {
                                  controller.isIncidentDescriptionInvalid
                                      .value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Type of Incident: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller.incidentrisktypeList,
                                  isValueSelected:
                                      controller.isRiskTypeListSelected.value,
                                  selectedValue:
                                      controller.selectedRiskTypeList.value,
                                  onValueChanged:
                                      controller.onValuetypeincidentChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Incident date & Time: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.text,
                              textController: controller
                                  .startDateTimeCtrlr, // For Incident Date & Time
                              errorText: controller.isDateInvalid.value
                                  ? "Required field"
                                  : null,
                              onTap: () {
                                controller.pickDateTime_web(context);
                              },
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isDateInvalid.value = false;
                                } else {
                                  controller.isDateInvalid.value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Asset Restoration Action Taken By: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller
                                      .assetRestorationActionTakenByList,
                                  isValueSelected: controller
                                      .isAssetRestorationActionTakenByListSelected
                                      .value,
                                  selectedValue: controller
                                      .selectedAssetRestorationActionTakenByList
                                      .value,
                                  onValueChanged: controller
                                      .onValueAssetRestorationActionTakenByChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Damaged Asset Cost Approx: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textController:
                                  controller.damagedAssetCostTextCtrlr,
                              errorText:
                                  controller.isDamagedAssetCostTextInvalid.value
                                      ? "Required field"
                                      : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isDamagedAssetCostTextInvalid
                                      .value = false;
                                } else {
                                  controller.isDamagedAssetCostTextInvalid
                                      .value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Gen Loss Due To Asset Damage: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textController:
                                  controller.genLossAssetDamageTextCtrlr,
                              errorText: controller
                                      .isGenLossAssetDamageTextInvalid.value
                                  ? "Required field"
                                  : null,
                              onChanged: (value) {
                                if (value.trim().length > 0) {
                                  controller.isGenLossAssetDamageTextInvalid
                                      .value = false;
                                } else {
                                  controller.isGenLossAssetDamageTextInvalid
                                      .value = true;
                                }
                              },
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Location: ",
                            ),
                            Dimens.boxHeight2,
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () => DropdownWebWidget(
                                  dropdownList: controller.blockList,
                                  isValueSelected:
                                      controller.isBlockSelected.value,
                                  selectedValue: controller.selectedBlock.value,
                                  onValueChanged: controller.onValueChanged,
                                ),
                              ),
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Incident Severity: ",
                            ),
                            Dimens.boxHeight2,
                            Wrap(
                              children: [
                                buildRadioButton('Critical', Colors.red,
                                    Colors.white, context, controller),
                                buildRadioButton('High', Colors.orange,
                                    Colors.white, context, controller),
                                buildRadioButton('Medium', Colors.yellow,
                                    Colors.white, context, controller),
                                buildRadioButton('Low', Colors.green,
                                    Colors.white, context, controller),
                              ],
                            ),
                            Dimens.boxHeight15,
                            CustomRichTextMobile(
                              title: "Asset Restoration Date & Time: ",
                            ),
                            Dimens.boxHeight2,
                            CustomTextfieldMobile(
                              width: MediaQuery.of(context).size.width / 1.1,
                              keyboardType: TextInputType.text,
                              textController:
                                  controller.actionTakenDateTimeCtrlr,
                              onTap: () {
                                controller.pickActionTakenDateTime_web(
                                    context, 0);
                              },
                            ),
                            Dimens.boxHeight15,
                            Row(
                              children: [
                                CustomRichTextMobile(
                                  includeAsterisk: false,
                                  title: "ESI Applicability Remark: ",
                                ),
                                Dimens.boxWidth2,
                                Obx(
                                  () => Switch(
                                    activeColor: Colors.green,
                                    value:
                                        controller.esiApplicabilityValue.value,
                                    onChanged: (value) {
                                      controller.esiApplicabilityValue.value =
                                          value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight2,
                            controller.esiApplicabilityValue == true
                                ? CustomTextfieldMobile(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    textController: controller
                                        .ESIApplicabilityRemarkTextCtrlr,
                                  )
                                : Container(),
                            // Dimens.boxHeight2,

                            Row(
                              children: [
                                CustomRichTextMobile(
                                  includeAsterisk: false,
                                  title: "Legal Applicability Remark: ",
                                ),
                                Dimens.boxWidth2,
                                Obx(
                                  () => Switch(
                                    activeColor: Colors.green,
                                    value: controller
                                        .legalApplicabilityValue.value,
                                    onChanged: (value) {
                                      controller.legalApplicabilityValue.value =
                                          value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight2,
                            controller.legalApplicabilityValue == true
                                ? CustomTextfieldMobile(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    textController: controller
                                        .legalApplicabilityRemarkTextCtrlr,
                                  )
                                : Container(),
                            Dimens.boxHeight2,
                            Row(
                              children: [
                                CustomRichTextMobile(
                                  includeAsterisk: false,
                                  title: "Insurance Applicable: ",
                                ),
                                Dimens.boxWidth2,
                                Obx(
                                  () => Switch(
                                    activeColor: Colors.green,
                                    value: controller
                                        .insuranceApplicableValue.value,
                                    onChanged: (value) {
                                      controller.insuranceApplicableValue
                                          .value = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Dimens.boxHeight2,
                            controller.insuranceApplicableValue == true
                                ? CustomTextfieldMobile(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    textController:
                                        controller.insuranceAvailableTextCtrlr,
                                  )
                                : Container(),
                            Dimens.boxHeight15,
                            DetailsOfInjuredPersonMobile(),
                            Dimens.boxHeight2,
                            Row(
                              children: [
                                CustomRichTextMobile(
                                  includeAsterisk: false,
                                  title: "Other Injured Person: ",
                                ),
                                Dimens.boxWidth2,
                                Obx(
                                  () => Switch(
                                    activeColor: Colors.green,
                                    value: controller.isToggleOn.value,
                                    onChanged: (value) {
                                      controller.isToggleOn.value = value;
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Divider(
                              thickness: 2,
                              color: ColorValues.greyLightColour,
                            ),
                            controller.isToggleOn.value
                                ? DetailsOfOtherInjuredPersonMobile()
                                : Container(),

                            Dimens.boxHeight15,

                            Text(
                              "Investigation",
                              style: Styles.blue700,
                            ),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "What task or type of job was being performed",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 1),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "Was the person involved in these activities trained and if so, when?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 2),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "Was the person authorized/licensed to carry out that type of work / use machinery?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 3),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "What instructions had been given? By Whom?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 4),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "What safety equipment and /protection was used/ available?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 5),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "Were correct safe procedures being observed?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 6),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "What unsafe condition contributed to the incident?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 7),
                            Dimens.boxHeight15,

                            CustomRichTextMobile(
                              includeAsterisk: false,
                              title:
                                  "Did unsafe act/s cause the incident? If yes. Mention the same?",
                            ),
                            Dimens.boxHeight3,
                            investigationTextfields(context, controller, 8),
                            Dimens.boxHeight15,
                            FileUploadWidgetWithDropzone(),
                            Dimens.boxHeight15,
                            FileUploadDetailsWidgetMobile(),
                            Dimens.boxHeight15,
                            controller.irId.value > 0 &&
                                    controller.incidentReportDetailsModel.value!
                                            .fileList!.length >
                                        0
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: DataTable2(
                                          border: TableBorder.all(
                                            color: Color.fromARGB(
                                                255, 206, 229, 234),
                                          ),
                                          dataRowHeight: 40,
                                          columns: [
                                            DataColumn2(
                                              fixedWidth: Get.width * .6,
                                              label: Text(
                                                "File Description",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              fixedWidth: Get.width * .2,
                                              label: Text(
                                                "Action",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.fileList?.length ?? 0,
                                            (index) => DataRow(
                                              cells: [
                                                DataCell(
                                                  Text(
                                                    controller.fileList![index]
                                                            ?.description
                                                            .toString() ??
                                                        '',
                                                  ),
                                                ),
                                                DataCell(
                                                  Wrap(
                                                    children: [
                                                      TableActionButton(
                                                        color: ColorValues
                                                            .appDarkBlueColor,
                                                        icon: Icons.visibility,
                                                        message: 'view',
                                                        onPress: () async {
                                                          // String baseUrl =
                                                          //     "http://65.0.20.19/CMMS_API/";
                                                          String baseUrl =
                                                              'http://172.20.43.9:83/';
                                                          String fileName =
                                                              controller
                                                                      .fileList![
                                                                          index]
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
                                                          // String baseUrl = 'http://172.20.43.9:83/';
                                                        },
                                                      ),
                                                      // controller.incidentReportDetailsModel
                                                      //             .value!.ptwStatus ==
                                                      //         125
                                                      //     ? Dimens.box0
                                                      //     :
                                                      TableActionButton(
                                                        color: ColorValues
                                                            .deleteColor,
                                                        icon: Icons
                                                            .delete_outline_outlined,
                                                        message: 'remove',
                                                        onPress: () {
                                                          controller.removeImage(
                                                              controller
                                                                  .fileList![
                                                                      index]
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
                                  )
                                : Dimens.box0,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                CustomElevatedButton(
                                  backgroundColor: ColorValues.appRedColor,
                                  onPressed: () {
                                    Get.offAndToNamed(
                                        Routes.incidentReportListWeb);
                                  },
                                  text: 'Cancel',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                controller.incidentReportDetailsModel.value
                                                ?.status ==
                                            182 ||
                                        controller.incidentReportDetailsModel
                                                .value?.status ==
                                            181
                                    ? CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appDarkBlueColor,
                                        onPressed: () {
                                          // showAlertDialog();
                                          controller.updateIncidentReport(
                                              fileIds:
                                                  dropzoneController.fileIds);
                                        },
                                        text: 'Update',
                                      )
                                    : Dimens.box0,
                                controller.irId.value == 0
                                    ? CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appGreenColor,
                                        onPressed: () {
                                          // showAlertDialog();
                                          controller.isFormInvalid.value =
                                              false;
                                          controller.createIncidentReport(
                                              fileIds:
                                                  dropzoneController.fileIds);
                                        },
                                        text: 'Submit',
                                      )
                                    : Dimens.box0,
                                SizedBox(
                                  width: 10,
                                ),
                                controller.incidentReportDetailsModel.value
                                            ?.status_short ==
                                        "Rejected"
                                    ? CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appGreenColor,
                                        onPressed: () {
                                          // showAlertDialog();
                                          controller.createIncidentReport(
                                              fileIds:
                                                  dropzoneController.fileIds);
                                        },
                                        text: 'Re-Submit',
                                      )
                                    : Container(),
                                controller.incidentReportDetailsModel.value
                                                ?.status ==
                                            183 ||
                                        controller.incidentReportDetailsModel
                                                .value?.status ==
                                            185
                                    ? CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appDarkBlueColor,
                                        onPressed: () {
                                          // showAlertDialog();
                                          controller.updateIRSecondStep(
                                              fileIds:
                                                  dropzoneController.fileIds);
                                        },
                                        text: 'Update IR',
                                      )
                                    : Dimens.box0,
                              ],
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
        );
      },
    );
  }
}

Widget buildRadioButton(String severity, Color color, Color textColor,
    BuildContext context, AddIncidentReportController controller) {
  return Obx(() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width / 2.5,
      child: Row(
        children: [
          Radio<String>(
            value: severity,
            groupValue: controller.selectedSeverity.value,
            onChanged: (value) {
              controller.setSelectedSeverity(value!);
              print('Incident Severity: ${controller.selectedSeverity.value}');
            },
            activeColor: color,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                severity,
                style: TextStyle(color: textColor, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  });
}

investigationTextfields(BuildContext context,
    AddIncidentReportController controller, int position) {
  return CustomTextfieldMobile(
    width: MediaQuery.of(context).size.width / 1.1,
    textController: position == 1
        ? controller.typeOfJbTextCtrlr
        : position == 2
            ? controller.personInvolvedTextCtrlr
            : position == 3
                ? controller.personAuthorizedInvolvedTextCtrlr
                : position == 4
                    ? controller.instructionsTextCtrlr
                    : position == 5
                        ? controller.SafetyEquipmetsTextCtrlr
                        : position == 6
                            ? controller.correctSafeTextCtrlr
                            : position == 7
                                ? controller.unsafeConditionsTextCtrlr
                                : position == 8
                                    ? controller.unsafeActCauseTextCtrlr
                                    : null,
    focusNode: position == 1
        ? controller.typeOfJbFocusNode
        : position == 2
            ? controller.personInvolvedFocusNode
            : position == 3
                ? controller.personAuthorizedInvolvedFocusNode
                : position == 4
                    ? controller.instructionsFocusNode
                    : position == 5
                        ? controller.safetyEquipmentsFocusNode
                        : position == 6
                            ? controller.correctSafeFocusNode
                            : position == 7
                                ? controller.unsafeConditionsFocusNode
                                : position == 8
                                    ? controller.unsafeActCauseFocusNode
                                    : null,
    scroll: position == 1
        ? controller.typeOfJbScrollController
        : position == 2
            ? controller.personInvolvedScrollController
            : position == 3
                ? controller.personAuthorizedInvolvedScrollController
                : position == 4
                    ? controller.instructionsScrollController
                    : position == 5
                        ? controller.safetyEquipmentsScrollController
                        : position == 6
                            ? controller.correctSafeScrollController
                            : position == 7
                                ? controller.unsafeConditionsScrollController
                                : position == 8
                                    ? controller.unsafeActCauseScrollController
                                    : null,
  );
}
