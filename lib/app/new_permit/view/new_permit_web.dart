import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:cmms/app/widgets/view_sop_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class NewPermitWeb extends GetView<NewPermitController> {
  NewPermitWeb({Key? key}) : super(key: key);
  final NewPermitController _controller = Get.find();
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
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
                      Get.offAllNamed(Routes.breakdown);
                    },
                    child: Text(" / BREAKDOWN MAINTENANCE ",
                        style: Styles.greyLight14),
                  ),
                  controller.newPermitDetailsModel.value?.permitNo == null
                      ? Text(" / ADD NEW PERMIT", style: Styles.greyLight14)
                      : Text(" / UPDATE NEW PERMIT", style: Styles.greyLight14),
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
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
                                  child: controller.pmtaskViewModel?.id != null
                                      ? Text('REQUEST A PERMIT FOR PM',
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
                          // Edit from here for pm task
                          controller.pmtaskViewModel?.id != null
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: Get.width * 0.7,
                                        height: Get.height * 0.2,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 20),
                                        // decoration: BoxDecoration(
                                        //   border:
                                        //       Border.all(color: Colors.black),
                                        // ),
                                        child: DataTable2(
                                          border: TableBorder.all(
                                            color: Colors.black,
                                          ),
                                          columns: [
                                            DataColumn2(
                                                label: Text('PM Task ID')),
                                            DataColumn2(
                                                label: Text('Plan Title')),
                                            DataColumn2(
                                                label:
                                                    Text('Equipment Category')),
                                            DataColumn2(
                                                label: Text('Frequency')),
                                            DataColumn2(
                                                label: Text('Assigned To')),
                                          ],
                                          rows: [
                                            DataRow(
                                              cells: [
                                                DataCell(
                                                  Text(
                                                    '${int.tryParse('${controller.pmtaskViewModel?.id ?? 0}')}',
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationStyle:
                                                          TextDecorationStyle
                                                              .solid,
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                      '${controller.pmtaskViewModel?.plan_title}',
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                DataCell(
                                                  Text(
                                                      '${controller.pmtaskViewModel?.category_name}',
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                DataCell(
                                                  Text(
                                                      '${controller.pmtaskViewModel?.frequency_name}',
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                                DataCell(
                                                  Text(
                                                      '${controller.pmtaskViewModel?.assigned_to_name}',
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Dimens.box0,
                          controller.jobModel?.id != null
                              ? Container(
                                  // alignment: Alignment.centerLeft,
                                  width: Get.width * .8,
                                  height: Get.height * .2,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  padding: EdgeInsets.all(10),
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(color: Colors.black),
                                  // ),
                                  child: DataTable2(
                                    border: TableBorder.all(
                                      color: Colors.black,
                                    ),
                                    columnSpacing: 11,
                                    columns: [
                                      DataColumn2(
                                          fixedWidth: Get.width * .05,
                                          label: Text('Job ID',
                                              overflow: TextOverflow.ellipsis)),
                                      DataColumn2(
                                          fixedWidth: Get.width * .2,
                                          label: Text('Job Title',
                                              overflow: TextOverflow.ellipsis)),
                                      DataColumn2(
                                          fixedWidth: Get.width * .1,
                                          label: Text('Equipment Category',
                                              overflow: TextOverflow.ellipsis)),
                                      DataColumn2(
                                          fixedWidth: Get.width * .1,
                                          label: Text('Block',
                                              overflow: TextOverflow.ellipsis)),
                                      DataColumn2(
                                          fixedWidth: Get.width * .1,
                                          label: Text('Equipment Name',
                                              overflow: TextOverflow.ellipsis)),
                                      DataColumn2(
                                          fixedWidth: Get.width * .1,
                                          label: Text('Breakdown Time',
                                              overflow: TextOverflow.ellipsis)),
                                      DataColumn2(
                                          fixedWidth: Get.width * .1,
                                          label: Text('Assigned To',
                                              overflow: TextOverflow.ellipsis)),
                                    ],
                                    rows: [
                                      DataRow(cells: [
                                        DataCell(
                                          GestureDetector(
                                            onTap: () {
                                              controller.viewJobDetails();
                                            },
                                            child: Text(
                                                '${int.tryParse('${controller.jobModel?.id ?? 0}')}',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  color: Color.fromARGB(
                                                      255, 5, 92, 163),
                                                ),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                              '${controller.titleTextCtrlr.text}',
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        DataCell(
                                          SizedBox(
                                            child: Column(
                                              children: controller
                                                  .listJobModelCategory
                                                  .map((element) => Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "${element?.equipmentCatName}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ],
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                              '${controller.blockNameTextCtrlr.text}',
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        DataCell(
                                          SizedBox(
                                            child: Column(
                                              children: controller
                                                  .list_working_area_name
                                                  .map(
                                                    (element) => Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "${element?.workingAreaName}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ],
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                              '${controller.breakdownTimeTextCtrlr.text}',
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        DataCell(
                                          Text(
                                              '${controller.assignToTextCtrlr.text}',
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ]),
                                    ],
                                  ),
                                )
                              : Dimens.box0,
                          Container(
                            // height: Get.height,
                            margin: EdgeInsets.only(right: 30, left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Dimens.boxWidth15,
                                              CustomRichText(
                                                  title: 'Block/Plot: '),
                                              Dimens.boxWidth10,
                                              SizedBox(
                                                width: Get.width * .2,
                                                child: Obx(
                                                  () => DropdownWebWidget(
                                                    dropdownList:
                                                        controller.blockList,
                                                    isValueSelected: controller
                                                        .isBlockSelected.value,
                                                    selectedValue: controller
                                                        .selectedBlock.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
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
                                                  title: 'Type of permit: '),
                                              Dimens.boxWidth10,
                                              SizedBox(
                                                width: MediaQuery.of(context)
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
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Dimens.boxHeight10,
                                          Row(
                                            children: [
                                              Dimens.boxWidth15,
                                              CustomRichText(
                                                  title: 'Start Date & Time: '),
                                              Dimens.boxWidth10,
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
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title:
                                                      'Equipment Categories: '),
                                              Dimens.boxWidth10,
                                              controller.permitId.value > 0
                                                  ? SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      child:
                                                          CustomMultiSelectDialogField(
                                                        title:
                                                            'Select Equipment Category',
                                                        // buttonText:
                                                        //     'Equipment Category',
                                                        initialValue: ((controller
                                                                .selectedEquipmentCategoryIdList
                                                                .isNotEmpty)
                                                            ? controller
                                                                .selectedEquipmentCategoryIdList
                                                            : []),
                                                        items: controller
                                                            .equipmentCategoryList
                                                            .map(
                                                              (equipmentCategory) =>
                                                                  MultiSelectItem(
                                                                equipmentCategory
                                                                    ?.id,
                                                                equipmentCategory
                                                                        ?.name ??
                                                                    '',
                                                              ),
                                                            )
                                                            .toList(),
                                                        onConfirm:
                                                            (selectedOptionsList) =>
                                                                {
                                                          controller
                                                              .equipmentCategoriesSelected(
                                                                  selectedOptionsList),
                                                          print(
                                                              'Equipment list ${controller.selectedEquipmentCategoryIdList}')
                                                        },
                                                      ),
                                                    )
                                                  : SizedBox(
                                                      width: Get.width * .2,
                                                      child:
                                                          CustomMultiSelectDialogField(
                                                        title: 'Please Select',
                                                        buttonText:
                                                            'Equipment Category',
                                                        initialValue: (controller
                                                                .selectedEquipmentCategoryIdList
                                                                .isNotEmpty)
                                                            ? controller
                                                                .selectedEquipmentCategoryIdList
                                                            : [],
                                                        items: controller
                                                            .equipmentCategoryList
                                                            .map(
                                                              (equipmentCategory) =>
                                                                  MultiSelectItem(
                                                                equipmentCategory
                                                                    ?.id,
                                                                equipmentCategory
                                                                        ?.name ??
                                                                    '',
                                                              ),
                                                            )
                                                            .toList(),
                                                        onConfirm:
                                                            (selectedOptionsList) =>
                                                                {
                                                          controller
                                                              .equipmentCategoriesSelected(
                                                                  selectedOptionsList),
                                                          print(
                                                              'Equipment list55 ${controller.selectedEquipmentCategoryIdList}')
                                                        },
                                                      ),
                                                    ),
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
                                          //                     .equipmentNameSelected(
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
                                                Dimens.boxWidth10,
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
                                              title: 'Work Description: '),
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
                                                  'Electrical Isolation Required '),
                                          Switch(
                                            value: _controller.isToggleOn.value,
                                            onChanged: (value) {
                                              _controller.toggle();
                                            },
                                            activeColor: Colors.white,
                                            activeTrackColor: Colors.green,
                                            inactiveThumbColor: Colors.white,
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
                                                // controller.permitId
                                                //             .value >
                                                //         0
                                                //     ? SizedBox(
                                                //         width:
                                                //             MediaQuery.of(context).size.width /
                                                //                 5,
                                                //         child:
                                                //             CustomMultiSelectDialogField(
                                                //           buttonText:
                                                //               'Select Equipment Isolation',
                                                //           title:
                                                //               'Equipment Isolation EDit',
                                                //           initialValue: (controller.selectedEditEquipemntIsolationIdList.isNotEmpty)
                                                //               ? controller.selectedEditEquipemntIsolationIdList
                                                //               : [],
                                                //           items: controller
                                                //               .equipmentIsolationList
                                                //               .map(
                                                //                 (equipmentIsolation) => MultiSelectItem(
                                                //                   equipmentIsolation?.id,
                                                //                   equipmentIsolation?.name ?? '',
                                                //                 ),
                                                //               )
                                                //               .toList(),
                                                //           onConfirm:
                                                //               (selectedOptionsList) => {
                                                //             controller.equipmentIsolationSelected(selectedOptionsList),
                                                //             print('Equipment Edit Isolation list5: ${controller.equipmentIsolationList}')
                                                //           },
                                                //         ),
                                                //       )
                                                //     :
                                                SizedBox(
                                                  width: MediaQuery.of(context)
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
                                                        (selectedOptionsList) =>
                                                            {
                                                      controller
                                                          .equipmentIsolationSelected(
                                                              selectedOptionsList),
                                                      print(
                                                          'Equipment Isolation list5: ${controller.equipmentIsolationList}')
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
                                                    title: 'Loto Equipment List'
                                                        .tr,
                                                    action: Row(
                                                      children: [
                                                        CustomRichText(
                                                            title: "Add new"),
                                                        Dimens.boxWidth10,
                                                        SizedBox(
                                                          width: 250,
                                                          height: 50,
                                                          child:
                                                              CustomMultiSelectDialogField(
                                                            buttonText:
                                                                'Select Equipment Name',
                                                            title:
                                                                'Equipment Name',
                                                            initialValue: (controller
                                                                    .selectedEquipmentNameList
                                                                    .isNotEmpty)
                                                                ? controller
                                                                    .selectedEquipmentNameIdList
                                                                : [],
                                                            items: controller
                                                                .equipmentNameList
                                                                .map(
                                                                  (equipmentName) =>
                                                                      MultiSelectItem(
                                                                    equipmentName
                                                                        ?.id,
                                                                    equipmentName
                                                                            ?.name ??
                                                                        '',
                                                                  ),
                                                                )
                                                                .toList(),
                                                            onConfirm:
                                                                (selectedOptionsList) =>
                                                                    {
                                                              controller
                                                                  .equipmentNameSelected(
                                                                      selectedOptionsList),
                                                              print(
                                                                  'Equipment Name list25: ${controller.selectedEquipmentNameIdList}')
                                                            },
                                                          ),
                                                        )
                                                        // ActionButton(
                                                        //     label: 'Add New',
                                                        //     icon: Icons.add,
                                                        //     onPressed: () {
                                                        //       //  showEquipmentNameAlertBox();
                                                        //       // Get.dialog<void>(
                                                        //       //     showEquipmentNameAlertBox());
                                                        //     },
                                                        //     color: ColorValues
                                                        //         .appGreenColor),
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
                                                          ///Put Loto applied here

                                                          // SizedBox(
                                                          //   width: MediaQuery.of(context)
                                                          //           .size
                                                          //           .width /
                                                          //       1.2,
                                                          //   child:
                                                          //       Divider(
                                                          //     thickness:
                                                          //         2,
                                                          //   ),
                                                          // ),
                                                          // controller.permitId.value > 0
                                                          //     ? SizedBox(
                                                          //         width: MediaQuery.of(context).size.width * 2,
                                                          //         child: Container(
                                                          //           height: ((controller.filteredEquipmentNameList.length) * 25) + 90,
                                                          //           child: Column(
                                                          //               //
                                                          //               children: [
                                                          //                 Expanded(
                                                          //                   child: //
                                                          //                       Theme(
                                                          //                     data: ThemeData(scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all<Color>(Colors.transparent))),
                                                          //                     child: ScrollableTableView(
                                                          //                       // paginationController: controller.equipmentNamepaginationController,
                                                          //                       columns: [
                                                          //                         'name',
                                                          //                         'serialNumber',
                                                          //                         'action'.tr,
                                                          //                       ].map((column) {
                                                          //                         return TableViewColumn(
                                                          //                           minWidth: Get.width * 0.25,
                                                          //                           label: column == "name"
                                                          //                               ? "Loto Applied On"
                                                          //                               : column == "serialNumber"
                                                          //                                   ? "Serial Number"
                                                          //                                   : "Action",
                                                          //                         );
                                                          //                       }).toList(),
                                                          //                       rows: //
                                                          //                           [
                                                          //                         ...List.generate(
                                                          //                           ///controller.selectedEquipmentNameIdList
                                                          //                           controller.listLoto!.length,

                                                          //                           (index) {
                                                          //                             var inventoryEquipmentName = controller.listLoto![index];

                                                          //                             //_jobId = jobDetails?.id;

                                                          //                             // controller.id.value = inventoryEquipmentName?.id ?? 0;
                                                          //                             print('Equipment Isss5:${controller.id.value}');
                                                          //                             return [
                                                          //                               '${inventoryEquipmentName?.asset_name ?? ''}',
                                                          //                               '${inventoryEquipmentName?.locksrno ?? ''}',
                                                          //                               'Actions'
                                                          //                             ];
                                                          //                           },
                                                          //                         ),
                                                          //                       ].map((_inventoryDetailList) {
                                                          //                         return TableViewRow(
                                                          //                             onTap: () => {
                                                          //                                   print('ZERO = ${_inventoryDetailList[0]}')
                                                          //                                 },
                                                          //                             height: 25,
                                                          //                             cells: _inventoryDetailList.map((value) {
                                                          //                               return TableViewCell(
                                                          //                                 //key: ,
                                                          //                                 child: (value == 'Actions')
                                                          //                                     ? Wrap(
                                                          //                                         children: [
                                                          //                                           TableActionButton(
                                                          //                                             color: Colors.red,
                                                          //                                             icon: Icons.delete_outline,
                                                          //                                             message: 'Remove',
                                                          //                                             onPress: () {
                                                          //                                               // controller.showNewPermitListDetails(
                                                          //                                               //     controller.permitId.value);
                                                          //                                             },
                                                          //                                           ),
                                                          //                                         ],
                                                          //                                       )
                                                          //                                     : Text(value.toString()),
                                                          //                               );
                                                          //                             }).toList());
                                                          //                       }).toList(),
                                                          //                     ),
                                                          //                   ),
                                                          //                 ),
                                                          //               ]),
                                                          //         ),
                                                          //       )
                                                          //     :
                                                          SingleChildScrollView(
                                                            child: SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  2,
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                        minHeight:
                                                                            110),
                                                                height: ((controller
                                                                        .filteredEquipmentNameList
                                                                        .length) *
                                                                    60),
                                                                // 90,
                                                                child:
                                                                    DataTable(
                                                                  columns: [
                                                                    DataColumn(
                                                                      label: Text(
                                                                          "Loto Applied On"),
                                                                      tooltip:
                                                                          "Name",
                                                                    ),
                                                                    DataColumn(
                                                                      label: Text(
                                                                          "Serial Number"),
                                                                      tooltip:
                                                                          "Serial Number",
                                                                    ),
                                                                    DataColumn(
                                                                      label: Text(
                                                                          "Action"),
                                                                      tooltip:
                                                                          "Action",
                                                                    ),
                                                                  ],
                                                                  rows: List<
                                                                      DataRow>.generate(
                                                                    controller
                                                                        .filteredEquipmentNameList
                                                                        .length,
                                                                    (index) {
                                                                      var inventoryEquipmentName =
                                                                          controller
                                                                              .filteredEquipmentNameList[index];
                                                                      controller
                                                                              .id
                                                                              .value =
                                                                          inventoryEquipmentName?.id ??
                                                                              0;
                                                                      print(
                                                                          'Equipment Isss5:${controller.id.value}');
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
                                // controller.safetyMeasureList.isEmpty
                                //     // ||  controller
                                //     // .safetyList!
                                //     // .isEmpty
                                //     ? Dimens.box0
                                //     : SizedBox(
                                //         // height: ((controller
                                //         //             .safetyMeasureList
                                //         //             .length) *
                                //         //         10) +
                                //         //     200,
                                //         width:
                                //             MediaQuery.of(context).size.width /
                                //                 1.3,
                                //         child: Center(
                                //           child: Column(
                                //             children: [
                                //               CustomAppBar(
                                //                 title:
                                //                     'Permit Type Checklist'.tr,
                                //               ),
                                //               Dimens.boxHeight10,
                                //               // controller.permitId.value <=
                                //               //         0
                                //               controller.safetyMeasureList
                                //                           .length >
                                //                       0
                                //                   ? Column(
                                //                       // alignment: WrapAlignment.start,
                                //                       // spacing: 100,
                                //                       children: []..addAll(
                                //                           controller
                                //                               .safetyMeasureList
                                //                               .map(
                                //                             (element) => Column(
                                //                               // mainAxisSize: MainAxisSize.min,
                                //                               mainAxisAlignment:
                                //                                   MainAxisAlignment
                                //                                       .start,
                                //                               crossAxisAlignment:
                                //                                   CrossAxisAlignment
                                //                                       .start,
                                //                               children: [
                                //                                 SizedBox(
                                //                                   // width: 200,
                                //                                   child: Row(
                                //                                     children: [
                                //                                       checkBoxMethod(
                                //                                           1),
                                //                                       Text(
                                //                                           "${element.name}"),
                                //                                     ],
                                //                                   ),
                                //                                 ),
                                //                               ],
                                //                             ),
                                //                           ),
                                //                         ),
                                //                     )
                                //                   : Dimens.box0,
                                //               // controller.selectedPermitTypeIdForSafetyList != null
                                //               // ?Column(
                                //               //     // alignment: WrapAlignment.start,
                                //               //     // spacing: 100,
                                //               //     children: []..addAll(controller.safetyList!.map((element) =>
                                //               //         Column(
                                //               //           // mainAxisSize: MainAxisSize.min,
                                //               //           mainAxisAlignment: MainAxisAlignment.start,
                                //               //           crossAxisAlignment: CrossAxisAlignment.start,
                                //               //           children: [
                                //               //             SizedBox(
                                //               //               // width: 200,
                                //               //               child: Row(
                                //               //                 children: [
                                //               //                   checkBoxMethod(1),

                                //               //                   // Text("${j= j! + 1}. "),
                                //               //                   Text("${element?.saftyQuestionName}")
                                //               //                 ],
                                //               //               ),
                                //               //             )
                                //               //           ],
                                //               //         ))),
                                //               //   ) : Dimens.box0
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                // Dimens.boxHeight10
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
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
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text('JOB Type: '),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: Obx(
                                                  () => DropdownWebWidget(
                                                    dropdownList:
                                                        controller.jobTypeList,
                                                    isValueSelected: controller
                                                        .isJobTypeListSelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedJobType.value,
                                                    onValueChanged: controller
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
                                                width: MediaQuery.of(context)
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
                                                    onValueChanged: controller
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
                                                    child: CustomElevatedButton(
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
                                                  child: CustomElevatedButton(
                                                    backgroundColor: ColorValues
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

                                          /// FILE UPLOAD WIDGET
                                          Container(
                                            height: Get.height * 0.2,
                                            width: Get.width,
                                            padding: EdgeInsets.all(10),
                                            child: Row(
                                              //
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child:
                                                      FileUploadWidgetWithDropzone(),
                                                ),
                                                Dimens.boxWidth10,
                                                Expanded(
                                                  flex: 8,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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

                          controller.newPermitDetailsModel.value?.ptwStatus ==
                                      125 &&
                                  controller.newPermitDetailsModel.value!
                                          .is_TBT_Expire ==
                                      true
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
                                                            left: 10,
                                                            right: 10),
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
                                                        Obx(
                                                          () => CustomAppBar(
                                                            title:
                                                                'TBT Training Attended By'
                                                                    .tr,
                                                            action: Row(
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        "Add Employee"),
                                                                Dimens
                                                                    .boxWidth10,
                                                                SizedBox(
                                                                  width: 220,
                                                                  height: 50,
                                                                  child:
                                                                      CustomMultiSelectDialogField(
                                                                    buttonText:
                                                                        'Add Employee',
                                                                    title:
                                                                        'Select Employee',
                                                                    initialValue: (controller
                                                                            .selectedEmployeeNameList
                                                                            .isNotEmpty)
                                                                        ? controller
                                                                            .selectedEmployeeNameIdList
                                                                        : [],
                                                                    items: controller
                                                                        .employeeNameList
                                                                        .map(
                                                                          (employeeName) =>
                                                                              MultiSelectItem(
                                                                            employeeName?.id,
                                                                            employeeName?.name ??
                                                                                '',
                                                                          ),
                                                                        )
                                                                        .toList(),
                                                                    onConfirm:
                                                                        (selectedOptionsList) =>
                                                                            {
                                                                      controller
                                                                          .employeeNameSelected(
                                                                              selectedOptionsList),
                                                                      print(
                                                                          'Employee Name list50: ${controller.selectedEmployeeNameIdList}')
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
                                                                              label: Text("Employee Name")),
                                                                          DataColumn(
                                                                              label: Text("Contact No")),
                                                                          DataColumn(
                                                                              label: Text("Responsibility")),
                                                                          DataColumn(
                                                                              label: Text("Responsibility")),
                                                                        ],
                                                                        rows: List<
                                                                            DataRow>.generate(
                                                                          controller
                                                                              .filteredEmployeeNameList
                                                                              .length,
                                                                          (index) {
                                                                            var employeeNameDetails =
                                                                                controller.filteredEmployeeNameList[index];
                                                                            return DataRow(cells: [
                                                                              DataCell(Text('${employeeNameDetails?.name ?? ''}')),
                                                                              DataCell(Text('${employeeNameDetails?.mobileNumber ?? ''}')),
                                                                              DataCell(Text('${employeeNameDetails?.responsibility?.map((e) => e.name) ?? ''}')),
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
                                                            const EdgeInsets
                                                                .all(15),
                                                        child: Text(
                                                          'TBT Training Attended By Other Person',
                                                          style: Styles
                                                              .blackBold15,
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
                                                        activeColor:
                                                            Colors.white,
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
                                                          margin:
                                                              EdgeInsets.only(
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
                                                                offset: Offset(
                                                                    0, 2),
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
                                                                              color: ColorValues.lightGreyColorWithOpacity35,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(5)),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              " + Add ",
                                                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100, color: Colors.white),
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
                                                                        "Responsibility",
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
                                                                            style:
                                                                                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                                                            .map((mapData) {
                                                                          return DataCell(
                                                                            (mapData['key'] == "Employee Name") || (mapData['key'] == "Contact Number") || (mapData['key'] == "Responsibility")
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

                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 60),
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
                          controller.jobModel?.id != null
                              ? Center(
                                  child: Container(
                                      height: 45,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appGreenColor,
                                        text: "Submit For Approval",
                                        onPressed: () {
                                          // var jobId = controller.jobModel?.id ?? 0;
                                          // print('JobId'),
                                          controller.isCheckedJSA.value ==
                                                      true &&
                                                  controller
                                                          .isCheckedSOP.value ==
                                                      true
                                              ? controller
                                                  .createNewPermitForJob(
                                                      jobId: controller
                                                          .jobModel?.id,
                                                      fileIds:
                                                          dropzoneController
                                                              .fileIds)
                                              : Get.dialog<void>(
                                                  checkboxAlertBox());
                                          // controller.linkToPermit(jobId: controller.jobModel?.id);
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
                                              // var jobId = controller.jobModel?.id ?? 0;
                                              // print('JobId'),
                                              controller.isCheckedJSA
                                                              .value ==
                                                          true &&
                                                      controller.isCheckedSOP
                                                              .value ==
                                                          true
                                                  ? controller
                                                      .createNewPermitForPm(
                                                          pmTaskId: controller
                                                              .pmtaskViewModel
                                                              ?.id,
                                                          activity:
                                                              controller
                                                                  .pmtaskViewModel
                                                                  ?.plan_title,
                                                          fileIds:
                                                              dropzoneController
                                                                  .fileIds)
                                                  : Get.dialog<void>(
                                                      checkboxAlertBox());
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
                                                            checkboxAlertBox());

                                                    // () {
                                                    //   controller.isCheckedJSA.value == true && controller.isCheckedSOP.value == true ? controller.createNewPermit(fileIds: dropzoneController.fileIds) : Get.dialog<void>(checkboxAlertBox());
                                                    // };
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
                                            controller.newPermitDetailsModel
                                                            .value?.ptwStatus ==
                                                        125 &&
                                                    controller
                                                            .newPermitDetailsModel
                                                            .value
                                                            ?.is_TBT_Expire ==
                                                        true
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
                                                            controller.updateNewPermit(
                                                                fileIds:
                                                                    dropzoneController
                                                                        .fileIds);
                                                          },
                                                        )),
                                                  )
                                                : Dimens.box0,
                                            Dimens.boxWidth20,
                                            controller.newPermitDetailsModel
                                                        .value?.ptwStatus ==
                                                    124
                                                ? Center(
                                                    child: Container(
                                                      height: 45,
                                                      child:
                                                          CustomElevatedButton(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                116, 78, 130),
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
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
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
              ),
            ),
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

      Container(
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.75
        //     : MediaQuery.of(context).size.width / 1.1,
        //  margin: EdgeInsets.all(20),
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
              if (value.trim().length > 3) {
                controller.isJobDescriptionInvalid.value = false;
              } else {
                controller.isJobDescriptionInvalid.value = true;
              }
            },
          ),
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }

  // Widget _buildTitleTextField_web(BuildContext context) {
  //   return Column(//
  //       children: [
  //     // Align(
  //     //   alignment: Alignment.centerLeft,
  //     //   child: Padding(
  //     //     padding: const EdgeInsets.only(left: 10),
  //     //     child: RichText(
  //     //       text:
  //     //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
  //     //         TextSpan(
  //     //           text: '*',
  //     //           style: TextStyle(
  //     //             color: ColorValues.orangeColor,
  //     //             fontWeight: FontWeight.bold,
  //     //           ),
  //     //         ),
  //     //       ]),
  //     //     ),
  //     //   ),
  //     // ),

  //     Container(
  //       height: MediaQuery.of(context).size.height * 0.050,
  //       // width: Responsive.isDesktop(context)
  //       //     ? MediaQuery.of(context).size.width / 1.75
  //       //     : MediaQuery.of(context).size.width / 1.1,
  //       // margin: EdgeInsets.all(20),
  //       margin: EdgeInsets.only(left: 10, right: 18, bottom: 10),
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
  //           ),
  //           BoxShadow(
  //             color: ColorValues.whiteColor,
  //             offset: const Offset(0.0, 0.0),
  //             blurRadius: 0.0,
  //             spreadRadius: 0.0,
  //           ),
  //         ],
  //         color: ColorValues.whiteColor,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width / 1,
  //         child: TextField(
  //           style: GoogleFonts.lato(
  //             textStyle:
  //                 TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
  //           ),
  //           controller: controller.titleTextCtrlr,
  //           keyboardType: TextInputType.multiline,
  //           autofocus: false,
  //           decoration: InputDecoration(
  //             fillColor: ColorValues.whiteColor,
  //             filled: true,
  //             contentPadding: Dimens.edgeInsets05_10,
  //             border: InputBorder.none,
  //             enabledBorder: InputBorder.none,
  //             focusedBorder: InputBorder.none,
  //             focusedErrorBorder: controller.isTitleTextInvalid.value
  //                 ? OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(5),
  //                     borderSide: BorderSide(
  //                       color: ColorValues.redColorDark,
  //                     ),
  //                   )
  //                 : InputBorder.none,
  //             errorBorder: controller.isTitleTextInvalid.value
  //                 ? OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(5),
  //                     borderSide: BorderSide(
  //                       color: ColorValues.redColorDark,
  //                     ),
  //                   )
  //                 : null,
  //             errorText:
  //                 controller.isTitleTextInvalid.value ? "Required field" : null,
  //           ),
  //           onChanged: (value) {
  //             if (value.trim().length > 3) {
  //               controller.isTitleTextInvalid.value = false;
  //             } else {
  //               controller.isTitleTextInvalid.value = true;
  //             }
  //           },
  //         ),
  //       ),
  //     ),
  //   ]);
  // }

  // Widget _buildWorkPermitReferenceTextField_web(BuildContext context) {
  //   return Column(//
  //       children: [
  //     // Align(
  //     //   alignment: Alignment.centerLeft,
  //     //   child: Padding(
  //     //     padding: const EdgeInsets.only(left: 10),
  //     //     child: RichText(
  //     //       text:
  //     //           TextSpan(text: 'Title: ', style: Styles.blackBold16, children: [
  //     //         TextSpan(
  //     //           text: '*',
  //     //           style: TextStyle(
  //     //             color: ColorValues.orangeColor,
  //     //             fontWeight: FontWeight.bold,
  //     //           ),
  //     //         ),
  //     //       ]),
  //     //     ),
  //     //   ),
  //     // ),

  //     Container(
  //       height: MediaQuery.of(context).size.height * 0.050,
  //       // width: Responsive.isDesktop(context)
  //       //     ? MediaQuery.of(context).size.width / 1.75
  //       //     : MediaQuery.of(context).size.width / 1.1,
  //       //  margin: EdgeInsets.all(20),
  //       margin: EdgeInsets.only(left: 10, right: 18, bottom: 10),
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
  //           ),
  //           BoxShadow(
  //             color: ColorValues.whiteColor,
  //             offset: const Offset(0.0, 0.0),
  //             blurRadius: 0.0,
  //             spreadRadius: 0.0,
  //           ),
  //         ],
  //         color: ColorValues.whiteColor,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width / 1,
  //         child: TextField(
  //           style: GoogleFonts.lato(
  //             textStyle:
  //                 TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
  //           ),
  //           controller: controller.workPermitNumberTextCtrlr,
  //           keyboardType: TextInputType.multiline,
  //           autofocus: false,
  //           decoration: InputDecoration(
  //             fillColor: ColorValues.whiteColor,
  //             filled: true,
  //             contentPadding: Dimens.edgeInsets05_10,
  //             border: InputBorder.none,
  //             enabledBorder: InputBorder.none,
  //             focusedBorder: InputBorder.none,
  //             focusedErrorBorder: controller.isWorPermitNumberTextInvalid.value
  //                 ? OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(5),
  //                     borderSide: BorderSide(
  //                       color: ColorValues.redColorDark,
  //                     ),
  //                   )
  //                 : InputBorder.none,
  //             errorBorder: controller.isWorPermitNumberTextInvalid.value
  //                 ? OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(5),
  //                     borderSide: BorderSide(
  //                       color: ColorValues.redColorDark,
  //                     ),
  //                   )
  //                 : null,
  //             errorText: controller.isWorPermitNumberTextInvalid.value
  //                 ? "Required field"
  //                 : null,
  //           ),
  //           onChanged: (value) {
  //             if (value.trim().length > 3) {
  //               controller.isWorPermitNumberTextInvalid.value = false;
  //             } else {
  //               controller.isWorPermitNumberTextInvalid.value = true;
  //             }
  //           },
  //         ),
  //       ),
  //     ),
  //     Dimens.boxHeight10,
  //   ]);
  // }

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

  Future<DateTime?> pickDateTBT_web(BuildContext context) async {
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

  Future<TimeOfDay?> pickTimeTBT_web(BuildContext context) async {
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

  Widget _buildWorkPermitCommentTextField_web(BuildContext context) {
    return Column(children: [
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

      Container(
        // height: MediaQuery.of(context).size.height * 0.1,
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.75
        //     : MediaQuery.of(context).size.width / 1.1,
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
            autofocus: false,
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
    return StatefulBuilder(builder: ((context, setState) {
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
              // height: double.infinity,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 1.5,
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

  checkBoxMethod(int position) {
    return Checkbox(
        value: position == 1
            ? controller.isChecked1.value = true
            // : position == 2
            //     ? controller.isChecked2.value
            //     : position == 3
            //         ? controller.isChecked3.value
            //         : position == 4
            //             ? controller.isChecked4.value
            //             : position == 5
            //                 ? controller.isChecked5.value
            //                 : position == 6
            //                     ? controller.isChecked6.value
            //                     : position == 7
            //                         ? controller.isChecked7.value
            : null,
        onChanged: (bool? value) {
          position == 1
              ? controller.toggleCheckbox1()
              // : position == 2
              //     ? controller.toggleCheckbox2()
              //     : position == 3
              //         ? controller.toggleCheckbox3()
              //         : position == 4
              //             ? controller.toggleCheckbox4()
              //             : position == 5
              //                 ? controller.toggleCheckbox5()
              //                 : position == 6
              //                     ? controller.toggleCheckbox6()
              //                     : position == 7
              //                         ? controller.toggleCheckbox7()
              : null;
        });
  }

  void _removeRow(int index) {
    controller.filteredEmployeeNameList.removeAt(index);
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
// import 'package:cmms/app/app.dart';
// import 'package:cmms/app/widgets/custom_elevated_button.dart';
// import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
// import 'package:cmms/app/widgets/custom_richtext.dart';
// import 'package:cmms/app/new_permit/new_permit_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cmms/app/widgets/custom_textfield.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart';
// import 'package:scrollable_table_view/scrollable_table_view.dart';

// // import '../../widgets/custom_multiselect_dialog_field.dart';
// // import '../../widgets/custom_elevated_button.dart';
// // import '../../widgets/custom_richtext.dart';
// // import '../preventive_list_controller.dart';

// class NewPermitWeb
//     extends GetView<NewPermitController> {
//   NewPermitWeb({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         color: Color.fromARGB(255, 234, 236, 238),
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           children: [
//             Container(
//               height: 45,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Color.fromARGB(255, 227, 224, 224),
//                   width: 1,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: ColorValues.greyLightColor,
//                   ),
//                   Text(
//                     "Dashboard",
//                     style: Styles.greyLight14,
//                   ),
//                   Text(" / Preventive Maintenance",
//                       style: Styles.greyMediumLight12),
//                   Text(" / Create Checklist Number",
//                       style: Styles.greyMediumLight12)
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: (MediaQuery.of(context).size.width * .3),
//                     margin: EdgeInsets.only(left: 30, top: 30),
//                     height: MediaQuery.of(context).size.height / 1.6,
//                     child: Card(
//                       color: Color.fromARGB(255, 251, 252, 253),
//                       elevation: 10,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 10.0, right: 10, top: 10),
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Create Checklist Number",
//                                     style: Styles.blackBold16,
//                                   ),
//                                   SizedBox(
//                                     height: 30,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       CustomRichText(
//                                           title: 'CheckList Number: '),
//                                       Container(
//                                           width: (MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .2) -
//                                               30,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             border: Border.all(
//                                               color: Color.fromARGB(
//                                                   255, 227, 224, 224),
//                                               width: 1,
//                                             ),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Color.fromARGB(
//                                                         255, 236, 234, 234)
//                                                     .withOpacity(0.5),
//                                                 spreadRadius: 2,
//                                                 blurRadius: 5,
//                                                 offset: Offset(0, 2),
//                                               ),
//                                             ],
//                                           ),
//                                           child: LoginCustomTextfield()),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       CustomRichText(
//                                           title: 'Equipment Category: '),
//                                       // Container(
//                                       //   decoration: BoxDecoration(
//                                       //     borderRadius:
//                                       //         BorderRadius.circular(10),
//                                       //     border: Border.all(
//                                       //       color: Color.fromARGB(
//                                       //           255, 227, 224, 224),
//                                       //       width: 1,
//                                       //     ),
//                                       //     boxShadow: [
//                                       //       BoxShadow(
//                                       //         color: Color.fromARGB(
//                                       //                 255, 236, 234, 234)
//                                       //             .withOpacity(0.5),
//                                       //         spreadRadius: 2,
//                                       //         blurRadius: 5,
//                                       //         offset: Offset(0, 2),
//                                       //       ),
//                                       //     ],
//                                       //   ),
//                                       //   width:
//                                       //       (MediaQuery.of(context).size.width *
//                                       //               .2) -
//                                       //           40,
//                                       //   child: CustomMultiSelectDialogField(
//                                       //     initialValue: (controller
//                                       //             .selectedEquipmentCategoryIdList
//                                       //             .isNotEmpty)
//                                       //         ? controller
//                                       //             .selectedEquipmentCategoryIdList
//                                       //         : [],
//                                       //     items: controller
//                                       //         .equipmentCategoryList
//                                       //         .map(
//                                       //           (equipmentCategory) =>
//                                       //               MultiSelectItem(
//                                       //             equipmentCategory?.id,
//                                       //             equipmentCategory?.name ?? '',
//                                       //           ),
//                                       //         )
//                                       //         .toList(),
//                                       //     onConfirm: (selectedOptionsList) => {
//                                       //       controller
//                                       //           .equipmentCategoriesSelected(
//                                       //               selectedOptionsList)
//                                       //     },
//                                       //   ),
//                                       // ),R
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       CustomRichText(title: 'Frequency: '),
//                                       Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             border: Border.all(
//                                               color: Color.fromARGB(
//                                                   255, 227, 224, 224),
//                                               width: 1,
//                                             ),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Color.fromARGB(
//                                                         255, 236, 234, 234)
//                                                     .withOpacity(0.5),
//                                                 spreadRadius: 2,
//                                                 blurRadius: 5,
//                                                 offset: Offset(0, 2),
//                                               ),
//                                             ],
//                                           ),
//                                           width: (MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .2) -
//                                               30,
//                                           child: LoginCustomTextfield()),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       CustomRichText(title: 'Manpower: '),
//                                       Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             border: Border.all(
//                                               color: Color.fromARGB(
//                                                   255, 227, 224, 224),
//                                               width: 1,
//                                             ),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Color.fromARGB(
//                                                         255, 236, 234, 234)
//                                                     .withOpacity(0.5),
//                                                 spreadRadius: 2,
//                                                 blurRadius: 5,
//                                                 offset: Offset(0, 2),
//                                               ),
//                                             ],
//                                           ),
//                                           width: (MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .2) -
//                                               30,
//                                           child: LoginCustomTextfield()),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       CustomRichText(
//                                           title: 'Duration(in Min.): '),
//                                       Container(
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             border: Border.all(
//                                               color: Color.fromARGB(
//                                                   255, 227, 224, 224),
//                                               width: 1,
//                                             ),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Color.fromARGB(
//                                                         255, 236, 234, 234)
//                                                     .withOpacity(0.5),
//                                                 spreadRadius: 2,
//                                                 blurRadius: 5,
//                                                 offset: Offset(0, 2),
//                                               ),
//                                             ],
//                                           ),
//                                           width: (MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   .2) -
//                                               30,
//                                           child: LoginCustomTextfield()),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                 ]),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                   height: 45,
//                                   child: CustomElevatedButton(
//                                       backgroundColor:
//                                           Color.fromARGB(255, 223, 101, 80),
//                                       onPressed: () {},
//                                       text: 'Cancel')),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Container(
//                                   height: 45,
//                                   child: CustomElevatedButton(
//                                       backgroundColor:
//                                           Color.fromARGB(255, 102, 249, 132),
//                                       onPressed: () {},
//                                       text: 'Create Number')),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 7,
//                       margin: EdgeInsets.only(left: 10, top: 30),
//                       height: Get.height,
//                       child: Card(
//                         color: Color.fromARGB(255, 251, 252, 253),
//                         elevation: 10,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Text(
//                                 "Checklist Number List",
//                                 style: Styles.blackBold16,
//                               ),
//                             ),
//                             Divider(
//                               color: ColorValues.greyLightColour,
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   margin: EdgeInsets.only(left: 10),
//                                   child: CustomElevatedButton(
//                                       backgroundColor: Colors.blue,
//                                       onPressed: () {},
//                                       text: 'Copy'),
//                                 ),
//                                 Container(
//                                   height: 40,
//                                   margin: EdgeInsets.only(left: 10),
//                                   child: CustomElevatedButton(
//                                       backgroundColor: Colors.blue,
//                                       onPressed: () {},
//                                       text: 'Excel'),
//                                 ),
//                                 Container(
//                                   height: 40,
//                                   margin: EdgeInsets.only(left: 10),
//                                   child: CustomElevatedButton(
//                                       backgroundColor: Colors.blue,
//                                       onPressed: () {},
//                                       text: 'PDF'),
//                                 ),
//                                 Container(
//                                   height: 40,
//                                   margin: EdgeInsets.only(left: 10),
//                                   child: CustomElevatedButton(
//                                       backgroundColor: Colors.blue,
//                                       onPressed: () {},
//                                       text: 'Column Visibility'),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             // Expanded(
//                             //   child: ScrollableTableView(
//                             //     paginationController:
//                             //         controller.paginationController,
//                             //     columns: [
//                             //       "Checklist Number ",
//                             //       "Active Status ",
//                             //       "Category ",
//                             //       "Frequency ",
//                             //       "PM Manpower",
//                             //       "PM Duration(in Min.)"
//                             //     ].map((column) {
//                             //       return TableViewColumn(
//                             //         minWidth: Get.width * 0.12,
//                             //         label: column,
//                             //       );
//                             //     }).toList(),
//                             //     rows: //
//                             //         [
//                             //       ...List.generate(
//                             //         controller.preventiveCheckList?.length ?? 0,
//                             //         (index) {
//                             //           var preventiveCheckListModelListDetails =
//                             //               controller
//                             //                   .preventiveCheckList?[index];
//                             //           return [
//                             //             '${preventiveCheckListModelListDetails?.checklist_number}',
//                             //             "No", //'${preventiveCheckListModelListDetails?.status ?? ''}',
//                             //             '${preventiveCheckListModelListDetails?.category_name}',
//                             //             '${preventiveCheckListModelListDetails?.frequency_name}',
//                             //             '${preventiveCheckListModelListDetails?.manPower}',
//                             //             '${preventiveCheckListModelListDetails?.duration}',
//                             //           ];
//                             //         },
//                             //       ),
//                             //     ].map((_preventiveCheckList) {
//                             //       return TableViewRow(
//                             //           height: 60,
//                             //           cells: _preventiveCheckList.map((value) {
//                             //             return TableViewCell(
//                             //                 child: Text(
//                             //               value,
//                             //             ));
//                             //           }).toList());
//                             //     }).toList(),
//                             //   ),
//                             // ),
//                             // Padding(
//                             //   padding:
//                             //       const EdgeInsets.symmetric(horizontal: 25),
//                             //   child: ValueListenableBuilder(
//                             //       valueListenable:
//                             //           controller.paginationController,
//                             //       builder: (context, value, child) {
//                             //         return Row(children: [
//                             //           Text(
//                             //               "${controller.paginationController.currentPage}  of ${controller.paginationController.pageCount}"),
//                             //           Row(children: [
//                             //             IconButton(
//                             //               onPressed: controller
//                             //                           .paginationController
//                             //                           .currentPage <=
//                             //                       1
//                             //                   ? null
//                             //                   : () {
//                             //                       controller
//                             //                           .paginationController
//                             //                           .previous();
//                             //                     },
//                             //               iconSize: 20,
//                             //               splashRadius: 20,
//                             //               icon: Icon(
//                             //                 Icons.arrow_back_ios_new_rounded,
//                             //                 color: controller
//                             //                             .paginationController
//                             //                             .currentPage <=
//                             //                         1
//                             //                     ? Colors.black26
//                             //                     : Theme.of(context)
//                             //                         .primaryColor,
//                             //               ),
//                             //             ),
//                             //             IconButton(
//                             //               onPressed: controller
//                             //                           .paginationController
//                             //                           .currentPage >=
//                             //                       controller
//                             //                           .paginationController
//                             //                           .pageCount
//                             //                   ? null
//                             //                   : () {
//                             //                       controller
//                             //                           .paginationController
//                             //                           .next();
//                             //                     },
//                             //               iconSize: 20,
//                             //               splashRadius: 20,
//                             //               icon: Icon(
//                             //                 Icons.arrow_forward_ios_rounded,
//                             //                 color: controller
//                             //                             .paginationController
//                             //                             .currentPage >=
//                             //                         controller
//                             //                             .paginationController
//                             //                             .pageCount
//                             //                     ? Colors.black26
//                             //                     : Theme.of(context)
//                             //                         .primaryColor,
//                             //               ),
//                             //             ),
//                             //           ]),
//                             //         ]);
//                             //       }),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
