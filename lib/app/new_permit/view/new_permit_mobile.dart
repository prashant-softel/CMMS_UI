import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/utils/url_path.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_mobile.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:cmms/app/widgets/view_sop_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NewPermitMobile extends GetView<NewPermitController> {
  NewPermitMobile({super.key});
  final FileUploadController dropzoneController = Get.put(FileUploadController(
    apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',
  ));
  @override
  Widget build(BuildContext context) {
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
                    controller.mcExecutionDetailsModel?.executionId != null
                        ? Text(
                            'Request a Permit to MC',
                            style: Styles.blackBold15,
                          )
                        : Text(
                            "Request a Permit to Work",
                            style: Styles.blackBold15,
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.mcExecutionDetailsModel?.executionId != null
                          ? Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.viewMCTDetails();
                                    },
                                    child: Text(
                                      'Task Id: MCT${int.tryParse('${controller.mcExecutionDetailsModel?.executionId ?? 0}')}',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        color: Color.fromARGB(255, 5, 92, 163),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Plan Title: ${controller.mcExecutionDetailsModel!.title ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Frequency: ${controller.mcExecutionDetailsModel!.frequency ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Planned By: ${controller.mcExecutionDetailsModel!.plannedBy ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Start Date Time: ${controller.mcExecutionDetailsModel!.startedAt ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Planning Date Time: ${controller.mcExecutionDetailsModel!.plannedAt ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            )
                          : Dimens.box0,

                      controller.vegExecutionDetailsModel?.executionId != null
                          ? Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    // onTap: () {
                                    //   controller.viewVegTDetails();
                                    // },
                                    child: Text(
                                      'Task Id: VCT${int.tryParse('${controller.vegExecutionDetailsModel?.executionId ?? 0}')}',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        color: Color.fromARGB(255, 5, 92, 163),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Plan Title: ${controller.vegExecutionDetailsModel!.title ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Frequency: ${controller.vegExecutionDetailsModel!.frequency ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Planned By: ${controller.vegExecutionDetailsModel!.plannedBy ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Start Date Time: ${controller.vegExecutionDetailsModel!.scheduledDate ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Planning Date Time: ${controller.vegExecutionDetailsModel!.plannedAt ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            )
                          : Dimens.box0,
//bm link
                      controller.jobModel?.id != null
                          ? Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.viewVegTDetails();
                                    },
                                    child: Text(
                                      'Job ID: ${int.tryParse('${controller.jobModel?.id ?? 0}')}',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        color: Color.fromARGB(255, 5, 92, 163),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Job Title: ${controller.titleTextCtrlr.text ?? ""}',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Column(
                                    children:
                                        controller.jobModel!.equipmentCatList!
                                            .map((element) => Column(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment
                                                  //         .start,
                                                  // crossAxisAlignment:
                                                  //     CrossAxisAlignment
                                                  //         .start,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        "Equipment Category: ${element?.name}",
                                                        maxLines: 3,
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                            .toList(),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Block: ${controller.selectedBlock ?? ""}',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Column(
                                    children:
                                        controller.jobModel!.workingAreaList!
                                            .map(
                                              (element) => Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    child: Text(
                                                      "Equipment Name: ${element?.name}",
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Breakdown Time: ${controller.jobModel?.breakdownTime ?? ""}',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Assigned To: ${controller.jobModel?.assignedName ?? ""}',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Dimens.box0,

                      //pm task link
                      controller.pmtaskViewModel?.id != null
                          ? Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.type == AppConstants.kAudit
                                          ? controller.viewAudDetails()
                                          : controller.viewPMTDetails();
                                    },
                                    child: Text(
                                      controller.typee.value ==
                                              AppConstants.kAudit
                                          ? 'Task Id: AUD${int.tryParse('${controller.pmtaskViewModel?.id ?? 0}') ?? 0}'
                                          : 'Task Id: PMT${int.tryParse('${controller.pmtaskViewModel?.id ?? 0}') ?? 0}',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        color: Color.fromARGB(255, 5, 92, 163),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Plan Title: ${controller.pmtaskViewModel?.plan_title ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Equipment Category: ${controller.typee.value == AppConstants.kAudit ? "NA" : controller.pmtaskViewModel?.category_name ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Checklist Name: ${controller.allChecklistNames}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Frequency: ${controller.pmtaskViewModel?.frequency_name ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Assigned To: ${controller.pmtaskViewModel?.assigned_to_name ?? ""}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            )
                          : Dimens.box0,

                      Dimens.boxHeight15,
                      CustomRichTextMobile(
                        title: "Block / Plot: ",
                      ),
                      Dimens.boxHeight2,
                      IgnorePointer(
                        ignoring:
                            controller.jobModel?.id != null ? true : false,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: Obx(
                            () => DropdownWebWidget(
                              dropdownList: controller.blockList,
                              isValueSelected: controller.isBlockSelected.value,
                              selectedValue: controller.selectedBlock.value,
                              onValueChanged: controller.onValueChanged,
                            ),
                          ),
                        ),
                      ),
                      Dimens.boxHeight15,
                      CustomRichTextMobile(
                        title: "Type of Permit: ",
                      ),
                      Dimens.boxHeight2,
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Obx(
                          () => DropdownWebWidget(
                            dropdownList: controller.typePermitList,
                            isValueSelected:
                                controller.isTypePermitSelected.value,
                            selectedValue: controller.selectedTypePermit.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight15,
                      CustomRichTextMobile(
                        title: "Equipment Categories: ",
                      ),
                      Dimens.boxHeight2,
                      controller.pmtaskViewModel?.id != null ||
                              controller.jobModel?.id != null
                          ? IgnorePointer(
                              child: Obx(
                                () => SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: CustomMultiSelectDialogField(
                                    title: 'Select Equipment Category',
                                    // buttonText:
                                    //     'Equipment Category',
                                    initialValue: ((controller
                                            .selectedEquipmentCategoryIdList
                                            .isNotEmpty)
                                        ? controller
                                            .selectedEquipmentCategoryIdList
                                        : []),
                                    items: controller.equipmentCategoryList
                                        .map(
                                          (equipmentCategory) =>
                                              MultiSelectItem(
                                            equipmentCategory?.id,
                                            equipmentCategory?.name ?? '',
                                          ),
                                        )
                                        .toList(),
                                    onConfirm: (selectedOptionsList) => {
                                      controller.equipmentCategoriesSelected(
                                          selectedOptionsList),
                                      print(
                                          'Equipment list ${controller.selectedEquipmentCategoryIdList}')
                                    },
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Obx(
                                () {
                                  if (controller
                                      .equipmentCategoryList.isEmpty) {
                                    return CustomMultiSelectDialogField(
                                      onConfirm: (selectedOptionsList) {},
                                      buttonText: "",
                                      initialValue: [],
                                      items: [],
                                      title: "",
                                    );
                                  }

                                  final initialValue = controller.typee == 4 ||
                                          controller.typee == 5
                                      ? controller.equipmentCategoryList
                                              ?.where((category) =>
                                                  category?.name == 'Inverter')
                                              ?.map((category) => category?.id)
                                              ?.toList() ??
                                          []
                                      : (controller
                                              .selectedEquipmentCategoryIdList
                                              .isNotEmpty
                                          ? controller
                                              .selectedEquipmentCategoryIdList
                                          : []);

                                  print('Initial Value: $initialValue');

                                  return IgnorePointer(
                                    ignoring: controller.typee == 4,
                                    child: CustomMultiSelectDialogField(
                                      title: 'Please Select',
                                      buttonText: 'Equipment Category',
                                      initialValue: initialValue,
                                      items: controller.equipmentCategoryList
                                              ?.map(
                                                (equipmentCategory) =>
                                                    MultiSelectItem(
                                                  equipmentCategory!.id,
                                                  equipmentCategory.name,
                                                ),
                                              )
                                              ?.toList() ??
                                          [],
                                      onConfirm: (selectedOptionsList) {
                                        controller.equipmentCategoriesSelected(
                                            selectedOptionsList);
                                        print(
                                            'Selected Equipment Categories: $selectedOptionsList');
                                        print(
                                            'Updated Selected Categories in Controller: ${controller.selectedEquipmentCategoryIdList}');
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                      Dimens.boxHeight15,
                      CustomRichTextMobile(title: 'Start Date: '),
                      Dimens.boxHeight2,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: _buildStartDateField_mobile(context, 0),
                      ),
                      Dimens.boxHeight15,
                      IgnorePointer(
                        ignoring: true,
                        child: CustomRichTextMobile(
                          title: 'Expiry Date: ',
                        ),
                      ),
                      Dimens.boxHeight2,
                      IgnorePointer(
                          ignoring: true,
                          child: _buildStartDateField_mobile(context, 1)),
                      Dimens.boxHeight15,
                      _buildPermitDescriptionField_mobile(context),
                      Obx(
                        () => Row(
                          children: [
                            CustomRichTextMobile(
                                includeAsterisk: false,
                                title: 'Electrical Isolation Required '),
                            Switch(
                              value: controller.isToggleOn.value,
                              onChanged: (value) {
                                controller.toggle();
                              },
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Dimens.boxHeight2,
                      Obx(
                        () => controller.isToggleOn == true
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomRichTextMobile(
                                      includeAsterisk: false,
                                      title: 'Equipment Isolation '),
                                  Dimens.boxHeight2,
                                  SizedBox(
                                    child: CustomMultiSelectDialogField(
                                      buttonText: 'Select Equipment Isolation',
                                      title: 'Equipment Isolation',
                                      initialValue: (controller
                                              .selectedEquipmentIsolationIdList
                                              .isNotEmpty)
                                          ? controller
                                              .selectedEquipmentIsolationIdList
                                          : [],
                                      items: controller.equipmentIsolationList
                                          .map(
                                            (equipmentIsolation) =>
                                                MultiSelectItem(
                                              equipmentIsolation?.id,
                                              equipmentIsolation?.name ?? '',
                                            ),
                                          )
                                          .toList(),
                                      onConfirm: (selectedOptionsList) => {
                                        controller.equipmentIsolationSelected(
                                            selectedOptionsList),
                                        print(
                                            'Equipment Isolation list5: ${controller.equipmentIsolationList}')
                                      },
                                    ),
                                  ),
                                  Dimens.boxHeight15
                                ],
                              )
                            : Dimens.box0,
                      ),
                      Obx(
                        () => controller.isToggleOn == true
                            ? Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomRichTextMobile(
                                      includeAsterisk: false,
                                      title: "Select Loto Equipment List".tr,
                                    ),
                                    Dimens.boxHeight10,
                                    CustomMultiSelectDialogField(
                                      buttonText: 'Select Equipment Name',
                                      title: 'Equipment Name',
                                      initialValue: (controller
                                              .selectedEquipmentNameList
                                              .isNotEmpty)
                                          ? controller
                                              .selectedEquipmentNameIdList.value
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
                                        controller.equipmentNameSelected(
                                            selectedOptionsList),
                                        print(
                                            'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                                      },
                                    ),
                                    Dimens.boxHeight10,
                                    SizedBox(
                                      width: Get.width,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            // Header Row
                                            Container(
                                              color: Colors.grey[300],
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8, horizontal: 16),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      'Loto Applied On',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Serial Number',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .info, // Placeholder icon for the "Action" header
                                                    color: Colors
                                                        .transparent, // Make it invisible for header alignment
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Data Rows
                                            ...List<Widget>.generate(
                                              controller
                                                  .filteredEquipmentNameList
                                                  .length,
                                              (index) {
                                                var inventoryEquipmentName =
                                                    controller
                                                            .filteredEquipmentNameList[
                                                        index];
                                                controller.id.value =
                                                    inventoryEquipmentName
                                                            ?.id ??
                                                        0;
                                                print(
                                                    'Equipment Isss5:${controller.id.value}');
                                                return Container(
                                                  color: index.isEven
                                                      ? Colors.grey[200]
                                                      : Colors.white,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8,
                                                      horizontal: 16),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          '${inventoryEquipmentName?.name ?? ''}',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[700],
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          '${inventoryEquipmentName?.serialNumber ?? ''}',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[700],
                                                            fontSize: 14,
                                                          ),
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                            Icons
                                                                .delete_outline,
                                                            color: Colors.red),
                                                        onPressed: () {
                                                          controller.removeItem(
                                                              index);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Dimens.boxHeight20,
                                  ],
                                ),
                              )
                            : Dimens.box0,
                      ),
                      controller.safetyMeasureList.length > 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomRichTextMobile(
                                    title: "Permit Type Checklist"),
                                Dimens.boxHeight2,
                                GetBuilder<NewPermitController>(
                                  init: controller,
                                  builder: (ctrl) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children:
                                          controller.safetyMeasureList.map(
                                        (element) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    checkBoxMethod(
                                                      element.isChecked ??
                                                          false,
                                                      (value) {
                                                        element.isChecked =
                                                            value ?? false;

                                                        controller.update();
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${element.name}",
                                                        maxLines: 5,
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
                                ),
                                Dimens.boxHeight15,
                              ],
                            )
                          : Dimens.box0,
                      CustomRichTextMobile(title: "Job Type: "),
                      Dimens.boxHeight2,
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Obx(
                          () => DropdownWebWidget(
                            dropdownList: controller.jobTypeList,
                            isValueSelected:
                                controller.isJobTypeListSelected.value,
                            selectedValue: controller.selectedJobType.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight15,
                      CustomRichTextMobile(title: "SOP: "),
                      Dimens.boxHeight2,
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Obx(
                          () => DropdownWebWidget(
                            dropdownList: controller.sopPermitList,
                            isValueSelected:
                                controller.isSopPermitListSelected.value,
                            selectedValue: controller.selectedSopPermit.value,
                            onValueChanged: controller.onValueChanged,
                          ),
                        ),
                      ),
                      Dimens.boxHeight15,
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
                      Dimens.boxHeight15,
                      FileUploadWidgetWithDropzone(),
                      Dimens.boxHeight15,
                      FileUploadDetailsWidgetMobile(),
                      Dimens.boxHeight15,
                      controller.permitId.value > 0 &&
                              controller.newPermitDetailsModel.value!.file_list!
                                      .length >
                                  0
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                borderRadius: BorderRadius.circular(
                                    10.0), // Rounded corners
                                border: Border.all(
                                  color: Color.fromARGB(
                                      255, 206, 229, 234), // Border color
                                  width: 1.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: Get.width * .6,
                                          child: Text(
                                            "File Description",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: Get.width * .2,
                                          child: Text(
                                            "Action",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: List.generate(
                                        controller.file_list?.length ?? 0,
                                        (index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0, horizontal: 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 206, 229, 234),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: Get.width * .6,
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    controller.file_list![index]
                                                            ?.description
                                                            .toString() ??
                                                        '',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                                Container(
                                                  width: Get.width * .2,
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Wrap(
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                            Icons.visibility),
                                                        color: ColorValues
                                                            .appDarkBlueColor,
                                                        onPressed: () async {
                                                          String baseUrl =
                                                              UrlPath.deployUrl;
                                                          String fileName =
                                                              controller
                                                                      .file_list![
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
                                                        },
                                                      ),
                                                      if (controller
                                                              .newPermitDetailsModel
                                                              .value!
                                                              .ptwStatus !=
                                                          125)
                                                        IconButton(
                                                          icon: Icon(Icons
                                                              .delete_outline_outlined),
                                                          color: ColorValues
                                                              .deleteColor,
                                                          onPressed: () {
                                                            controller.removeImage(
                                                                controller
                                                                    .file_list![
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
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Dimens.box0,
                      Dimens.boxHeight15,
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
                      //issue
                      controller.newPermitDetailsModel.value?.ptwStatus ==
                                  125 &&
                              controller.newPermitDetailsModel.value
                                      ?.is_TBT_Expire ==
                                  false
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomRichTextMobile(
                                    title: 'Conducted At Job-Site By: '),
                                Dimens.boxHeight2,
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: Obx(
                                    () => DropdownWebWidget(
                                      dropdownList: controller.employeeNameList,
                                      isValueSelected: controller
                                          .isemployeeNameListSelected.value,
                                      selectedValue: controller
                                          .selectedEmployeeNamesList.value,
                                      onValueChanged:
                                          controller.onValueTbtConductedChanged,
                                    ),
                                  ),
                                ),
                                Dimens.boxHeight15,
                                CustomRichTextMobile(title: 'Date and Time: '),
                                Dimens.boxHeight2,
                                _buildDateTimeField_mobile(context),
                                Dimens.boxHeight15,
                                CustomRichTextMobile(title: 'Add Employee'),
                                Dimens.boxHeight2,
                                Obx(
                                  () => CustomMultiSelectDialogField(
                                    buttonText: 'Add Employee',
                                    title: 'Select Employee',
                                    initialValue: (controller
                                            .selectedEmployeeNameList
                                            .isNotEmpty)
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
                                      controller.employeeNameSelected(
                                          selectedOptionsList),
                                      print(
                                          'Employee Name list50: ${controller.selectedEmployeeNameIdList}')
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      ...List<Widget>.generate(
                                        controller
                                            .filteredEmployeeNameList.length,
                                        (index) {
                                          var employeeNameDetails = controller
                                              .filteredEmployeeNameList[index];
                                          return Card(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5),
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: Colors.grey[300]!,
                                                    width: 1),
                                              ),
                                              padding: EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Employee Name: ${employeeNameDetails?.name ?? ''}',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'Contact Number: ${employeeNameDetails?.mobileNumber ?? ''}',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'Designation: ${employeeNameDetails?.designation ?? 'NO Designation'}',
                                                    style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                            Icons
                                                                .delete_outline,
                                                            color: Colors.red),
                                                        onPressed: () {
                                                          _removeRow(index);
                                                        },
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
                                ),
                                Dimens.boxHeight15,
                              ],
                            )
                          : Dimens.box0,

                      CustomRichTextMobile(title: "Comments: "),
                      Dimens.boxHeight2,
                      _buildPermitCommentField_mobile(context),
                      Dimens.boxHeight20,
                      //issue
                      controller.jobModel?.id != null
                          ? Center(
                              child: Container(
                                height: 45,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.appGreenColor,
                                  text: "Submit For Approval",
                                  onPressed: () {
                                    controller.isCheckedJSA.value == true &&
                                            controller.isCheckedSOP.value ==
                                                true
                                        ? controller.createNewPermitForJob(
                                            jobId: controller.jobModel?.id,
                                            fileIds: dropzoneController.fileIds)
                                        : Get.dialog<void>(
                                            checkboxAlertBox(),
                                          );
                                  },
                                ),
                              ),
                            )
                          : controller.mcExecutionDetailsModel?.id != null &&
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
                                                  controller
                                                          .isCheckedJSA.value ==
                                                      true &&
                                                  controller
                                                          .isCheckedSOP.value ==
                                                      true
                                              ? controller.createNewPermitForPm(
                                                  pmTaskId: controller
                                                      .scheduleID.value,
                                                  fileIds: dropzoneController
                                                      .fileIds)
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
                                                      controller
                                                              .isCheckedJSA.value ==
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
                                                          controller
                                                                  .isCheckedSOP
                                                                  .value ==
                                                              true
                                                      ? print(
                                                          "condiation failed")
                                                      : Get.dialog<void>(
                                                          checkboxAlertBox(),
                                                        );
                                            },
                                          )),
                                    )
                                  : controller.pmtaskViewModel?.id != null
                                      ? Center(
                                          child: Container(
                                            height: 45,
                                            child: CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appGreenColor,
                                              text: "Submit For Approval",
                                              onPressed: () {
                                                controller.isCheckedJSA.value ==
                                                            true &&
                                                        controller.isCheckedSOP
                                                                .value ==
                                                            true
                                                    ? controller.createNewPermitForPm(
                                                        pmTaskId:
                                                            controller
                                                                .pmtaskViewModel
                                                                ?.id,
                                                        activity: controller
                                                            .pmtaskViewModel
                                                            ?.plan_title,
                                                        fileIds:
                                                            dropzoneController
                                                                .fileIds)
                                                    : Get.dialog<void>(
                                                        checkboxAlertBox(),
                                                      );
                                              },
                                            ),
                                          ),
                                        )
                                      : controller.permitId.value <= 0
                                          ? Center(
                                              child: Container(
                                                height: 45,
                                                child: CustomElevatedButton(
                                                  backgroundColor:
                                                      ColorValues.appGreenColor,
                                                  text: "Submit For Approval",
                                                  onPressed: () {
                                                    controller.isCheckedJSA
                                                                    .value ==
                                                                true &&
                                                            controller
                                                                    .isCheckedSOP
                                                                    .value ==
                                                                true
                                                        ? controller.createNewPermit(
                                                            fileIds:
                                                                dropzoneController
                                                                    .fileIds)
                                                        : Get.dialog<void>(
                                                            checkboxAlertBox(),
                                                          );
                                                  },
                                                ),
                                              ),
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                controller.newPermitDetailsModel
                                                            .value?.ptwStatus ==
                                                        121
                                                    ? Container(
                                                        height: 45,
                                                        child:
                                                            CustomElevatedButton(
                                                          backgroundColor:
                                                              ColorValues
                                                                  .appDarkBlueColor,
                                                          text: "Update",
                                                          onPressed: () {
                                                            controller
                                                                .updateNewPermit(
                                                              fileIds:
                                                                  dropzoneController
                                                                      .fileIds,
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : Dimens.box0,
                                                controller.newPermitDetailsModel
                                                                .value?.ptwStatus ==
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
                                                            text: "Update TBT",
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
                                                                          ? Text(
                                                                              "Select TBT Conducted By")
                                                                          : Text(
                                                                              "Can't do TBT without entering the time."),
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
                                                              }
                                                              controller.updateNewPermit(
                                                                  fileIds:
                                                                      dropzoneController
                                                                          .fileIds);
                                                            },
                                                          ),
                                                        ),
                                                      )
                                                    : Dimens.box0,
                                                controller.newPermitDetailsModel
                                                            .value?.ptwStatus ==
                                                        124
                                                    ? Center(
                                                        child: Container(
                                                          height: 45,
                                                          child:
                                                              CustomElevatedButton(
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    116,
                                                                    78,
                                                                    130),
                                                            text:
                                                                "Re submit Permit",
                                                            onPressed: () {
                                                              controller.resubmitPermit(
                                                                  fileIds:
                                                                      dropzoneController
                                                                          .fileIds);
                                                            },
                                                          ),
                                                        ),
                                                      )
                                                    : Dimens.box0,
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
                                                //                 jobId: controller
                                                //                     .jobModel!
                                                //                     .id,
                                                //               ),
                                                //             );
                                                //             print(
                                                //                 "Permit ID TO Cancel: ${controller.permitId.value}");
                                                //             print(
                                                //                 "JobId To cancel: ${controller.jobModel!.id}");
                                                //           },
                                                //         ))
                                                //     : Dimens.box0,
                                              ],
                                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ////Below All for Mobile
  Widget _buildStartDateField_mobile(
    BuildContext context,
    int position,
  ) {
    return Container(
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
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width / 1.1,
      child: TextField(
        style: GoogleFonts.lato(
          textStyle:
              TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
        ),
        onTap: () {
          position == 0
              ? pickDateTime_mobile(context, 0)
              : pickDateTime_mobile(context, 1);
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
        ),
      ),
    );
  }

  Future pickDateTime_mobile(BuildContext context, int position) async {
    var dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    final date = await pickDate_mobile(context, position);
    if (date == null) {
      return;
    }

    final time = await pickTime_mobile(context, position, date);
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

  Future<DateTime?> pickDate_mobile(BuildContext context, int position) async {
    DateTime? dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return null;
    return newDate;
  }

  Future<TimeOfDay?> pickTime_mobile(
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

  // Widget _buildValidTillField_mobile(BuildContext context) {
  //   return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //     Container(
  //       decoration: BoxDecoration(
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black26,
  //             offset: const Offset(
  //               5.0,
  //               5.0,
  //             ),
  //             blurRadius: 5.0,
  //             spreadRadius: 1.0,
  //           ), //BoxShadow
  //           BoxShadow(
  //             color: ColorValues.whiteColor,
  //             offset: const Offset(0.0, 0.0),
  //             blurRadius: 0.0,
  //             spreadRadius: 0.0,
  //           ), //BoxShadow
  //         ],
  //         color: ColorValues.whiteColor,
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width / 1.1,
  //         child: TextField(
  //           style: GoogleFonts.lato(
  //             textStyle:
  //                 TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
  //           ),
  //           onTap: () {
  //             pickDateTimeTill_mobile(context);
  //           },
  //           controller: controller.validTillTimeCtrlr,
  //           autofocus: false,
  //           decoration: InputDecoration(
  //             fillColor: ColorValues.whiteColor,
  //             filled: true,
  //             contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
  //             border: InputBorder.none,
  //             enabledBorder: InputBorder.none,
  //             focusedBorder: InputBorder.none,
  //           ),
  //           onChanged: (value) {},
  //         ),
  //       ),
  //     ),
  //   ]);
  // }

  // Future pickDateTimeTill_mobile(BuildContext context) async {
  //   var dateTime = controller.selectedValidTillTime.value;
  //   final date = await pickDateTill_mobile(context);
  //   if (date == null) {
  //     return;
  //   }
  //   final time = await pickTimeTill_mobile(context);
  //   if (time == null) {
  //     return;
  //   }
  //   dateTime = DateTime(
  //     date.year,
  //     date.month,
  //     date.day,
  //     time.hour,
  //     time.minute,
  //   );
  //   controller.selectedValidTillTime.value = dateTime;
  //   controller.validTillTimeCtrlr
  //     ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
  //     ..selection = TextSelection.fromPosition(
  //       TextPosition(
  //         offset: controller.validTillTimeCtrlr.text.length,
  //         affinity: TextAffinity.upstream,
  //       ),
  //     );
  // }

  // Future<DateTime?> pickDateTill_mobile(BuildContext context) async {
  //   DateTime? dateTime = controller.selectedValidTillTime.value;
  //   //final initialDate = DateTime.now();
  //   final newDate = await showDatePicker(
  //     context: context,
  //     initialDate: dateTime,
  //     firstDate: DateTime(DateTime.now().year - 5),
  //     lastDate: DateTime(DateTime.now().year + 5),
  //   );
  //   if (newDate == null) return null;
  //   return newDate;
  // }

  // Future<TimeOfDay?> pickTimeTill_mobile(BuildContext context) async {
  //   DateTime dateTime = controller.selectedValidTillTime.value;
  //   //final initialTime = TimeOfDay(hour: 12, minute: 0);
  //   final newTime = await showTimePicker(
  //       context: context,
  //       initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
  //       builder: (BuildContext context, Widget? child) {
  //         return Theme(
  //           data: ThemeData.light(),
  //           child: child!,
  //         );
  //       });
  //   if (newTime == null) {
  //     return null;
  //   }
  //   return newTime;
  // }

  Widget _buildPermitDescriptionField_mobile(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomRichTextMobile(title: 'Permit Description : '),
      Dimens.boxHeight2,
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
          width: MediaQuery.of(context).size.width / 1.1,
          child: TextField(
            style: GoogleFonts.lato(
              textStyle:
                  TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
            ),
            controller: controller.permitDescriptionCtrlr,
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
      Dimens.boxHeight15,
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
                          controller.equipmentNameSelected(selectedOptionsList),
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
            height: 100,
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
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        title: Text(
          'Select Employee Name',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          return Obx(
            () => Container(
              padding: Dimens.edgeInsets05_0_5_0,
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
                          controller.employeeNameSelected(selectedOptionsList),
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
    }));
  }

  checkBoxMethod(bool isChecked, Function(bool?) onChange) {
    return Checkbox(
      value: isChecked,
      // value: isInitialChecked,
      onChanged: onChange,
    );
  }

  // checkBoxMethod(int position) {
  //   return Checkbox(
  //       value: position == 1
  //           ? controller.isChecked1.value
  //           : position == 2
  //               ? controller.isChecked2.value
  //               : position == 3
  //                   ? controller.isChecked3.value
  //                   : position == 4
  //                       ? controller.isChecked4.value
  //                       : position == 5
  //                           ? controller.isChecked5.value
  //                           : position == 6
  //                               ? controller.isChecked6.value
  //                               : position == 7
  //                                   ? controller.isChecked7.value
  //                                   : null,
  //       onChanged: (bool? value) {
  //         position == 1
  //             ? controller.toggleCheckbox1()
  //             : position == 2
  //                 ? controller.toggleCheckbox2()
  //                 : position == 3
  //                     ? controller.toggleCheckbox3()
  //                     : position == 4
  //                         ? controller.toggleCheckbox4()
  //                         : position == 5
  //                             ? controller.toggleCheckbox5()
  //                             : position == 6
  //                                 ? controller.toggleCheckbox6()
  //                                 : position == 7
  //                                     ? controller.toggleCheckbox7()
  //                                     : null;
  //       });
  // }

  Widget _buildDateTimeField_mobile(
    BuildContext context,
  ) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width / 1.1,
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
        child: TextField(
          style: GoogleFonts.lato(
            textStyle:
                TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
          ),
          onTap: () {
            pickDateTimeTBT_mobile(context);
          },
          controller: controller.dateTimeCtrlr,
          autofocus: false,
          decoration: InputDecoration(
            fillColor: ColorValues.whiteColor,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
      ),
    ]);
  }

  Future pickDateTimeTBT_mobile(BuildContext context) async {
    var dateTime = controller.selectedDateTime.value;
    final date = await pickDateTBT_mobile(context);
    if (date == null) {
      return;
    }

    final time = await pickTimeTBT_mobile(context);
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
    // controller.selectedDateTime.value = dateTime;
    // controller.dateTimeCtrlr
    //   ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
    //   ..selection = TextSelection.fromPosition(
    //     TextPosition(
    //       offset: controller.dateTimeCtrlr.text.length,
    //       affinity: TextAffinity.upstream,
    //     ),
    //   );
    controller.dateTimeCtrlr.text =
        DateFormat("yyyy-MM-dd HH:mm").format(dateTime);
    controller.tbtDateTimeCtrlrBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print('TBT DateTime:${controller.dateTimeCtrlr.text}');
  }

  Future<DateTime?> pickDateTBT_mobile(BuildContext context) async {
    DateTime? dateTime = controller.selectedDateTime.value;
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

  Future<TimeOfDay?> pickTimeTBT_mobile(BuildContext context) async {
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

    return newTime;
  }

  Widget _buildPermitCommentField_mobile(BuildContext context) {
    return Container(
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
        width: MediaQuery.of(context).size.width / 1.1,
        child: TextField(
          style: GoogleFonts.lato(
            textStyle:
                TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
          ),
          controller: controller.workPermitRemarkTextCtrlr,
          focusNode: controller.commentFocus,
          scrollController: controller.commentScroll,
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
    );
  }

  void _removeRow(int index) {
    controller.filteredEmployeeNameList.removeAt(index);
  }
}
