import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/permit_approved_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_by_approver_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_request_dialog.dart';
import 'package:cmms/app/widgets/permit_close_dialog.dart';
import 'package:cmms/app/widgets/permit_extend_dialog.dart';
import 'package:cmms/app/widgets/permit_reject_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ViewPermitWebScreen extends GetView<ViewPermitController> {
  ViewPermitWebScreen({super.key});
  bool valuefirst = false;
  final ViewPermitController _controller = Get.find();
  // final NewPermitListController Newcontroller = Get.find();

  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  String dropdownvalue = 'Item 1';

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Responsive.isDesktop(context)
            ? AppBar(
                title: HeaderWidget(),
                automaticallyImplyLeading: false,
                elevation: 0,
                toolbarHeight: 60,
              )
            : AppBar(
                title: Text('View Permit'),
                centerTitle: true,
                elevation: 0,
              ),
        body: RepaintBoundary(
          key: controller.printKey,
          child: Container(
            // width: MediaQuery.of(context).size.width  ,
            // width: 1500,
            // height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
                (Responsive.isMobile(context) || Responsive.isTablet(context))
                    ? Dimens.box0
                    : HomeDrawer(),
                Obx(
                  () => Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                            color: ColorValues.greyLightColor,
                                          ),
                                          Text(
                                            "DASHBOARD",
                                            style: Styles.greyLight14,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Text(" / NEW PERMIT LIST",
                                                style:
                                                    Styles.greyMediumLight12),
                                          ),
                                          Text(" / VIEW PERMIT",
                                              style: Styles.greyMediumLight12)
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
                                                fontWeight: FontWeight.bold),
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                                            CustomRichText(title: 'Plant: '),
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
                                                title: 'Site Permit No.: '),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            CustomRichText(
                                              title: 'Equipment Categories: ',
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            CustomRichText(title: 'Block: '),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            CustomRichText(
                                                title: 'Permit Description: '),
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
                                              overflow: TextOverflow.ellipsis,
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
                                                overflow: TextOverflow.ellipsis,
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
                                                          WrapAlignment.start,
                                                      spacing: 100,
                                                      children:
                                                          []
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
                                                          color: Color.fromARGB(
                                                              255, 5, 92, 163)),
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
                                      width: MediaQuery.of(context).size.width /
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
                                                  title: 'Isolation Required ',
                                                  action: Row(
                                                    children: [
                                                      Checkbox(
                                                        value: controller
                                                            .isCheckedLoto
                                                            .value,
                                                        onChanged: (value) {},
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
                                                          height: Get.height,
                                                          child: Column(
                                                              //
                                                              children: [
                                                                Expanded(
                                                                  child: //
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
                                                                          print(
                                                                              'Equipment Isss5:${controller.id.value}');
                                                                          return [
                                                                            '${viewLotoListName?.asset_name}',
                                                                            '${viewLotoListName?.locksrno}',
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
                                                                ),

                                                                // / PAGINATION
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          25),
                                                                  child:
                                                                      ValueListenableBuilder(
                                                                          valueListenable: controller
                                                                              .inventoryDetailPaginationController,
                                                                          builder: (context,
                                                                              value,
                                                                              child) {
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
                                      width: MediaQuery.of(context).size.width /
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
                                                            height: Get.height,
                                                            child: Column(
                                                                //
                                                                children: [
                                                                  Expanded(
                                                                    child: //
                                                                        ScrollableTableView(
                                                                      // paginationController: controller.equipmentNamepaginationController,
                                                                      columns: [
                                                                        'empName',
                                                                        'resp',
                                                                        'Competeness'
                                                                            .tr,
                                                                      ].map(
                                                                          (column) {
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
                                                                            var employeeNameDetails =
                                                                                controller.listEmployee![index];

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
                                                                          return Row(
                                                                              children: [
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
                                      width: MediaQuery.of(context).size.width /
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
                                                                .map(
                                                                    (element) =>
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
                                      width: MediaQuery.of(context).size.width /
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
                                                                  color: Color
                                                                      .fromARGB(
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
                                                                title: 'SOP: '),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            SizedBox(
                                                              width: 200,
                                                              child: Text(
                                                                '${controller.viewPermitDetailsModel.value?.sop_type_name ?? 'No Data Found'}',
                                                                style: TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
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
                                                                  right: 250),
                                                          child: CustomRichText(
                                                              title: 'JSA: '),
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
                                                                    // controller.createNewPermit();
                                                                    // Get.dialog<void>(ViewJSADialog());
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
                                      width: MediaQuery.of(context).size.width /
                                          0.03,
                                      child: Container(
                                        height: 180,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
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
                                                title: 'All Files Upload'.tr,
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
                                                      Text('Upload\nProgress'),
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
                                      padding: const EdgeInsets.only(left: 50),
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
                                                  style:
                                                      ElevatedButton.styleFrom(
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
                                                    controller.printScreen();
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
                                                  child: CustomElevatedButton(
                                                    backgroundColor: Colors.red,
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
                          } else if (Responsive.isDesktop(
                            context,
                          )) {
                            ///For Desktop
                          
}
