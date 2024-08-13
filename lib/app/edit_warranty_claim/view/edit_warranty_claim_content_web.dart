// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/edit_warranty_claim/edit_warranty_claim_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class EditWarrantyClaimWeb extends GetView<EditWarrantyClaimController> {
  EditWarrantyClaimWeb({super.key});

  bool valuefirst = false;

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  // final controller = Get.find<HomeController>();
  final EditWarrantyClaimController controller = Get.find();
  final homecontroller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) => SelectionArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: HeaderWidget(),
          //   elevation: 0,
          //   toolbarHeight: 60,
          //   automaticallyImplyLeading: false,
          // ),
          body: Obx(
            () => Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 450),
                  margin: EdgeInsets.only(
                      left: homecontroller.menuButton.value ? 250.0 : 70.0),
                  width: Get.width,
                  height: Get.height,
                  child: Row(
                    children: [
                      Responsive.isMobile(context) ||
                              Responsive.isTablet(context)
                          ? Dimens.box0
                          : Container(),
                      Expanded(
                        child: RepaintBoundary(
                          key: controller.printKey,
                          child: Container(
                            // margin: Dimens.edgeInsets16,
                            height: Get.height,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3)),
                            ),
                            constraints: BoxConstraints(
                              maxWidth: 1100,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  HeaderWidget(),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 227, 224, 224),
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(255, 236, 234, 234)
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
                                            Get.back();
                                          },
                                          child: Text(
                                              " / Warranty Claim List"
                                                  .toUpperCase(),
                                              style: Styles.greyMediumLight12),
                                        ),
                                        Text(
                                            " / Edit Warranty Claim"
                                                .toUpperCase(),
                                            style: Styles.greyMediumLight12)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CustomAppBar(
                                    title: 'Edit Warranty Claim'.tr,
                                    action: Text(
                                        "WC Id: ${controller.editWarrantyClaimDetailsModel.value?.wc_id}"),
                                  ),
                                  Dimens.boxHeight10,
                                  Card(
                                    color: Colors.lightBlue.shade50,
                                    child: Wrap(
                                      children: [
                                        GetBuilder<EditWarrantyClaimController>(
                                            id: 'block_field',
                                            builder: (controller) {
                                              return Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CustomTextField(
                                                        label:
                                                            'Warranty Claim Title: ',
                                                        hintText:
                                                            '${controller.editWarrantyClaimDetailsModel.value?.warranty_claim_title}',
                                                        maxLine: 3,
                                                        textController: controller
                                                            .warrantyClaimTitleTextController,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.3,
                                                        height: 80,
                                                        child: CustomTextField(
                                                          label:
                                                              'Warranty Brief Description: ',
                                                          hintText:
                                                              '${controller.editWarrantyClaimDetailsModel.value?.warranty_description}',
                                                          textController: controller
                                                              .warrantyClaimBriefDescTextController,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Equipment Categories: '),
                                                          SizedBox(
                                                            width: 25,
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                3.8,
                                                            child:
                                                                //     CustomMultiSelectDialogField(
                                                                //   buttonText:
                                                                //       'Select Equipment Categories',
                                                                //   title: 'Equipment Categories',
                                                                //   // initialValue: [],
                                                                //   initialValue: (controller
                                                                //           .selectedEquipmentCategoryIdList
                                                                //           .isNotEmpty)
                                                                //       ? controller
                                                                //           .selectedEquipmentCategoryIdList
                                                                //       : [],
                                                                //   items: controller
                                                                //       .equipmentCategoryList
                                                                //       .map(
                                                                //         (equipmentCategory) =>
                                                                //             MultiSelectItem(
                                                                //           equipmentCategory?.id,
                                                                //           equipmentCategory
                                                                //                   ?.name ??
                                                                //               '',
                                                                //         ),
                                                                //       )
                                                                //       .toList(),
                                                                //   onConfirm:
                                                                //       (selectedOptionsList) => {
                                                                //     controller
                                                                //         .equipmentCategoriesSelected(
                                                                //             selectedOptionsList),
                                                                //     print(
                                                                //         'Equipment category list ${controller.selectedEquipmentCategoryIdList}')
                                                                //   },
                                                                //   // items: [],
                                                                // ),
                                                                Obx(
                                                              () =>
                                                                  DropdownWebWidget(
                                                                dropdownList:
                                                                    controller
                                                                        .equipmentCategoryList,
                                                                isValueSelected:
                                                                    controller
                                                                        .isEquipmentCategorySelected
                                                                        .value,
                                                                selectedValue:
                                                                    controller
                                                                        .selectedEquipmentCategory
                                                                        .value,
                                                                onValueChanged:
                                                                    controller
                                                                        .onValueChanged,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Equipment Name: '),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          // Text("${controller.inventoryNameList.length}"),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                3.8,
                                                            child: Obx(
                                                              () =>
                                                                  DropdownWebWidget(
                                                                dropdownList:
                                                                    controller
                                                                        .eqipmentNameList,
                                                                isValueSelected:
                                                                    controller
                                                                        .isEquipmentNameSelected
                                                                        .value,
                                                                selectedValue:
                                                                    controller
                                                                        .selectedEquipmentName
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
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),

                                                  ///Affected Part
                                                  Obx(
                                                    () => Container(
                                                      margin:
                                                          Dimens.edgeInsets20,
                                                      height: ((controller
                                                                  .rowItems
                                                                  .value
                                                                  .length) *
                                                              90) +
                                                          170,
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
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Column(children: [
                                                        // Column(
                                                        //     children: []..addAll(controller.rowItem.value.map((e) {
                                                        //         return Text(jsonEncode(e));
                                                        //       }))),
                                                        // Text(jsonEncode(controller.dropdownMapperData)),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Select Affected Part ",
                                                                style: Styles
                                                                    .blue700,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  controller
                                                                      .addRowItem();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 25,
                                                                  width: 70,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ColorValues
                                                                        .addNewColor,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: ColorValues
                                                                          .lightGreyColorWithOpacity35,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(5)),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      " + Add ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .w100,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: DataTable2(
                                                            // minWidth: 2000,
                                                            dataRowHeight: 70,
                                                            columnSpacing: 10,
                                                            border: TableBorder.all(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        206,
                                                                        229,
                                                                        234)),
                                                            columns: [
                                                              DataColumn2(
                                                                  // fixedWidth: 150,
                                                                  label: Text(
                                                                "Affected Parts",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                              DataColumn2(
                                                                  fixedWidth:
                                                                      100,
                                                                  label: Text(
                                                                    "Action",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                            ],
                                                            rows: controller
                                                                .rowItems.value
                                                                .map((record) {
                                                              return DataRow(
                                                                // height: 130,
                                                                cells: record.map(
                                                                    (mapData) {
                                                                  return DataCell(
                                                                    (mapData['key'] ==
                                                                            "Affected Parts")
                                                                        ? Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 10),
                                                                            child:
                                                                                Column(
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
                                                                                      maxLine: 1,
                                                                                      textController: new TextEditingController(text: mapData["value"] ?? ''),
                                                                                      onChanged: (txt) {
                                                                                        mapData["value"] = txt;
                                                                                      },
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        : (mapData['key'] ==
                                                                                "Action ")
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
                                                                                        controller.rowItems.remove(record);
                                                                                      },
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            : Text(mapData['key'] ??
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

                                                  //SizedBox(
                                                  //  height: 220,
                                                  //  width: MediaQuery.of(context)
                                                  //.size
                                                  //.width /
                                                  //       1.2,
                                                  //  child: Center(
                                                  //    child: Container(
                                                  //      margin: Dimens.edgeInsets16,
                                                  //      height: Get.height,
                                                  //      decoration: BoxDecoration(
                                                  //        border: Border.all(
                                                  //            color: Colors.grey
                                                  //                .withOpacity(.3)),
                                                  //      ),
                                                  //      constraints: BoxConstraints(
                                                  //        maxWidth: 1100,
                                                  //      ),
                                                  //      child: SingleChildScrollView(
                                                  //        child: Column(
                                                  //          children: [
                                                  //            CustomAppBar(
                                                  //              title: 'Affected Part'.tr,
                                                  //            ),
                                                  //            Dimens.boxHeight10,
                                                  //            Wrap(
                                                  //              children: [
                                                  //                Padding(
                                                  //                  padding:
                                                  //                      const EdgeInsets
                                                  //                          .only(
                                                  //                          left: 150),
                                                  //                  child: Row(
                                                  //                    children: [
                                                  //                      CustomRichText(
                                                  //                          title:
                                                  //                              'Select Affected Part: '),
                                                  //                      SizedBox(
                                                  //                        width: 5,
                                                  //                      ),
                                                  //                      SizedBox(
                                                  //                        width: MediaQuery.of(
                                                  //                                    context)
                                                  //                                .size
                                                  //                                .width /
                                                  //                            3.8,
                                                  //                        child: Obx(
                                                  //                          () =>
                                                  //                              DropdownWebWidget(
                                                  //                            dropdownList:
                                                  //                                controller
                                                  //                                    .affectedPartEqipmentNameList,
                                                  //                            isValueSelected:
                                                  //                                controller
                                                  //                                    .isAffectedPartSelected
                                                  //                                    .value,
                                                  //                            selectedValue:
                                                  //                                controller
                                                  //                                    .selectedAffectedPart
                                                  //                                    .value,
                                                  //                            onValueChanged:
                                                  //                                controller
                                                  //                                    .onValueChanged,
                                                  //                          ),
                                                  //                        ),
                                                  //               //child: Obx(
                                                  //   //() => DropdownWebWidget(
                                                  //     //dropdownList: controller
                                                  //         //.equipmentCategoryList,
                                                  //     //isValueSelected: controller
                                                  //         //.isEquipmentCategorySelected
                                                  //         //.value,
                                                  //     //selectedValue: controller
                                                  //         //.selectedEquipmentCategory
                                                  //         //.value,
                                                  //     //onValueChanged: controller
                                                  //         //.onValueChanged,
                                                  //   //),
                                                  // //),
                                                  //     //CustomMultiSelectDialogField(
                                                  //   //buttonText:
                                                  //       //'Affected parts',
                                                  //   //title:
                                                  //       //'Select Affected Part',
                                                  //   //initialValue: (controller
                                                  //           //.selectedAffectedPartEquipmentIdList
                                                  //           //.isNotEmpty)
                                                  //       //? controller
                                                  //           //.selectedAffectedPartEquipmentIdList
                                                  //       //: [],
                                                  //   //items: controller
                                                  //       //.affectedPartEqipmentNameList
                                                  //       //.map(
                                                  //         //(equipmentList) =>
                                                  //             //MultiSelectItem(
                                                  //           //equipmentList
                                                  //               //?.id,
                                                  //           //equipmentList?.name ??
                                                  //               //'',
                                                  //         //),
                                                  //       //)
                                                  //       //.toList(),
                                                  //   //onConfirm:
                                                  //       //(selectedOptionsList) =>
                                                  //           //{
                                                  //     //controller
                                                  //         //.affectedPartSelected(
                                                  //             //selectedOptionsList),
                                                  //     //print(
                                                  //         //'Affected part Equipment Name list ${controller.selectedAffectedPartEquipmentIdList}')
                                                  //   //},
                                                  // //),
                                                  //                      ),
                                                  //                      SizedBox(
                                                  //                        width: 100,
                                                  //                      ),
                                                  //                    ],
                                                  //                  ),
                                                  //                ),
                                                  //              ],
                                                  //            ),
                                                  //          ],
                                                  //        ),
                                                  //      ),
                                                  //    ),
                                                  //  ),
                                                  //),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CustomTextField(
                                                        label:
                                                            'Failure Date & Time: ',
                                                        suffixIcon: Icon(
                                                          Icons.calendar_month,
                                                        ),
                                                        // textController:
                                                        //     controller.categoryTextController,
                                                        textController: controller
                                                            .failureDateTimeCtrlrWeb,

                                                        onTap: () {
                                                          pickFailureDateTime_web(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CustomTextField(
                                                        label:
                                                            'Approximate Daily Loss: ',
                                                        // textController:
                                                        //     controller.categoryTextController,
                                                      ),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      CustomRichText(
                                                          title: 'Severity: '),
                                                      Row(
                                                        // mainAxisAlignment:
                                                        //     MainAxisAlignment.spaceAround,
                                                        children: [
                                                          buildRadioButton(
                                                              'Critical',
                                                              Colors.red,
                                                              context),
                                                          buildRadioButton(
                                                              'High',
                                                              Colors.orange,
                                                              context),
                                                          buildRadioButton(
                                                              'Medium',
                                                              Colors.yellow,
                                                              context),
                                                          buildRadioButton(
                                                              'Low',
                                                              Colors.green,
                                                              context),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          CustomTextField(
                                                            textController:
                                                                controller
                                                                    .currentdateTextController,
                                                            label:
                                                                'Applied At:',
                                                            hintText:
                                                                '${controller.editWarrantyClaimDetailsModel.value?.date_of_claim}',
                                                          ),
                                                          CustomTextField(
                                                            textController:
                                                                controller
                                                                    .affectedSerialNoTextController,
                                                            label:
                                                                'Affected Sr.No.:',
                                                            hintText:
                                                                '${controller.editWarrantyClaimDetailsModel.value?.affected_sr_no}',
                                                          ),
                                                          CustomTextField(
                                                            readOnly: true,
                                                            hintText:
                                                                'Justin Fernandez',
                                                            label:
                                                                'Manufacturer Name:',
                                                          ),
                                                          CustomTextField(
                                                            textController:
                                                                controller
                                                                    .orderReferenceNoTextController,
                                                            label:
                                                                'Order/Contract Reference No.:',
                                                            hintText:
                                                                '${controller.editWarrantyClaimDetailsModel.value?.order_reference_number}',
                                                          ),
                                                          CustomTextField(
                                                            textController:
                                                                controller
                                                                    .warrantyStartDateTimeCtrlrWeb,
                                                            label:
                                                                'Warranty Start Date:',
                                                            suffixIcon: Icon(Icons
                                                                .calendar_month),
                                                            onTap: () {
                                                              pickWarrantyStartDateTime_web(
                                                                  context);
                                                            },
                                                          ),
                                                          CustomTextField(
                                                            textController:
                                                                controller
                                                                    .warrantyEndDateTimeCtrlrWeb,
                                                            label:
                                                                'Warranty End Date:',
                                                            suffixIcon: Icon(Icons
                                                                .calendar_month),
                                                            onTap: () {
                                                              pickWarrantyEndDateTime_web(
                                                                  context);
                                                            },
                                                          ),
                                                          CustomTextField(
                                                            textController:
                                                                controller
                                                                    .costOfReplacementTextController,
                                                            label:
                                                                'Cost of Replacement:',
                                                            hintText:
                                                                '${controller.editWarrantyClaimDetailsModel.value?.cost_of_replacement}',
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),

                                                      ///Additional Email
                                                      SizedBox(
                                                        height: 400,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                        child: Center(
                                                          child: Container(
                                                            margin: Dimens
                                                                .edgeInsets16,
                                                            height: Get.height,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          .3)),
                                                            ),
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 1100,
                                                            ),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Obx(
                                                                () => Column(
                                                                  children: [
                                                                    CustomAppBar(
                                                                      title:
                                                                          'Additional Emails'
                                                                              .tr,
                                                                      // action: ActionButton(
                                                                      //   icon: Icons.add,
                                                                      //   label: 'Add',
                                                                      //   // onPress:
                                                                      //   //     () async {},
                                                                      //   color: Colors.blue,
                                                                      //   onPressed: () {},
                                                                      // ),
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight10,
                                                                    Wrap(
                                                                      children: [
                                                                        Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: MediaQuery.of(context).size.width / 1.5,
                                                                              child: DefaultTabController(
                                                                                length: 2,
                                                                                child: Column(
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(1.0),
                                                                                      child: Container(
                                                                                        height: 45,
                                                                                        decoration: BoxDecoration(
                                                                                          border: Border.all(color: Colors.grey),
                                                                                          color: Colors.white,
                                                                                          borderRadius: BorderRadius.circular(1),
                                                                                        ),
                                                                                        child: TabBar(
                                                                                          labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                                                          labelColor: Colors.black,
                                                                                          indicator: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(1)),
                                                                                          unselectedLabelColor: Colors.black,
                                                                                          tabs: [
                                                                                            Tab(
                                                                                              child: Text('Employee'),
                                                                                            ),
                                                                                            Tab(
                                                                                              child: Text(
                                                                                                'External Emails',
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 250,
                                                                                      width: MediaQuery.of(context).size.width / 2,
                                                                                      child: TabBarView(children: [
                                                                                        ///First TabBar View
                                                                                        Container(
                                                                                            // decoration: BoxDecoration(color: Colors.grey),
                                                                                            child: Column(
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            SizedBox(
                                                                                              height: 15,
                                                                                            ),

                                                                                            emailDropdown(
                                                                                              context,
                                                                                              'Select Employees',
                                                                                            ),

                                                                                            SizedBox(
                                                                                              height: 10,
                                                                                            ),
                                                                                            // emailDropdown(context, 'Sujit Kumar'),
                                                                                            // SizedBox(
                                                                                            //   height: 10,
                                                                                            // ),
                                                                                            // emailDropdown(context, 'Amit Kumar'),
                                                                                            // SizedBox(
                                                                                            //   height: 10,
                                                                                            // ),
                                                                                            // emailDropdown(context, 'Joseph Fernandez'),
                                                                                          ],
                                                                                        )),

                                                                                        ////Second TabBar View

                                                                                        // Center(child: Text('Second Tab'))
                                                                                        SingleChildScrollView(
                                                                                          child: Column(
                                                                                            children: [
                                                                                              SizedBox(
                                                                                                height: 10,
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  // Text(
                                                                                                  //   'Sr. No',
                                                                                                  //   style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                  // ),
                                                                                                  SizedBox(
                                                                                                    width: 75,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Name',
                                                                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                  ),
                                                                                                  SizedBox(
                                                                                                    width: 175,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'Email',
                                                                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              SizedBox(
                                                                                                height: 10,
                                                                                              ),
                                                                                              Column(
                                                                                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                  children: [
                                                                                                // for (var rowData in controller.rowList) Text(rowData)

                                                                                                // for (var rowData2 in controller.rowList2)
                                                                                                //   Text(rowData2),

                                                                                                // for (var rowData3 in controller.rowList3)
                                                                                                //   Text(rowData3)
                                                                                              ]..addAll(controller.externalEmails.map((data) => Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          SizedBox(
                                                                                                            width: 75,
                                                                                                          ),
                                                                                                          SizedBox(width: 200, child: Text('${data.name}')),
                                                                                                          SizedBox(
                                                                                                            width: 20,
                                                                                                          ),
                                                                                                          SizedBox(width: 200, child: Text('${data.email}')),
                                                                                                        ],
                                                                                                      )))),

                                                                                              //For shwing External emails List from API
                                                                                              Column(
                                                                                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                  children: []..addAll(controller.externalEmailsList!.map((data) => Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          SizedBox(
                                                                                                            width: 75,
                                                                                                          ),
                                                                                                          SizedBox(width: 200, child: Text('${data?.name}')),
                                                                                                          SizedBox(
                                                                                                            width: 20,
                                                                                                          ),
                                                                                                          SizedBox(width: 200, child: Text('${data?.email}')),
                                                                                                        ],
                                                                                                      )))),

                                                                                              // SizedBox(
                                                                                              //     width: MediaQuery.of(context).size.width / 3,
                                                                                              //     child: CustomTextField(
                                                                                              //       textController: controller.serialNoTextFieldController,
                                                                                              //       label: 'Sr. No.',
                                                                                              //     )),
                                                                                              SizedBox(
                                                                                                  width: MediaQuery.of(context).size.width / 3,
                                                                                                  child: CustomTextField(
                                                                                                    textController: controller.nameTextFieldController,
                                                                                                    label: 'Name',
                                                                                                  )),
                                                                                              SizedBox(
                                                                                                  width: MediaQuery.of(context).size.width / 3,
                                                                                                  child: CustomTextField(
                                                                                                    textController: controller.emailTextFieldController,
                                                                                                    label: 'Email',
                                                                                                  )),
                                                                                              ElevatedButton(
                                                                                                onPressed: () {
                                                                                                  // controller.addRow(controller.serialNoTextFieldController.text);
                                                                                                  // controller.serialNoTextFieldController.clear();

                                                                                                  // controller.addRow(controller.nameTextFieldController.text);
                                                                                                  // controller.nameTextFieldController.clear();

                                                                                                  // controller.addRow(controller.emailTextFieldController.text);
                                                                                                  // controller.emailTextFieldController.clear();
                                                                                                  controller.updateText(controller.nameTextFieldController.text, controller.emailTextFieldController.text);
                                                                                                  controller.nameTextFieldController.clear();
                                                                                                  controller.emailTextFieldController.clear();
                                                                                                },
                                                                                                child: Text('Add'),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        )
                                                                                      ]),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),

                                                                        /// Employee
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Wrap(
                                                    children: [
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Container(
                                                        height: 250,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.15,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey)),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 20,
                                                                      top: 15),
                                                              child: Text(
                                                                  'Equipment Images'),
                                                            ),
                                                            Dimens.boxHeight30,
                                                            Row(
                                                              children: [
                                                                ////
                                                                /// FILE UPLOAD WIDGET
                                                                Container(
                                                                  height:
                                                                      Get.height *
                                                                          0.2,
                                                                  width:
                                                                      Get.width /
                                                                          1.3,
                                                                  child: Row(
                                                                      //
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              FileUploadWidgetWithDropzone(),
                                                                        ),
                                                                        Dimens
                                                                            .boxWidth10,
                                                                        Expanded(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                FileUploadDetailsWidgetWeb()),
                                                                      ]),
                                                                ),

                                                                // Padding(
                                                                //   padding:
                                                                //       const EdgeInsets
                                                                //               .only(
                                                                //           left: 90,
                                                                //           top: 30),
                                                                //   child: CircleAvatar(
                                                                //     radius: 70,
                                                                //     child: Text(
                                                                //       'Drop Files Here',
                                                                //       style:
                                                                //           Styles.white13,
                                                                //     ),
                                                                //   ),
                                                                // ),
                                                                // SizedBox(
                                                                //   width: 50,
                                                                // ),
                                                                // ////
                                                                // Container(
                                                                //   height: 100,
                                                                //   width: MediaQuery.of(
                                                                //               context)
                                                                //           .size
                                                                //           .width /
                                                                //       2.5,
                                                                //   decoration:
                                                                //       BoxDecoration(
                                                                //     border: Border.all(
                                                                //         color: Colors.grey
                                                                //             .withOpacity(
                                                                //                 .3)),
                                                                //   ),
                                                                //   constraints:
                                                                //       BoxConstraints(
                                                                //     maxWidth: 1100,
                                                                //   ),
                                                                //   child:
                                                                //       SingleChildScrollView(
                                                                //     child: Column(
                                                                //       children: [
                                                                //         CustomAppBar(
                                                                //           title: '#'.tr,
                                                                //           action: Row(
                                                                //             mainAxisAlignment:
                                                                //                 MainAxisAlignment
                                                                //                     .spaceBetween,
                                                                //             children: [
                                                                //               // Text('#'),

                                                                //               Text(
                                                                //                   'Name'),
                                                                //               Dimens
                                                                //                   .boxWidth20,
                                                                //               Text(
                                                                //                   'Upload Progress'),
                                                                //               Dimens
                                                                //                   .boxWidth20,
                                                                //               Text(
                                                                //                   'Status'),
                                                                //               Dimens
                                                                //                   .boxWidth20,
                                                                //               Text(
                                                                //                   'Description'),
                                                                //               Dimens
                                                                //                   .boxWidth20,
                                                                //               Text(
                                                                //                   'Remove'),
                                                                //               Dimens
                                                                //                   .boxWidth20,
                                                                //             ],
                                                                //           ),
                                                                //         ),
                                                                //         Dimens
                                                                //             .boxHeight10,
                                                                //         Wrap(
                                                                //           children: [
                                                                //             Row(
                                                                //               children: [
                                                                //                 SizedBox(
                                                                //                   width:
                                                                //                       10,
                                                                //                 ),
                                                                //                 Text(
                                                                //                     'Files list will appear heres'),
                                                                //               ],
                                                                //             ),
                                                                //             // Row(
                                                                //             //   mainAxisAlignment:
                                                                //             //       MainAxisAlignment.spaceEvenly,
                                                                //             //   children: [
                                                                //             //     SizedBox(
                                                                //             //       width:
                                                                //             //           MediaQuery.of(context).size.width / 3.8,
                                                                //             //       child:
                                                                //             //           CustomMultiSelectDialogField(
                                                                //             //         initialValue: [],
                                                                //             //         // initialValue: (
                                                                //             //         //   controller
                                                                //             //         //         .selectedEquipmentCategoryIdList
                                                                //             //         //         .isNotEmpty)
                                                                //             //         //     ? controller
                                                                //             //         //         .selectedEquipmentCategoryIdList
                                                                //             //         //     : [],
                                                                //             //         // items: controller
                                                                //             //         //     .equipmentCategoryList
                                                                //             //         //     .map(
                                                                //             //         //       (equipmentCategory) =>
                                                                //             //         //           MultiSelectItem(
                                                                //             //         //         equipmentCategory?.id,
                                                                //             //         //         equipmentCategory?.name ??
                                                                //             //         //             '',
                                                                //             //         //       ),
                                                                //             //         //     )
                                                                //             //         //     .toList(),
                                                                //             //         onConfirm: (selectedOptionsList) => {
                                                                //             //           // controller
                                                                //             //           //     .equipmentCategoriesSelected(
                                                                //             //           //         selectedOptionsList),
                                                                //             //           // print(
                                                                //             //           //     'Equipment list ${controller.equipmentCategoryList}')
                                                                //             //         },
                                                                //             //         items: [],
                                                                //             //       ),
                                                                //             //     ),
                                                                //             //     ActionButton(
                                                                //             //       icon:
                                                                //             //           Icons.remove,
                                                                //             //       label:
                                                                //             //           'Delete',
                                                                //             //       // onPress:
                                                                //             //       //     () async {},
                                                                //             //       color:
                                                                //             //           Colors.red,
                                                                //             //       onPressed:
                                                                //             //           () {},
                                                                //             //     ),
                                                                //             //   ],
                                                                //             // )
                                                                //           ],
                                                                //         ),
                                                                //       ],
                                                                //     ),
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              SizedBox(
                                                                height: 80,
                                                                child:
                                                                    CustomTextField(
                                                                  textController:
                                                                      controller
                                                                          .immediateCorrectiveActionTextController,
                                                                  label:
                                                                      'Immediate Corrective Action by Buyer: *',
                                                                  hintText:
                                                                      '${controller.editWarrantyClaimDetailsModel.value?.corrective_action_by_buyer}',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      // SizedBox(
                                                      //   width: 210,
                                                      // ),
                                                      Column(
                                                        children: [
                                                          CustomTextField(
                                                            textController:
                                                                controller
                                                                    .requestManufactureTextController,
                                                            label:
                                                                'Request to Supplier: ',
                                                            hintText:
                                                                '${controller.editWarrantyClaimDetailsModel.value?.request_to_supplier}',
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      CustomRichText(
                                                          title:
                                                              'Select Currency Unit: '),
                                                      Dimens.boxWidth5,
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            6,
                                                        child: Obx(
                                                          () =>
                                                              DropdownWebWidget(
                                                            dropdownList: controller
                                                                .unitCurrencyList,
                                                            isValueSelected:
                                                                controller
                                                                    .isUnitCurrencySelected
                                                                    .value,
                                                            selectedValue:
                                                                controller
                                                                    .selectedUnitCurrency
                                                                    .value,
                                                            onValueChanged:
                                                                controller
                                                                    .onValueChanged,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              );
                                            }),
                                        ////Supplier Actions
                                        Container(
                                          margin: Dimens.edgeInsets20,
                                          // height: Get.height,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(.3)),
                                          ),
                                          constraints: BoxConstraints(
                                            maxWidth: 1100,
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                CustomAppBar(
                                                  title:
                                                      'Schedule of Supplier Actions'
                                                          .tr,
                                                  // action: ActionButton(
                                                  //   icon: Icons.add,
                                                  //   label: 'Add',
                                                  //   // onPress:
                                                  //   //     () async {},
                                                  //   color: Colors.blue,
                                                  //   onPressed: () {
                                                  //     controller
                                                  //         .updateSupplierActionText(
                                                  //       controller
                                                  //           .supplierActionTextFieldController
                                                  //           .text,
                                                  //       controller
                                                  //           .supplierActionDateTimeCtrlrWeb
                                                  //           .text,
                                                  //       // controller.isCheckedRequire
                                                  //       //     .value
                                                  //     );
                                                  //     controller
                                                  //         .supplierActionTextFieldController
                                                  //         .clear();
                                                  //     controller
                                                  //         .supplierActionDateTimeCtrlrWeb
                                                  //         .clear();
                                                  //     // controller.isCheckedRequire
                                                  //     //     .value = false;
                                                  //   },
                                                  // ),
                                                ),
                                                Dimens.boxHeight10,
                                                Obx(
                                                  () => Wrap(children: [
                                                    Row(children: [
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text('#'),
                                                      SizedBox(
                                                        width: 35,
                                                      ),
                                                      Text('Supplier Action'),
                                                      SizedBox(
                                                        width: 215,
                                                      ),
                                                      Text('Required'),
                                                      SizedBox(
                                                        width: 180,
                                                      ),
                                                      Text('Required by Date'),
                                                      // SizedBox(
                                                      //   width: 150,
                                                      // ),
                                                      // Text('Action'),
                                                    ]),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Column(
                                                      children: []..addAll(
                                                          controller
                                                              .supplierActions
                                                              .map((element) =>
                                                                  Row(
                                                                    children: [
                                                                      // Text('${element.name}'),
                                                                      // Text('${element.required_by_date}')

                                                                      supplierActionData(
                                                                          '${element.srNumber}',
                                                                          '${element.name}',
                                                                          context,
                                                                          0,
                                                                          '${element.required_by_date}'),
                                                                    ],
                                                                  ))),
                                                    ),
                                                    Column(
                                                      children: []
                                                        ..addAll(controller
                                                            .supplierActionsList!
                                                            .map((element) =>
                                                                Row(
                                                                  children: [
                                                                    // Text('${element.name}'),
                                                                    // Text('${element.required_by_date}')

                                                                    supplierActionData(
                                                                        '#',
                                                                        '${element?.name}',
                                                                        context,
                                                                        0,
                                                                        '${element?.required_by_date}'),
                                                                  ],
                                                                ))),
                                                    ),

                                                    // supplierActionData(
                                                    //     '2',
                                                    //     'Material Replinishment',
                                                    //     context,
                                                    //     1),
                                                    // supplierActionData(
                                                    //     '3',
                                                    //     'Preventive Action Plan',
                                                    //     context,
                                                    //     2),
                                                    // supplierActionData(
                                                    //     '4',
                                                    //     'Claim Closure Date',
                                                    //     context,
                                                    //     3)
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                3,
                                                            child:
                                                                CustomTextField(
                                                              textController:
                                                                  controller
                                                                      .supplierActionSrNumberTextFieldController,
                                                              label:
                                                                  '  Serial Number',
                                                            )),
                                                        SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                3,
                                                            child:
                                                                CustomTextField(
                                                              textController:
                                                                  controller
                                                                      .supplierActionTextFieldController,
                                                              label:
                                                                  'Supplier Action',
                                                            )),

                                                        ///Checkbox
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                          340),
                                                              child: Text(
                                                                'Required',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 70,
                                                            ),
                                                            Checkbox(
                                                                value: controller
                                                                    .isCheckedRequire
                                                                    .value,
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  controller
                                                                      .requireToggleCheckbox();
                                                                }),
                                                          ],
                                                        ),

                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                          child:
                                                              CustomTextField(
                                                            label:
                                                                ' Required Date ',
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .calendar_month,
                                                            ),
                                                            // textController:
                                                            //     controller.categoryTextController,
                                                            textController:
                                                                controller
                                                                    .supplierActionDateTimeCtrlrWeb,

                                                            onTap: () {
                                                              pickRequiredSupplierDate_web(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                        // ActionButton(
                                                        //   icon: Icons.add,
                                                        //   label: 'Add',
                                                        //   // onPress:
                                                        //   //     () async {},
                                                        //   color: Colors.blue,
                                                        //   onPressed: () {
                                                        //     controller
                                                        //         .updateSupplierActionText(
                                                        //       controller
                                                        //           .supplierActionTextFieldController
                                                        //           .text,
                                                        //       controller
                                                        //           .supplierActionDateTimeCtrlrWeb
                                                        //           .text,
                                                        //       controller
                                                        //           .supplierActionSrNumberTextFieldController
                                                        //           .text,

                                                        //       // controller.isCheckedRequire
                                                        //       //     .value
                                                        //     );
                                                        //     controller
                                                        //         .supplierActionSrNumberTextFieldController
                                                        //         .clear();
                                                        //     controller
                                                        //         .supplierActionTextFieldController
                                                        //         .clear();
                                                        //     controller
                                                        //         .supplierActionDateTimeCtrlrWeb
                                                        //         .clear();
                                                        //     // controller.isCheckedRequire
                                                        //     //     .value = false;
                                                        //   },
                                                        // ),
                                                        ElevatedButton(
                                                          child: Text('Add'),
                                                          onPressed: () {
                                                            controller
                                                                .updateSupplierActionText(
                                                              controller
                                                                  .supplierActionTextFieldController
                                                                  .text,
                                                              controller
                                                                  .supplierActionDateTimeCtrlrWeb
                                                                  .text,
                                                              controller
                                                                  .supplierActionSrNumberTextFieldController
                                                                  .text,

                                                              // controller.isCheckedRequire
                                                              //     .value
                                                            );
                                                            controller
                                                                .supplierActionSrNumberTextFieldController
                                                                .clear();
                                                            controller
                                                                .supplierActionTextFieldController
                                                                .clear();
                                                            controller
                                                                .supplierActionDateTimeCtrlrWeb
                                                                .clear();
                                                            // controller.isCheckedRequire
                                                            //     .value = false;
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        Wrap(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              height: 250,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.15,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20, top: 15),
                                                    child: Text('Attachments'),
                                                  ),
                                                  Dimens.boxHeight30,
                                                  Row(
                                                    children: [
                                                      /// FILE UPLOAD WIDGET
                                                      Container(
                                                        height:
                                                            Get.height * 0.2,
                                                        width: Get.width / 1.3,
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
                                                                  child:
                                                                      FileUploadDetailsWidgetWeb()),
                                                            ]),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),

                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 20,
                                              ),
                                              CustomRichText(
                                                  title: 'Select Approver: '),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.8,
                                                child: Obx(
                                                  () => DropdownWebWidget(
                                                    dropdownList:
                                                        controller.employeeList,
                                                    isValueSelected: controller
                                                        .isemployeeListSelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedEmployeeList
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 150,
                                            ),
                                            CustomElevatedButton(
                                              backgroundColor:
                                                  ColorValues.appDarkBlueColor,
                                              onPressed: () {
                                                controller
                                                    .updateWarrantyClaim();
                                              },
                                              text: 'Update',
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            // CustomElevatedButton(
                                            //   backgroundColor: Colors.green,
                                            //   onPressed: () {
                                            //     // showAlertDialog();
                                            //     // controller.createWarrantyClaim();
                                            //   },
                                            //   text: 'Submit For Release',
                                            // ),
                                          ],
                                        )

                                        // Wrap(
                                        //   children: [
                                        //     Row(
                                        //       mainAxisSize: MainAxisSize.min,
                                        //       children: [
                                        //         CustomTextField(
                                        //           label: 'Calibration remainder In: ',
                                        //           width: 300,
                                        //         ),
                                        //         Container(
                                        //           width: 100,
                                        //           child: TextField(
                                        //             decoration: InputDecoration(
                                        //               contentPadding:
                                        //                   Dimens.edgeInsets16_0_16_0,
                                        //               focusedBorder: OutlineInputBorder(
                                        //                 borderSide: BorderSide(width: .2),
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(2),
                                        //               ),
                                        //               enabledBorder: OutlineInputBorder(
                                        //                 borderSide: BorderSide(width: .2),
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(2),
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //     Container(
                                        //       margin: Dimens.edgeInsets16,
                                        //       child: Row(
                                        //         mainAxisSize: MainAxisSize.min,
                                        //         children: [
                                        //           Text('Calibration cirtificate'),
                                        //           Dimens.boxWidth10,
                                        //           ActionButton(
                                        //             label: 'Upload cirtification file',
                                        //             onPressed: () {},
                                        //             icon: Icons.file_upload_outlined,
                                        //             color: Colors.blue,
                                        //           )
                                        //         ],
                                        //       ),
                                        //     )
                                        //   ],
                                        // ),
                                        // Container(
                                        //   margin: Dimens.edgeInsets16,
                                        //   decoration: BoxDecoration(
                                        //     border: Border.all(
                                        //       width: 1,
                                        //       color: Colors.grey.withOpacity(.3),
                                        //     ),
                                        //   ),
                                        //   child: DefaultTabController(
                                        //     length: 3,
                                        //     child: Column(
                                        //       children: [
                                        //         Container(
                                        //           color: Colors.grey.withOpacity(.2),
                                        //           child: TabBar(
                                        //             tabs: [
                                        //               Container(
                                        //                 height: 40,
                                        //                 child: Center(
                                        //                   child: Text('Warranties'),
                                        //                 ),
                                        //               ),
                                        //               Container(
                                        //                 height: 40,
                                        //                 child: Center(
                                        //                   child: Text('Purchasing'),
                                        //                 ),
                                        //               ),
                                        //               Container(
                                        //                 height: 40,
                                        //                 child: Center(
                                        //                   child: Text('Files'),
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         Container(
                                        //           height: 400,
                                        //           child: TabBarView(
                                        //             children: [
                                        //               WarrantyTab(),
                                        //               ManufacturarTab(),
                                        //               Files(),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
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
                ),
                AnimatedPositioned(
                    child: HomeDrawer(), duration: Duration(milliseconds: 450))
              ],
            ),
          ),

          // ),
        ),
      );

  ///Alert Dialog
  // static void showAlertDialog({
  //   int? facility_id,
  //   String? message,
  //   String? title,
  //   Function()? onPress,
  // }) async {
  //   await Get.dialog<void>(NewWarrantyClaimDialog());
  // }

  /// For Failure Date Time
  Future pickFailureDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedFailureDateTimeWeb.value;
    final date = await pickDate_web(context);
    if (date == null) {
      return;
    }

    // final time = await pickTime_web(context);
    // if (time == null) {
    //   return;
    // }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      // time.hour,
      // time.minute,
    );
    controller.selectedFailureDateTimeWeb.value = dateTime;
    controller.failureDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.failureDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print('FailureDateTime:${controller.failureDateTimeCtrlrWeb.text}');
    controller.failureDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedFailureDateTimeWeb.value;
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
    DateTime dateTime = controller.selectedFailureDateTimeWeb.value;
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

////Warranty Start Date
  Future pickWarrantyStartDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedWarrantyStartDateTime.value;
    final date = await pickDate2_web(context);
    if (date == null) {
      return;
    }

    // final time = await pickTime2_web(context);
    // if (time == null) {
    //   return;
    // }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      // time.hour,
      // time.minute,
    );
    controller.selectedWarrantyStartDateTime.value = dateTime;
    controller.warrantyStartDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.warrantyStartDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'Warranty Start Date Time: ${controller.warrantyStartDateTimeCtrlrWeb.text}');
    controller.warrantyStartDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print(
        'Warranty Start Date sending Time: ${controller.warrantyStartDateTimeCtrlrWebBuffer}');
  }

  Future<DateTime?> pickDate2_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedWarrantyStartDateTime.value;
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

  Future<TimeOfDay?> pickTime2_web(BuildContext context) async {
    DateTime dateTime = controller.selectedWarrantyStartDateTime.value;
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

////Warranty End Date
  Future pickWarrantyEndDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedWarrantyEndDateTime.value;
    final date = await pickDate3_web(context);
    if (date == null) {
      return;
    }

    // final time = await pickTime3_web(context);
    // if (time == null) {
    //   return;
    // }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      // time.hour,
      // time.minute,
    );
    controller.selectedWarrantyEndDateTime.value = dateTime;
    controller.warrantyEndDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.warrantyEndDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'Warranty End Date Time: ${controller.warrantyEndDateTimeCtrlrWeb.text}');
    controller.warrantyEndDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate3_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedWarrantyEndDateTime.value;
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

  Future<TimeOfDay?> pickTime3_web(BuildContext context) async {
    DateTime dateTime = controller.selectedWarrantyEndDateTime.value;
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

  supplierActionData(String? title, String? title2, BuildContext context,
      int? position, String? date) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$title'),
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Container(
                child: Container(
              height: 30,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 206, 204, 204)),
              child: Center(child: Text('$title2')),
            )),
          ),
          Checkbox(
            value: controller.isCheckedDataRequire.value,
            // onChanged: (bool? value) {
            //   // this.valuefirst = value!;
            //   // controller.isCheckedDataRequire.value = value!;
            // }
            onChanged: null,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: CustomTextField(
              label: '',
              hintText: '$date',
              readOnly: true,
            ),
          ),
          // position == 1 || position == 2 || position == 3
          // ?
          // ActionButton(
          //   icon: Icons.remove,
          //   label: 'Delete',
          //   // onPress:
          //   //     () async {},
          //   color: Colors.red,
          //   onPressed: () {},
          // )
          // : Text('data')
        ],
      ),
    );
  }

  ///Supplier Action Required by date
  Future pickRequiredSupplierDate_web(BuildContext context) async {
    var dateTime = controller.selectedSupplierActionDateTimeWeb.value;
    final date = await pickRequiredDate_web(context);
    if (date == null) {
      return;
    }

    // final time = await pickRequiredTime_web(context);
    // if (time == null) {
    //   return;
    // }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      // time.hour,
      // time.minute,
    );
    controller.selectedSupplierActionDateTimeWeb.value = dateTime;
    controller.supplierActionDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.supplierActionDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    // print('FailureDateTime:${controller.supplierActionDateTimeCtrlrWeb.text}');
    // controller.supplierActionDateTimeCtrlrWebBuffer =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickRequiredDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedSupplierActionDateTimeWeb.value;
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

  Future<TimeOfDay?> pickRequiredTime_web(BuildContext context) async {
    DateTime dateTime = controller.selectedSupplierActionDateTimeWeb.value;
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

  emailDropdown(BuildContext context, String? title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.8,
          child: CustomMultiSelectDialogField(
            buttonText: '$title',
            title: 'Employees',
            initialValue: [7, 45],
            // initialValue: (controller.selectedEmployeeNameIdList.isNotEmpty)
            //     ? controller.selectedEmployeeNameIdList
            //     : [],
            items: controller.employeesList
                .map(
                  (equipmentCategory) => MultiSelectItem(
                    equipmentCategory.id,
                    equipmentCategory.name ?? '',
                  ),
                )
                .toList(),
            onConfirm: (selectedOptionsList) => {
              controller.employeesNameSelected(selectedOptionsList),
              print(
                  'Employees Name list Ids ${controller.selectedEmployeeNameIdList}')
            },
          ),
        ),
        // ActionButton(
        //   icon: Icons.delete_outline,
        //   label: 'Delete',
        //   // onPress:
        //   //     () async {},
        //   color: Colors.red,
        //   onPressed: () {},
        // ),
      ],
    );
  }

  Widget buildRadioButton(String severity, Color color, BuildContext context) {
    return Obx(() {
      return Container(
        height: 35,
        width: MediaQuery.of(context).size.width / 10,
        child: RadioListTile(
          dense: true,
          title: Text(
            severity,
            style: TextStyle(color: color),
          ),
          value: severity,
          groupValue: controller.selectedSeverity.value,
          onChanged: (value) {
            controller.setSelectedSeverity(value as String);
            print('DAta Edit WC:${controller.selectedSeverity.value}');
          },
        ),
      );
    });
  }
}
