import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/domain/models/asset_master_model.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../asset_master_Controller.dart';
// import '../mrs_Details_Controller.dart';
// import '../preventive_list_controller.dart';

class AssetMasterWeb extends GetView<AssetMasterController> {
  AssetMasterWeb({Key? key}) : super(key: key);
  final AssetMasterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetMasterController>(
        id: 'stock_Mangement_Date',
        builder: (controller) {
          return SelectionArea(
            child: Obx(
              () => Container(
                color: Color.fromARGB(255, 234, 236, 238),
                width: Get.width,
                height: Get.height,
                child: Column(
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
                                  Routes.stockManagementDashboardScreen);
                            },
                            child: Text(" / STOCK MANAGEMENT",
                                style: Styles.greyLight14),
                          ),
                          Text(" / MATERIAL LIST", style: Styles.greyLight14),
                          // Text(" / ST NUMBER",
                          //     style: Styles.greyMediumLight12)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // varUserAccessModel.value.access_list!
                          //     .where((e) => e.feature_id == 5 && e.add == 1)
                          //     .length >
                          //     0
                          //     ? Container(
                          //   width: (Get.width * .3),
                          //   margin: EdgeInsets.only(left: 30, top: 30),
                          //   height: Get.height/1.85,
                          //   child: Card(
                          //     color: Color.fromARGB(255, 251, 252, 253),
                          //     elevation: 10,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10.0),
                          //     ),
                          //     child: Column(
                          //       children: [
                          //         // Text(
                          //         //     '${varUserAccessModel.value.access_list!.where((e) => e.feature_id == 5 && e.add == 1).length}'),
                          //         Padding(
                          //           padding: const EdgeInsets.only(
                          //               left: 10.0, right: 10, top: 10),
                          //           child: Column(
                          //               crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //               children: [
                          //                 Text(
                          //                   "Create Modulelist",
                          //                   style: Styles.blackBold16,
                          //                 ),
                          //                 SizedBox(
                          //                   height: 30,
                          //                 ),
                          //                 Visibility(
                          //                   visible: controller.isSuccess.value,
                          //                   child: Center(
                          //                     child: Wrap(
                          //                       children: [
                          //                         Text(
                          //                           controller.selectedItem ==
                          //                               null
                          //                               ? "ModuleList added Successfully in the List."
                          //                               : "ModuleList updated Successfully in the List.",
                          //                           style: TextStyle(
                          //                               fontSize: 16,
                          //                               color: Color.fromARGB(
                          //                                   255, 24, 243, 123)),
                          //                         ),
                          //                         SizedBox(
                          //                           height: 5,
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Row(
                          //                   mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     CustomRichText(title: 'Module Name: '),
                          //                     SizedBox(
                          //                       width: 70,
                          //                     ),
                          //                     Expanded(
                          //                       child: Container(
                          //                           width: (MediaQuery.of(context)
                          //                               .size
                          //                               .width *
                          //                               .2) -
                          //                               30,
                          //                           decoration: BoxDecoration(
                          //                             boxShadow: [
                          //                               BoxShadow(
                          //                                 color: Colors.black26,
                          //                                 offset: const Offset(
                          //                                   5.0,
                          //                                   5.0,
                          //                                 ),
                          //                                 blurRadius: 5.0,
                          //                                 spreadRadius: 1.0,
                          //                               ),
                          //                               BoxShadow(
                          //                                 color: ColorValues
                          //                                     .whiteColor,
                          //                                 offset: const Offset(
                          //                                     0.0, 0.0),
                          //                                 blurRadius: 0.0,
                          //                                 spreadRadius: 0.0,
                          //                               ),
                          //                             ],
                          //                             color:
                          //                             ColorValues.whiteColor,
                          //                             borderRadius:
                          //                             BorderRadius.circular(
                          //                                 5),
                          //                           ),
                          //                           child: LoginCustomTextfield(
                          //                             textController: controller
                          //                                 .modulelistNumberCtrlr,
                          //                           )),
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 SizedBox(
                          //                   height: 10,
                          //                 ),
                          //                 Row(
                          //                   mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //                   children: [
                          //                     CustomRichText(title: 'Feature Name: '),
                          //                     SizedBox(
                          //                       width: 70,
                          //                     ),
                          //                     Expanded(
                          //                       child: Container(
                          //                           width: (MediaQuery.of(context)
                          //                               .size
                          //                               .width *
                          //                               .2) -
                          //                               30,
                          //                           decoration: BoxDecoration(
                          //                             boxShadow: [
                          //                               BoxShadow(
                          //                                 color: Colors.black26,
                          //                                 offset: const Offset(
                          //                                   5.0,
                          //                                   5.0,
                          //                                 ),
                          //                                 blurRadius: 5.0,
                          //                                 spreadRadius: 1.0,
                          //                               ),
                          //                               BoxShadow(
                          //                                 color: ColorValues
                          //                                     .whiteColor,
                          //                                 offset: const Offset(
                          //                                     0.0, 0.0),
                          //                                 blurRadius: 0.0,
                          //                                 spreadRadius: 0.0,
                          //                               ),
                          //                             ],
                          //                             color:
                          //                             ColorValues.whiteColor,
                          //                             borderRadius:
                          //                             BorderRadius.circular(
                          //                                 5),
                          //                           ),
                          //                           child: LoginCustomTextfield(
                          //                             textController: controller
                          //                                 .featureCtrlr,
                          //                           )),
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 SizedBox(
                          //                   height: 30,
                          //                 ),
                          //                 Row(
                          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                       children: [
                          //                         CustomRichText(title:"Add"),
                          //                         // SizedBox(width:12),
                          //                         Row(
                          //                           mainAxisAlignment: MainAxisAlignment.center,
                          //                           children: [
                          //                             // Text("No"),
                          //                             CustomSwitchTroggle(
                          //                                 value:
                          //                                 controller.isToggleOn.value,
                          //                                 onChanged: (value) {
                          //                                   controller.toggle();
                          //                                 }),
                          //
                          //                             // Text("Yes"),
                          //                           ],
                          //                         ),
                          //
                          //                       ],
                          //                     ),
                          //
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                       children: [
                          //                         CustomRichText(title:"Edit"),
                          //                         SizedBox(width:12),
                          //                         Row(
                          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                           children: [
                          //                             // Text("No"),
                          //                             CustomSwitchTroggle(
                          //                                 value:
                          //                                 controller.isToggle1On.value,
                          //                                 onChanged: (value) {
                          //                                   controller.toggle1();
                          //                                 }),
                          //
                          //                             // Text("Yes"),
                          //                           ],
                          //                         ),
                          //
                          //                       ],
                          //                     ),
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                       children: [
                          //                         CustomRichText(title:"Delete"),
                          //                         SizedBox(width:12),
                          //                         Row(
                          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //
                          //                           children: [
                          //                             // Text("No"),
                          //                             // SizedBox(width:2),
                          //                             CustomSwitchTroggle(
                          //                                 value:
                          //                                 controller.isToggle2On.value,
                          //                                 onChanged: (value) {
                          //                                   controller.toggle2();
                          //                                 }),
                          //                             // SizedBox(width:2),
                          //
                          //                             // Text("Yes"),
                          //                           ],
                          //                         ),
                          //
                          //                       ],
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 SizedBox(
                          //                   height: 30,
                          //                 ),
                          //                 Row(
                          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                       children: [
                          //                         CustomRichText(title:"View"),
                          //                         // SizedBox(width:12),
                          //                         Row(
                          //                           mainAxisAlignment: MainAxisAlignment.center,
                          //                           children: [
                          //                             // Text("No"),
                          //                             CustomSwitchTroggle(
                          //                                 value:
                          //                                 controller.isToggle3On.value,
                          //                                 onChanged: (value) {
                          //                                   controller.toggle3();
                          //                                 }),
                          //
                          //                             // Text("Yes"),
                          //                           ],
                          //                         ),
                          //
                          //                       ],
                          //                     ),
                          //
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                       children: [
                          //                         CustomRichText(title:"Approve"),
                          //                         SizedBox(width:12),
                          //                         Row(
                          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                           children: [
                          //                             // Text("No"),
                          //                             CustomSwitchTroggle(
                          //                                 value:
                          //                                 controller.isToggle4On.value,
                          //                                 onChanged: (value) {
                          //                                   controller.toggle4();
                          //                                 }),
                          //
                          //                             // Text("Yes"),
                          //                           ],
                          //                         ),
                          //
                          //                       ],
                          //                     ),
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                       children: [
                          //                         CustomRichText(title:"Issue"),
                          //                         SizedBox(width:12),
                          //                         Row(
                          //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //
                          //                           children: [
                          //                             // Text("No"),
                          //                             // SizedBox(width:2),
                          //                             CustomSwitchTroggle(
                          //                                 value:
                          //                                 controller.isToggle5On.value,
                          //                                 onChanged: (value) {
                          //                                   controller.toggle5();
                          //                                 }),
                          //                             // SizedBox(width:2),
                          //
                          //                             // Text("Yes"),
                          //                           ],
                          //                         ),
                          //
                          //                       ],
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 SizedBox(
                          //                   height: 30,
                          //                 ),
                          //                 Row(
                          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     Row(
                          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                       children: [
                          //                         CustomRichText(title:"SelfView"),
                          //                         SizedBox(width:12),
                          //                         Row(
                          //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //
                          //                           children: [
                          //                             // Text("No"),
                          //                             // SizedBox(width:2),
                          //                             CustomSwitchTroggle(
                          //                                 value:
                          //                                 controller.isToggle6On.value,
                          //                                 onChanged: (value) {
                          //                                   controller.toggle6();
                          //                                 }),
                          //                             // SizedBox(width:2),
                          //
                          //                             // Text("Yes"),
                          //                           ],
                          //                         ),
                          //
                          //                       ],
                          //                     ),
                          //                   ],
                          //                 ),
                          //                 SizedBox(
                          //                   height: 30,
                          //                 ),
                          //               ]),
                          //         ),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //                 height: 40,
                          //                 width: (Get.width * .1),
                          //                 child: CustomElevatedButton(
                          //                     backgroundColor:
                          //                     ColorValues.appRedColor,
                          //                     onPressed: () {},
                          //                     text: 'Cancel')),
                          //             SizedBox(
                          //               width: 10,
                          //             ),
                          //             Container(
                          //                 height: 40,
                          //                 width: (Get.width * .2) - 70,
                          //                 child: controller.selectedItem == null
                          //                     ? CustomElevatedButton(
                          //                     backgroundColor: ColorValues
                          //                         .appDarkBlueColor,
                          //                     onPressed: () {
                          //                       controller
                          //                           .createModuleListNumber()
                          //                           .then((value) {
                          //                         print("value,$value");
                          //                         if (value == true)
                          //                           controller
                          //                               .issuccessCreatemodulelist();
                          //                       });
                          //                     },
                          //                     text: 'Create Module List')
                          //                     : CustomElevatedButton(
                          //                     backgroundColor: ColorValues
                          //                         .appDarkBlueColor,
                          //                     onPressed: () {
                          //                       controller
                          //                           .updateModulelistNumber(
                          //                           controller
                          //                               .selectedItem?.)
                          //                           .then((value) {
                          //                         print("value,$value");
                          //                         if (value == true)
                          //                           controller
                          //                               .issuccessCreatemodulelist();
                          //                       });
                          //                     },
                          //                     text: 'Update')),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // )
                          //     : Container(),
                          // varUserAccessModel.value.access_list!
                          //             .where((e) => e.feature_id == 5 && e.view == 0)
                          //             .length >
                          //         0
                          //     ?
                          // Expanded(
                          //   child: Container(
                          //     width: Get.width * 7,
                          //     margin: EdgeInsets.only(left: 10, top: 15),
                          //     height: Get.height / 1.1,
                          //     child: Card(
                          //       color: Color.fromARGB(255, 251, 252, 253),
                          //       elevation: 10,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(10.0),
                          //       ),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           CustomAppBar(
                          //             title: 'Material Master',
                          //             action: Row(children: [
                          //               Dimens.boxWidth10,
                          //               Container(
                          //                 height: 35,
                          //                 margin: EdgeInsets.only(left: 10),
                          //                 child: CustomElevatedButton(
                          //                     backgroundColor:
                          //                         ColorValues.appLightBlueColor,
                          //                     onPressed: () {
                          //                       controller.export();
                          //                     },
                          //                     text: 'Excel'),
                          //               ),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  width: Get.width * 7,
                                  margin: EdgeInsets.only(
                                      left: 10, top: 10, right: 10, bottom: 10),
                                  height: Get.height,
                                  child: Card(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Material List",
                                                style: Styles.blackBold16,
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title: 'Date Range'),
                                                  // Dimens.boxWidth10,
                                                  SizedBox(width: 10),
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openFromDateToStartDatePicker =
                                                          !controller
                                                              .openFromDateToStartDatePicker;
                                                      controller.update([
                                                        'stock_Mangement_Date'
                                                      ]);
                                                    },
                                                    hintText:
                                                        '${controller.formattedFromdate.toString()} To ${controller.formattedTodate.toString()}',
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: ColorValues.greyLightColour,
                                        ),
                                        Row(children: [
                                          Container(
                                            height: 35,
                                            margin: EdgeInsets.only(left: 10),
                                            child: CustomElevatedButton(
                                                backgroundColor: ColorValues
                                                    .appLightBlueColor,
                                                onPressed: () {
                                                  controller.export();
                                                },
                                                text: 'Excel'),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 300,
                                            height: 40,
                                            margin: EdgeInsets.only(right: 5),
                                            child: TextField(
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 16.0,
                                                    height: 1.0,
                                                    color: Colors.black),
                                              ),
                                              onChanged: (value) =>
                                                  controller.search(value),
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.0,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.0,
                                                  ),
                                                ),
                                                contentPadding:
                                                    Dimens.edgeInsets05_10,
                                                hintText: 'search'.tr,
                                                hintStyle: Styles.grey16,
                                              ),
                                            ),
                                          ),
                                        ]),
                                        controller.moduleList!.isEmpty ==
                                                    true &&
                                                controller.isLoading == false
                                            ? Center(child: Text('No data'))
                                            : controller.isLoading.value == true
                                                ? Center(
                                                    child: Text(
                                                        "Data Loading......"))
                                                : Expanded(
                                                    child:
                                                        ValueListenableBuilder(
                                                            valueListenable:
                                                                controller
                                                                    .columnVisibility,
                                                            builder: (context,
                                                                value, child) {
                                                              final dataSource =
                                                                  AssetListDataSource(
                                                                      controller);

                                                              return PaginatedDataTable2(
                                                                // fixedLeftColumns: 1,
                                                                dataRowHeight:
                                                                    70, //Get.height * 0.10,
                                                                columnSpacing:
                                                                    10,
                                                                source:
                                                                    dataSource, // Custom DataSource class
                                                                // headingRowHeight: Get.height * 0.12,
                                                                minWidth: 3000,
                                                                showCheckboxColumn:
                                                                    false,
                                                                rowsPerPage:
                                                                    10, // Number of rows per page
                                                                availableRowsPerPage: [
                                                                  10,
                                                                  20,
                                                                  30,
                                                                  50
                                                                ],
                                                                columns: [
                                                                  for (var entry
                                                                      in value
                                                                          .entries)
                                                                    if (entry
                                                                        .value)
                                                                      buildDataColumn(
                                                                        entry
                                                                            .key,
                                                                        controller
                                                                            .filterText[entry.key]!,
                                                                        controller
                                                                            .columnwidth[entry.key],
                                                                      ),
                                                                ],
                                                              );
                                                            }),
                                                  )
                                      ],
                                    ),
                                  ),
                                ),
                                if (controller.openFromDateToStartDatePicker)
                                  Positioned(
                                    right: 150,
                                    top: 85,
                                    child: DatePickerWidget(
                                      selectionMode:
                                          DateRangePickerSelectionMode.range,
                                      monthCellStyle:
                                          DateRangePickerMonthCellStyle(
                                        todayCellDecoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                ColorValues.appDarkBlueColor),
                                      ), // last date of this year
                                      // controller: DateRangePickerController(),
                                      initialSelectedRange: PickerDateRange(
                                        controller.fromDate.value,
                                        controller.toDate.value,
                                      ),

                                      onSubmit: (value) {
                                        print('po valu ${value.toString()}');
                                        PickerDateRange? data =
                                            value as PickerDateRange;

                                        var pickUpDate = DateTime.parse(
                                            data.startDate.toString());
                                        controller.fromDate.value = pickUpDate;
                                        var dropDate = DateTime.parse(
                                            data.endDate.toString());
                                        dropDate != null
                                            ? controller.toDate.value = dropDate
                                            : controller.toDate.value =
                                                pickUpDate;

                                        controller.getmoduleListByDate();
                                        controller
                                                .openFromDateToStartDatePicker =
                                            !controller
                                                .openFromDateToStartDatePicker;
                                        controller
                                            .update(['stock_Mangement_Date']);

                                        // Get.toNamed(
                                        //   Routes.stockManagementGoodsOrdersScreen,
                                        // );
                                      },
                                      onCancel: () {
                                        controller
                                                .openFromDateToStartDatePicker =
                                            false;
                                        controller
                                            .update(['stock_Mangement_Date']);
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

DataColumn2 buildDataColumn(
  // String columnName,
  String header,

  /// ColumnSize columnSize,
  RxString filterText,
  double? fixedWidth,
  //  {required Function(String) onSearchCallBack}
) {
  return //
      DataColumn2(
    // size: columnSize,
    fixedWidth: fixedWidth,

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: Styles.black16W500,
            ),
          ),
        ]),
    // ),
  );
}

class AssetListDataSource extends DataTableSource {
  final AssetMasterController controller;

  late List<AssetMasterModel?> filteredAssetList;

  AssetListDataSource(this.controller) {
    filterAsset();
  }
  void filterAsset() {
    filteredAssetList = <AssetMasterModel?>[];
    filteredAssetList = controller.moduleList!.where((Mrs) {
      return (Mrs?.asset_code ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.mdmFilterText.value.toLowerCase()) &&
          (Mrs?.asset_name ?? '').toLowerCase().contains(
              controller.materialNameFilterText.value.toLowerCase()) &&
          (Mrs?.section ?? '')
              .toLowerCase()
              .contains(controller.acdcFilterText.value.toLowerCase()) &&
          (Mrs?.asset_type ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.acdcFilterText.value.toLowerCase()) &&
          (Mrs?.cat_name ?? '').toString().toLowerCase().contains(
              controller.materialCategoryFilterText.value.toLowerCase()) &&
          (Mrs?.max_request_qty ?? '').toString().toLowerCase().contains(
              controller.minRequiredQtyFilterText.value.toLowerCase()) &&
          (Mrs?.reorder_qty ?? '').toString().toLowerCase().contains(
              controller.minReorderQtyTextFilterText.value.toLowerCase()) &&
          (Mrs?.description ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.descriptionFilterText.value.toLowerCase()) &&
          (Mrs?.measurement ?? '').toString().toLowerCase().contains(
              controller.unitofMeasurementFilterText.value.toLowerCase()) &&
          (Mrs?.approval_required ?? '').toString().toLowerCase().contains(
              controller.approvalRequiredFilterText.value.toLowerCase());

      // Add other filter conditions as needed
    }).toList();
    // print({"filteredmoduleList": filteredmoduleList});
  }

  @override
  DataRow? getRow(int index) {
    final AssetDetails = filteredAssetList[index];

    controller.AssetId.value = AssetDetails?.asset_Type_id ?? 0;
    var cellsBuffer = [
      '${AssetDetails?.asset_code ?? ''}',
      '${AssetDetails?.asset_name ?? ''}',
      '${AssetDetails?.section ?? ''}',
      '${AssetDetails?.asset_type ?? ''}',
      '${AssetDetails?.cat_name ?? ''}',
      '${AssetDetails?.min_qty ?? ''}',
      '${AssetDetails?.reorder_qty ?? ''}',
      '${AssetDetails?.description ?? ''}',
      '${AssetDetails?.measurement ?? ''}',
      '${AssetDetails?.approval_required ?? ''}',
    ];
    var cells = [];
    int i = 0;

    for (var entry in controller.columnVisibility.value.entries) {
      // print({"entry.value entry": entry});
      if (entry.key == "search") {
        return null;
      }
      if (entry.value) {
        cells.add(cellsBuffer[i]);
      }
      i++;
    }
    // print({"cell": cells});
    return DataRow.byIndex(
      index: index,
      cells: cells.map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: Text(value.toString()),
          ),
        );
      }).toList(),
      //   ],
      onSelectChanged: (_) {
        // controller.clearStoreData();

        // // final _flutterSecureStorage = const FlutterSecureStorage();

        // // _flutterSecureStorage.delete(key: "AssetId");
        // Get.toNamed(
        //   Routes.mrsViewScreen,
        //   arguments: {'AssetId': AssetDetails?.asset_Type_id, 'type': 0},
        // );
      },
    );
  }

  @override
  int get rowCount => filteredAssetList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}




            //                       Dimens.boxWidth14,
            //                       Container(
            //                         width: 300,
            //                         height: 40,
            //                         margin