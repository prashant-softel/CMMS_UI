import 'package:cmms/app/add_job/add_job_controller.dart';
import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/create_preventive_checklist/create_preventive_checklist_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/history_table_widget_web.dart';
import 'package:cmms/app/widgets/permit_approved_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_by_approver_dialog.dart';
import 'package:cmms/app/widgets/permit_cancel_dialog.dart';
import 'package:cmms/app/widgets/permit_issue_dialog.dart';
import 'package:cmms/app/widgets/permit_reject_dialog.dart';
import 'package:cmms/app/widgets/view_sop_dialog.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:cmms/domain/models/new_permit_details_model.dart';
import 'package:cmms/domain/models/new_permit_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class ViewPermitWebScreen extends GetView<ViewPermitController> {
  ViewPermitWebScreen({super.key});
  bool valuefirst = false;
  final ViewPermitController _controller = Get.find();

  DateTime? _dateTime1;
  DateTime? _dateTime2;
  TimeOfDay? time1;
  TimeOfDay? time2;

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  int? l = 0;

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Responsive.isDesktop(context)
            ? AppBar(
                title: HeaderWidget(),
                automaticallyImplyLeading: false,
                elevation: 0,
                toolbarHeight: 90,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  if(Responsive.isMobile(context))
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [],
                              ),
                            ),

                            /// CARD
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                //  height: MediaQuery.of(context).size.height,
                                child: Card(
                                  color: Colors.lightBlue.shade50,
                                  elevation: 20,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                      padding: Dimens.edgeInsets10,
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
                                                                  255,
                                                                  236,
                                                                  234,
                                                                  234)
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
                                                          color: ColorValues
                                                              .greyLightColor,
                                                        ),
                                                        Text(
                                                          "DASHBOARD",
                                                          style: Styles
                                                              .greyLight14,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Text(
                                                              " / New Permit List",
                                                              style: Styles
                                                                  .greyMediumLight12),
                                                        ),
                                                        Text(" / View Permit",
                                                            style: Styles
                                                                .greyMediumLight12)
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Title:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 150,
                                                        child: Text(
                                                          '${controller.viewPermitDetailsModel.value?.title}',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      6,
                                                                      83,
                                                                      146),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      // SizedBox(
                                                      //   width: 350,
                                                      // ),
                                                      Container(
                                                        height: 30,
                                                        width: 170,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                            color: Colors.blue,
                                                            width: 1,
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .blue),
                                                          ],
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          'Waiting to be Issued',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          CustomRichText(
                                                              title:
                                                                  'Start Date: '),
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Valid Till: '),
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          CustomRichText(
                                                              title: 'Plant: '),
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Permit No: '),
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Permit Type: '),
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Site Permit No.: '),
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${controller.startDateTimeCtrlr.text}',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        5,
                                                                        92,
                                                                        163)),
                                                          ),
                                                          Text(
                                                            '${controller.validTillTimeCtrlr.text}',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        5,
                                                                        92,
                                                                        163)),
                                                          ),
                                                          Text(
                                                            '${controller.viewPermitDetailsModel.value?.blockName}',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        5,
                                                                        92,
                                                                        163)),
                                                          ),
                                                          Text(
                                                            '${controller.viewPermitDetailsModel.value?.permitNo}',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        5,
                                                                        92,
                                                                        163)),
                                                          ),
                                                          Container(
                                                            width: 150,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.permitTypeName}',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163)),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${controller.viewPermitDetailsModel.value?.sitePermitNo}',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        5,
                                                                        92,
                                                                        163)),
                                                          ),
                                                          controller.permitId !=
                                                                  null
                                                              ? SizedBox(
                                                                  width: 100,
                                                                  child: Wrap(
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    spacing:
                                                                        100,
                                                                    children: []
                                                                      ..addAll(controller
                                                                          .listCategory!
                                                                          .map((element) =>
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                            255,
                                                                            5,
                                                                            92,
                                                                            163)),
                                                                  ),
                                                                ),
                                                          Text(
                                                            '${controller.viewPermitDetailsModel.value?.blockName}',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        5,
                                                                        92,
                                                                        163)),
                                                          ),
                                                          Text(
                                                            '${controller.viewPermitDetailsModel.value?.description}',
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
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  ///Loto Applied List
                                                  SizedBox(
                                                    height: 230,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            0.1,
                                                    child: Center(
                                                      child: Container(
                                                        margin:
                                                            Dimens.edgeInsets16,
                                                        height: Get.height,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3)),
                                                        ),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1100,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
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
                                                              Dimens
                                                                  .boxHeight10,
                                                              Wrap(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .centerLeft,
                                                                          child:
                                                                              Text(
                                                                            'Isolated Category',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          )),
                                                                      Divider(
                                                                        thickness:
                                                                            2,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.height *
                                                                                2,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              Get.height,
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
                                                                                      'action'.tr,
                                                                                    ].map((column) {
                                                                                      return TableViewColumn(
                                                                                          minWidth: Get.width * 0.25,
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
                                                                                      ...List.generate(
                                                                                        ///controller.selectedEquipmentNameIdList
                                                                                        controller.listLoto!.length,

                                                                                        (index) {
                                                                                          var viewLotoListName = controller.listLoto![index];

                                                                                          //_jobId = jobDetails?.id;

                                                                                          // controller.id.value = viewLotoListName?.id ?? 0;
                                                                                          print('Equipment Isss5:${controller.id.value}');
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
                                                                                          onTap: () => {
                                                                                                print('ZERO = ${_inventoryDetailList[0]}')
                                                                                              },
                                                                                          height: 45,
                                                                                          cells: _inventoryDetailList.map((value) {
                                                                                            return TableViewCell(
                                                                                              //key: ,
                                                                                              child: (value == 'Actions')
                                                                                                  ? Wrap(
                                                                                                      children: [
                                                                                                        TableActionButton(
                                                                                                          color: Colors.red,
                                                                                                          icon: Icons.delete_outline,
                                                                                                          label: 'Remove',
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
                                                                                  padding: const EdgeInsets.symmetric(horizontal: 25),
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
                                                                        width: MediaQuery.of(context).size.width /
                                                                            1.2,
                                                                        child:
                                                                            Divider(
                                                                          thickness:
                                                                              2,
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
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                  ///Team Deployed
                                                  SizedBox(
                                                    height: 230,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            0.1,
                                                    child: Center(
                                                      child: Container(
                                                        margin:
                                                            Dimens.edgeInsets16,
                                                        height: Get.height,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3)),
                                                        ),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1100,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              CustomAppBar(
                                                                title:
                                                                    'Team Deployed to carry out the job'
                                                                        .tr,
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Wrap(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            1.5,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              Get.height,
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
                                                                                      'Competeness'.tr,
                                                                                    ].map((column) {
                                                                                      return TableViewColumn(
                                                                                        minWidth: Get.width * 0.19,
                                                                                        label: column == "empName"
                                                                                            ? "Employee Name"
                                                                                            : column == "resp"
                                                                                                ? "Responsibility"
                                                                                                : "Competeness",
                                                                                      );
                                                                                    }).toList(),
                                                                                    rows: //
                                                                                        [
                                                                                      ...List.generate(
                                                                                        ///controller.selectedEquipmentNameIdList
                                                                                        controller.listEmployee?.length ?? 0,

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
                                                                                                          label: 'Compete',
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
                                                                                  padding: const EdgeInsets.symmetric(horizontal: 25),
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            0.1,
                                                    child: Center(
                                                      child: Container(
                                                        margin:
                                                            Dimens.edgeInsets16,
                                                        height: Get.height,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3)),
                                                        ),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1100,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              CustomAppBar(
                                                                title:
                                                                    'Following safety Measures taken to\ncarry out the work'
                                                                        .tr,
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
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
                                                                            WrapAlignment.start,
                                                                        spacing:
                                                                            100,
                                                                        children: []
                                                                          ..addAll(controller.safetyMeasureList.map((element) =>
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                        height:
                                                                            20,
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            0.1,
                                                    child: Center(
                                                      child: Container(
                                                        margin:
                                                            Dimens.edgeInsets16,
                                                        height: Get.height,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3)),
                                                        ),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1100,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              CustomAppBar(
                                                                title:
                                                                    'Tool Box Talk'
                                                                        .tr,
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Wrap(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                15,
                                                                          ),
                                                                          CustomRichText(
                                                                              title: 'Job Type: '),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            '${controller.viewPermitDetailsModel.value?.job_type_name ?? 'No Data Found'}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),

                                                                      Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                15,
                                                                          ),
                                                                          CustomRichText(
                                                                              title: 'SOP: '),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                200,
                                                                            child:
                                                                                Text(
                                                                              '${controller.viewPermitDetailsModel.value?.sop_type_name ?? 'No Data Found'}',
                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
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
                                                                            const EdgeInsets.only(right: 250),
                                                                        child: CustomRichText(
                                                                            title:
                                                                                'JSA: '),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            30,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                15,
                                                                          ),
                                                                          Container(
                                                                              height: 30,
                                                                              child: CustomElevatedButton(
                                                                                backgroundColor: ColorValues.navyBlueColor,
                                                                                text: "View SOP",
                                                                                onPressed: () {
                                                                                  // controller.createNewPermit();
                                                                                  // Get.dialog<void>(ViewJSADialog());
                                                                                },
                                                                              )),
                                                                          SizedBox(
                                                                            width:
                                                                                80,
                                                                          ),
                                                                          Container(
                                                                              height: 30,
                                                                              child: CustomElevatedButton(
                                                                                backgroundColor: ColorValues.navyBlueColor,
                                                                                text: "View JSA",
                                                                                onPressed: () {
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            0.03,
                                                    child: Container(
                                                      height: 180,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    .3)),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 1100,
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            CustomAppBar(
                                                              title:
                                                                  'All Files Upload'
                                                                      .tr,
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
                                                                    Text(
                                                                        'Name'),
                                                                    Dimens
                                                                        .boxWidth10,
                                                                    Text(
                                                                        'Upload\nProgress'),
                                                                    Dimens
                                                                        .boxWidth10,
                                                                    Text(
                                                                        'Status'),
                                                                    Dimens
                                                                        .boxWidth10,
                                                                    Text(
                                                                        'Description'),
                                                                    Dimens
                                                                        .boxWidth10,
                                                                    Text(
                                                                        'Remove'),
                                                                    Dimens
                                                                        .boxWidth10,
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
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            0.03,
                                                    child: Container(
                                                      // margin: Dimens.edgeInsets20,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 100,
                                                        minHeight: 100,
                                                      ),
                                                      child: //
                                                          HistoryTableWidgetWeb(
                                                        historyList: controller
                                                            .historyList,
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 50),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Requested By: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Date / Time: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Signature: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Issued By: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Date / Time: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Signature: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Approved By: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Date / Time: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Signature: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Closed By: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Date / Time: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Signature: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Cancelled By: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Date / Time: '),
                                                            SizedBox(
                                                              height: 1,
                                                            ),
                                                            CustomRichText(
                                                                title:
                                                                    'Signature: '),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
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
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title:
                                                          //         'Requested By: '),
                                                          // Text(
                                                          //   ' Prashant Shetya',
                                                          // ),
                                                        ],
                                                      ),
                                                      // Dimens.boxWidth10,
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title:
                                                          //         'Date / Time: '),
                                                          // Text(
                                                          //   ' 2022-05-01 17:25',
                                                          // ),
                                                        ],
                                                      ),
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets.only(
                                                      //           right: 270),
                                                      //   child: CustomRichText(
                                                      //       title: 'Signature: '),
                                                      // ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Column(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment
                                                    //         .spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title: 'Issued By: '),
                                                          SizedBox(width: 5),
                                                          // Text(
                                                          //   '${controller.viewPermitDetailsModel.value?.issuedByName}',
                                                          // ),
                                                        ],
                                                      ),
                                                      // SizedBox(width: 187),
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title:
                                                          //         'Date / Time: '),
                                                          SizedBox(width: 5),
                                                          // Text(
                                                          //   '${controller.viewPermitDetailsModel.value?.issue_at}',
                                                          // ),
                                                        ],
                                                      ),

                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets.only(
                                                      //           right: 270),
                                                      //   child: CustomRichText(
                                                      //       title: 'Signature: '),
                                                      // ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Column(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment
                                                    //         .spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title:
                                                          //         'Approved By: '),
                                                          SizedBox(width: 5),
                                                          // SizedBox(
                                                          //   width: 100,
                                                          //   child: Text(
                                                          //     '${controller.viewPermitDetailsModel.value?.approvedByName}',
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title:
                                                          //         'Date / Time: '),
                                                          SizedBox(width: 5),
                                                          // Text(
                                                          //   '${controller.viewPermitDetailsModel.value?.approve_at}',
                                                          // ),
                                                        ],
                                                      ),
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets.only(
                                                      //           right: 270),
                                                      //   child: CustomRichText(
                                                      //       title: 'Signature: '),
                                                      // ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Column(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment
                                                    //         .spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title: 'Closed By: '),
                                                          SizedBox(width: 5),
                                                          // Text(
                                                          //   '${controller.viewPermitDetailsModel.value?.closedByName}',
                                                          // ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title:
                                                          //         'Date / Time: '),
                                                          SizedBox(width: 5),
                                                          // Text(
                                                          //   '${controller.viewPermitDetailsModel.value?.close_at}',
                                                          // ),
                                                        ],
                                                      ),
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets.only(
                                                      //           right: 270),
                                                      //   child: CustomRichText(
                                                      //       title: 'Signature: '),
                                                      // ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Column(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment
                                                    //         .spaceEvenly,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title:
                                                          //         'Cancelled By: '),
                                                          SizedBox(width: 5),
                                                          // Text(
                                                          //   '${controller.viewPermitDetailsModel.value?.cancelRequestByName ?? ''}',
                                                          // ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          // CustomRichText(
                                                          //     title:
                                                          //         'Date / Time: '),
                                                          SizedBox(width: 5),
                                                          // Text(
                                                          //   '${controller.viewPermitDetailsModel.value?.cancel_at ?? ''}',
                                                          // ),
                                                        ],
                                                      ),
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets.only(
                                                      //           right: 270),
                                                      //   child: CustomRichText(
                                                      //       title: 'Signature: '),
                                                      // ),
                                                    ],
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
                                                              child:
                                                                  ElevatedButton
                                                                      .icon(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  foregroundColor:
                                                                      Colors
                                                                          .white,
                                                                  backgroundColor:
                                                                      Color.fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163), //  foreground
                                                                ),
                                                                onPressed: () {
                                                                  controller
                                                                      .printScreen();
                                                                  print(
                                                                      'HelloPrint');
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
                                                                      Colors
                                                                          .red,
                                                                  text:
                                                                      "Cancel",
                                                                  onPressed:
                                                                      () {
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
                                                                  255,
                                                                  236,
                                                                  234,
                                                                  234)
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
                                                          color: ColorValues
                                                              .greyLightColor,
                                                        ),
                                                        Text(
                                                          "DASHBOARD",
                                                          style: Styles
                                                              .greyLight14,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Text(
                                                              " / New Permit List",
                                                              style: Styles
                                                                  .greyMediumLight12),
                                                        ),
                                                        Text(" / View Permit",
                                                            style: Styles
                                                                .greyMediumLight12)
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Title:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 150,
                                                        child: Text(
                                                          '${controller.viewPermitDetailsModel.value?.title}',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      6,
                                                                      83,
                                                                      146),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 550,
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                            color: Colors.blue,
                                                            width: 1,
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .blue),
                                                          ],
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          '${controller.viewPermitDetailsModel.value?.current_status_short}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
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
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.2,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 35,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'Start Date: '),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                CustomRichText(
                                                                    title:
                                                                        'Permit No.: '),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                CustomRichText(
                                                                    title:
                                                                        'Permit Description: '),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                CustomRichText(
                                                                    title:
                                                                        'Equipment Categories: '),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(width: 20),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${controller.startDateTimeCtrlr.text}',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163)),
                                                                ),

                                                                Text(
                                                                  '${controller.viewPermitDetailsModel.value?.permitNo}',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163)),
                                                                ),

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
                                                                Text(
                                                                  '${controller.viewPermitDetailsModel.value?.description}',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163)),
                                                                ),
                                                                controller.permitId !=
                                                                        null
                                                                    ? SizedBox(
                                                                        width:
                                                                            100,
                                                                        child:
                                                                            Wrap(
                                                                          alignment:
                                                                              WrapAlignment.start,
                                                                          spacing:
                                                                              100,
                                                                          children: []..addAll(controller.listCategory!.map((element) =>
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    "${element?.equipmentCat}",
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  )
                                                                                ],
                                                                              ))),
                                                                        ),
                                                                      )
                                                                    : Container(),

                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 40,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'Valid Till: '),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                CustomRichText(
                                                                    title:
                                                                        'Site Permit No.: '),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                CustomRichText(
                                                                    title:
                                                                        'Block: '),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${controller.validTillTimeCtrlr.text}',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163)),
                                                                ),
                                                                Text(
                                                                  '${controller.viewPermitDetailsModel.value?.sitePermitNo}',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163)),
                                                                ),
                                                                SizedBox(
                                                                  width: 150,
                                                                  child: Text(
                                                                    '${controller.viewPermitDetailsModel.value?.blockName}',
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
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'Plant: '),
                                                                SizedBox(
                                                                    height: 5),
                                                                CustomRichText(
                                                                    title:
                                                                        'Permit Type: '),
                                                                SizedBox(
                                                                    height: 5),
                                                              ],
                                                            ),
                                                            SizedBox(width: 5),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${controller.viewPermitDetailsModel.value?.siteName}',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163)),
                                                                ),
                                                                Text(
                                                                  '${controller.viewPermitDetailsModel.value?.permitTypeName}',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          5,
                                                                          92,
                                                                          163)),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),

                                                        // _buildStartValidTillDateField_web(
                                                        //     context, 0,),
                                                      ],
                                                    ),
                                                  ),

                                                  ///Loto Applied List
                                                  SizedBox(
                                                    height: 270,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.2,
                                                    child: Center(
                                                      child: Container(
                                                        margin:
                                                            Dimens.edgeInsets16,
                                                        height: Get.height,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3)),
                                                        ),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1100,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              CustomAppBar(
                                                                  title: '',
                                                                  action:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            120),
                                                                    child: Row(
                                                                      children: [
                                                                        CustomRichText(
                                                                            title:
                                                                                'Isolation Required '),
                                                                        Checkbox(
                                                                          value: controller
                                                                              .isCheckedLoto
                                                                              .value,
                                                                          onChanged:
                                                                              (value) {},
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              230,
                                                                        ),
                                                                        CustomRichText(
                                                                            title:
                                                                                'Loto Applied '),
                                                                        Checkbox(
                                                                          value: controller
                                                                              .isCheckedLoto
                                                                              .value,
                                                                          onChanged:
                                                                              (value) {},
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              180,
                                                                        ),
                                                                        CustomRichText(
                                                                            title:
                                                                                'Isolated Equipments: '),
                                                                        Text(
                                                                            'Inverter'),
                                                                      ],
                                                                    ),
                                                                  )),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Wrap(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment
                                                                              .centerLeft,
                                                                          child:
                                                                              Text(
                                                                            'Isolated Category',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          )),
                                                                      Divider(
                                                                        thickness:
                                                                            2,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width *
                                                                                2,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100,
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
                                                                                      'action'.tr,
                                                                                    ].map((column) {
                                                                                      return TableViewColumn(
                                                                                        minWidth: Get.width * 0.25,
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

                                                                                                : "Action",
                                                                                        // : ""
                                                                                      );
                                                                                    }).toList(),
                                                                                    rows: //
                                                                                        [
                                                                                      ...List.generate(
                                                                                        ///controller.selectedEquipmentNameIdList
                                                                                        controller.listLoto!.length,

                                                                                        (index) {
                                                                                          var viewLotoListName = controller.listLoto![index];

                                                                                          //_jobId = jobDetails?.id;

                                                                                          // controller.id.value = viewLotoListName?.id ?? 0;
                                                                                          print('Equipment Isss5:${controller.id.value}');
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
                                                                                          onTap: () => {
                                                                                                print('ZERO = ${_inventoryDetailList[0]}')
                                                                                              },
                                                                                          height: 45,
                                                                                          cells: _inventoryDetailList.map((value) {
                                                                                            return TableViewCell(
                                                                                              //key: ,
                                                                                              child: (value == 'Actions')
                                                                                                  ? Wrap(
                                                                                                      children: [
                                                                                                        TableActionButton(
                                                                                                          color: Colors.red,
                                                                                                          icon: Icons.delete_outline,
                                                                                                          label: 'Remove',
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
                                                                                // Padding(
                                                                                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                                                                                //   child: ValueListenableBuilder(
                                                                                //       valueListenable: controller.inventoryDetailPaginationController,
                                                                                //       builder: (context, value, child) {
                                                                                //         return Row(children: [
                                                                                //           Text("${controller.inventoryDetailPaginationController.currentPage}  of ${controller.inventoryDetailPaginationController.pageCount}"),
                                                                                //           Row(children: [
                                                                                //             IconButton(
                                                                                //               onPressed: controller.inventoryDetailPaginationController.currentPage <= 1
                                                                                //                   ? null
                                                                                //                   : () {
                                                                                //                       controller.inventoryDetailPaginationController.previous();
                                                                                //                     },
                                                                                //               iconSize: 20,
                                                                                //               splashRadius: 20,
                                                                                //               icon: Icon(
                                                                                //                 Icons.arrow_back_ios_new_rounded,
                                                                                //                 color: controller.inventoryDetailPaginationController.currentPage <= 1 ? Colors.black26 : Theme.of(context).primaryColor,
                                                                                //               ),
                                                                                //             ),
                                                                                //             IconButton(
                                                                                //               onPressed: controller.inventoryDetailPaginationController.currentPage >= controller.inventoryDetailPaginationController.pageCount
                                                                                //                   ? null
                                                                                //                   : () {
                                                                                //                       controller.inventoryDetailPaginationController.next();
                                                                                //                     },
                                                                                //               iconSize: 20,
                                                                                //               splashRadius: 20,
                                                                                //               icon: Icon(
                                                                                //                 Icons.arrow_forward_ios_rounded,
                                                                                //                 color: controller.inventoryDetailPaginationController.currentPage >= controller.inventoryDetailPaginationController.pageCount ? Colors.black26 : Theme.of(context).primaryColor,
                                                                                //               ),
                                                                                //             ),
                                                                                //           ]),
                                                                                //         ]);
                                                                                //       }),
                                                                                // ),
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

                                                  ///Team Deployed
                                                  SizedBox(
                                                    height: 270,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.2,
                                                    child: Center(
                                                      child: Container(
                                                        margin:
                                                            Dimens.edgeInsets16,
                                                        height: Get.height,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3)),
                                                        ),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1100,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              CustomAppBar(
                                                                title:
                                                                    'Team Deployed to carry out the job'
                                                                        .tr,
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Wrap(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            1.5,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              180,
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
                                                                                      'Competeness'.tr,
                                                                                    ].map((column) {
                                                                                      return TableViewColumn(
                                                                                        minWidth: Get.width * 0.26,
                                                                                        label: column == "empName"
                                                                                            ? "Employee Name"
                                                                                            : column == "resp"
                                                                                                ? "Responsibility"
                                                                                                : "Competeness",
                                                                                      );
                                                                                    }).toList(),
                                                                                    rows: //
                                                                                        [
                                                                                      ...List.generate(
                                                                                        ///controller.selectedEquipmentNameIdList
                                                                                        controller.listEmployee?.length ?? 0,

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
                                                                                                          label: 'Competency',
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
                                                                                // Padding(
                                                                                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                                                                                //   child: ValueListenableBuilder(
                                                                                //       valueListenable: controller.employeeNamepaginationController,
                                                                                //       builder: (context, value, child) {
                                                                                //         return Row(children: [
                                                                                //           Text("${controller.employeeNamepaginationController.currentPage}  of ${controller.employeeNamepaginationController.pageCount}"),
                                                                                //           Row(children: [
                                                                                //             IconButton(
                                                                                //               onPressed: controller.employeeNamepaginationController.currentPage <= 1
                                                                                //                   ? null
                                                                                //                   : () {
                                                                                //                       controller.employeeNamepaginationController.previous();
                                                                                //                     },
                                                                                //               iconSize: 20,
                                                                                //               splashRadius: 20,
                                                                                //               icon: Icon(
                                                                                //                 Icons.arrow_back_ios_new_rounded,
                                                                                //                 color: controller.employeeNamepaginationController.currentPage <= 1 ? Colors.black26 : Theme.of(context).primaryColor,
                                                                                //               ),
                                                                                //             ),
                                                                                //             IconButton(
                                                                                //               onPressed: controller.employeeNamepaginationController.currentPage >= controller.employeeNamepaginationController.pageCount
                                                                                //                   ? null
                                                                                //                   : () {
                                                                                //                       controller.employeeNamepaginationController.next();
                                                                                //                     },
                                                                                //               iconSize: 20,
                                                                                //               splashRadius: 20,
                                                                                //               icon: Icon(
                                                                                //                 Icons.arrow_forward_ios_rounded,
                                                                                //                 color: controller.employeeNamepaginationController.currentPage >= controller.employeeNamepaginationController.pageCount ? Colors.black26 : Theme.of(context).primaryColor,
                                                                                //               ),
                                                                                //             ),
                                                                                //           ]),
                                                                                //         ]);
                                                                                //       }),
                                                                                // ),
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
                                                    height: 150,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.2,
                                                    child: Center(
                                                      child: Container(
                                                        margin:
                                                            Dimens.edgeInsets16,
                                                        height: Get.height,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3)),
                                                        ),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1100,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              CustomAppBar(
                                                                title:
                                                                    'Following safety Measures taken to carry out the work'
                                                                        .tr,
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
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
                                                                      controller.permitId !=
                                                                              null
                                                                          ? Wrap(
                                                                              alignment: WrapAlignment.start,
                                                                              spacing: 100,
                                                                              children: []..addAll(controller.safetyMeasureList.map((element) => Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                            )
                                                                          : Container(),

                                                                      SizedBox(
                                                                        height:
                                                                            20,
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.2,
                                                    child: Center(
                                                      child: Container(
                                                        margin:
                                                            Dimens.edgeInsets16,
                                                        height: Get.height,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      .3)),
                                                        ),
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1100,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              CustomAppBar(
                                                                title:
                                                                    'Tool Box Talk'
                                                                        .tr,
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
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
                                                                            width:
                                                                                15,
                                                                          ),
                                                                          CustomRichText(
                                                                              title: 'Job Type: '),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),

                                                                          Text(
                                                                            '${controller.viewPermitDetailsModel.value?.job_type_name ?? 'No Data Found'}',
                                                                            style:
                                                                                TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                          ),

                                                                          SizedBox(
                                                                            width:
                                                                                130,
                                                                          ),
                                                                          CustomRichText(
                                                                              title: 'SOP: '),
                                                                          SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),

                                                                          SizedBox(
                                                                            width:
                                                                                200,
                                                                            child:
                                                                                Text(
                                                                              '${controller.viewPermitDetailsModel.value?.sop_type_name ?? 'No Data Found'}',
                                                                              style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                            ),
                                                                          ),
                                                                          // Checkbox(
                                                                          //   value: controller
                                                                          //       .isCheckedLoto
                                                                          //       .value,
                                                                          //   onChanged:
                                                                          //       (value) {},
                                                                          // ),
                                                                          SizedBox(
                                                                            width:
                                                                                160,
                                                                          ),
                                                                          CustomRichText(
                                                                              title: 'JSA: '),
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
                                                                        height:
                                                                            30,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                              height: 30,
                                                                              child: CustomElevatedButton(
                                                                                backgroundColor: ColorValues.navyBlueColor,
                                                                                text: "View SOP",
                                                                                onPressed: () {
                                                                                  // controller.createNewPermit();
                                                                                  // Get.dialog<void>(ViewJSADialog());
                                                                                },
                                                                              )),
                                                                          SizedBox(
                                                                            width:
                                                                                150,
                                                                          ),
                                                                          Container(
                                                                              height: 30,
                                                                              child: CustomElevatedButton(
                                                                                backgroundColor: ColorValues.navyBlueColor,
                                                                                text: "View JSA",
                                                                                onPressed: () {
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.3,
                                                    child: Container(
                                                      height: 150,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    .3)),
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 1100,
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            CustomAppBar(
                                                              title:
                                                                  'All Files Upload'
                                                                      .tr,
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
                                                                    Text(
                                                                        'Name'),
                                                                    Dimens
                                                                        .boxWidth20,
                                                                    Text(
                                                                        'Upload Progress'),
                                                                    Dimens
                                                                        .boxWidth20,
                                                                    Text(
                                                                        'Status'),
                                                                    Dimens
                                                                        .boxWidth20,
                                                                    Text(
                                                                        'Description'),
                                                                    Dimens
                                                                        .boxWidth20,
                                                                    Text(
                                                                        'Remove'),
                                                                    Dimens
                                                                        .boxWidth20,
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  thickness: 2,
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
                                                    height: 10,
                                                  ),

                                                  ///Permit History
                                                  Container(
                                                    margin: Dimens.edgeInsets20,
                                                    height: 300,
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
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "Permit History ",
                                                                style: Styles
                                                                    .blue700,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          color: ColorValues
                                                              .greyLightColour,
                                                        ),
                                                        Expanded(
                                                          child:
                                                              ScrollableTableView(
                                                            columns: [
                                                              "Time Stamp",
                                                              "Posted By",
                                                              "Comment",
                                                              "Location",
                                                              "Status",
                                                            ].map((column) {
                                                              return TableViewColumn(
                                                                label: column,
                                                                minWidth:
                                                                    Get.width *
                                                                        0.15,
                                                              );
                                                            }).toList(),
                                                            rows: [
                                                              ...List.generate(
                                                                controller
                                                                        .historyList
                                                                        ?.length ??
                                                                    0,
                                                                (index) {
                                                                  var getHistoryListDetails =
                                                                      controller
                                                                              .historyList?[
                                                                          index];
                                                                  return [
                                                                    '${getHistoryListDetails?.createdAt}',
                                                                    '${getHistoryListDetails?.createdByName ?? ''}',
                                                                    '${getHistoryListDetails?.comment ?? ''}',
                                                                    '--',
                                                                    '${getHistoryListDetails?.status_name ?? ''}',
                                                                  ];
                                                                },
                                                              ),
                                                              // [
                                                            ].map((record) {
                                                              return TableViewRow(
                                                                height: 90,
                                                                cells: record
                                                                    .map(
                                                                        (value) {
                                                                  return TableViewCell(
                                                                    child: Text(
                                                                        value),
                                                                  );
                                                                }).toList(),
                                                              );
                                                            }).toList(),
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

                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          CustomRichText(
                                                              title:
                                                                  'Requested By: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Issued By: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Approved By: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Closed By: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Cancelled By: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          SizedBox(
                                                            width: 100,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.issuedByName}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          SizedBox(
                                                            width: 100,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.issuedByName}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          SizedBox(
                                                            width: 100,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.approvedByName}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          SizedBox(
                                                            width: 100,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.closedByName}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 100,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.cancelRequestByName ?? ''}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 70,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          CustomRichText(
                                                              title:
                                                                  'Date / Time: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Date / Time: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Date / Time: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Date / Time: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Date / Time: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          SizedBox(
                                                            width: 200,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.issue_at}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          SizedBox(
                                                            width: 200,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.issue_at}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          SizedBox(
                                                            width: 200,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.approve_at}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          SizedBox(
                                                            width: 200,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.close_at}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          SizedBox(
                                                            width: 200,
                                                            child: Text(
                                                              '${controller.viewPermitDetailsModel.value?.cancel_at ?? ''}',
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 40,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          CustomRichText(
                                                              title:
                                                                  'Signature: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Signature: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Signature: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Signature: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Signature: '),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 90,
                                                  ),
                                                  SizedBox(
                                                    height: 50,
                                                  ),
                                                  ////
                                                ]),
                                          );
                                        }
                                      }())
                                      //
                                      ),
                                ),
                              ),
                            ),
                            // Expanded(child: NewPermitMobile()),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.19,
              ),
              Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 19, horizontal: 30),

                    foregroundColor: Colors.white,
                    backgroundColor:
                        Color.fromARGB(255, 5, 92, 163), //  foreground
                  ),
                  onPressed: () {
                    controller.printScreen();
                  },
                  icon: Icon(Icons.print), //icon data for elevated button
                  label: Text("Print"), //label text
                  // style: ButtonStyle( backgroundColor:Color(value)),
                ),
              ),

              ///Printing functionality
              // Container(
              //   height: 35,
              //   child: CustomElevatedButton(
              //     icon: Icons.print_outlined,
              //     backgroundColor: ColorValues.appDarkBlueColor,
              //     text: "Print",
              //     onPressed: () {
              //       controller.printScreen();
              //     },
              //   ),
              // ),
              SizedBox(
                width: 10,
              ),
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
              varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 3 && e.issue == 1)
                              .length >
                          0 &&
                      controller.viewPermitDetailsModel.value?.ptwStatus == 121
                      ||
                      controller.viewPermitDetailsModel.value?.ptwStatus == 122
                      ||
                      controller.viewPermitDetailsModel.value?.ptwStatus == 124

                  ? Container(
                      height: 45,
                      child: CustomElevatedButton(
                        backgroundColor: Colors.green,
                        text: "Issue",
                        icon: Icons.check,
                        onPressed: () {
                          // controller
                          //     .createNewPermit();
                          Get.dialog(PermitIssueDialog(
                              permitId:
                                  '${controller.viewPermitDetailsModel.value?.permitNo}'));
                        },
                      ))
                  : Container(),
              SizedBox(
                width: 10,
              ),

              ///Approve Button
              varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 3 && e.approve == 1)
                              .length >
                          0 &&
                      controller.viewPermitDetailsModel.value?.ptwStatus == 123
                      ||
                      controller.viewPermitDetailsModel.value?.ptwStatus == 133

                  ? Container(
                      height: 45,
                      child: CustomElevatedButton(
                        backgroundColor: ColorValues.purpleColor,
                        text: "Approve",
                        icon: Icons.add,
                        onPressed: () {
                          // controller
                          //     .createNewPermit();
                          Get.dialog(PermitApprovedDialog(
                              permitId:
                                  '${controller.viewPermitDetailsModel.value?.permitNo}',
                              ptwStatus:
                                  '${controller.viewPermitDetailsModel.value?.ptwStatus}'));
                        },
                      ))
                  : Container(),
              SizedBox(
                width: 10,
              ),

              ///Reject Button
              varUserAccessModel.value.access_list!
                                  .where(
                                      (e) => e.feature_id == 3 && e.issue == 1)
                                  .length >
                              0 &&
                          controller.viewPermitDetailsModel.value?.ptwStatus ==
                              121 ||
                      varUserAccessModel.value.access_list!
                                  .where((e) =>
                                      e.feature_id == 3 && e.approve == 1)
                                  .length >
                              0 &&
                          controller.viewPermitDetailsModel.value?.ptwStatus ==
                              123
                  ? Container(
                      height: 45,
                      child: CustomElevatedButton(
                        backgroundColor: Colors.red,
                        text: "Reject",
                        icon: Icons.close,
                        onPressed: () {
                          // controller
                          //     .createNewPermit();
                          Get.dialog(PermitRejectDialog(
                              permitId:
                                  '${controller.viewPermitDetailsModel.value?.permitNo}'));
                        },
                      ))
                  : Container(),
              SizedBox(
                width: 10,
              ),

              ///Permit cancel by Issuer
              varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 3 && e.issue == 1)
                              .length >
                          0 &&
                      controller.viewPermitDetailsModel.value?.ptwStatus == 121
              ?Container(
                      height: 45,
                      child: CustomElevatedButton(
                        backgroundColor: ColorValues.appRedColor,
                        text: "Cancel",
                        icon: Icons.close,
                        onPressed: () {
                          // controller
                          //     .createNewPermit();
                          Get.dialog(PermitCancelByIssuerDialog(
                              permitId:
                                  '${controller.viewPermitDetailsModel.value?.permitNo}'));
                        },
                      ))
                      :
                      Container(),

              /// Permit Cancel By approver & Permit Request
              varUserAccessModel.value.access_list!
                              .where((e) => e.feature_id == 3 && e.approve == 1)
                              .length >
                          0 &&
                      controller.viewPermitDetailsModel.value?.ptwStatus == 123
                      ||
                      controller.viewPermitDetailsModel.value?.ptwStatus == 130

              ?Container(
                      height: 45,
                      child: CustomElevatedButton(
                        backgroundColor: ColorValues.appRedColor,
                        text: "${controller.viewPermitDetailsModel.value?.ptwStatus == 123 ? 'Cancel By Approver' : 'Cancel Request'}",
                        icon: Icons.close,
                        onPressed: () {
                          // controller
                          //     .createNewPermit();
                          Get.dialog(PermitCancelByApproverDialog(
                              permitId:
                                  '${controller.viewPermitDetailsModel.value?.permitNo}',
                              ptwStatus: '${controller.viewPermitDetailsModel.value?.ptwStatus}',));
                        },
                      ))
                      :
                      Container(),
              // varUserAccessModel.value.access_list!
              //                 .where((e) => e.feature_id == 3 && e.approve == 1)
              //                 .length >
              //             0 &&
              //         controller.viewPermitDetailsModel.value?.ptwStatus == 133
              // ?TableActionButton(
              //   color: ColorValues.appDarkBlueColor,
              //   icon: Icons.expand_outlined,
              //   label: 'Extend Approve',
              //   onPress: () {
                  
              //     // Get.dialog(PermitExtendDialog(
              //     //     permitId:
              //     //         _newPermitList[0]));
              //   },
              // )
              // : Container()
            ],
          ),
        ));
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
                // focusedErrorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : InputBorder.none,
                // errorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : null,
                // errorText: controller.isJobTitleInvalid.value
                //     ? "Required field"
                //     : null,
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
                // focusedErrorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : InputBorder.none,
                // errorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : null,
                // errorText: controller.isJobTitleInvalid.value
                //     ? "Required field"
                //     : null,
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

  Widget _buildStartValidTillDateField_web(
    BuildContext context,
    int position,
  ) {
    return Column(//
        children: [
      // Align(
      //   alignment: Alignment.topLeft,
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 385),
      //     child: RichText(
      //       text: TextSpan(
      //           text: position == 0 ? 'Start Date: ' : 'Valid Till: ',
      //           style: Styles.blackBold16, children: []),
      //     ),
      //   ),
      // ),
      // Align(
      //     alignment: Alignment.topLeft,
      //     child: Padding(
      //       padding: const EdgeInsets.only(right: 385),
      //       child: CustomRichText(
      //         title: position == 0 ? '$title1' : '$title2',
      //       ),
      //     )),
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
            width: MediaQuery.of(context).size.width / 3.7,
            child: TextField(
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
                // focusedErrorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : InputBorder.none,
                // errorBorder:
                //     controller.isJobTitleInvalid.value
                //         ? OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.circular(5),
                //             borderSide: BorderSide(
                //               color: ColorsValue.redColorDark,
                //             ),
                //           )
                //         : null,
                // errorText: controller.isJobTitleInvalid.value
                //     ? "Required field"
                //     : null,
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

//Start Date and valid Till
  Future pickDateTime_web(BuildContext context, int position) async {
    var dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
    final date = await pickDate_web(context, 0);
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
    position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value = dateTime;
    position == 0
        ? controller.startDateTimeCtrlr
        : controller.validTillTimeCtrlr
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: position == 0
              ? controller.startDateTimeCtrlr.text.length
              : controller.validTillTimeCtrlr.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate_web(BuildContext context, int position) async {
    DateTime? dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
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

  // Widget _buildPermitDescriptionField_web(BuildContext context) {
  //   return Column(//
  //       children: [
  //     // Align(
  //     //   alignment: Alignment.centerLeft,
  //     //   child: Padding(
  //     //     padding: const EdgeInsets.only(left: 10),
  //     //     child: RichText(
  //     //       text: TextSpan(
  //     //           text: 'Permit Description: ',
  //     //           style: Styles.blackBold16,
  //     //           children: [
  //     //             TextSpan(
  //     //               text: '*',
  //     //               style: TextStyle(
  //     //                 color: ColorValues.orangeColor,
  //     //                 fontWeight: FontWeight.bold,
  //     //               ),
  //     //             ),
  //     //           ]),
  //     //     ),
  //     //   ),
  //     // ),
  //     Dimens.boxHeight5,
  //     Padding(
  //       padding: const EdgeInsets.only(left: 1),
  //       child: Container(
  //         width: MediaQuery.of(context).size.width / 1.45,
  //         decoration: BoxDecoration(
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.black26,
  //               offset: const Offset(
  //                 5.0,
  //                 5.0,
  //               ),
  //               blurRadius: 5.0,
  //               spreadRadius: 1.0,
  //             ),
  //             BoxShadow(
  //               color: ColorValues.whiteColor,
  //               offset: const Offset(0.0, 0.0),
  //               blurRadius: 0.0,
  //               spreadRadius: 0.0,
  //             ),
  //           ],
  //           color: ColorValues.whiteColor,
  //           borderRadius: BorderRadius.circular(5),
  //         ),
  //         child: SizedBox(
  //           width: MediaQuery.of(context).size.width / 1.4,
  //           child: TextField(
  //             readOnly: true,

  //             // controller: controller.jobDescriptionCtrlr,
  //             keyboardType: TextInputType.multiline,
  //             maxLines: 1,
  //             autofocus: false,
  //             decoration: InputDecoration(
  //               fillColor: ColorValues.whiteColor,
  //               filled: true,
  //               hintText: 'Inverter Failure',
  //               hintStyle: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
  //               contentPadding: Dimens.edgeInsets05_10,
  //               border: InputBorder.none,
  //               enabledBorder: InputBorder.none,
  //               focusedBorder: InputBorder.none,
  //               focusedErrorBorder: controller.isJobDescriptionInvalid.value
  //                   ? OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(5),
  //                       borderSide: BorderSide(
  //                         color: ColorValues.redColorDark,
  //                       ),
  //                     )
  //                   : InputBorder.none,
  //               errorBorder: controller.isJobDescriptionInvalid.value
  //                   ? OutlineInputBorder(
  //                       borderRadius: BorderRadius.circular(5),
  //                       borderSide: BorderSide(
  //                         color: ColorValues.redColorDark,
  //                       ),
  //                     )
  //                   : null,
  //               errorText: controller.isJobDescriptionInvalid.value
  //                   ? "Required field"
  //                   : null,
  //             ),
  //             onChanged: (value) {
  //               if (value.trim().length > 3) {
  //                 controller.isJobDescriptionInvalid.value = false;
  //               } else {
  //                 controller.isJobDescriptionInvalid.value = true;
  //               }
  //             },
  //           ),
  //         ),
  //       ),
  //     ),
  //     Dimens.boxHeight10,
  //   ]);
  // }

  Widget _buildTitleTextField_web(BuildContext context) {
    return Column(//
        children: [
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
    return Container(
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
    );
  }
}
