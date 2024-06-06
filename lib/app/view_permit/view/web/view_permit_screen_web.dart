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
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/permit_approved_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/permit_close_dialog.dart';
import 'package:cmms/app/widgets/permit_extend_dialog.dart';
import 'package:cmms/app/widgets/permit_reject_dialog.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewPermitWebScreen extends GetView<ViewPermitController> {
  ViewPermitWebScreen({super.key});
  bool valuefirst = false;
  final ViewPermitController _controller = Get.find();
  final HomeController homecontroller = Get.find();
  // final NewPermitListController Newcontroller = Get.find();

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  String dropdownvalue = 'Item 1';

  ///
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
          // appBar: Responsive.isDesktop(context)
          //     ? AppBar(
          //         title: HeaderWidget(),
          //         automaticallyImplyLeading: false,
          //         elevation: 0,
          //         toolbarHeight: 60,
          //       )
          //     : AppBar(
          //         title: Text('View Permit'),
          //         centerTitle: true,
          //         elevation: 0,
          //       ),
          body: Obx(
            () => Stack(
              children: [
                RepaintBoundary(
                  key: controller.printKey,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 450),
                    margin: EdgeInsets.only(
                        left: homecontroller.menuButton.value ? 250.0 : 70.0),
                    width: Get.width,
                    height: Get.height,
                    // width: MediaQuery.of(context).size.width  ,
                    // width: 1500,
                    // height: MediaQuery.of(context).size.height,
                    child: Column(
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
                            child: (() {
                              if (Responsive.isMobile(context)) {
                                return SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 227, 224, 224),
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 236, 234, 234)
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
                                                color:
                                                    ColorValues.greyLightColor,
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
                                                      Routes.newPermitList);
                                                },
                                                child: Text(
                                                    " / NEW PERMIT LIST",
                                                    style: Styles.greyLight14),
                                              ),
                                              Text(" / VIEW PERMIT",
                                                  style: Styles.greyLight14)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Title:'),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                '${controller.viewPermitDetailsModel.value?.title}',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 6, 83, 146),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 350,
                                            // ),
                                            Container(
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
                                                  BoxShadow(color: Colors.blue),
                                                ],
                                              ),
                                              child: Center(
                                                  child: Text(
                                                'Waiting to be Issued',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 5,
                                          thickness: 2,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                CustomRichText(
                                                    title: 'Start Date: '),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                CustomRichText(
                                                    title: 'Valid Till: '),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                CustomRichText(
                                                    title: 'Plant: '),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                CustomRichText(
                                                    title: 'Permit No: '),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                CustomRichText(
                                                    title: 'Permit Type: '),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                CustomRichText(
                                                    title: 'Site Permit No: '),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                CustomRichText(
                                                  title:
                                                      'Equipment Categories: ',
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                CustomRichText(
                                                    title: 'Block: '),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                CustomRichText(
                                                    title:
                                                        'Permit Description: '),
                                                SizedBox(
                                                  height: 1,
                                                ),
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
                                                  '${controller.startDateTimeCtrlr.text}',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                                Text(
                                                  '${controller.validTillTimeCtrlr.text}',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                                Text(
                                                  '${controller.viewPermitDetailsModel.value?.blockName}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                                Text(
                                                  '${controller.viewPermitDetailsModel.value?.permitNo}',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    '${controller.viewPermitDetailsModel.value?.permitTypeName}',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 5, 92, 163)),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  '${controller.viewPermitDetailsModel.value?.sitePermitNo}',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                                controller.permitId != null
                                                    ? SizedBox(
                                                        width: 100,
                                                        child: Wrap(
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          spacing: 100,
                                                          children: []
                                                            ..addAll(controller
                                                                .listCategory!
                                                                .map(
                                                                    (element) =>
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "${element?.equipmentCat}",
                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                            )
                                                                          ],
                                                                        ))),
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        width: 150,
                                                        child: Text(
                                                          'Inverter, SCADA',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      5,
                                                                      92,
                                                                      163)),
                                                        ),
                                                      ),
                                                Text(
                                                  '${controller.viewPermitDetailsModel.value?.blockName}',
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 5, 92, 163)),
                                                ),
                                                SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                    '${controller.viewPermitDetailsModel.value?.description}',
                                                    overflow: TextOverflow.clip,
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 5, 92, 163)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        ///Loto Applied List
                                        SizedBox(
                                          // height: 230,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              0.1,
                                          child: Center(
                                            child: Container(
                                              margin: Dimens.edgeInsets16,
                                              height: Get.height,
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
                                                          'Isolation Required ',
                                                      action: Row(
                                                        children: [
                                                          Checkbox(
                                                            value: controller
                                                                .isCheckedLoto
                                                                .value,
                                                            onChanged:
                                                                (value) {},
                                                          ),

                                                          // CustomRichText(
                                                          // title:
                                                          //     'Loto Applied '),
                                                          // Checkbox(
                                                          //   value: controller
                                                          //   .isCheckedLoto
                                                          //   .value,
                                                          //   onChanged:
                                                          //   (value) {},
                                                          // ),

                                                          // CustomRichText(
                                                          // title:
                                                          //     'Isolated Equipments: '),
                                                          // Text(
                                                          // 'Inverter')
                                                        ],
                                                      )),
                                                  Dimens.boxHeight10,
                                                  Wrap(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                'Isolated Category',
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            5,
                                                                            92,
                                                                            163)),
                                                              )),
                                                          Divider(
                                                            thickness: 2,
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                2,
                                                            child: Container(
                                                              height:
                                                                  Get.height,
                                                              child: Column(
                                                                  //
                                                                  children: [
                                                                    ScrollableTableView(
                                                                      // paginationController: controller.equipmentNamepaginationController,
                                                                      columns: [
                                                                        'asset_name',
                                                                        'locksrno',
                                                                        // 'approved_datetime',
                                                                        // 'equipment',
                                                                        // 'workingAreaId',
                                                                        // 'description',
                                                                        // 'permitTypeName',
                                                                        // 'raisedByName',
                                                                        // 'breakdownTime',
                                                                        // 'breakdownType',
                                                                        // 'permitId',
                                                                        // 'assignedToName',
                                                                        // 'status',
                                                                        'action'
                                                                            .tr,
                                                                      ].map(
                                                                          (column) {
                                                                        return TableViewColumn(
                                                                            minWidth:
                                                                                Get.width * 0.25,
                                                                            label: column == "asset_name"
                                                                                ? "Loto Applied On"
                                                                                : column == "locksrno"
                                                                                    ? "Serial Number"
                                                                                    //     : column == "approved_datetime"
                                                                                    //         ? "Approved Time"
                                                                                    //         : column == "equipment"
                                                                                    //             ? "Equipment" //
                                                                                    //             : column == "workingAreaId"
                                                                                    //                 ? "Working Area Id"
                                                                                    //                 : column == "description"
                                                                                    //                     ? "Description"
                                                                                    //                     : column == "permitTypeName"
                                                                                    //                         ? "Work Type"

                                                                                    // : "Action",
                                                                                    : "");
                                                                      }).toList(),
                                                                      rows: //
                                                                          [
                                                                        ...List
                                                                            .generate(
                                                                          ///controller.selectedEquipmentNameIdList
                                                                          controller
                                                                              .listLoto!
                                                                              .length,

                                                                          (index) {
                                                                            var viewLotoListName =
                                                                                controller.listLoto![index];

                                                                            //_jobId = jobDetails?.id;

                                                                            // controller.id.value = viewLotoListName?.id ?? 0;
                                                                            print('Equipment Isss5:${controller.id.value}');
                                                                            return [
                                                                              '${viewLotoListName?.loto_Key}',
                                                                              '${viewLotoListName?.loto_lock_number}',
                                                                              // '${newPermitDetails?.workingAreaId}',
                                                                              // '${newPermitDetails?.description}',
                                                                              // '${newPermitDetails?.permitTypeName}',
                                                                              // '${jobDetails?.workType}',
                                                                              // '${jobDetails?.raisedByName}',
                                                                              // '${jobDetails?.breakdownTime ?? ''}',
                                                                              // '${jobDetails?.breakdownType}',
                                                                              // '${jobDetails?.permitId}',
                                                                              // '${jobDetails?.assignedToName}',
                                                                              // '${jobDetails?.status}',
                                                                              'Actions'
                                                                            ];
                                                                          },
                                                                        ),
                                                                      ].map((_inventoryDetailList) {
                                                                        return TableViewRow(
                                                                            onTap: () =>
                                                                                {
                                                                                  print('ZERO = ${_inventoryDetailList[0]}')
                                                                                },
                                                                            height:
                                                                                45,
                                                                            cells:
                                                                                _inventoryDetailList.map((value) {
                                                                              return TableViewCell(
                                                                                //key: ,
                                                                                child: (value == 'Actions')
                                                                                    ? Wrap(
                                                                                        children: [
                                                                                          TableActionButton(
                                                                                            color: Colors.red,
                                                                                            icon: Icons.delete_outline,
                                                                                            message: 'Remove',
                                                                                            onPress: () {
                                                                                              // controller.showNewPermitListDetails(
                                                                                              //     controller.permitId.value);
                                                                                            },
                                                                                          ),
                                                                                          // TableActionButton(
                                                                                          //   color: ColorValues.purpleColor,
                                                                                          //   icon: Icons.add,
                                                                                          //   label: 'Job Card',
                                                                                          //   onPress: () {
                                                                                          //     // controller.goToJobCardScreen(
                                                                                          //     //   int.tryParse(_newPermitList[0]),
                                                                                          //     // );
                                                                                          //   },
                                                                                          // ),
                                                                                          // TableActionButton(
                                                                                          //   color: Colors.blue,
                                                                                          //   icon: Icons.edit,
                                                                                          //   label: 'Edit PTW',
                                                                                          //   onPress: () {},
                                                                                          // ),
                                                                                          // TableActionButton(
                                                                                          //   color: Colors.green,
                                                                                          //   icon: Icons.visibility,
                                                                                          //   label: 'Approve Request',
                                                                                          //   onPress: () {},
                                                                                          // ),
                                                                                          // TableActionButton(
                                                                                          //   color: Colors.red,
                                                                                          //   icon: Icons.visibility,
                                                                                          //   label: 'Reject Request',
                                                                                          //   onPress: () {},
                                                                                          // ),
                                                                                        ],
                                                                                      )
                                                                                    : Text(value.toString()),
                                                                              );
                                                                            }).toList());
                                                                      }).toList(),
                                                                    ),

                                                                    // / PAGINATION
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              25),
                                                                      child: ValueListenableBuilder(
                                                                          valueListenable: controller.inventoryDetailPaginationController,
                                                                          builder: (context, value, child) {
                                                                            return Row(children: [
                                                                              Text("${controller.inventoryDetailPaginationController.currentPage}  of ${controller.inventoryDetailPaginationController.pageCount}"),
                                                                              Row(children: [
                                                                                IconButton(
                                                                                  onPressed: controller.inventoryDetailPaginationController.currentPage <= 1
                                                                                      ? null
                                                                                      : () {
                                                                                          controller.inventoryDetailPaginationController.previous();
                                                                                        },
                                                                                  iconSize: 20,
                                                                                  splashRadius: 20,
                                                                                  icon: Icon(
                                                                                    Icons.arrow_back_ios_new_rounded,
                                                                                    color: controller.inventoryDetailPaginationController.currentPage <= 1 ? Colors.black26 : Theme.of(context).primaryColor,
                                                                                  ),
                                                                                ),
                                                                                IconButton(
                                                                                  onPressed: controller.inventoryDetailPaginationController.currentPage >= controller.inventoryDetailPaginationController.pageCount
                                                                                      ? null
                                                                                      : () {
                                                                                          controller.inventoryDetailPaginationController.next();
                                                                                        },
                                                                                  iconSize: 20,
                                                                                  splashRadius: 20,
                                                                                  icon: Icon(
                                                                                    Icons.arrow_forward_ios_rounded,
                                                                                    color: controller.inventoryDetailPaginationController.currentPage >= controller.inventoryDetailPaginationController.pageCount ? Colors.black26 : Theme.of(context).primaryColor,
                                                                                  ),
                                                                                ),
                                                                              ]),
                                                                            ]);
                                                                          }),
                                                                    ),
                                                                  ]),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.2,
                                                            child: Divider(
                                                              thickness: 2,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),

                                        ///Team Deployed
                                        SizedBox(
                                          height: 230,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              0.1,
                                          child: Center(
                                            child: Container(
                                              margin: Dimens.edgeInsets16,
                                              height: Get.height,
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
                                                          'Team Deployed to carry out the job'
                                                              .tr,
                                                    ),
                                                    Dimens.boxHeight10,
                                                    Wrap(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  1.5,
                                                              child: Container(
                                                                height:
                                                                    Get.height,
                                                                child: Column(
                                                                    //
                                                                    children: [
                                                                      ScrollableTableView(
                                                                        // paginationController: controller.equipmentNamepaginationController,
                                                                        columns:
                                                                            [
                                                                          'empName',
                                                                          'resp',
                                                                          'Competeness'
                                                                              .tr,
                                                                        ].map((column) {
                                                                          return TableViewColumn(
                                                                            minWidth:
                                                                                Get.width * 0.19,
                                                                            label: column == "empName"
                                                                                ? "Employee Name"
                                                                                : column == "resp"
                                                                                    ? "Responsibility"
                                                                                    : "Competeness",
                                                                          );
                                                                        }).toList(),
                                                                        rows: //
                                                                            [
                                                                          ...List
                                                                              .generate(
                                                                            ///controller.selectedEquipmentNameIdList
                                                                            controller.listEmployee?.length ??
                                                                                0,

                                                                            (index) {
                                                                              var employeeNameDetails = controller.listEmployee![index];

                                                                              //_jobId = jobDetails?.id;

                                                                              // controller.id.value = employeeNameDetails?.id ?? 0;
                                                                              print('Employee Idss5:${controller.id.value}');
                                                                              return [
                                                                                '${employeeNameDetails?.empName ?? ''}',
                                                                                '${employeeNameDetails?.resp ?? ''}',
                                                                                'Competeness'
                                                                              ];
                                                                            },
                                                                          ),
                                                                        ].map((_inventoryDetailList) {
                                                                          return TableViewRow(
                                                                              onTap: () => {
                                                                                    print('ZERO = ${_inventoryDetailList[0]}')
                                                                                  },
                                                                              height: 45,
                                                                              cells: _inventoryDetailList.map((value) {
                                                                                return TableViewCell(
                                                                                  //key: ,
                                                                                  child: (value == 'Competeness')
                                                                                      ? Wrap(
                                                                                          children: [
                                                                                            TableActionButton(
                                                                                              color: Colors.blue,
                                                                                              icon: Icons.delete_outline,
                                                                                              message: 'Compete',
                                                                                              onPress: () {
                                                                                                // controller.showNewPermitListDetails(
                                                                                                //     controller.permitId.value);
                                                                                              },
                                                                                            ),
                                                                                            // TableActionButton(
                                                                                            //   color: ColorValues.purpleColor,
                                                                                            //   icon: Icons.add,
                                                                                            //   label: 'Job Card',
                                                                                            //   onPress: () {
                                                                                            //     // controller.goToJobCardScreen(
                                                                                            //     //   int.tryParse(_newPermitList[0]),
                                                                                            //     // );
                                                                                            //   },
                                                                                            // ),
                                                                                            // TableActionButton(
                                                                                            //   color: Colors.blue,
                                                                                            //   icon: Icons.edit,
                                                                                            //   label: 'Edit PTW',
                                                                                            //   onPress: () {},
                                                                                            // ),
                                                                                            // TableActionButton(
                                                                                            //   color: Colors.green,
                                                                                            //   icon: Icons.visibility,
                                                                                            //   label: 'Approve Request',
                                                                                            //   onPress: () {},
                                                                                            // ),
                                                                                            // TableActionButton(
                                                                                            //   color: Colors.red,
                                                                                            //   icon: Icons.visibility,
                                                                                            //   label: 'Reject Request',
                                                                                            //   onPress: () {},
                                                                                            // ),
                                                                                          ],
                                                                                        )
                                                                                      : Text(value.toString()),
                                                                                );
                                                                              }).toList());
                                                                        }).toList(),
                                                                      ),

                                                                      /// PAGINATION
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                25),
                                                                        child: ValueListenableBuilder(
                                                                            valueListenable: controller.employeeNamepaginationController,
                                                                            builder: (context, value, child) {
                                                                              return Row(children: [
                                                                                Text("${controller.employeeNamepaginationController.currentPage}  of ${controller.employeeNamepaginationController.pageCount}"),
                                                                                Row(children: [
                                                                                  IconButton(
                                                                                    onPressed: controller.employeeNamepaginationController.currentPage <= 1
                                                                                        ? null
                                                                                        : () {
                                                                                            controller.employeeNamepaginationController.previous();
                                                                                          },
                                                                                    iconSize: 20,
                                                                                    splashRadius: 20,
                                                                                    icon: Icon(
                                                                                      Icons.arrow_back_ios_new_rounded,
                                                                                      color: controller.employeeNamepaginationController.currentPage <= 1 ? Colors.black26 : Theme.of(context).primaryColor,
                                                                                    ),
                                                                                  ),
                                                                                  IconButton(
                                                                                    onPressed: controller.employeeNamepaginationController.currentPage >= controller.employeeNamepaginationController.pageCount
                                                                                        ? null
                                                                                        : () {
                                                                                            controller.employeeNamepaginationController.next();
                                                                                          },
                                                                                    iconSize: 20,
                                                                                    splashRadius: 20,
                                                                                    icon: Icon(
                                                                                      Icons.arrow_forward_ios_rounded,
                                                                                      color: controller.employeeNamepaginationController.currentPage >= controller.employeeNamepaginationController.pageCount ? Colors.black26 : Theme.of(context).primaryColor,
                                                                                    ),
                                                                                  ),
                                                                                ]),
                                                                              ]);
                                                                            }),
                                                                      ),
                                                                    ]),
                                                              ),
                                                            ),

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
                                                            // SizedBox(
                                                            //   height: 50,
                                                            // ),
                                                            // Center(
                                                            //     child: Text(
                                                            //         'List will appear here')
                                                            //         )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),

                                        ///Safety measures
                                        SizedBox(
                                          height: 240,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              0.1,
                                          child: Center(
                                            child: Container(
                                              margin: Dimens.edgeInsets16,
                                              height: Get.height,
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
                                                          'Following safety Measures taken to\ncarry out the work'
                                                              .tr,
                                                    ),
                                                    Dimens.boxHeight10,
                                                    Wrap(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            // Row(
                                                            //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            //   children: [
                                                            //     SizedBox(
                                                            //       width:
                                                            //           20,
                                                            //     ),
                                                            //     checkBoxMethod(
                                                            //         1),
                                                            //     Text(
                                                            //         'Hand Gloves'),
                                                            //     SizedBox(
                                                            //       width:
                                                            //           200,
                                                            //     ),
                                                            //      checkBoxMethod(
                                                            //         2),
                                                            //     Text(
                                                            //         'Safety helmet & safety shoes'),
                                                            //     SizedBox(
                                                            //       width:
                                                            //           250,
                                                            //     ),
                                                            //     checkBoxMethod(
                                                            //         3),
                                                            //     Text(
                                                            //         'Ladder'),

                                                            //   ],
                                                            // ),
                                                            Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              spacing: 100,
                                                              children: []
                                                                ..addAll(controller
                                                                    .safetyMeasureList
                                                                    .map((element) =>
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                checkBoxMethod(1),
                                                                                // Text("${l = l! + 1}. "),
                                                                                Text("${element.name}")
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ))),
                                                            ),

                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        //Tool box talk
                                        SizedBox(
                                          height: 250,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              0.1,
                                          child: Center(
                                            child: Container(
                                              margin: Dimens.edgeInsets16,
                                              height: Get.height,
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
                                                      title: 'Tool Box Talk'.tr,
                                                    ),
                                                    Dimens.boxHeight10,
                                                    Wrap(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                CustomRichText(
                                                                    title:
                                                                        'Job Type: '),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  '${controller.viewPermitDetailsModel.value?.job_type_name ?? 'No Data Found'}',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163)),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),

                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                CustomRichText(
                                                                    title:
                                                                        'SOP: '),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                SizedBox(
                                                                  width: 200,
                                                                  child: Text(
                                                                    '${controller.viewPermitDetailsModel.value?.sop_type_name ?? 'No Data Found'}',
                                                                    style: TextStyle(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            5,
                                                                            92,
                                                                            163)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),

                                                            // Checkbox(
                                                            //   value: controller
                                                            //       .isCheckedLoto
                                                            //       .value,
                                                            //   onChanged:
                                                            //       (value) {},
                                                            // ),

                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          250),
                                                              child: CustomRichText(
                                                                  title:
                                                                      'JSA: '),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Container(
                                                                    height: 30,
                                                                    child:
                                                                        CustomElevatedButton(
                                                                      backgroundColor:
                                                                          ColorValues
                                                                              .navyBlueColor,
                                                                      text:
                                                                          "View SOP",
                                                                      onPressed:
                                                                          () {
                                                                        controller
                                                                            .createNewPermits();
                                                                        Get.dialog<void>(
                                                                            ViewJSADialog());
                                                                      },
                                                                    )),
                                                                SizedBox(
                                                                  width: 80,
                                                                ),
                                                                Container(
                                                                    height: 30,
                                                                    child:
                                                                        CustomElevatedButton(
                                                                      backgroundColor:
                                                                          ColorValues
                                                                              .navyBlueColor,
                                                                      text:
                                                                          "View JSA",
                                                                      onPressed:
                                                                          () {
                                                                        // Get.dialog<void>(SafetyMeasureDialog());
                                                                        // controller.createNewPermit();
                                                                      },
                                                                    )),
                                                              ],
                                                            ),

                                                            ///Non Routine Tab Bar
                                                            // SizedBox(
                                                            //   height: 400,
                                                            //   width: MediaQuery.of(context)
                                                            //           .size
                                                            //           .width /
                                                            //       1,
                                                            //   child:
                                                            //       Center(
                                                            //     child:
                                                            //         Container(
                                                            //       margin:
                                                            //           Dimens.edgeInsets16,
                                                            //       height:
                                                            //           Get.height,
                                                            //       decoration:
                                                            //           BoxDecoration(
                                                            //         border:
                                                            //             Border.all(color: Colors.grey.withOpacity(.3)),
                                                            //       ),
                                                            //       constraints:
                                                            //           BoxConstraints(
                                                            //         maxWidth:
                                                            //             1100,
                                                            //       ),
                                                            //       child:
                                                            //           SingleChildScrollView(
                                                            //         child:
                                                            //             Column(
                                                            //           children: [
                                                            //             CustomAppBar(
                                                            //               title: 'Non-Routine Tasks'.tr,
                                                            //             ),
                                                            //             Dimens.boxHeight10,
                                                            //             Wrap(
                                                            //               children: [
                                                            //                 Column(
                                                            //                   children: [
                                                            //                     SizedBox(
                                                            //                       width: MediaQuery.of(context).size.width / 1,
                                                            //                       child: DefaultTabController(
                                                            //                         length: 2,
                                                            //                         child: Column(
                                                            //                           children: [
                                                            //                             Padding(
                                                            //                               padding: const EdgeInsets.all(1.0),
                                                            //                               child: Container(
                                                            //                                 height: 45,
                                                            //                                 decoration: BoxDecoration(
                                                            //                                   border: Border.all(color: Colors.grey),
                                                            //                                   color: Colors.white,
                                                            //                                   borderRadius: BorderRadius.circular(1),
                                                            //                                 ),
                                                            //                                 child: TabBar(
                                                            //                                   labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                            //                                   labelColor: Colors.white,
                                                            //                                   indicator: BoxDecoration(color: Color.fromRGBO(7, 63, 115, 1), borderRadius: BorderRadius.circular(1)),
                                                            //                                   unselectedLabelColor: Colors.black,
                                                            //                                   tabs: [
                                                            //                                     Tab(
                                                            //                                       child: Text('Risk Assessment'),
                                                            //                                     ),
                                                            //                                     Tab(
                                                            //                                       child: Text(
                                                            //                                         'Method Statement',
                                                            //                                       ),
                                                            //                                     ),
                                                            //                                   ],
                                                            //                                 ),
                                                            //                               ),
                                                            //                             ),
                                                            //                             SizedBox(
                                                            //                               height: 250,
                                                            //                               width: MediaQuery.of(context).size.width / 2,
                                                            //                               child: TabBarView(children: [
                                                            //                                 ///First TabBar View
                                                            //                                 Container(
                                                            //                                     // decoration: BoxDecoration(color: Colors.grey),
                                                            //                                     child: Column(
                                                            //                                   children: [
                                                            //                                     SizedBox(
                                                            //                                       height: 15,
                                                            //                                     ),
                                                            //                                     Row(
                                                            //                                       children: [
                                                            //                                         SizedBox(
                                                            //                                           width: 10,
                                                            //                                         ),
                                                            //                                         Text(
                                                            //                                           'Risk',
                                                            //                                           style: TextStyle(color: Color.fromARGB(255, 5, 92, 163), fontWeight: FontWeight.bold),
                                                            //                                         ),
                                                            //                                         SizedBox(
                                                            //                                           width: 330,
                                                            //                                         ),
                                                            //                                         Text(
                                                            //                                           'MitigationPlan',
                                                            //                                           style: TextStyle(color: Color.fromARGB(255, 5, 92, 163), fontWeight: FontWeight.bold),
                                                            //                                         ),
                                                            //                                         Divider(
                                                            //                                           thickness: 2,
                                                            //                                         )
                                                            //                                       ],
                                                            //                                     ),
                                                            //                                     SizedBox(
                                                            //                                       height: 20,
                                                            //                                     ),
                                                            //                                     Text('No Risk Assessment Link')
                                                            //                                   ],
                                                            //                                 )),

                                                            //                                 ////Second TabBar View
                                                            //                                 Center(child: Text('Second Tab'))
                                                            //                               ]),
                                                            //                             )
                                                            //                           ],
                                                            //                         ),
                                                            //                       ),
                                                            //                     ),
                                                            //                   ],
                                                            //                 ),

                                                            //                 /// Employee
                                                            //               ],
                                                            //             ),
                                                            //           ],
                                                            //         ),
                                                            //       ),
                                                            //     ),
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
                                        ),
                                        SizedBox(height: 10),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              0.03,
                                          child: Container(
                                            height: 180,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
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
                                                        'All Files Upload'.tr,
                                                    action: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [],
                                                    ),
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Wrap(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text('Name'),
                                                          Dimens.boxWidth10,
                                                          Text(
                                                              'Upload\nProgress'),
                                                          Dimens.boxWidth10,
                                                          Text('Status'),
                                                          Dimens.boxWidth10,
                                                          Text('Description'),
                                                          Dimens.boxWidth10,
                                                          Text('Remove'),
                                                          Dimens.boxWidth10,
                                                        ],
                                                      ),
                                                      Divider(
                                                        thickness: 2,
                                                      ),
                                                      SizedBox(
                                                        height: 40,
                                                      ),
                                                      Text(
                                                          'File List will Appear Here')
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 25,
                                        ),

                                        ///Permit History

                                        controller.historyList!.isEmpty
                                            ? Dimens.box0
                                            : SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    0.03,
                                                child: Container(
                                                  // margin: Dimens.edgeInsets20,
                                                  constraints: BoxConstraints(
                                                    maxHeight: 100,
                                                    minHeight: 100,
                                                  ),
                                                  child: //
                                                      HistoryTableWidgetWeb(
                                                    historyList:
                                                        controller.historyList,
                                                  ),
                                                ),
                                              ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  CustomRichText(
                                                      title: 'Requested By: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Date / Time: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Signature: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Issued By: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Date / Time: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Signature: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Approved By: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Date / Time: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Signature: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Closed By: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Date / Time: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Signature: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Cancelled By: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Date / Time: '),
                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Signature: '),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Prashant Shetya',
                                                  ),
                                                  Text(
                                                    '2022-05-01 17:25',
                                                  ),
                                                  Text(
                                                    'No Data !!!',
                                                  ),
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.issuedByName}',
                                                  ),
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.issue_at}',
                                                  ),
                                                  Text(
                                                    'No Data !!!',
                                                  ),
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.approvedByName}',
                                                  ),
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.approve_at}',
                                                  ),
                                                  Text(
                                                    'No Data !!!',
                                                  ),
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.closedByName}',
                                                  ),
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.close_at}',
                                                  ),
                                                  Text(
                                                    'No Data !!!',
                                                  ),
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.cancelRequestByName ?? ''}',
                                                  ),
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.cancel_at ?? ''}',
                                                  ),
                                                  Text(
                                                    'No Data !!!',
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 25,
                                        ),
                                        Center(
                                          child: Wrap(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 35,
                                                  ),
                                                  Container(
                                                    height: 45,
                                                    width: 180,
                                                    child: ElevatedButton.icon(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        foregroundColor:
                                                            Colors.white,
                                                        backgroundColor:
                                                            Color.fromARGB(
                                                                255,
                                                                5,
                                                                92,
                                                                163), //  foreground
                                                      ),
                                                      onPressed: () {
                                                        // controller.printScreen();
                                                        print('HelloPrint');
                                                      },
                                                      icon: Icon(Icons
                                                          .print), //icon data for elevated button
                                                      label: Text(
                                                          "Prints"), //label text
                                                      // style: ButtonStyle( backgroundColor:Color(value)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Container(
                                                      height: 45,
                                                      child:
                                                          CustomElevatedButton(
                                                        backgroundColor:
                                                            Colors.red,
                                                        text: "Cancel",
                                                        onPressed: () {
                                                          // controller
                                                          //     .createNewPermit();
                                                        },
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 90,
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                      ]),
                                );
                              } else if (Responsive.isDesktop(context)) {
                                return SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 227, 224, 224),
                                              width: 1,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 236, 234, 234)
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
                                                color:
                                                    ColorValues.greyLightColor,
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
                                              controller.type.value == 1
                                                  ? InkWell(
                                                      onTap: () {
                                                        Get.offAllNamed(
                                                            Routes.pmTaskView);
                                                      },
                                                      child: Text(
                                                          " / VIEW PM TASK",
                                                          style: Styles
                                                              .greyLight14),
                                                    )
                                                  : InkWell(
                                                      onTap: () {
                                                        Get.offAllNamed(Routes
                                                            .newPermitList);
                                                      },
                                                      child: Text(
                                                          " / NEW PERMIT LIST",
                                                          style: Styles
                                                              .greyLight14),
                                                    ),
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: controller
                                                                    .viewPermitDetailsModel
                                                                    .value
                                                                    ?.ptwStatus ==
                                                                PermitStatusConstants
                                                                    .PTW_APPROVE //125
                                                            ||
                                                            controller
                                                                    .viewPermitDetailsModel
                                                                    .value
                                                                    ?.ptwStatus ==
                                                                PermitStatusConstants
                                                                    .PTW_CREATED //121
                                                            ||
                                                            controller
                                                                    .viewPermitDetailsModel
                                                                    .value
                                                                    ?.ptwStatus ==
                                                                PermitStatusConstants
                                                                    .PTW_EXTEND_REQUEST_APPROVE //135
                                                        ? ColorValues
                                                            .approveColor
                                                        : ColorValues
                                                            .appRedColor,
                                                    width: 1,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: controller
                                                                      .viewPermitDetailsModel
                                                                      .value
                                                                      ?.ptwStatus ==
                                                                  PermitStatusConstants
                                                                      .PTW_APPROVE //125
                                                              ||
                                                              controller
                                                                      .viewPermitDetailsModel
                                                                      .value
                                                                      ?.ptwStatus ==
                                                                  PermitStatusConstants
                                                                      .PTW_CREATED //121
                                                              ||
                                                              controller
                                                                      .viewPermitDetailsModel
                                                                      .value
                                                                      ?.ptwStatus ==
                                                                  PermitStatusConstants
                                                                      .PTW_EXTEND_REQUEST_APPROVE //135
                                                          ? ColorValues
                                                              .approveColor
                                                          : ColorValues
                                                              .appRedColor,
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '${controller.viewPermitDetailsModel.value?.current_status_short}',
                                                  style: TextStyle(
                                                      color: Colors.white),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "This permit is valid only when issued Et approved by an authorized issuer. This permit must be obtained before a specified work is started Et it must be closed immediately after completion of the work or at the end of the shift as agreed by the parties identified on this permit. Refer PTW SOP",
                                                style: Styles.grey15,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // String pdfUrl =
                                                  //     "assets/files/ptwsop.pdf";
                                                  // String pdfPath = html.window
                                                  //         .location.origin +
                                                  //     '/' +
                                                  //     pdfUrl;
                                                  // html.window
                                                  //     .open(pdfPath, '_blank');
                                                },
                                                child: Image.asset(
                                                  'assets/files/pdf2.png',
                                                  width:
                                                      45, // Set the desired width
                                                  height:
                                                      35, // Set the desired height
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 20, right: 20, top: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                      overflow:
                                                          TextOverflow.clip,
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
                                                                WrapAlignment
                                                                    .start,
                                                            spacing: 100,
                                                            children: []
                                                              ..addAll(controller
                                                                  .listCategory!
                                                                  .map(
                                                                      (element) =>
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 20,
                                                                                child: Text(
                                                                                  "${element?.equipmentCat}",
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: Styles.blue17,
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
                                          padding:
                                              const EdgeInsets.only(left: 70),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Work Description: ',
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
                                                height: ((controller
                                                                .listAssociatedJobs
                                                                ?.length ??
                                                            0) *
                                                        50) +
                                                    125,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
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
                                                            "Jobs Linked To This Permit",
                                                            style:
                                                                Styles.blue700,
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
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    206,
                                                                    229,
                                                                    234)),
                                                        columns: [
                                                          DataColumn(
                                                              label: Text(
                                                            "Job Id",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Job Title",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Equipment\nCategory",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Equipment",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Breakdown\nTime",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Assigned To",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Status",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ],
                                                        rows: List<
                                                            DataRow>.generate(
                                                          controller
                                                                  .listAssociatedJobs
                                                                  ?.length ??
                                                              0,
                                                          (index) => DataRow(
                                                              cells: [
                                                                DataCell(
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          controller.viewJobDetails(controller
                                                                              .listAssociatedJobs?[index]
                                                                              ?.jobId);
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          controller.listAssociatedJobs?[index]?.jobId.toString() ??
                                                                              '',
                                                                          style:
                                                                              TextStyle(
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                            decorationStyle:
                                                                                TextDecorationStyle.solid,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                5,
                                                                                92,
                                                                                163),
                                                                          ),
                                                                        ))),
                                                                DataCell(Text(controller
                                                                        .listAssociatedJobs?[
                                                                            index]
                                                                        ?.title
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .listAssociatedJobs?[
                                                                            index]
                                                                        ?.equipmentCat
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(
                                                                  Text(
                                                                    controller
                                                                            .listAssociatedJobs?[index]
                                                                            ?.equipment
                                                                            .toString() ??
                                                                        '',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                                DataCell(Text(controller
                                                                        .listAssociatedJobs?[
                                                                            index]
                                                                        ?.breakdownTime
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .listAssociatedJobs?[
                                                                            index]
                                                                        ?.assignedTo
                                                                        .toString() ??
                                                                    '')),
                                                                DataCell(Text(controller
                                                                        .listAssociatedJobs?[
                                                                            index]
                                                                        ?.status_short
                                                                        .toString() ??
                                                                    '')),
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                        controller.listAssociatedPm!.isEmpty
                                            ? Dimens.box0
                                            : Container(
                                                margin: Dimens.edgeInsets20,
                                                height: ((controller
                                                                .listAssociatedPm
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "PM Task Linked To This Permit",
                                                            style:
                                                                Styles.blue700,
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
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    206,
                                                                    229,
                                                                    234)),
                                                        columns: [
                                                          DataColumn(
                                                              label: Text(
                                                            "PM Task Id",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "PM Task Title",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Equipment\nCategory",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Equipment",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Start Date",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Assigned To",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Status",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ],
                                                        rows: List<
                                                            DataRow>.generate(
                                                          controller
                                                                  .listAssociatedPm
                                                                  ?.length ??
                                                              0,
                                                          (index) =>
                                                              DataRow(cells: [
                                                            DataCell(
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      controller
                                                                          .clearStoreDataPMtaskId();

                                                                      Get.toNamed(
                                                                          Routes
                                                                              .pmTaskView,
                                                                          arguments: {
                                                                            'pmTaskId':
                                                                                controller.listAssociatedPm?[index]?.pmId
                                                                          });
                                                                    },
                                                                    child: Text(
                                                                      "PMT${controller.listAssociatedPm?[index]?.pmId.toString() ?? ''}",
                                                                      style:
                                                                          TextStyle(
                                                                        decoration:
                                                                            TextDecoration.underline,
                                                                        decorationStyle:
                                                                            TextDecorationStyle.solid,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            5,
                                                                            92,
                                                                            163),
                                                                      ),
                                                                    ))),
                                                            DataCell(Text(controller
                                                                    .listAssociatedPm?[
                                                                        index]
                                                                    ?.title
                                                                    .toString() ??
                                                                '')),
                                                            DataCell(Text(controller
                                                                    .listAssociatedPm?[
                                                                        index]
                                                                    ?.equipmentCat
                                                                    .toString() ??
                                                                '')),
                                                            DataCell(
                                                              Text(
                                                                controller
                                                                        .listAssociatedPm?[
                                                                            index]
                                                                        ?.equipment
                                                                        .toString() ??
                                                                    '',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            DataCell(Text(controller
                                                                    .listAssociatedPm?[
                                                                        index]
                                                                    ?.startDate
                                                                    .toString() ??
                                                                '')),
                                                            DataCell(Text(controller
                                                                    .listAssociatedPm?[
                                                                        index]
                                                                    ?.assignedTo
                                                                    .toString() ??
                                                                '')),
                                                            DataCell(Text(controller
                                                                    .listAssociatedPm?[
                                                                        index]
                                                                    ?.status_short
                                                                    .toString() ??
                                                                '')),
                                                          ]),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Isolation Required ',
                                                style: Styles.blue700,
                                              ),
                                              Checkbox(
                                                value: controller
                                                    .isCheckedLoto.value,
                                                onChanged: (value) {},
                                              ),
                                              Spacer(),
                                              Text(
                                                'Loto Applied ',
                                                style: Styles.blue700,
                                              ),
                                              Checkbox(
                                                value: controller
                                                    .isCheckedLoto.value,
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
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                                "${element?.isolationAssetsCatName?.split(',')}",
                                                                style: Styles
                                                                    .blue17)
                                                          ],
                                                        ))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: Dimens.edgeInsets20,
                                          height:
                                              ((controller.listLoto?.length ??
                                                          0) *
                                                      40) +
                                                  130,
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
                                                    const EdgeInsets.all(10.0),
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
                                                      "Loto Applied On",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    DataColumn(
                                                        label: Text(
                                                      "Loto Lock Sr. No.",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  ],
                                                  rows: List<DataRow>.generate(
                                                    controller
                                                            .listLoto?.length ??
                                                        0,
                                                    (index) => DataRow(cells: [
                                                      DataCell(Text(controller
                                                              .listLoto?[index]
                                                              ?.loto_Key
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

                                        ///Team Deployed
                                        // Container(
                                        //   margin: Dimens.edgeInsets20,
                                        //   height:
                                        //       ((controller.listEmployee?.length ??
                                        //                   0) *
                                        //               40) +
                                        //           130,
                                        //   decoration: BoxDecoration(
                                        //     border: Border.all(
                                        //       color: ColorValues
                                        //           .lightGreyColorWithOpacity35,
                                        //       width: 1,
                                        //     ),
                                        //     boxShadow: [
                                        //       BoxShadow(
                                        //         color: ColorValues
                                        //             .appBlueBackgroundColor,
                                        //         spreadRadius: 2,
                                        //         blurRadius: 5,
                                        //         offset: Offset(0, 2),
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   child: Column(
                                        //     children: [
                                        //       Padding(
                                        //         padding: const EdgeInsets.all(10.0),
                                        //         child: Row(
                                        //           children: [
                                        //             Text(
                                        //               'Team deploying to carry out the Job',
                                        //               style: Styles.blue700,
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //       Expanded(
                                        //         child: DataTable2(
                                        //           border: TableBorder.all(
                                        //               color: Color.fromARGB(
                                        //                   255, 206, 229, 234)),
                                        //           columns: [
                                        //             DataColumn(
                                        //                 label: Text(
                                        //               "Employee Name",
                                        //               style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             )),
                                        //             DataColumn(
                                        //                 label: Text(
                                        //               "Responsibility",
                                        //               style: TextStyle(
                                        //                   fontSize: 15,
                                        //                   fontWeight:
                                        //                       FontWeight.bold),
                                        //             )),
                                        //           ],
                                        //           rows: List<DataRow>.generate(
                                        //             controller
                                        //                     .listEmployee?.length ??
                                        //                 0,
                                        //             (index) => DataRow(cells: [
                                        //               DataCell(Text(controller
                                        //                       .listEmployee?[index]
                                        //                       ?.empName
                                        //                       .toString() ??
                                        //                   '')),
                                        //               DataCell(Text(controller
                                        //                       .listEmployee?[index]
                                        //                       ?.resp
                                        //                       .toString() ??
                                        //                   '')),
                                        //             ]),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),

                                        ///Safety measures
                                        controller.safetyMeasureList.isEmpty
                                            ? Dimens.box0
                                            : SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1,
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // CustomAppBar(
                                                      //   title: 'Following safety Measures taken to carry out the work'.tr,
                                                      // ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 10),
                                                        child: Text(
                                                          'Permit Type Checklist',
                                                          style: Styles.blue700,
                                                        ),
                                                      ),
                                                      Dimens.boxHeight10,
                                                      Wrap(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              controller.permitId !=
                                                                      null
                                                                  ? Column(
                                                                      // alignment: WrapAlignment.start,
                                                                      // spacing: 100,
                                                                      children: []
                                                                        ..addAll(controller.safetyMeasureList.map((element) =>
                                                                            Column(
                                                                              // mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(left: 20),
                                                                                  child: SizedBox(
                                                                                    // width: 200,
                                                                                    child: Row(
                                                                                      children: [
                                                                                        checkBoxMethod(1),
                                                                                        // Text("${l = l! + 1}. "),
                                                                                        Expanded(child: Text("${element.name}"))
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ))),
                                                                    )
                                                                  : Container(),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                        //Tool box talk
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
                                                  "Tool Box Talk",
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
                                                                  style: Styles
                                                                      .blue17),
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
                                                                  style: Styles
                                                                      .blue17),
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
                                                            Text('JSA: '),
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
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
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
                                                                  text:
                                                                      "View SOP",
                                                                  onPressed:
                                                                      () async {
                                                                    // final url = '${_controller.jsaData}';
                                                                    // "https://www.w3.org/1999/xhtml/"
                                                                    String
                                                                        baseUrl =
                                                                        'http://65.0.20.19/CMMS_API/';
                                                                    // String baseUrl = 'http://172.20.43.9:83/';
                                                                    String
                                                                        endpoint =
                                                                        '${_controller.sopData}';

                                                                    // Concatenate the links
                                                                    String
                                                                        fullUrl =
                                                                        baseUrl +
                                                                            endpoint;
                                                                    // final url =
                                                                    //     'http://65.0.20.19/O3_Files${_controller.jsaData}';
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
                                                              child:
                                                                  CustomElevatedButton(
                                                                backgroundColor:
                                                                    ColorValues
                                                                        .navyBlueColor,
                                                                text:
                                                                    "View JSA",
                                                                onPressed:
                                                                    () async {
                                                                  String
                                                                      baseUrl =
                                                                      'http://65.0.20.19/CMMS_API/';
                                                                  // String baseUrl = 'http://172.20.43.9:83/';
                                                                  String
                                                                      endpoint =
                                                                      '${_controller.jsaData}';
                                                                  String
                                                                      fullUrl =
                                                                      baseUrl +
                                                                          endpoint;
                                                                  print(
                                                                      'JSAUrl:$fullUrl');
                                                                  if (await canLaunch(
                                                                      fullUrl)) {
                                                                    await launch(
                                                                        fullUrl);
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
                                                                      '${controller.viewPermitDetailsModel.value?.tbT_Done_At}',
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
                                                                      "Responsibility",
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

                                        //   SizedBox(height: 10),

                                        ////Extend Conditions List

                                        controller.viewPermitDetailsModel.value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_EXTEND_REQUESTED //133
                                                ||
                                                controller
                                                        .viewPermitDetailsModel
                                                        .value
                                                        ?.ptwStatus ==
                                                    PermitStatusConstants
                                                        .PTW_EXTEND_REQUEST_APPROVE //135
                                            ? SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // CustomAppBar(
                                                      //   title: 'Following safety Measures taken to carry out the work'.tr,
                                                      // ),
                                                      Text(
                                                        'Extend Condition List',
                                                        style: Styles.blue700,
                                                      ),
                                                      Dimens.boxHeight10,
                                                      Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Column(
                                                                // alignment: WrapAlignment.start,
                                                                // spacing: 100,
                                                                children: []
                                                                  ..addAll(controller
                                                                      .listExtendCondition!
                                                                      .map((element) =>
                                                                          Column(
                                                                            // mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(
                                                                                // width: 200,
                                                                                child: Row(
                                                                                  children: [
                                                                                    checkBoxMethod(1),
                                                                                    // Text("${l = l! + 1}. "),
                                                                                    Expanded(child: Text("${element!.name}")),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ))),
                                                              ),
                                                              // : Dimens.box0,
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10),
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
                                                                          'Attached Files',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          'anas zia.jpeg',
                                                                          style: TextStyle(
                                                                              decoration: TextDecoration.underline,
                                                                              decorationStyle: TextDecorationStyle.solid,
                                                                              color: Color.fromARGB(255, 5, 92, 163),
                                                                              fontSize: Dimens.seventeen),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Spacer(),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Comment/Remark',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          'Extended Conditions',
                                                                          style:
                                                                              Styles.black17,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Spacer(),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Approver Name',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          '${controller.viewPermitDetailsModel.value?.requestedByName}',
                                                                          style:
                                                                              Styles.black17,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Spacer(),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Date & Time',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          '${controller.viewPermitDetailsModel.value?.start_datetime}',
                                                                          style:
                                                                              Styles.black17,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Dimens.box0,

                                        ///Cancel Condition List
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
                                                        .PTW_CANCEL_REQUESTED //130
                                            ? SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // CustomAppBar(
                                                      //   title: 'Following safety Measures taken to carry out the work'.tr,
                                                      // ),
                                                      Text(
                                                        'Cancel Condition List',
                                                        style: Styles.blue700,
                                                      ),
                                                      Dimens.boxHeight10,
                                                      Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              // controller.permitId != null
                                                              //     ?
                                                              Column(
                                                                // alignment: WrapAlignment.start,
                                                                // spacing: 100,
                                                                children: []
                                                                  ..addAll(controller
                                                                      .listCancelCondition!
                                                                      .map((element) =>
                                                                          Column(
                                                                            // mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(
                                                                                // width: 200,
                                                                                child: Row(
                                                                                  children: [
                                                                                    checkBoxMethod(1),
                                                                                    // Text("${l = l! + 1}. "),
                                                                                    Expanded(child: Text("${element!.name}"))
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ))),
                                                              ),
                                                              // : Container(),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10),
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
                                                                          'Attached Files',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          'anas zia.jpeg',
                                                                          style: TextStyle(
                                                                              decoration: TextDecoration.underline,
                                                                              decorationStyle: TextDecorationStyle.solid,
                                                                              color: Color.fromARGB(255, 5, 92, 163),
                                                                              fontSize: Dimens.seventeen),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Spacer(),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Comment/Remark',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          'cancel Conditions',
                                                                          style:
                                                                              Styles.black17,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Spacer(),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Approver Name',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          '${controller.viewPermitDetailsModel.value?.requestedByName}',
                                                                          style:
                                                                              Styles.black17,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Spacer(),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Date & Time',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          '${controller.viewPermitDetailsModel.value?.start_datetime}',
                                                                          style:
                                                                              Styles.black17,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Dimens.box0,

                                        ///Close Condition List
                                        controller.viewPermitDetailsModel.value
                                                    ?.ptwStatus ==
                                                PermitStatusConstants
                                                    .PTW_CLOSED //126
                                            ? SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // CustomAppBar(
                                                      //   title: 'Following safety Measures taken to carry out the work'.tr,
                                                      // ),
                                                      Text(
                                                        'Close Condition List',
                                                        style: Styles.blue700,
                                                      ),
                                                      Dimens.boxHeight10,
                                                      Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              // controller.permitId != null
                                                              //     ?
                                                              Column(
                                                                // alignment: WrapAlignment.start,
                                                                // spacing: 100,
                                                                children: []
                                                                  ..addAll(controller
                                                                      .listCloseCondition!
                                                                      .map((element) =>
                                                                          Column(
                                                                            // mainAxisSize: MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SizedBox(
                                                                                // width: 200,
                                                                                child: Row(
                                                                                  children: [
                                                                                    checkBoxMethod(1),
                                                                                    // Text("${l = l! + 1}. "),
                                                                                    Expanded(child: Text("${element!.name}"))
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ))),
                                                              ),
                                                              // : Container(),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10),
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
                                                                          'Attached Files',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          'anas zia.jpeg',
                                                                          style: TextStyle(
                                                                              decoration: TextDecoration.underline,
                                                                              decorationStyle: TextDecorationStyle.solid,
                                                                              color: Color.fromARGB(255, 5, 92, 163),
                                                                              fontSize: Dimens.seventeen),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Spacer(),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Comment/Remark',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          'Close Conditions',
                                                                          style:
                                                                              Styles.black17,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Spacer(),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Approver Name',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          '${controller.viewPermitDetailsModel.value?.requestedByName}',
                                                                          style:
                                                                              Styles.black17,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Spacer(),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'Date & Time',
                                                                          style:
                                                                              Styles.blackBold17,
                                                                        ),
                                                                        Text(
                                                                          '${controller.viewPermitDetailsModel.value?.start_datetime}',
                                                                          style:
                                                                              Styles.black17,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Dimens.box0,

                                        ///File Upload
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "All Files Upload",
                                                style: Styles.blue700,
                                              ),
                                              Dimens.boxHeight10,
                                              Wrap(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                        child: Container(
                                                          height:
                                                              Get.height * 0.2,
                                                          width: Get.width,
                                                          child: Row(
                                                              //
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      FileUploadWidgetWithDropzone(),
                                                                ),
                                                                Dimens
                                                                    .boxWidth10,
                                                                Expanded(
                                                                    flex: 8,
                                                                    child:
                                                                        FileUploadDetailsWidgetWeb2()),
                                                              ]),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                                                height: ((controller.historyList
                                                                ?.length ??
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Permit History ",
                                                            style:
                                                                Styles.blue700,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: ColorValues
                                                          .greyLightColour,
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
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    206,
                                                                    229,
                                                                    234)),
                                                        columns: [
                                                          DataColumn(
                                                              label: Text(
                                                            "Time Stamp",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Posted By",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Comment",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Location",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                          DataColumn(
                                                              label: Text(
                                                            "Status",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ],
                                                        rows: List<
                                                            DataRow>.generate(
                                                          controller.historyList
                                                                  ?.length ??
                                                              0,
                                                          (index) =>
                                                              DataRow(cells: [
                                                            DataCell(Text(controller
                                                                    .historyList?[
                                                                        index]
                                                                    ?.createdAt
                                                                    .toString() ??
                                                                '')),
                                                            DataCell(Text(controller
                                                                    .historyList?[
                                                                        index]
                                                                    ?.createdByName
                                                                    .toString() ??
                                                                '')),
                                                            DataCell(Text(controller
                                                                    .historyList?[
                                                                        index]
                                                                    ?.comment
                                                                    .toString() ??
                                                                '')),
                                                            DataCell(
                                                                Text('--')),
                                                            DataCell(Text(controller
                                                                    .historyList?[
                                                                        index]
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
                                        // Container(
                                        //   margin: Dimens.edgeInsets20,
                                        //   constraints: BoxConstraints(
                                        //     maxHeight: 100,
                                        //     minHeight: 100,
                                        //   ),
                                        //   child: //
                                        //       HistoryTableWidgetWeb(
                                        //     historyList:
                                        //         controller.historyList,
                                        //   ),
                                        // ),

                                        Dimens.boxHeight10,
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                  controller.viewPermitDetailsModel
                                                              .value?.ptwStatus ==
                                                          PermitStatusConstants
                                                              .PTW_CLOSED //126
                                                      ? Text('Closed By: ')
                                                      : Dimens.box0,
                                                ],
                                              ),
                                              Dimens.boxWidth20,
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
                                                  controller.viewPermitDetailsModel
                                                              .value?.ptwStatus ==
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
                                                  controller.viewPermitDetailsModel
                                                              .value?.ptwStatus ==
                                                          PermitStatusConstants
                                                              .PTW_CLOSED //126
                                                      ? Text('Date / Time: ')
                                                      : Dimens.box0,
                                                ],
                                              ),
                                              Dimens.boxWidth20,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${controller.viewPermitDetailsModel.value?.issue_at}',
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
                                                          '${controller.viewPermitDetailsModel.value?.approve_at}',
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
                                                          '${controller.viewPermitDetailsModel.value?.cancel_at}',
                                                        )
                                                      : Dimens.box0,

                                                  controller.viewPermitDetailsModel
                                                              .value?.ptwStatus ==
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
                                                  controller.viewPermitDetailsModel
                                                              .value?.ptwStatus ==
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
                                );
                              }
                            }()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                    child: HomeDrawer(), duration: Duration(milliseconds: 450))
              ],
            ),
          ),
          floatingActionButton: Obx(
            () => Row(
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
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.approve ==
                                        UserAccessConstants.kHaveApproveAccess)
                                .length >
                            0 &&
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
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
                                        .viewPermitDetailsModel.value?.permitNo,
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
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.approve ==
                                        UserAccessConstants.kHaveApproveAccess)
                                .length >
                            0 &&
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants.PTW_EXTEND_REQUESTED //133
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
                                      .viewPermitDetailsModel.value?.permitNo,
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
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.approve ==
                                        UserAccessConstants.kHaveApproveAccess)
                                .length >
                            0 &&
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants.PTW_EXTEND_REQUESTED //133
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
                                      .viewPermitDetailsModel.value?.permitNo,
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
                controller.viewPermitDetailsModel.value?.isExpired == 1 ||
                        controller.viewPermitDetailsModel.value?.requester_id ==
                                varUserAccessModel.value.user_id &&
                            controller
                                    .viewPermitDetailsModel.value?.ptwStatus ==
                                PermitStatusConstants.PTW_APPROVE //125
                            &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id ==
                                            UserAccessConstants
                                                .kPermitFeatureId &&
                                        e.edit ==
                                            UserAccessConstants.kHaveEditAccess)
                                    .length >
                                0
                    //          ||
                    // controller.viewPermitDetailsModel.value?.ptwStatus == 135
                    ? Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                            height: 45,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.appDarkBlueColor,
                              text: "Extend Permit",
                              icon: Icons.expand_outlined,
                              onPressed: () {
                                // controller
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
                                            UserAccessConstants.kHaveAddAccess)
                                    .length >
                                0 &&
                            controller.viewPermitDetailsModel.value?.permitNo !=
                                null &&
                            controller
                                    .viewPermitDetailsModel.value?.ptwStatus ==
                                PermitStatusConstants
                                    .PTW_CANCEL_REQUEST_REJECTED //121
                        ||
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants.PTW_EXTEND_REQUEST_REJECTED
                    ? Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                            height: 45,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.appcloseRedColor,
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
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.approve ==
                                        UserAccessConstants.kHaveApproveAccess)
                                .length >
                            0 &&
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
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
                                // controller
                                //     .createNewPermit();
                                Get.dialog(PermitRejectDialog(
                                  permitId: controller
                                      .viewPermitDetailsModel.value?.permitNo,
                                  ptwStatus:
                                      '${controller.viewPermitDetailsModel.value?.ptwStatus}',
                                  jobId: controller.jobId.value,
                                ));
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
                varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id == UserAccessConstants.kPermitFeatureId &&
                                        e.approve ==
                                            UserAccessConstants
                                                .kHaveApproveAccess)
                                    .length >
                                0 &&
                            varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id == UserAccessConstants.kPermitFeatureId &&
                                        e.edit ==
                                            UserAccessConstants.kHaveEditAccess)
                                    .length >
                                0 ||
                        varUserAccessModel.value.access_list!
                                    .where((e) =>
                                        e.feature_id == UserAccessConstants.kPermitFeatureId &&
                                        e.edit ==
                                            UserAccessConstants.kHaveEditAccess)
                                    .length >
                                0 &&
                            controller.viewPermitDetailsModel.value?.ptwStatus ==
                                PermitStatusConstants.PTW_APPROVE //125
                        ||
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants.PTW_CREATED //121
                        ||
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants.PTW_EXTEND_REQUEST_REJECTED ||
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants.PTW_CANCEL_REQUEST_REJECTED
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
                                        UserAccessConstants.kPermitFeatureId &&
                                    e.edit ==
                                        UserAccessConstants.kHaveAddAccess)
                                .length >
                            0 &&
                        controller.viewPermitDetailsModel.value?.ptwStatus ==
                            PermitStatusConstants.PTW_CREATED //121

                    ? Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                            height: 45,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.appYellowColor,
                              text: "Edit Permit",
                              icon: Icons.close,
                              onPressed: () {
                                controller.editNewPermit(
                                    permitId: controller
                                        .viewPermitDetailsModel.value?.permitNo,
                                    isChecked: controller.isChecked.value);
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

  ////Below All for Mobile
  Widget _buildStartDateField_mobile(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RichText(
            text: TextSpan(
                text: 'Start Date: ', style: Styles.blackBold16, children: []),
          ),
        ),
      ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
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
            width: MediaQuery.of(context).size.width / 1.1,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onTap: () {
                pickDateTime_mobile(context);
              },
              controller: controller.startDateTimeCtrlr,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                // if (value.trim().length > 3) {
                //   controller.isJobTitleInvalid.value = false;
                // } else {
                //   controller.isJobTitleInvalid.value = true;
                // }
              },
            ),
          ),
        ),
      ),
      Dimens.boxHeight20,
    ]);
  }

  Widget _buildValidTillField_mobile(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RichText(
            text: TextSpan(
                text: 'Valid Till: ', style: Styles.blackBold16, children: []),
          ),
        ),
      ),
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
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
            width: MediaQuery.of(context).size.width / 1.1,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onTap: () {
                pickDateTimeTill_mobile(context);
              },
              controller: controller.validTillTimeCtrlr,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                // if (value.trim().length > 3) {
                //   controller.isJobTitleInvalid.value = false;
                // } else {
                //   controller.isJobTitleInvalid.value = true;
                // }
              },
            ),
          ),
        ),
      ),
      Dimens.boxHeight20,
    ]);
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

  Widget _buildPermitDescriptionField_mobile(BuildContext context) {
    return Column(//
        children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RichText(
            text: TextSpan(
                text: 'Permit Description: ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: ColorValues.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ),
      ),
      Dimens.boxHeight5,
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
            controller: controller.jobDescriptionCtrlr,
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

  ///Below All For WEB

  Widget _buildDateTimeField_web(
    BuildContext context,
  ) {
    return Column(//
        children: [
      Dimens.boxHeight5,
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
                pickDateTime_web(context);
              },
              controller: controller.startDateTimeCtrlr,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
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
      Dimens.boxHeight20,
    ]);
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

  Widget _buildTitleTextField_web(BuildContext context) {
    return Column(//
        children: [
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.44,
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
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              controller: controller.titleTextCtrlr,
              keyboardType: TextInputType.multiline,
              // maxLines: 5,
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
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;

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
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;

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

  checkBoxMethod(int position) {
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
