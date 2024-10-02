// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/url_path.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class NewWarrantyClaimWeb extends GetView<WarrantyClaimController> {
  NewWarrantyClaimWeb({super.key});
  final FileUploadController dropzoneController =
      Get.put(FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',));
  // bool valuefirst = false;
  // final controller = Get.find<HomeController>();
  // final WarrantyClaimController controller = Get.find();
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) => SelectionArea(
        child: Scaffold(
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
                      Expanded(
                        child: Container(
                          // margin: Dimens.edgeInsets16,
                          height: Get.height,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(.3)),
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
                                    // borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 227, 224, 224),
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
                                          Get.offNamed(
                                              Routes.warrantyClaimList);
                                        },
                                        child: Text(" / Warranty Claim List",
                                            style: Styles.greyLight14),
                                      ),
                                      Text(" / Add Warranty Claim",
                                          style: Styles.greyLight14)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CustomAppBar(
                                  title: 'New Warranty Claim'.tr,
                                ),
                                Dimens.boxHeight10,
                                Card(
                                  color: Colors.lightBlue.shade50,
                                  child: Wrap(
                                    children: [
                                      GetBuilder<WarrantyClaimController>(
                                          id: 'block_field',
                                          builder: (controller) {
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.55,
                                                      child: CustomTextField(
                                                        label:
                                                            'Warranty Claim Title: ',
                                                        textController: controller
                                                            .warrantyClaimTitleTextController,
                                                        focusnode: controller
                                                            .wtitleFocus,
                                                        scroll: controller
                                                            .wtitleScroll,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.3,
                                                      height: 80,
                                                      child: CustomTextField(
                                                        label:
                                                            'Warranty Brief Description: ',
                                                        textController: controller
                                                            .warrantyClaimBriefDescTextController,
                                                        focusnode: controller
                                                            .wdescFocus,
                                                        scroll: controller
                                                            .wdescScroll,
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
                                                          width: 27,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              4.2,
                                                          child: Obx(
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
                                                          width: 55,
                                                        ),
                                                        CustomRichText(
                                                            title:
                                                                'Equipment Name: '),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              4.2,
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
                                                    margin: Dimens.edgeInsets20,
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
                                                          offset: Offset(0, 2),
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
                                                              child: Container(
                                                                height: 25,
                                                                width: 70,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: ColorValues
                                                                      .addNewColor,
                                                                  border: Border
                                                                      .all(
                                                                    color: ColorValues
                                                                        .lightGreyColorWithOpacity35,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              5)),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    " + Add ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w100,
                                                                        color: Colors
                                                                            .white),
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
                                                          border:
                                                              TableBorder.all(
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
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                            DataColumn2(
                                                                fixedWidth: 100,
                                                                label: Text(
                                                                  "Action",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
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
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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

                                                ///
                                                // SizedBox(
                                                //   height: 220,
                                                //   width: MediaQuery.of(context)
                                                //           .size
                                                //           .width /
                                                //       1.2,
                                                //   child: Center(
                                                //     child: Container(
                                                //       margin:
                                                //           Dimens.edgeInsets16,
                                                //       height: Get.height,
                                                //       decoration: BoxDecoration(
                                                //         border: Border.all(
                                                //             color: Colors.grey
                                                //                 .withOpacity(
                                                //                     .3)),
                                                //       ),
                                                //       constraints:
                                                //           BoxConstraints(
                                                //         maxWidth: 1100,
                                                //       ),
                                                //       child:
                                                //           SingleChildScrollView(
                                                //         child: Column(
                                                //           children: [
                                                //             CustomAppBar(
                                                //               title:
                                                //                   'Affected Part'
                                                //                       .tr,
                                                //             ),
                                                //             Dimens.boxHeight10,
                                                //             // Wrap(
                                                //             //   children: [
                                                //             //     Padding(
                                                //             //       padding:
                                                //             //           const EdgeInsets
                                                //             //               .only(
                                                //             //               left:
                                                //             //                   150),
                                                //             //       child: Row(
                                                //             //         children: [
                                                //             //           Dimens
                                                //             //               .boxHeight20,
                                                //             //           CustomRichText(
                                                //             //               title:
                                                //             //                   'Select Affected Part: '),
                                                //             //           SizedBox(
                                                //             //             width:
                                                //             //                 15,
                                                //             //           ),

                                                //             //         ],
                                                //             //       ),
                                                //             //     ),
                                                //             //   ],
                                                //             // ),
                                                //           ],
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),

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
                                                    SizedBox(
                                                      width: 40,
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
                                                    CustomTextField(
                                                      label:
                                                          'Approximate Daily Loss: ',
                                                      numberTextField: true,
                                                      textController: controller
                                                          .approxdailylosstxtcontroller,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                              6.3,
                                                          child: Obx(
                                                            () =>
                                                                DropdownWebWidget(
                                                              dropdownList:
                                                                  controller
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
                                                  ],
                                                ),

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        CustomTextField(
                                                          textController: controller
                                                              .currentStartDateCtrlrWeb,
                                                          label:
                                                              'Applied At:',
                                                          suffixIcon: Icon(Icons
                                                              .calendar_month),
                                                          onTap: () {
                                                            pickcurrentStartDate_web(
                                                                context);
                                                          },
                                                        ),
                                                        CustomTextField(
                                                          textController: controller
                                                              .affectedSerialNoTextController,
                                                          readOnly: true,
                                                          label:
                                                              'Affected Sr.No.:',
                                                          hintText:
                                                              '${controller.inventoryDetailsModel.value?.serialNumber}',
                                                        ),
                                                        CustomTextField(
                                                          textController: controller
                                                              .manufacturerNameTextController,
                                                          readOnly: true,
                                                          hintText:
                                                              '${controller.inventoryDetailsModel.value?.manufacturerName}',
                                                          label:
                                                              'Manufacturer Name:',
                                                        ),
                                                        CustomTextField(
                                                          textController: controller
                                                              .orderReferenceNoTextController,
                                                          label:
                                                              'Contract Reference No.:',
                                                        ),
                                                        CustomTextField(
                                                          textController: controller
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
                                                          textController: controller
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
                                                          textController: controller
                                                              .costOfReplacementTextController,
                                                          readOnly: true,
                                                          hintText:
                                                              '${controller.inventoryDetailsModel.value?.cost}',
                                                          label:
                                                              'Cost of Replacement:',
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),

                                                    ///Additional Email
                                                    SizedBox(
                                                      height: 500,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.2,
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
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 1.5,
                                                                            child:
                                                                                DefaultTabController(
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
                                                                                      ///
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
                                                                                                Dimens.boxWidth140,
                                                                                                Text(
                                                                                                  'Email',
                                                                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                ),
                                                                                                Dimens.boxWidth150,
                                                                                                Text(
                                                                                                  'Mobile',
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
                                                                                                        SizedBox(width: 200, child: Text('${data.email}')),
                                                                                                        SizedBox(width: 100, child: Text('${data.mobile}')),
                                                                                                      ],
                                                                                                    )))),

                                                                                            // SizedBox(
                                                                                            //     width: MediaQuery.of(context).size.width / 3,
                                                                                            //     child: CustomTextField(
                                                                                            //       textController: controller.serialNoTextFieldController,
                                                                                            //       label: 'Sr. No.',
                                                                                            //     )),
                                                                                            Dimens.boxHeight10,
                                                                                            SizedBox(
                                                                                                width: MediaQuery.of(context).size.width / 3,
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      ' Name: ',
                                                                                                      style: Styles.black14,
                                                                                                    ),
                                                                                                    Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                          border: Border.all(
                                                                                                        color: Color(0xFE50000),
                                                                                                        width: 0.5,
                                                                                                      )),
                                                                                                      height: MediaQuery.of(context).size.height * 0.040,
                                                                                                      // margin: Dimens.edgeInsets5,
                                                                                                      constraints: BoxConstraints(
                                                                                                        maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                        minWidth: 100,
                                                                                                      ),
                                                                                                      child: LoginCustomTextfield(
                                                                                                        textController: controller.nameTextFieldController,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                )),
                                                                                            SizedBox(
                                                                                              width: MediaQuery.of(context).size.width / 3,
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  Text(
                                                                                                    '  Email: ',
                                                                                                    style: Styles.black14,
                                                                                                  ),
                                                                                                  Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                        border: Border.all(
                                                                                                      color: Color(0xFE50000),
                                                                                                      width: 0.5,
                                                                                                    )),
                                                                                                    height: MediaQuery.of(context).size.height * 0.040,
                                                                                                    // margin: Dimens.edgeInsets5,
                                                                                                    constraints: BoxConstraints(
                                                                                                      maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                      minWidth: 100,
                                                                                                    ),
                                                                                                    child: LoginCustomTextfield(
                                                                                                      textController: controller.emailTextFieldController,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            SizedBox(
                                                                                              width: MediaQuery.of(context).size.width / 3,
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Mobile: ',
                                                                                                    style: Styles.black14,
                                                                                                  ),
                                                                                                  Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                        border: Border.all(
                                                                                                      color: Color(0xFE50000),
                                                                                                      width: 0.5,
                                                                                                    )),
                                                                                                    height: MediaQuery.of(context).size.height * 0.040,
                                                                                                    // margin: Dimens.edgeInsets5,
                                                                                                    constraints: BoxConstraints(
                                                                                                      maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                      minWidth: 100,
                                                                                                    ),
                                                                                                    child: LoginCustomTextfield(
                                                                                                      inputFormatters: [
                                                                                                        FilteringTextInputFormatter.digitsOnly
                                                                                                      ],
                                                                                                      textController: controller.mobileTextFieldController,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            ElevatedButton(
                                                                                              onPressed: () {
                                                                                                // controller.addRow(controller.serialNoTextFieldController.text);
                                                                                                // controller.serialNoTextFieldController.clear();

                                                                                                // controller.addRow(controller.nameTextFieldController.text);
                                                                                                // controller.nameTextFieldController.clear();

                                                                                                // controller.addRow(controller.emailTextFieldController.text);
                                                                                                // controller.emailTextFieldController.clear();
                                                                                                controller.updateText(controller.nameTextFieldController.text,controller.roleTextFieldController.text, controller.emailTextFieldController.text, int.tryParse('${controller.mobileTextFieldController.text}'));
                                                                                                controller.nameTextFieldController.clear();
                                                                                                controller.emailTextFieldController.clear();
                                                                                                controller.mobileTextFieldController.clear();
                                                                                              },
                                                                                              child: Text(
                                                                                                'Add',
                                                                                                style: TextStyle(color: ColorValues.whiteColor),
                                                                                              ),
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
                                                // SizedBox(
                                                //   height: 20,
                                                // ),
                                                // Wrap(
                                                //   children: [
                                                //     SizedBox(
                                                //       width: 20,
                                                //     ),
                                                //     Container(
                                                //       height: 250,
                                                //       width: MediaQuery.of(context)
                                                //               .size
                                                //               .width /
                                                //           1.15,
                                                //       decoration: BoxDecoration(
                                                //           border: Border.all(
                                                //               color: Colors.grey)),
                                                //       child: Column(
                                                //         crossAxisAlignment:
                                                //             CrossAxisAlignment.start,
                                                //         children: [
                                                //           Padding(
                                                //             padding:
                                                //                 const EdgeInsets.only(
                                                //                     left: 20, top: 15),
                                                //             child:
                                                //                 Text('Equipment Images'),
                                                //           ),
                                                //           Dimens.boxHeight30,
                                                //           Row(
                                                //             children: [
                                                //               ////
                                                //               /// FILE UPLOAD WIDGET
                                                //               Container(
                                                //                 height: Get.height * 0.2,
                                                //                 width: Get.width / 1.3,
                                                //                 child: Row(
                                                //                     //
                                                //                     children: [
                                                //                       Expanded(
                                                //                         flex: 2,
                                                //                         child:
                                                //                             FileUploadWidgetWithDropzone(),
                                                //                       ),
                                                //                       Dimens.boxWidth10,
                                                //                       Expanded(
                                                //                           flex: 8,
                                                //                           child:
                                                //                               FileUploadDetailsWidgetWeb()),
                                                //                     ]),
                                                //               ),
                                                //             ],
                                                //           ),
                                                //         ],
                                                //       ),
                                                //     )
                                                //   ],
                                                // ),

                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          // mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            SizedBox(
                                                              height: 80,
                                                              child:
                                                                  CustomTextField(
                                                                width: 550,
                                                                textController:
                                                                    controller
                                                                        .immediateCorrectiveActionTextController,
                                                                focusnode:
                                                                    controller
                                                                        .immcoracFocus,
                                                                scroll: controller
                                                                    .immcoracScroll,
                                                                label:
                                                                    'Immediate Corrective Action by Buyer: ',
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
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Request to Supplier: ',
                                                          style: Styles.black14,
                                                        ),
                                                        Container(
                                                          // color: Color.fromARGB(
                                                          //     255, 206, 205, 205),
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                            color: Color(
                                                                0xFE50000),
                                                            // width: 0.5,
                                                          )),
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.070,
                                                          // width: 500,
                                                          // margin: Dimens.edgeInsets5,
                                                          constraints: BoxConstraints(
                                                              // maxWidth:
                                                              //     MediaQuery.of(context)
                                                              //             .size
                                                              //             .width /
                                                              //         7,
                                                              // minWidth: 200,
                                                              ),
                                                          child:
                                                              LoginCustomTextfield(
                                                            width: 400,
                                                            readOnly: true,
                                                            ishint:
                                                                '${controller.inventoryDetailsModel.value?.supplierName}',
                                                            textController:
                                                                controller
                                                                    .requestManufactureTextController,
                                                          ),
                                                        ),
                                                        //  CustomTextField(
                                                        //   textController: controller
                                                        //       .requestManufactureTextController,
                                                        //   readOnly: true,
                                                        //   label:
                                                        //       'Request to Supplier: ',
                                                        //   hintText:
                                                        //       '${controller.inventoryDetailsModel.value?.supplierName}',
                                                        // ),
                                                      ],
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
                                        // width: MediaQuery.of(context).size.width / 1.15,
                                        margin: Dimens.edgeInsets20,
                                        // height: Get.height,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(.3)),
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
                                                    SizedBox(
                                                      width: 150,
                                                    ),
                                                    // Text('Action'),
                                                  ]),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Column(
                                                    children: []
                                                      ..addAll(controller
                                                          .supplierActions
                                                          .map((element) => Row(
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
                                                                    left: 340),
                                                            child: Text(
                                                              'Required',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 70,
                                                          ),
                                                          Checkbox(
                                                              value: controller
                                                                  .isCheckedRequire
                                                                  .value,
                                                              onChanged: (bool?
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
                                                        child: CustomTextField(
                                                          label:
                                                              ' Required Date ',
                                                          suffixIcon: Icon(
                                                            Icons
                                                                .calendar_month,
                                                          ),
                                                          // textController:
                                                          //     controller.categoryTextController,
                                                          textController: controller
                                                              .supplierActionDateTimeCtrlrWeb,

                                                          onTap: () {
                                                            pickRequiredSupplierDate_web(
                                                                context);
                                                          },
                                                        ),
                                                      ),

                                                      ElevatedButton(
                                                        child: Text(
                                                          'Add',
                                                          style: TextStyle(
                                                              color: ColorValues
                                                                  .appGreenColor),
                                                        ),
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
                                      Dimens.boxHeight10,
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Wrap(
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
                                                      /// File Upload Widget
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
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            CustomRichText(
                                                title: 'Select Approver: '),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.2,
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
                                                  onValueChanged:
                                                      controller.onValueChanged,
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
                                                ColorValues.appGreenColor,
                                            onPressed: () {
                                              controller.saveAsDraft();
                                            },
                                            text: 'Save As Draft',
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CustomElevatedButton(
                                            backgroundColor:
                                                ColorValues.appGreenColor,
                                            onPressed: () {
                                              // showAlertDialog();
                                              controller.createWarrantyClaim();
                                            },
                                            text: 'Submit For Release',
                                          ),
                                        ],
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
                AnimatedPositioned(
                    child: HomeDrawer(), duration: Duration(milliseconds: 450))
              ],
            ),
            // ),
          ),
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
    controller.selectedFailureDateTimeWeb.value = dateTime;
    controller.failureDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
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
  Future pickcurrentStartDate_web(BuildContext context) async {
    var dateTime = controller.selectedcurrentStartDate.value;
    final date = await pickDate2_web(context);
    if (date == null) {
      return;
    }

    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    controller.dateController.value = dateTime;
    controller.currentStartDateCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.currentStartDateCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'Current Date: ${controller.currentStartDateCtrlrWeb.text}');
    controller.currentStartDateCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print(
        'Current Date sending Time: ${controller.currentStartDateCtrlrWebBuffer}');
  }

  Future<DateTime?> pickcurrentDate2_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedcurrentStartDate.value;
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
            // value: controller.isCheckedDataRequire.value,
            value: true,
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
          //   onPressed: () {
          //     controller.removeRow(index: 0);
          //   },
          // )

          // : Text('data')
        ],
      ),
    );
  }

  emailDropdown(
    BuildContext context,
    String? title,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 4.2,
          child: CustomMultiSelectDialogField(
            buttonText: '$title',
            title: 'Employees',
            // initialValue: [],
            initialValue: (controller.selectedEmployeeNameIdList.isNotEmpty)
                ? controller.selectedEmployeeNameIdList
                : [],
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
        // GestureDetector(
        //   onTap: () {},
        //   child: Icon(
        //     Icons.delete,
        //     color: Colors.red,
        //   ),
        // )
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
            print('DAta:${controller.selectedSeverity.value}');
          },
        ),
      );
    });
  }
}
