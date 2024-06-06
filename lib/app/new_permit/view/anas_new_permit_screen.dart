import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/view_sop_dialog.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class NewPermitScreen extends GetView<NewPermitController> {
  NewPermitScreen({super.key});
  bool valuefirst = false;
  final NewPermitController _controller = Get.find();

  ///
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
  final HomeController homecontroller = Get.find();

  ///
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context)
            ? AppBar(
                title: HeaderWidget(),
                automaticallyImplyLeading: false,
                elevation: 0,
                toolbarHeight: 60,
              )
            : null,
        body: Obx(
          () => Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 450),
                margin: EdgeInsets.only(
                    left: homecontroller.menuButton.value ? 250.0 : 70.0),
                // width: MediaQuery.of(context).size.width  ,
                // width: 1500,
                // height: MediaQuery.of(context).size.height,
                child: Row(
                  children: [
                    (Responsive.isMobile(context) ||
                            Responsive.isTablet(context))
                        ? Dimens.box0
                        : Container(),
                    Obx(
                      () => Expanded(
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (Responsive.isMobile(context))
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        //  Text('Select Plantss:'),
                                        // DropdownWebWidget(
                                        //   // controller: controller,
                                        //   dropdownList: controller.facilityList,
                                        //   isValueSelected: controller.isFacilitySelected.value,
                                        //   selectedValue: controller.selectedFacility.value,
                                        //   onValueChanged: controller.onValueChanged,
                                        // )
                                        Obx(
                                          () => Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Card(
                                                shadowColor:
                                                    ColorValues.greyColor,
                                                elevation: 1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  child: DropdownWebWidget(
                                                    dropdownList:
                                                        controller.facilityList,
                                                    isValueSelected: controller
                                                        .isFacilitySelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedFacility.value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                  // DropdownButtonHideUnderline(
                                                  //   child: DropdownButton(
                                                  //     isExpanded: true,
                                                  //     value: controller.selectedFacility.value,
                                                  //     icon: const Icon(
                                                  //         Icons.keyboard_arrow_down_outlined),
                                                  //     elevation: 7,
                                                  //     style: const TextStyle(color: Colors.black),
                                                  //     onChanged: (String? selectedValue) {
                                                  //       controller.isFacilitySelected.value =
                                                  //           true;
                                                  //       controller.selectedFacility.value =
                                                  //           selectedValue ?? '';
                                                  //     },
                                                  //     items: controller.facilityList
                                                  //         .map<DropdownMenuItem<String>>(
                                                  //             (facility) {
                                                  //       return DropdownMenuItem<String>(
                                                  //         value: facility?.name ?? '',
                                                  //         child: Text(facility?.name ?? ''),
                                                  //       );
                                                  //     }).toList(),
                                                  //   ),
                                                  // ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                /// CARD
                                Expanded(
                                  child: Container(
                                    // width: MediaQuery.of(context).size.width,
                                    //  height: MediaQuery.of(context).size.height,
                                    child: Card(
                                      color: Color.fromARGB(255, 245, 248, 250),
                                      elevation: 20,
                                      shadowColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                          padding: Dimens.edgeInsets0,
                                          child: (() {
                                            if (Responsive.isMobile(context)) {
                                              return SingleChildScrollView(
                                                child: Column(
                                                    ////
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 140),
                                                        child: Text(
                                                          'REQUEST A PERMIT TO WORK',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            CustomRichText(
                                                                title:
                                                                    'Block/Plot: '),
                                                            // SizedBox(
                                                            //   width: 5,
                                                            // ),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1.6,
                                                              child: Obx(
                                                                () =>
                                                                    DropdownWebWidget(
                                                                  dropdownList:
                                                                      controller
                                                                          .blockList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isBlockSelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedBlock
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
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          CustomRichText(
                                                              title:
                                                                  'Type\nof permit: '),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.6,
                                                            child:
                                                                DropdownWebWidget(
                                                              dropdownList:
                                                                  controller
                                                                      .typePermitList,
                                                              isValueSelected:
                                                                  controller
                                                                      .isTypePermitSelected
                                                                      .value,
                                                              selectedValue:
                                                                  controller
                                                                      .selectedTypePermit
                                                                      .value,
                                                              onValueChanged:
                                                                  controller
                                                                      .onValueChanged,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          SizedBox(
                                                            width: 100,
                                                            child: CustomRichText(
                                                                title:
                                                                    'Equipment Categories: '),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                1.6,
                                                            child:
                                                                CustomMultiSelectDialogField(
                                                              buttonText:
                                                                  'Equipment Categories',
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
                                                                    'Equipment list ${controller.equipmentCategoryList}')
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(
                                                        height: 20,
                                                      ),

                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 13),
                                                            child: CustomRichText(
                                                                title:
                                                                    'Start Date: '),
                                                          )),
                                                      _buildStartValidTillDateField_web(
                                                        context,
                                                        0,
                                                      ),
                                                      // SizedBox(
                                                      //   width: 125,
                                                      // ),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 13),
                                                            child: CustomRichText(
                                                                title:
                                                                    'Valid Till: '),
                                                          )),
                                                      _buildStartValidTillDateField_web(
                                                          context, 1),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 13),
                                                            child: CustomRichText(
                                                                title:
                                                                    'Title: '),
                                                          )),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      _buildTitleTextField_web(
                                                          context),

                                                      _buildPermitDescriptionField_mobile(
                                                          context),
                                                      Row(
                                                        children: [
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            13),
                                                                child: CustomRichText(
                                                                    title:
                                                                        'Isolation Required: '),
                                                              )),
                                                          Switch(
                                                            value: _controller
                                                                .isToggleOn
                                                                .value,
                                                            onChanged: (value) {
                                                              _controller
                                                                  .toggle();
                                                            },
                                                            activeColor:
                                                                Colors.white,
                                                            activeTrackColor:
                                                                Colors.green,
                                                            inactiveThumbColor:
                                                                Colors.white,
                                                            inactiveTrackColor:
                                                                Colors.red,
                                                          ),
                                                        ],
                                                      ),
                                                      controller.isToggleOn ==
                                                              true
                                                          ? Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 13,
                                                                ),
                                                                SizedBox(
                                                                  width: 100,
                                                                  child: CustomRichText(
                                                                      title:
                                                                          'Equipment Isolation '),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      1.7,
                                                                  child:
                                                                      CustomMultiSelectDialogField(
                                                                    buttonText:
                                                                        'Equipment Isolation',
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
                                                                            equipmentIsolation?.id,
                                                                            equipmentIsolation?.name ??
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
                                                                )
                                                              ],
                                                            )
                                                          : Text(
                                                              'No Isolation Equipment'),

                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      controller.isToggleOn ==
                                                              true
                                                          ?
                                                          //Loto apply
                                                          SizedBox(
                                                              height: ((controller
                                                                          .filteredEquipmentNameList
                                                                          .length) *
                                                                      30) +
                                                                  250,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  1.0,
                                                              child: Center(
                                                                child:
                                                                    Container(
                                                                  margin: Dimens
                                                                      .edgeInsets16,
                                                                  height: Get
                                                                      .height,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(.3)),
                                                                  ),
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        1100,
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      CustomAppBar(
                                                                        title: ''
                                                                            .tr,
                                                                        action:
                                                                            ActionButton(
                                                                          label:
                                                                              'Add New',
                                                                          icon:
                                                                              Icons.add,
                                                                          onPressed:
                                                                              () {
                                                                            //  showEquipmentNameAlertBox();

                                                                            Get.dialog<void>(showEquipmentNameAlertBox());
                                                                          },
                                                                          color:
                                                                              Colors.green,
                                                                        ),
                                                                      ),
                                                                      Dimens
                                                                          .boxHeight10,
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
                                                                              SizedBox(
                                                                                width: MediaQuery.of(context).size.height * 2,
                                                                                child: Container(
                                                                                  height: ((controller.filteredEquipmentNameList.length) * 30) + 250,
                                                                                  child: Column(
                                                                                      //
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: //
                                                                                              Theme(
                                                                                            data: ThemeData(scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all<Color>(Colors.transparent))),
                                                                                            child: ScrollableTableView(
                                                                                              // paginationController: controller.equipmentNamepaginationController,
                                                                                              columns: [
                                                                                                'name',
                                                                                                'serialNumber',
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
                                                                                                  label: column == "name"
                                                                                                      ? "Loto Applied On"
                                                                                                      : column == "serialNumber"
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
                                                                                                );
                                                                                              }).toList(),
                                                                                              rows: //
                                                                                                  [
                                                                                                ...List.generate(
                                                                                                  ///controller.selectedEquipmentNameIdList
                                                                                                  controller.filteredEquipmentNameList.length,

                                                                                                  (index) {
                                                                                                    var inventoryEquipmentName = controller.filteredEquipmentNameList[index];

                                                                                                    //_jobId = jobDetails?.id;

                                                                                                    controller.id.value = inventoryEquipmentName?.id ?? 0;
                                                                                                    print('Equipment Isss5:${controller.id.value}');
                                                                                                    return [
                                                                                                      '${inventoryEquipmentName?.name ?? ''}',
                                                                                                      '${inventoryEquipmentName?.serialNumber ?? ''}',
                                                                                                      // '${newPermitDetails?.approved_datetime}',
                                                                                                      // '${newPermitDetails?.equipment}',
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
                                                                                                                    message: 'Delete',
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
                                                                                        ),

                                                                                        /// PAGINATION
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
                                                                                width: MediaQuery.of(context).size.width / 1.2,
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
                                                            )
                                                          : Text(
                                                              'Nothing to show !!'),

                                                      ///Safety measures
                                                      SizedBox(
                                                        height: 230,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.0,
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
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        1,
                                                                    child:
                                                                        CustomAppBar(
                                                                      title:
                                                                          'Following safety Measures taken to \n carry out the work',
                                                                    ),
                                                                  ),
                                                                  Dimens
                                                                      .boxHeight10,
                                                                  //   controller.permitId == null
                                                                  //  ?
                                                                  Wrap(
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .start,
                                                                    spacing: 10,
                                                                    children: []
                                                                      ..addAll(controller
                                                                          .safetyMeasureList
                                                                          .map((element) =>
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      checkBoxMethod(1),
                                                                                      Text("${element.name}")
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ))),
                                                                  )
                                                                  // :Wrap(
                                                                  //   alignment: WrapAlignment.start,
                                                                  //   spacing: 100,
                                                                  //   children: []..addAll(controller.safetyList!.map((element) => Column(
                                                                  //   mainAxisSize: MainAxisSize.min,
                                                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                                                  //    children: [
                                                                  //             checkBoxMethod(
                                                                  //                 1),
                                                                  //                 Text("${element?.saftyQuestionName}")
                                                                  //                 ],))),),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),

                                                      ///Team Deploying For Mobile
                                                      SizedBox(
                                                        height: 230,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.0,
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
                                                              child: Column(
                                                                  children: [
                                                                    CustomAppBar(
                                                                      title:
                                                                          'Team Deploying\nto carry out job'
                                                                              .tr,
                                                                      action:
                                                                          SizedBox(
                                                                        width: MediaQuery.of(context).size.width /
                                                                            2.60,
                                                                        child:
                                                                            ActionButton(
                                                                          label:
                                                                              'Add Employee',
                                                                          icon:
                                                                              Icons.add,
                                                                          onPressed:
                                                                              () {
                                                                            Get.dialog<void>(AddEmployeeListAlertBox());
                                                                          },
                                                                          color:
                                                                              Colors.green,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    // Dimens.boxHeight10,
                                                                    Wrap(
                                                                        children: [
                                                                          Column(
                                                                              children: [
                                                                                // Row(
                                                                                //   mainAxisAlignment:
                                                                                //       MainAxisAlignment
                                                                                //           .spaceEvenly,
                                                                                //   children: [
                                                                                //     Text(
                                                                                //         'Name'),
                                                                                //     Text(
                                                                                //         'Designation'),
                                                                                //     Text(
                                                                                //         'Responsibility'),
                                                                                //     Text(
                                                                                //         'Competeness'),
                                                                                //     Text(
                                                                                //         'Remove'),
                                                                                //   ],
                                                                                // ),

                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.height * 1.5,
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
                                                                                                'name',
                                                                                                'gender',
                                                                                                'Contact No.',
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
                                                                                                  minWidth: Get.width * 0.3,
                                                                                                  label: column == "name"
                                                                                                      ? "Employee Name"
                                                                                                      : column == "gender"
                                                                                                          ? "Gender"
                                                                                                          : column == "Contact No."
                                                                                                              ? "Contact No."
                                                                                                              //         : column == "equipment"
                                                                                                              //             ? "Equipment" //
                                                                                                              //             : column == "workingAreaId"
                                                                                                              //                 ? "Working Area Id"
                                                                                                              //                 : column == "description"
                                                                                                              //                     ? "Description"
                                                                                                              //                     : column == "permitTypeName"
                                                                                                              //                         ? "Work Type"

                                                                                                              : "Action",
                                                                                                );
                                                                                              }).toList(),
                                                                                              rows: //
                                                                                                  [
                                                                                                ...List.generate(
                                                                                                  ///controller.selectedEquipmentNameIdList
                                                                                                  controller.filteredEmployeeNameList.length,

                                                                                                  (index) {
                                                                                                    var employeeNameDetails = controller.filteredEmployeeNameList[index];

                                                                                                    //_jobId = jobDetails?.id;

                                                                                                    controller.id.value = employeeNameDetails?.id ?? 0;
                                                                                                    print('Employee Idss5:${controller.id.value}');
                                                                                                    return [
                                                                                                      '${employeeNameDetails?.name ?? ''}',
                                                                                                      '${employeeNameDetails?.gender ?? ''}',
                                                                                                      '${employeeNameDetails?.mobileNumber ?? ''}',
                                                                                                      // '${newPermitDetails?.approved_datetime}',
                                                                                                      // '${newPermitDetails?.equipment}',
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
                                                                                                            ? Wrap(children: [
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
                                                                                                              ])
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
                                                                              ])
                                                                        ]),
                                                                  ]),
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                      //Tool box talk For Mobile
                                                      SizedBox(
                                                        height: 480,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.0,
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
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Align(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(left: 13),
                                                                                    child: CustomRichText(title: 'Job Type: '),
                                                                                  )),
                                                                              SizedBox(
                                                                                width: MediaQuery.of(context).size.width / 1.3,
                                                                                child: Obx(
                                                                                  () => DropdownWebWidget(
                                                                                    dropdownList: controller.jobTypeList,
                                                                                    isValueSelected: controller.isJobTypeListSelected.value,
                                                                                    selectedValue: controller.selectedJobType.value,
                                                                                    onValueChanged: controller.onValueChanged,
                                                                                  ),
                                                                                ),

                                                                                // LoginCustomTextfield(),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              Align(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(left: 13),
                                                                                    child: CustomRichText(title: 'SOP: '),
                                                                                  )),
                                                                              SizedBox(
                                                                                width: MediaQuery.of(context).size.width / 1.3,
                                                                                child: Obx(
                                                                                  () => DropdownWebWidget(
                                                                                    dropdownList: controller.sopPermitList,
                                                                                    isValueSelected: controller.isSopPermitListSelected.value,
                                                                                    selectedValue: controller.selectedSopPermit.value,
                                                                                    onValueChanged: controller.onValueChanged,
                                                                                  ),
                                                                                ),
                                                                                // LoginCustomTextfield(),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                40,
                                                                          ),
                                                                          Center(
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Container(
                                                                                    height: 30,
                                                                                    width: 150,
                                                                                    child: CustomElevatedButton(
                                                                                      backgroundColor: ColorValues.navyBlueColor,
                                                                                      text: "View JSA",
                                                                                      onPressed: () {
                                                                                        // controller.createNewPermit();
                                                                                        Get.dialog<void>(ViewJSADialog());
                                                                                      },
                                                                                    )),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Container(
                                                                                    height: 30,
                                                                                    width: 150,
                                                                                    child: CustomElevatedButton(
                                                                                      backgroundColor: ColorValues.navyBlueColor,
                                                                                      text: "View SOP",
                                                                                      onPressed: () {
                                                                                        Get.dialog<void>(ViewSOPDialog());
                                                                                        // controller.createNewPermit();
                                                                                      },
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),

                                                                          Column(
                                                                            children: [
                                                                              SizedBox(
                                                                                width: 40,
                                                                              ),
                                                                              Align(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(left: 13),
                                                                                    child: CustomRichText(title: 'Permit Issuer: '),
                                                                                  )),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              SizedBox(
                                                                                width: MediaQuery.of(context).size.width / 1.3,
                                                                                child: Obx(
                                                                                  () => DropdownWebWidget(
                                                                                    dropdownList: controller.permitIssuerList,
                                                                                    isValueSelected: controller.isPermitIssuerListSelected.value,
                                                                                    selectedValue: controller.selectedPermitIssuerLists.value,
                                                                                    onValueChanged: controller.onValueChanged,
                                                                                  ),
                                                                                ),
                                                                                // CustomMultiSelectDialogField(
                                                                                //   buttonText: 'Permit Issuer',
                                                                                //   title: 'Select Permit Issuer',
                                                                                //   initialValue:
                                                                                //       (controller.selectedPermitIssuerList.isNotEmpty)
                                                                                //           ? controller.selectedPermitIssuerIdList
                                                                                //           : [],
                                                                                //   items: controller.permitIssuerList
                                                                                //       .map(
                                                                                //         (permitIssuer) => MultiSelectItem(
                                                                                //           permitIssuer?.id,
                                                                                //           permitIssuer?.name ?? '',
                                                                                //         ),
                                                                                //       )
                                                                                //       .toList(),
                                                                                //   onConfirm: (selectedOptionsList) => {
                                                                                //     controller.permitIssuerSelected(selectedOptionsList),
                                                                                //     print(
                                                                                //         'Permit Issuer list50: ${controller.selectedEmployeeNameIdList}')
                                                                                //   },
                                                                                // ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Align(
                                                                                  alignment: Alignment.centerLeft,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(left: 13),
                                                                                    child: CustomRichText(title: 'Permit Approver: '),
                                                                                  )),
                                                                              SizedBox(
                                                                                width: 23,
                                                                              ),
                                                                              SizedBox(
                                                                                width: MediaQuery.of(context).size.width / 1.3,
                                                                                child: Obx(
                                                                                  () => DropdownWebWidget(
                                                                                    dropdownList: controller.permitApproverList,
                                                                                    isValueSelected: controller.isPermitApproverListSelected.value,
                                                                                    selectedValue: controller.selectedPermitApproverLists.value,
                                                                                    onValueChanged: controller.onValueChanged,
                                                                                  ),
                                                                                ),
                                                                                // LoginCustomTextfield(),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                40,
                                                                          ),
                                                                          //Button

                                                                          SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 1.24,
                                                                            child:
                                                                                Wrap(
                                                                              children: [
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        // DropFileWidget(),

                                                                                        ////
                                                                                        Container(
                                                                                          height: 100,
                                                                                          width: MediaQuery.of(context).size.width / 1.24,
                                                                                          decoration: BoxDecoration(
                                                                                            border: Border.all(color: Colors.grey.withOpacity(.3)),
                                                                                          ),
                                                                                          constraints: BoxConstraints(
                                                                                            maxWidth: 1100,
                                                                                          ),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              children: [
                                                                                                CustomAppBar(
                                                                                                  title: '#'.tr,
                                                                                                  action: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'Name',
                                                                                                        style: TextStyle(fontSize: 9),
                                                                                                      ),
                                                                                                      Dimens.boxWidth5,
                                                                                                      Text('Upload Progress', style: TextStyle(fontSize: 9)),
                                                                                                      Dimens.boxWidth5,
                                                                                                      Text('Status', style: TextStyle(fontSize: 9)),
                                                                                                      Dimens.boxWidth5,
                                                                                                      Text('Description', style: TextStyle(fontSize: 9)),
                                                                                                      Dimens.boxWidth5,
                                                                                                      Text('Remove', style: TextStyle(fontSize: 9)),
                                                                                                      Dimens.boxWidth5,
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Dimens.boxHeight10,
                                                                                                Wrap(
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      children: [
                                                                                                        SizedBox(
                                                                                                          width: 10,
                                                                                                        ),
                                                                                                        Text('Files list will appear heres', style: TextStyle(fontSize: 9)),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.only(left: 10, top: 30),
                                                                                      child: CircleAvatar(
                                                                                        backgroundColor: Color.fromARGB(255, 160, 160, 160),
                                                                                        radius: 70,
                                                                                        child: Text(
                                                                                          'Drop Files Here',
                                                                                          style: Styles.white13,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
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

                                                      controller.permitId
                                                                  .value <=
                                                              0
                                                          ? Center(
                                                              child: Container(
                                                                  height: 45,
                                                                  child:
                                                                      CustomElevatedButton(
                                                                    backgroundColor:
                                                                        ColorValues
                                                                            .appGreenColor,
                                                                    text:
                                                                        "Submit",
                                                                    onPressed:
                                                                        () {
                                                                      controller.isCheckedJSA.value == true &&
                                                                              controller.isCheckedSOP.value ==
                                                                                  true
                                                                          ? controller
                                                                              .createNewPermit()
                                                                          : Get.dialog<void>(
                                                                              checkboxAlertBox());
                                                                    },
                                                                  )),
                                                            )
                                                          : Center(
                                                              child: Container(
                                                                  height: 45,
                                                                  child:
                                                                      CustomElevatedButton(
                                                                    backgroundColor:
                                                                        ColorValues
                                                                            .appDarkBlueColor,
                                                                    text:
                                                                        "Update",
                                                                    onPressed:
                                                                        () {
                                                                      controller
                                                                          .updateNewPermit();
                                                                    },
                                                                  )),
                                                            ),

                                                      // :
                                                      // SizedBox(
                                                      //   height: 90,
                                                      // ),

                                                      // /
                                                      // / SELECT BLOCK DropDown
                                                      // _buildBlockDropdown(),

                                                      // /MULTISELECT CONTROL Equipment Categories
                                                      // _buildEquipmentCategoriesDropdown(),

                                                      // / WORK AREA (= EQUIPMENTS) DropDown
                                                      // _buildWorkAreaDropdown(),

                                                      // / WORK TYPE  DropDown
                                                      // _buildWorkTypeDropdown(),

                                                      // / TOOLS REQUIRED DropDown
                                                      // _buildToolsRequiredDropdown(),

                                                      // / ASSIGNED TO DropDown
                                                      // _buildAssignedToDropdown(),

                                                      // / JOB TITLE
                                                      // _buildJobTitleField(),

                                                      // / JOB DESCRIPTION
                                                      // _buildJobDescriptionField(),

                                                      // / BREAKDOWN TIME
                                                      // _buildBreakDownTimeField(context),

                                                      // / SAVE BUTTON
                                                      // _buildSaveJobButton(saveButtonStyle),

                                                      ///
                                                      SizedBox(
                                                        height: 50,
                                                      ),
                                                    ]),
                                              );
                                            } else if (Responsive.isDesktop(
                                                context)) {
                                              return Column(
                                                children: [
                                                  HeaderWidget(),
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
                                                        InkWell(
                                                          onTap: () {
                                                            Get.offNamed(
                                                                Routes.home);
                                                          },
                                                          child: Text(
                                                            "DASHBOARD",
                                                            style: Styles
                                                                .greyLight14,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.offAllNamed(
                                                                Routes
                                                                    .breakdown);
                                                          },
                                                          child: Text(
                                                              " / BREAKDOWN MAINTENANCE",
                                                              style: Styles
                                                                  .greyLight14),
                                                        ),
                                                        controller
                                                                    .newPermitDetailsModel
                                                                    .value
                                                                    ?.permitNo ==
                                                                null
                                                            ? Text(
                                                                " / ADD NEW PERMIT",
                                                                style: Styles
                                                                    .greyLight14)
                                                            : Text(
                                                                " / Update NEW PERMIT",
                                                                style: Styles
                                                                    .greyLight14),
                                                        Spacer(),
                                                        controller
                                                                    .newPermitDetailsModel
                                                                    .value
                                                                    ?.permitNo !=
                                                                null
                                                            ? Text(
                                                                "Permit Id: ${controller.newPermitDetailsModel.value?.permitNo}",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            : Dimens.box0,
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: ScrollConfiguration(
                                                      behavior:
                                                          ScrollConfiguration
                                                                  .of(context)
                                                              .copyWith(
                                                                  scrollbars:
                                                                      false),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            50,
                                                                        top:
                                                                            20),
                                                                child: Text(
                                                                  'REQUEST A PERMIT TO WORK',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Dimens
                                                                  .boxHeight20,
                                                              controller.pmtaskViewModel
                                                                          ?.id !=
                                                                      null
                                                                  ? Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Dimens
                                                                            .boxHeight10,
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 70),
                                                                          child:
                                                                              Text(
                                                                            'Request a Permit For a PM',
                                                                            style:
                                                                                Styles.blue700,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              top: 10,
                                                                              left: 40,
                                                                              right: 10),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'PM Task ID',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      //   controller.viewJobDetails();
                                                                                    },
                                                                                    child: Text(
                                                                                      '${int.tryParse('${controller.pmtaskViewModel?.id ?? 0}')}',
                                                                                      style: TextStyle(
                                                                                        decoration: TextDecoration.underline,
                                                                                        decorationStyle: TextDecorationStyle.solid,
                                                                                        color: Color.fromARGB(255, 5, 92, 163),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Plan Title',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Text('${controller.pmtaskViewModel?.plan_title}'),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Equipment Category',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Text('${controller.pmtaskViewModel?.category_name}'),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Frequency',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Text('${controller.pmtaskViewModel?.frequency_name}'),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Assigned To',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Text('${controller.pmtaskViewModel?.assigned_to_name}'),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  : Dimens.box0,
                                                              Dimens
                                                                  .boxHeight30,
                                                              controller.jobModel
                                                                          ?.id !=
                                                                      null
                                                                  ? Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Dimens
                                                                            .boxHeight10,
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 10),
                                                                          child:
                                                                              Text(
                                                                            'Request a Permit For a Job',
                                                                            style:
                                                                                Styles.blue700,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              top: 10,
                                                                              left: 40,
                                                                              right: 10),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Job ID',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  GestureDetector(
                                                                                    onTap: () {
                                                                                      controller.viewJobDetails();
                                                                                    },
                                                                                    child: Text(
                                                                                      '${int.tryParse('${controller.jobModel?.id ?? 0}')}',
                                                                                      style: TextStyle(
                                                                                        decoration: TextDecoration.underline,
                                                                                        decorationStyle: TextDecorationStyle.solid,
                                                                                        color: Color.fromARGB(255, 5, 92, 163),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Job Title',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Text('${controller.titleTextCtrlr.text}'),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Equipment Category',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  SizedBox(
                                                                                    // width: 100,
                                                                                    child: Column(
                                                                                      // alignment: WrapAlignment.start,
                                                                                      // spacing: 100,
                                                                                      children: []

                                                                                        ///Uncomment once Work done
                                                                                        ..addAll(controller.listJobModelCategory.map((element) => Column(
                                                                                              // mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  "${element?.equipmentCatName}",
                                                                                                ),
                                                                                                //  Text(
                                                                                                //   "${element?.equipmentCatName}",
                                                                                                // ),
                                                                                                //  Text(
                                                                                                //   "${element?.equipmentCatName}",
                                                                                                // ),
                                                                                                //  Text(
                                                                                                //   "${element?.equipmentCatName}",
                                                                                                // ),
                                                                                                //  Text(
                                                                                                //   "${element?.equipmentCatName}",
                                                                                                // ),
                                                                                              ],
                                                                                            ))),

                                                                                      ///end Uncomment
                                                                                    ),
                                                                                  )
                                                                                  // Text('${controller.selectedItem}'),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Block',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Text('${controller.blockNameTextCtrlr.text}'),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Equipment Name',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  SizedBox(
                                                                                    // width: 200,
                                                                                    child: Column(
                                                                                      // alignment: WrapAlignment.start,
                                                                                      // spacing: 100,
                                                                                      children: []

                                                                                        ///Uncomment once Work done
                                                                                        ..addAll(controller.list_working_area_name.map((element) => Column(
                                                                                              // mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  "${element?.name}",
                                                                                                ),
                                                                                                //  Text(
                                                                                                //   "${element?.workingAreaName}",
                                                                                                // ),
                                                                                                //  Text(
                                                                                                //   "${element?.workingAreaName}",
                                                                                                // ),
                                                                                                //  Text(
                                                                                                //   "${element?.workingAreaName}",
                                                                                                // ),
                                                                                                //  Text(
                                                                                                //   "${element?.workingAreaName}",
                                                                                                // ),
                                                                                              ],
                                                                                            ))),

                                                                                      ///end Uncomment
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Breakdwon Time',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Text('${controller.breakdownTimeTextCtrlr.text}'),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    'Assigned To',
                                                                                    style: TextStyle(color: Color.fromARGB(255, 5, 92, 163)),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Text('${controller.assignToTextCtrlr.text}'),
                                                                                ],
                                                                              ),
                                                                              Spacer(),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  : Dimens.box0,
                                                              Dimens
                                                                  .boxHeight30,

                                                              SizedBox(
                                                                height: 20,
                                                              ),

                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Row(
                                                                    // mainAxisAlignment:
                                                                    //     MainAxisAlignment
                                                                    //         .center,
                                                                    children: [
                                                                      Spacer(),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Dimens.boxWidth15,
                                                                              CustomRichText(title: 'Block/Plot: '),
                                                                              Dimens.boxWidth10,
                                                                              SizedBox(
                                                                                width: MediaQuery.of(context).size.width / 5,

                                                                                child: Obx(
                                                                                  () => DropdownWebWidget(
                                                                                    dropdownList: controller.blockList,
                                                                                    isValueSelected: controller.isBlockSelected.value,
                                                                                    selectedValue: controller.selectedBlock.value,
                                                                                    onValueChanged: controller.onValueChanged,
                                                                                  ),
                                                                                ),
                                                                                // LoginCustomTextfield(),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Dimens
                                                                              .boxHeight10,
                                                                          Row(
                                                                            children: [
                                                                              Dimens.boxWidth15,
                                                                              CustomRichText(title: 'Type of permit: '),
                                                                              Dimens.boxWidth10,
                                                                              SizedBox(
                                                                                width: MediaQuery.of(context).size.width / 5,
                                                                                child: Obx(
                                                                                  () => DropdownWebWidget(
                                                                                    dropdownList: controller.typePermitList,
                                                                                    isValueSelected: controller.isTypePermitSelected.value,
                                                                                    selectedValue: controller.selectedTypePermit.value,
                                                                                    onValueChanged: controller.onValueChanged,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Dimens
                                                                              .boxHeight10,
                                                                          Row(
                                                                            children: [
                                                                              Dimens.boxWidth15,
                                                                              CustomRichText(title: 'Start Date & Time: '),
                                                                              Dimens.boxWidth10,
                                                                              _buildStartValidTillDateField_web(
                                                                                context,
                                                                                0,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Dimens
                                                                              .boxHeight10,
                                                                        ],
                                                                      ),

                                                                      Spacer(),
                                                                      // Dimens.boxWidth47,
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            right:
                                                                                20),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                CustomRichText(title: 'Equipment Categories: '),
                                                                                Dimens.boxWidth10,
                                                                                controller.permitId.value > 0
                                                                                    ? SizedBox(
                                                                                        width: MediaQuery.of(context).size.width / 5,
                                                                                        child: CustomMultiSelectDialogField(
                                                                                          title: 'Select Equipment Category',
                                                                                          buttonText: 'Equipment Category',
                                                                                          initialValue: ((controller.selectedEquipmentCategoryIdList.isNotEmpty) ? controller.selectedEquipmentCategoryIdList : []),
                                                                                          items: controller.equipmentCategoryList
                                                                                              .map(
                                                                                                (equipmentCategory) => MultiSelectItem(
                                                                                                  equipmentCategory?.id,
                                                                                                  equipmentCategory?.name ?? '',
                                                                                                ),
                                                                                              )
                                                                                              .toList(),
                                                                                          onConfirm: (selectedOptionsList) => {
                                                                                            controller.equipmentCategoriesSelected(selectedOptionsList),
                                                                                            print('Equipment list ${controller.selectedEquipmentCategoryIdList}')
                                                                                          },
                                                                                        ),
                                                                                      )
                                                                                    : SizedBox(
                                                                                        width: MediaQuery.of(context).size.width / 5,
                                                                                        child: CustomMultiSelectDialogField(
                                                                                          title: 'Select Equipment Category',
                                                                                          buttonText: 'Equipment Category',
                                                                                          initialValue: (controller.selectedEquipmentCategoryIdList.isNotEmpty) ? controller.selectedEquipmentCategoryIdList : [],
                                                                                          items: controller.equipmentCategoryList
                                                                                              .map(
                                                                                                (equipmentCategory) => MultiSelectItem(
                                                                                                  equipmentCategory?.id,
                                                                                                  equipmentCategory?.name ?? '',
                                                                                                ),
                                                                                              )
                                                                                              .toList(),
                                                                                          onConfirm: (selectedOptionsList) => {
                                                                                            controller.equipmentCategoriesSelected(selectedOptionsList),
                                                                                            print('Equipment list55 ${controller.selectedEquipmentCategoryIdList}')
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                              ],
                                                                            ),
                                                                            Dimens.boxHeight30,
                                                                            Row(
                                                                              children: [
                                                                                CustomRichText(title: 'Expiry Date & Time: '),
                                                                                Dimens.boxWidth10,
                                                                                _buildStartValidTillDateField_web(context, 1),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Spacer(),
                                                                      // Padding(
                                                                      //   padding:
                                                                      //       const EdgeInsets
                                                                      //               .only(
                                                                      //           left:
                                                                      //               120),
                                                                      //   child: Column(
                                                                      //     crossAxisAlignment:
                                                                      //         CrossAxisAlignment
                                                                      //             .end,
                                                                      //     children: [
                                                                      //       Dimens
                                                                      //           .boxHeight10,
                                                                      //       // CustomRichText(title:'Block/Plot: '),
                                                                      //       Dimens
                                                                      //           .boxHeight15,
                                                                      //       // CustomRichText(title:'Type of permit: '),
                                                                      //       Dimens
                                                                      //           .boxHeight25,
                                                                      //       // CustomRichText(
                                                                      //       //     title:
                                                                      //       //         'Start Date: '),
                                                                      //     ],
                                                                      //   ),
                                                                      // ),
                                                                      // Dimens.boxWidth10,
                                                                      // Column(
                                                                      //   crossAxisAlignment:
                                                                      //       CrossAxisAlignment
                                                                      //           .start,
                                                                      //   children: [
                                                                      //     //       SizedBox(
                                                                      //     //   width: MediaQuery.of(
                                                                      //     //               context)
                                                                      //     //           .size
                                                                      //     //           .width /
                                                                      //     //       5,

                                                                      //     //   child: Obx(
                                                                      //     //     () =>
                                                                      //     //         DropdownWebWidget(
                                                                      //     //       dropdownList:
                                                                      //     //           controller
                                                                      //     //               .blockList,
                                                                      //     //       isValueSelected:
                                                                      //     //           controller
                                                                      //     //               .isBlockSelected
                                                                      //     //               .value,
                                                                      //     //       selectedValue:
                                                                      //     //           controller
                                                                      //     //               .selectedBlock
                                                                      //     //               .value,
                                                                      //     //       onValueChanged:
                                                                      //     //           controller
                                                                      //     //               .onValueChanged,
                                                                      //     //     ),
                                                                      //     //   ),
                                                                      //     //   // LoginCustomTextfield(),
                                                                      //     // ),
                                                                      //     Dimens
                                                                      //         .boxHeight10,
                                                                      //     // SizedBox(
                                                                      //     //   width: MediaQuery.of(
                                                                      //     //               context)
                                                                      //     //           .size
                                                                      //     //           .width /
                                                                      //     //       5,
                                                                      //     //   child: Obx(
                                                                      //     //     () =>
                                                                      //     //         DropdownWebWidget(
                                                                      //     //       dropdownList:
                                                                      //     //           controller
                                                                      //     //               .typePermitList,
                                                                      //     //       isValueSelected:
                                                                      //     //           controller
                                                                      //     //               .isTypePermitSelected
                                                                      //     //               .value,
                                                                      //     //       selectedValue:
                                                                      //     //           controller
                                                                      //     //               .selectedTypePermit
                                                                      //     //               .value,
                                                                      //     //       onValueChanged:
                                                                      //     //           controller
                                                                      //     //               .onValueChanged,
                                                                      //     //     ),
                                                                      //     //   ),
                                                                      //     // ),
                                                                      //     Dimens
                                                                      //         .boxHeight10,
                                                                      //     // _buildStartValidTillDateField_web(
                                                                      //     //   context,
                                                                      //     //   0,
                                                                      //     // ),
                                                                      //   ],
                                                                      // ),
                                                                      // Padding(
                                                                      //   padding:
                                                                      //       const EdgeInsets
                                                                      //               .only(
                                                                      //           left:
                                                                      //               65),
                                                                      //   child: Column(
                                                                      //     crossAxisAlignment:
                                                                      //         CrossAxisAlignment
                                                                      //             .end,
                                                                      //     children: [
                                                                      //       Dimens
                                                                      //           .boxHeight10,
                                                                      //       // CustomRichText(
                                                                      //       //     title:
                                                                      //       //         'Equipment Categories: '),
                                                                      //       Dimens
                                                                      //           .boxHeight60,
                                                                      //       // CustomRichText(
                                                                      //       //     title:
                                                                      //       //         'Valid Till: '),
                                                                      //       Dimens
                                                                      //           .boxWidth10,
                                                                      //     ],
                                                                      //   ),
                                                                      // ),
                                                                      // Dimens.boxWidth10,
                                                                      // Column(
                                                                      //   crossAxisAlignment:
                                                                      //       CrossAxisAlignment
                                                                      //           .start,
                                                                      //   children: [
                                                                      //     // controller.permitId
                                                                      //     //             .value >
                                                                      //     //         0
                                                                      //     //     ? SizedBox(
                                                                      //     //         width:
                                                                      //     //             MediaQuery.of(context).size.width / 5,
                                                                      //     //         child:
                                                                      //     //             CustomMultiSelectDialogField(
                                                                      //     //           title:
                                                                      //     //               'Select Equipment Category',
                                                                      //     //           buttonText:
                                                                      //     //               'Equipment Category',
                                                                      //     //           initialValue: ((controller.selectedEquipmentCategoryIdList.isNotEmpty)
                                                                      //     //               ? controller.selectedEquipmentCategoryIdList
                                                                      //     //               : []),
                                                                      //     //           items: controller.equipmentCategoryList
                                                                      //     //               .map(
                                                                      //     //                 (equipmentCategory) => MultiSelectItem(
                                                                      //     //                   equipmentCategory?.id,
                                                                      //     //                   equipmentCategory?.name ?? '',
                                                                      //     //                 ),
                                                                      //     //               )
                                                                      //     //               .toList(),
                                                                      //     //           onConfirm: (selectedOptionsList) =>
                                                                      //     //               {
                                                                      //     //             controller.equipmentCategoriesSelected(selectedOptionsList),
                                                                      //     //             print('Equipment list ${controller.selectedEquipmentCategoryIdList}')
                                                                      //     //           },
                                                                      //     //         ),
                                                                      //     //       )
                                                                      //     //     : SizedBox(
                                                                      //     //         width:
                                                                      //     //             MediaQuery.of(context).size.width / 5,
                                                                      //     //         child:
                                                                      //     //             CustomMultiSelectDialogField(
                                                                      //     //           title:
                                                                      //     //               'Select Equipment Category',
                                                                      //     //           buttonText:
                                                                      //     //               'Equipment Category',
                                                                      //     //           initialValue: (controller.selectedEquipmentCategoryIdList.isNotEmpty)
                                                                      //     //               ? controller.selectedEquipmentCategoryIdList
                                                                      //     //               : [],
                                                                      //     //           items: controller.equipmentCategoryList
                                                                      //     //               .map(
                                                                      //     //                 (equipmentCategory) => MultiSelectItem(
                                                                      //     //                   equipmentCategory?.id,
                                                                      //     //                   equipmentCategory?.name ?? '',
                                                                      //     //                 ),
                                                                      //     //               )
                                                                      //     //               .toList(),
                                                                      //     //           onConfirm: (selectedOptionsList) =>
                                                                      //     //               {
                                                                      //     //             controller.equipmentCategoriesSelected(selectedOptionsList),
                                                                      //     //             print('Equipment list55 ${controller.selectedEquipmentCategoryIdList}')
                                                                      //     //           },
                                                                      //     //         ),
                                                                      //     //       ),
                                                                      //     Dimens
                                                                      //         .boxHeight30,
                                                                      //     // _buildStartValidTillDateField_web(
                                                                      //     //     context,
                                                                      //     //     1),
                                                                      //   ],
                                                                      // ),
                                                                    ],
                                                                  ),
                                                                  // Padding(
                                                                  //   padding: const EdgeInsets.only(left: 95),
                                                                  //   child: Row(
                                                                  //     children: [
                                                                  //       CustomRichText(title: 'Title: '),
                                                                  //       Expanded(
                                                                  //         child: _buildTitleTextField_web(context),
                                                                  //       ),
                                                                  //     ],
                                                                  //   ),
                                                                  // ),

                                                                  //// Permit Reference
                                                                  // Padding(
                                                                  //   padding: const EdgeInsets.only(left: 30),
                                                                  //   child: Row(
                                                                  //     children: [
                                                                  //       CustomRichText(title: 'Permit Ref. No: '),
                                                                  //       Expanded(
                                                                  //         child: _buildWorkPermitReferenceTextField_web(context),
                                                                  //       ),
                                                                  //     ],
                                                                  //   ),
                                                                  // ),

                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            150,
                                                                        right:
                                                                            130),
                                                                    child: Row(
                                                                      children: [
                                                                        CustomRichText(
                                                                            title:
                                                                                'Work Description: '),
                                                                        Expanded(
                                                                          child:
                                                                              _buildPermitDescriptionField_web(context),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              SizedBox(
                                                                height: 10,
                                                              ),

                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            70),
                                                                child: Row(
                                                                  children: [
                                                                    CustomRichText(
                                                                        title:
                                                                            'Electrical Isolation Required '),
                                                                    Switch(
                                                                      value: _controller
                                                                          .isToggleOn
                                                                          .value,
                                                                      onChanged:
                                                                          (value) {
                                                                        _controller
                                                                            .toggle();
                                                                      },
                                                                      activeColor:
                                                                          Colors
                                                                              .white,
                                                                      activeTrackColor:
                                                                          Colors
                                                                              .green,
                                                                      inactiveThumbColor:
                                                                          Colors
                                                                              .white,
                                                                      inactiveTrackColor:
                                                                          Colors
                                                                              .red,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              controller.isToggleOn ==
                                                                      true
                                                                  ? Row(
                                                                      children: [
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.only(left: 130),
                                                                          // alignment:
                                                                          //     Alignment
                                                                          //         .centerRight,

                                                                          child:
                                                                              CustomRichText(title: 'Equipment Isolation '),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5,
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
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 5,
                                                                          child:
                                                                              CustomMultiSelectDialogField(
                                                                            buttonText:
                                                                                'Select Equipment Isolation',
                                                                            title:
                                                                                'Equipment Isolation',
                                                                            initialValue: (controller.selectedEquipmentIsolationIdList.isNotEmpty)
                                                                                ? controller.selectedEquipmentIsolationIdList
                                                                                : [],
                                                                            items: controller.equipmentIsolationList
                                                                                .map(
                                                                                  (equipmentIsolation) => MultiSelectItem(
                                                                                    equipmentIsolation?.id,
                                                                                    equipmentIsolation?.name ?? '',
                                                                                  ),
                                                                                )
                                                                                .toList(),
                                                                            onConfirm: (selectedOptionsList) =>
                                                                                {
                                                                              controller.equipmentIsolationSelected(selectedOptionsList),
                                                                              print('Equipment Isolation list5: ${controller.equipmentIsolationList}')
                                                                            },
                                                                          ),
                                                                        )
                                                                      ],
                                                                    )
                                                                  : Text(
                                                                      'No Isolation Equipment'),

                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              controller.isToggleOn ==
                                                                      true
                                                                  ?
                                                                  //Loto apply
                                                                  SizedBox(
                                                                      height: ((controller.filteredEquipmentNameList.length) *
                                                                              30) +
                                                                          200,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          1.2,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Container(
                                                                          margin:
                                                                              Dimens.edgeInsets16,
                                                                          height:
                                                                              Get.height,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(color: Colors.grey.withOpacity(.3)),
                                                                          ),
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                1100,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              CustomAppBar(
                                                                                title: 'Loto Equipment List'.tr,
                                                                                action: ActionButton(
                                                                                    label: 'Add New1',
                                                                                    icon: Icons.add,
                                                                                    onPressed: () {
                                                                                      //  showEquipmentNameAlertBox();
                                                                                      Get.dialog<void>(showEquipmentNameAlertBox());
                                                                                    },
                                                                                    color: ColorValues.appGreenColor),
                                                                              ),
                                                                              Dimens.boxHeight10,
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
                                                                                      SizedBox(
                                                                                        width: MediaQuery.of(context).size.width * 2,
                                                                                        child: Container(
                                                                                          constraints: BoxConstraints(minHeight: 90),
                                                                                          // height: ((controller.filteredEquipmentNameList.length) * 25) + 90,
                                                                                          child: Column(
                                                                                              //
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: //
                                                                                                      Theme(
                                                                                                    data: ThemeData(scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all<Color>(Colors.transparent))),
                                                                                                    child: ScrollableTableView(
                                                                                                      // paginationController: controller.equipmentNamepaginationController,
                                                                                                      columns: [
                                                                                                        'name',
                                                                                                        'serialNumber',
                                                                                                        'action'.tr,
                                                                                                      ].map((column) {
                                                                                                        return TableViewColumn(
                                                                                                          minWidth: Get.width * 0.25,
                                                                                                          label: column == "name"
                                                                                                              ? "Loto Applied On"
                                                                                                              : column == "serialNumber"
                                                                                                                  ? "Serial Number"
                                                                                                                  : "Action",
                                                                                                        );
                                                                                                      }).toList(),
                                                                                                      rows: //
                                                                                                          [
                                                                                                        ...List.generate(
                                                                                                          ///controller.selectedEquipmentNameIdList
                                                                                                          controller.filteredEquipmentNameList.length,

                                                                                                          (index) {
                                                                                                            var inventoryEquipmentName = controller.filteredEquipmentNameList[index];

                                                                                                            //_jobId = jobDetails?.id;

                                                                                                            controller.id.value = inventoryEquipmentName?.id ?? 0;
                                                                                                            print('Equipment Isss5:${controller.id.value}');
                                                                                                            return [
                                                                                                              '${inventoryEquipmentName?.name ?? ''}',
                                                                                                              '${inventoryEquipmentName?.serialNumber ?? ''}',
                                                                                                              'Actions'
                                                                                                            ];
                                                                                                          },
                                                                                                        ),
                                                                                                      ].map((_inventoryDetailList) {
                                                                                                        return TableViewRow(
                                                                                                            onTap: () => {
                                                                                                                  print('ZERO = ${_inventoryDetailList[0]}')
                                                                                                                },
                                                                                                            height: 25,
                                                                                                            cells: _inventoryDetailList.map((value) {
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
                                                                                                                              int index = _inventoryDetailList.indexOf(value);
                                                                                                                              print("Index to remove: $index");
                                                                                                                              controller.removeItem(index);
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      )
                                                                                                                    : Text(value.toString()),
                                                                                                              );
                                                                                                            }).toList());
                                                                                                      }).toList(),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ]),
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
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Text(
                                                                      'Nothing to show !!'),

                                                              ///Safety measures
                                                              controller
                                                                      .safetyMeasureList
                                                                      .isEmpty
                                                                  // ||  controller
                                                                  // .safetyList!
                                                                  // .isEmpty
                                                                  ? Dimens.box0
                                                                  : SizedBox(
                                                                      // height: ((controller
                                                                      //             .safetyMeasureList
                                                                      //             .length) *
                                                                      //         10) +
                                                                      //     200,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          1.3,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            CustomAppBar(
                                                                              title: 'Permit Type Checklist'.tr,
                                                                            ),
                                                                            Dimens.boxHeight10,
                                                                            // controller.permitId.value <=
                                                                            //         0
                                                                            controller.safetyMeasureList.length > 0
                                                                                ? Column(
                                                                                    // alignment: WrapAlignment.start,
                                                                                    // spacing: 100,
                                                                                    children: []..addAll(controller.safetyMeasureList.map((element) => Column(
                                                                                          // mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            SizedBox(
                                                                                              // width: 200,
                                                                                              child: Row(
                                                                                                children: [
                                                                                                  checkBoxMethod(1),
                                                                                                  Text("${element.name}")
                                                                                                ],
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                        ))),
                                                                                  )
                                                                                : Dimens.box0,
                                                                            // controller.selectedPermitTypeIdForSafetyList != null
                                                                            // ?Column(
                                                                            //     // alignment: WrapAlignment.start,
                                                                            //     // spacing: 100,
                                                                            //     children: []..addAll(controller.safetyList!.map((element) =>
                                                                            //         Column(
                                                                            //           // mainAxisSize: MainAxisSize.min,
                                                                            //           mainAxisAlignment: MainAxisAlignment.start,
                                                                            //           crossAxisAlignment: CrossAxisAlignment.start,
                                                                            //           children: [
                                                                            //             SizedBox(
                                                                            //               // width: 200,
                                                                            //               child: Row(
                                                                            //                 children: [
                                                                            //                   checkBoxMethod(1),

                                                                            //                   // Text("${j= j! + 1}. "),
                                                                            //                   Text("${element?.saftyQuestionName}")
                                                                            //                 ],
                                                                            //               ),
                                                                            //             )
                                                                            //           ],
                                                                            //         ))),
                                                                            //   ) : Dimens.box0
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),

                                                              SizedBox(
                                                                height: 10,
                                                              ),

                                                              //Tool box talk
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1.25,
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            20),
                                                                // margin: Dimens
                                                                //     .edgeInsets16,
                                                                // height: Get.height,
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
                                                                  maxWidth:
                                                                      1100,
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    CustomAppBar(
                                                                      title: 'SOP'
                                                                          .tr,
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight10,
                                                                    Wrap(
                                                                      children: [
                                                                        Column(
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Text('JOB Type: '),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width / 5,
                                                                                  child: Obx(
                                                                                    () => DropdownWebWidget(
                                                                                      dropdownList: controller.jobTypeList,
                                                                                      isValueSelected: controller.isJobTypeListSelected.value,
                                                                                      selectedValue: controller.selectedJobType.value,
                                                                                      onValueChanged: controller.onValueChanged,
                                                                                    ),
                                                                                  ),

                                                                                  // LoginCustomTextfield(),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 20,
                                                                                ),
                                                                                Text('SOP: '),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width / 5,
                                                                                  child: Obx(
                                                                                    () => DropdownWebWidget(
                                                                                      dropdownList: controller.sopPermitList,
                                                                                      isValueSelected: controller.isSopPermitListSelected.value,
                                                                                      selectedValue: controller.selectedSopPermit.value,
                                                                                      onValueChanged: controller.onValueChanged,
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
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                      height: 30,
                                                                                      child: CustomElevatedButton(
                                                                                        backgroundColor: ColorValues.navyBlueColor,
                                                                                        text: "Create JSA",
                                                                                        onPressed: () {
                                                                                          // controller.createNewPermit();
                                                                                          Get.dialog<void>(ViewJSADialog());
                                                                                        },
                                                                                      )),
                                                                                  SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Container(
                                                                                      height: 30,
                                                                                      child: CustomElevatedButton(
                                                                                        backgroundColor: ColorValues.navyBlueColor,
                                                                                        text: "View SOP",
                                                                                        onPressed: () {
                                                                                          Get.dialog<void>(ViewSOPDialog());
                                                                                          // controller.createNewPermit();
                                                                                        },
                                                                                      )),
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
                                                                              child: Row(
                                                                                  //
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: FileUploadWidgetWithDropzone(),
                                                                                    ),
                                                                                    Dimens.boxWidth10,
                                                                                    Expanded(
                                                                                        flex: 8,
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.only(top: 15),
                                                                                          child: FileUploadDetailsWidgetWeb2(),
                                                                                        )),
                                                                                  ]),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Dimens
                                                                  .boxHeight20,

                                                              //Tool box talk / Pre Job Discussion
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    1.3,
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(
                                                                            20),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              .3)),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  // color: ColorValues.appBlueBackgroundColor,
                                                                  // padding: const EdgeInsets.all(8.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomAppBar(
                                                                        title:
                                                                            "Tool Box Talk (TBT) / PRE-JOB DISCUSSION",
                                                                      ),
                                                                      // Text(
                                                                      //   "Tool Box Talk (TBT) / PRE-JOB DISCUSSION",
                                                                      //   style: Styles.blue700,
                                                                      // ),
                                                                      Dimens
                                                                          .boxHeight10,
                                                                      Wrap(
                                                                        children: [
                                                                          Column(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 10, right: 10),
                                                                                child: Row(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Conducted At Job-Site By:',
                                                                                          style: Styles.blackBold17,
                                                                                        ),
                                                                                        Dimens.boxHeight10,
                                                                                        // Text(
                                                                                        //   'Ramesh Singh',
                                                                                        //   style: Styles.black17,
                                                                                        // ),
                                                                                        SizedBox(
                                                                                          width: MediaQuery.of(context).size.width / 7,
                                                                                          child: Obx(
                                                                                            () => DropdownWebWidget(
                                                                                              dropdownList: controller.employeeNameList,
                                                                                              isValueSelected: controller.isemployeeNameListSelected.value,
                                                                                              selectedValue: controller.selectedEmployeeNamesList.value,
                                                                                              onValueChanged: controller.onValueTbtConductedChanged,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Spacer(),
                                                                                    Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Date & Time',
                                                                                          style: Styles.blackBold17,
                                                                                        ),
                                                                                        Dimens.boxHeight10,
                                                                                        // Text(
                                                                                        //   '17:06:2022 09:30:00',
                                                                                        //   style: Styles.black17,
                                                                                        // ),
                                                                                        _buildDateTimeField_web(context),
                                                                                      ],
                                                                                    ),
                                                                                    Spacer(),
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
                                                                                  border: Border.all(color: Colors.grey.withOpacity(.3)),
                                                                                ),
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 1100,
                                                                                ),
                                                                                child: Column(children: [
                                                                                  CustomAppBar(
                                                                                    title: 'TBT Training Attended By'.tr,
                                                                                    action: ActionButton(
                                                                                      label: 'Add Employee',
                                                                                      icon: Icons.add,
                                                                                      onPressed: () {
                                                                                        Get.dialog<void>(AddEmployeeListAlertBox());
                                                                                      },
                                                                                      color: ColorValues.appGreenColor,
                                                                                    ),
                                                                                  ),
                                                                                  Dimens.boxHeight10,
                                                                                  Wrap(children: [
                                                                                    Column(children: [
                                                                                      Obx(
                                                                                        () => SizedBox(
                                                                                          width: MediaQuery.of(context).size.width * 1.5,
                                                                                          child: Container(
                                                                                            height: ((controller.filteredEmployeeNameList.length) * 30) + 110,
                                                                                            child: Column(
                                                                                                //
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: //
                                                                                                        Theme(
                                                                                                      data: ThemeData(scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all<Color>(Colors.transparent))),
                                                                                                      child: ScrollableTableView(
                                                                                                        // paginationController: controller.equipmentNamepaginationController,
                                                                                                        columns: [
                                                                                                          // 'id',
                                                                                                          'name',
                                                                                                          // 'gender',
                                                                                                          'Contact No.',
                                                                                                          'Responsibility',

                                                                                                          'action'.tr,
                                                                                                        ].map((column) {
                                                                                                          return TableViewColumn(
                                                                                                            minWidth: Get.width * 0.175,
                                                                                                            label:
                                                                                                                // column == "id"
                                                                                                                //     ? "Employee Id"
                                                                                                                //     :
                                                                                                                column == "name"
                                                                                                                    ? "Employee Name"
                                                                                                                    // : column == "gender"
                                                                                                                    //     ? "Gender"
                                                                                                                    : column == "Contact No."
                                                                                                                        ? "Contact No."
                                                                                                                        : column == "Responsibility"
                                                                                                                            ? "Responsibility"
                                                                                                                            : "Action",
                                                                                                          );
                                                                                                        }).toList(),
                                                                                                        rows: //
                                                                                                            [
                                                                                                          ...List.generate(
                                                                                                            ///controller.selectedEquipmentNameIdList
                                                                                                            controller.filteredEmployeeNameList.length,

                                                                                                            (index) {
                                                                                                              var employeeNameDetails = controller.filteredEmployeeNameList[index];

                                                                                                              //_jobId = jobDetails?.id;

                                                                                                              // controller.id.value = employeeNameDetails?.id ?? 0;
                                                                                                              // print('Employee Idss5:${controller.id.value}');
                                                                                                              return [
                                                                                                                // '${employeeNameDetails?.id ?? ''}',
                                                                                                                '${employeeNameDetails?.name ?? ''}',
                                                                                                                // '${employeeNameDetails?.gender ?? ''}',
                                                                                                                '${employeeNameDetails?.mobileNumber ?? ''}',
                                                                                                                '${employeeNameDetails?.responsibility?.map((e) => e.name) ?? ''}',
                                                                                                                'Actions'
                                                                                                              ];
                                                                                                            },
                                                                                                          ),
                                                                                                        ].map((_inventoryDetailList) {
                                                                                                          print('ListData = ${_inventoryDetailList}');

                                                                                                          return TableViewRow(
                                                                                                              onTap: () => {
                                                                                                                    print('ZERO = ${_inventoryDetailList[0]}')
                                                                                                                  },
                                                                                                              height: 25,
                                                                                                              cells: _inventoryDetailList.map((value) {
                                                                                                                return TableViewCell(
                                                                                                                  //key: ,
                                                                                                                  child: (value == 'Actions')
                                                                                                                      ? Wrap(children: [
                                                                                                                          TableActionButton(
                                                                                                                            color: Colors.red,
                                                                                                                            icon: Icons.delete_outline,
                                                                                                                            message: 'Remove',
                                                                                                                            onPress: () {
                                                                                                                              // controller.showNewPermitListDetails(
                                                                                                                              //     controller.permitId.value);
                                                                                                                              controller.removeRow(id: int.tryParse(_inventoryDetailList[0]) ?? 0);
                                                                                                                              print('InventoryEmployeeList$_inventoryDetailList');
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        ])
                                                                                                                      : Text(value.toString()),
                                                                                                                );
                                                                                                              }).toList());
                                                                                                        }).toList(),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ]),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ]),
                                                                                  ]),
                                                                                ]),
                                                                              )
                                                                              // :
                                                                              // Container(
                                                                              //     margin: Dimens.edgeInsets20,
                                                                              //     decoration: BoxDecoration(
                                                                              //       border: Border.all(color: Colors.grey.withOpacity(.3)),
                                                                              //     ),
                                                                              //     constraints: BoxConstraints(
                                                                              //       maxWidth: 1100,
                                                                              //     ),
                                                                              //     child: Column(children: [
                                                                              //       CustomAppBar(
                                                                              //         title: 'TBT Training Attended By'.tr,
                                                                              //         action: ActionButton(
                                                                              //           label: 'Add Employee',
                                                                              //           icon: Icons.add,
                                                                              //           onPressed: () {
                                                                              //             Get.dialog<void>(AddEmployeeListAlertBox());
                                                                              //           },
                                                                              //           color: Colors.green,
                                                                              //         ),
                                                                              //       ),
                                                                              //       Dimens.boxHeight10,
                                                                              //       Wrap(children: [
                                                                              //         Column(children: [
                                                                              //           // Row(
                                                                              //           //   mainAxisAlignment:
                                                                              //           //       MainAxisAlignment
                                                                              //           //           .spaceEvenly,
                                                                              //           //   children: [
                                                                              //           //     Text(
                                                                              //           //         'Name'),
                                                                              //           //     Text(
                                                                              //           //         'Designation'),
                                                                              //           //     Text(
                                                                              //           //         'Responsibility'),
                                                                              //           //     Text(
                                                                              //           //         'Competeness'),
                                                                              //           //     Text(
                                                                              //           //         'Remove'),
                                                                              //           //   ],
                                                                              //           // ),

                                                                              //           SizedBox(
                                                                              //             width: MediaQuery.of(context).size.width * 1.5,
                                                                              //             child: Container(
                                                                              //               height: ((controller.listEmployee!.length) * 30) + 200,
                                                                              //               child: Column(
                                                                              //                   //
                                                                              //                   children: [
                                                                              //                     Expanded(
                                                                              //                       child: //
                                                                              //                           Theme(
                                                                              //                         data: ThemeData(scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all<Color>(Colors.transparent))),
                                                                              //                         child: ScrollableTableView(
                                                                              //                           // paginationController: controller.equipmentNamepaginationController,
                                                                              //                           columns: [
                                                                              //                             'empName',
                                                                              //                             'resp',
                                                                              //                             'action'.tr,
                                                                              //                           ].map((column) {
                                                                              //                             return TableViewColumn(
                                                                              //                               minWidth: Get.width * 0.19,
                                                                              //                               label: column == "empName"
                                                                              //                                   ? "Employee Name"
                                                                              //                                   : column == "resp"
                                                                              //                                       ? "Responsibility"
                                                                              //                                       : "Action",
                                                                              //                             );
                                                                              //                           }).toList(),
                                                                              //                           rows: //
                                                                              //                               [
                                                                              //                             ...List.generate(
                                                                              //                               ///controller.selectedEquipmentNameIdList
                                                                              //                               controller.listEmployee!.length,

                                                                              //                               (index) {
                                                                              //                                 var employeeNameDetails = controller.listEmployee![index];

                                                                              //                                 //_jobId = jobDetails?.id;

                                                                              //                                 // controller.id.value = employeeNameDetails?.empName ?? 0;
                                                                              //                                 print('Employee Idss5:${controller.id.value}');
                                                                              //                                 return [
                                                                              //                                   '${employeeNameDetails?.empName ?? ''}',
                                                                              //                                   '${employeeNameDetails?.resp ?? ''}',
                                                                              //                                   'Actions'
                                                                              //                                 ];
                                                                              //                               },
                                                                              //                             ),
                                                                              //                           ].map((_inventoryDetailList) {
                                                                              //                             return TableViewRow(
                                                                              //                                 onTap: () => {
                                                                              //                                       print('ZERO = ${_inventoryDetailList[0]}')
                                                                              //                                     },
                                                                              //                                 height: 25,
                                                                              //                                 cells: _inventoryDetailList.map((value) {
                                                                              //                                   return TableViewCell(
                                                                              //                                     //key: ,
                                                                              //                                     child: (value == 'Actions')
                                                                              //                                         ? Wrap(children: [
                                                                              //                                             TableActionButton(
                                                                              //                                               color: Colors.red,
                                                                              //                                               icon: Icons.delete_outline,
                                                                              //                                               message: 'Remove',
                                                                              //                                               onPress: () {
                                                                              //                                                 // controller.showNewPermitListDetails(
                                                                              //                                                 //     controller.permitId.value);
                                                                              //                                               },
                                                                              //                                             ),
                                                                              //                                           ])
                                                                              //                                         : Text(value.toString()),
                                                                              //                                   );
                                                                              //                                 }).toList());
                                                                              //                           }).toList(),
                                                                              //                         ),
                                                                              //                       ),
                                                                              //                     ),
                                                                              //                   ]),
                                                                              //             ),
                                                                              //           ),
                                                                              //         ])
                                                                              //       ]),
                                                                              //     ]),
                                                                              //   ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),

                                                              ////  commented
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            28,
                                                                        right:
                                                                            110),
                                                                child: Row(
                                                                  children: [
                                                                    CustomRichText(
                                                                        title:
                                                                            'Comments: '),
                                                                    Expanded(
                                                                      child: _buildWorkPermitCommentTextField_web(
                                                                          context),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              controller.jobModel
                                                                          ?.id !=
                                                                      null
                                                                  ? Center(
                                                                      child: Container(
                                                                          height: 45,
                                                                          child: CustomElevatedButton(
                                                                            backgroundColor:
                                                                                ColorValues.appGreenColor,
                                                                            text:
                                                                                "Submit For Approval",
                                                                            onPressed:
                                                                                () {
                                                                              // var jobId = controller.jobModel?.id ?? 0;
                                                                              // print('JobId'),
                                                                              controller.isCheckedJSA.value == true && controller.isCheckedSOP.value == true ? controller.createNewPermitForJob(jobId: controller.jobModel?.id, fileIds: dropzoneController.fileIds) : Get.dialog<void>(checkboxAlertBox());
                                                                              // controller.linkToPermit(jobId: controller.jobModel?.id);
                                                                            },
                                                                          )),
                                                                    )
                                                                  : controller.pmtaskViewModel
                                                                              ?.id !=
                                                                          null
                                                                      ? Center(
                                                                          child: Container(
                                                                              height: 45,
                                                                              child: CustomElevatedButton(
                                                                                backgroundColor: ColorValues.appGreenColor,
                                                                                text: "Submit For Approval",
                                                                                onPressed: () {
                                                                                  // var jobId = controller.jobModel?.id ?? 0;
                                                                                  // print('JobId'),
                                                                                  controller.isCheckedJSA.value == true && controller.isCheckedSOP.value == true ? controller.createNewPermitForPm(pmTaskId: controller.pmtaskViewModel?.id, activity: controller.pmtaskViewModel?.plan_title, fileIds: dropzoneController.fileIds) : Get.dialog<void>(checkboxAlertBox());
                                                                                  // controller.linkToPermit(jobId: controller.jobModel?.id);
                                                                                },
                                                                              )),
                                                                        )
                                                                      : controller.permitId.value <=
                                                                              0
                                                                          ? Center(
                                                                              child: Container(
                                                                                  height: 45,
                                                                                  child: CustomElevatedButton(
                                                                                      backgroundColor: ColorValues.appGreenColor,
                                                                                      text: "Submit For Approval",
                                                                                      onPressed: () {
                                                                                        controller.isCheckedJSA.value == true && controller.isCheckedSOP.value == true ? controller.createNewPermit(fileIds: dropzoneController.fileIds) : Get.dialog<void>(checkboxAlertBox());

                                                                                        // () {
                                                                                        //   controller.isCheckedJSA.value == true && controller.isCheckedSOP.value == true ? controller.createNewPermit(fileIds: dropzoneController.fileIds) : Get.dialog<void>(checkboxAlertBox());
                                                                                        // };
                                                                                      })),
                                                                            )
                                                                          : Row(
                                                                              children: [
                                                                                Spacer(),
                                                                                controller.newPermitDetailsModel.value?.ptwStatus == 121
                                                                                    ? Center(
                                                                                        child: Container(
                                                                                            height: 45,
                                                                                            child: CustomElevatedButton(
                                                                                              backgroundColor: ColorValues.appDarkBlueColor,
                                                                                              text: "Update",
                                                                                              onPressed: () {
                                                                                                controller.updateNewPermit(fileIds: dropzoneController.fileIds);
                                                                                              },
                                                                                            )),
                                                                                      )
                                                                                    : Dimens.box0,
                                                                                Dimens.boxWidth20,
                                                                                controller.newPermitDetailsModel.value?.ptwStatus == 124
                                                                                    ? Center(
                                                                                        child: Container(
                                                                                            height: 45,
                                                                                            child: CustomElevatedButton(
                                                                                              backgroundColor: Color.fromARGB(255, 116, 78, 130),
                                                                                              text: "Re submit Permit",
                                                                                              onPressed: () {
                                                                                                controller.resubmitPermit(fileIds: dropzoneController.fileIds);
                                                                                              },
                                                                                            )),
                                                                                      )
                                                                                    : Dimens.box0,
                                                                                Spacer(),
                                                                              ],
                                                                            ),

                                                              // : checkboxAlertBox(),

                                                              SizedBox(
                                                                height: 90,
                                                              ),
                                                              SizedBox(
                                                                height: 50,
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
              AnimatedContainer(
                duration: Duration(milliseconds: 450),
                child: HomeDrawer(),
              )
            ],
          ),
        ),
      ),
    );
  }

  ////Below All for Mobile
//   Widget _buildStartDateField_mobile(BuildContext context) {
//     return Column(//
//         children: [
//       Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: RichText(
//             text: TextSpan(
//                 text: 'Start Date: ', style: Styles.blackBold16, children: []),
//           ),
//         ),
//       ),
//       Dimens.boxHeight5,
//       Padding(
//         padding: const EdgeInsets.only(right: 10, left: 10),
//         child: Container(
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 offset: const Offset(
//                   5.0,
//                   5.0,
//                 ),
//                 blurRadius: 5.0,
//                 spreadRadius: 1.0,
//               ), //BoxShadow
//               BoxShadow(
//                 color: ColorValues.whiteColor,
//                 offset: const Offset(0.0, 0.0),
//                 blurRadius: 0.0,
//                 spreadRadius: 0.0,
//               ), //BoxShadow
//             ],
//             color: ColorValues.whiteColor,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width / 1.1,
//             child: TextField(
  // style: GoogleFonts.lato(
  //               textStyle: TextStyle(
  //                   fontSize: 16.0, height: 1.0, color: Colors.black),
  //             ),
//               onTap: () {
//                 pickDateTime_mobile(context);
//               },
//               controller: controller.startDateTimeCtrlr,
//               autofocus: false,
//               decoration: InputDecoration(
//                 fillColor: ColorValues.whiteColor,
//                 filled: true,
//                 contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
//                 border: InputBorder.none,
//                 enabledBorder: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 // focusedErrorBorder:
//                 //     controller.isJobTitleInvalid.value
//                 //         ? OutlineInputBorder(
//                 //             borderRadius:
//                 //                 BorderRadius.circular(5),
//                 //             borderSide: BorderSide(
//                 //               color: ColorsValue.redColorDark,
//                 //             ),
//                 //           )
//                 //         : InputBorder.none,
//                 // errorBorder:
//                 //     controller.isJobTitleInvalid.value
//                 //         ? OutlineInputBorder(
//                 //             borderRadius:
//                 //                 BorderRadius.circular(5),
//                 //             borderSide: BorderSide(
//                 //               color: ColorsValue.redColorDark,
//                 //             ),
//                 //           )
//                 //         : null,
//                 // errorText: controller.isJobTitleInvalid.value
//                 //     ? "Required field"
//                 //     : null,
//               ),
//               onChanged: (value) {
//                 // if (value.trim().length > 3) {
//                 //   controller.isJobTitleInvalid.value = false;
//                 // } else {
//                 //   controller.isJobTitleInvalid.value = true;
//                 // }
//               },
//             ),
//           ),
//         ),
//       ),
//       Dimens.boxHeight20,
//     ]);
//   }

//   Widget _buildValidTillField_mobile(BuildContext context) {
//     return Column(//
//         children: [
//       Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: RichText(
//             text: TextSpan(
//                 text: 'Valid Till: ', style: Styles.blackBold16, children: []),
//           ),
//         ),
//       ),
//       Dimens.boxHeight5,
//       Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: Container(
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 offset: const Offset(
//                   5.0,
//                   5.0,
//                 ),
//                 blurRadius: 5.0,
//                 spreadRadius: 1.0,
//               ), //BoxShadow
//               BoxShadow(
//                 color: ColorValues.whiteColor,
//                 offset: const Offset(0.0, 0.0),
//                 blurRadius: 0.0,
//                 spreadRadius: 0.0,
//               ), //BoxShadow
//             ],
//             color: ColorValues.whiteColor,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width / 1.1,
//             child: TextField(
  // style: GoogleFonts.lato(
  //               textStyle: TextStyle(
  //                   fontSize: 16.0, height: 1.0, color: Colors.black),
  //             ),
//               onTap: () {
//                 pickDateTimeTill_mobile(context);
//               },
//               controller: controller.validTillTimeCtrlr,
//               autofocus: false,
//               decoration: InputDecoration(
//                 fillColor: ColorValues.whiteColor,
//                 filled: true,
//                 contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
//                 border: InputBorder.none,
//                 enabledBorder: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 // focusedErrorBorder:
//                 //     controller.isJobTitleInvalid.value
//                 //         ? OutlineInputBorder(
//                 //             borderRadius:
//                 //                 BorderRadius.circular(5),
//                 //             borderSide: BorderSide(
//                 //               color: ColorsValue.redColorDark,
//                 //             ),
//                 //           )
//                 //         : InputBorder.none,
//                 // errorBorder:
//                 //     controller.isJobTitleInvalid.value
//                 //         ? OutlineInputBorder(
//                 //             borderRadius:
//                 //                 BorderRadius.circular(5),
//                 //             borderSide: BorderSide(
//                 //               color: ColorsValue.redColorDark,
//                 //             ),
//                 //           )
//                 //         : null,
//                 // errorText: controller.isJobTitleInvalid.value
//                 //     ? "Required field"
//                 //     : null,
//               ),
//               onChanged: (value) {
//                 // if (value.trim().length > 3) {
//                 //   controller.isJobTitleInvalid.value = false;
//                 // } else {
//                 //   controller.isJobTitleInvalid.value = true;
//                 // }
//               },
//             ),
//           ),
//         ),
//       ),
//       Dimens.boxHeight20,
//     ]);
//   }

// //Start Date for mobile
//   Future pickDateTime_mobile(BuildContext context) async {
//     var dateTime = controller.selectedBreakdownTime.value;
//     final date = await pickDate_mobile(context);
//     if (date == null) {
//       return;
//     }

//     final time = await pickTime_mobile(context);
//     if (time == null) {
//       return;
//     }

//     dateTime = DateTime(
//       date.year,
//       date.month,
//       date.day,
//       time.hour,
//       time.minute,
//     );
//     controller.selectedBreakdownTime.value = dateTime;
//     controller.startDateTimeCtrlr
//       ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
//       ..selection = TextSelection.fromPosition(
//         TextPosition(
//           offset: controller.startDateTimeCtrlr.text.length,
//           affinity: TextAffinity.upstream,
//         ),
//       );
//   }

//   Future<DateTime?> pickDate_mobile(BuildContext context) async {
//     DateTime? dateTime = controller.selectedBreakdownTime.value;
//     //final initialDate = DateTime.now();
//     final newDate = await showDatePicker(
//       context: context,
//       initialDate: dateTime,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );

//     if (newDate == null) return null;

//     return newDate;
//   }

//   Future<TimeOfDay?> pickTime_mobile(BuildContext context) async {
//     DateTime dateTime = controller.selectedBreakdownTime.value;
//     //final initialTime = TimeOfDay(hour: 12, minute: 0);
//     final newTime = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
//         builder: (BuildContext context, Widget? child) {
//           return Theme(
//             data: ThemeData.light(),
//             child: child!,
//           );
//         });

//     if (newTime == null) {
//       return null;
//     }

//     return newTime;
//   }

//   // Valid Till for mobile
//   Future pickDateTimeTill_mobile(BuildContext context) async {
//     var dateTime = controller.selectedValidTillTime.value;
//     final date = await pickDateTill_mobile(context);
//     if (date == null) {
//       return;
//     }

//     final time = await pickTimeTill_mobile(context);
//     if (time == null) {
//       return;
//     }

//     dateTime = DateTime(
//       date.year,
//       date.month,
//       date.day,
//       time.hour,
//       time.minute,
//     );
//     controller.selectedValidTillTime.value = dateTime;
//     controller.validTillTimeCtrlr
//       ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
//       ..selection = TextSelection.fromPosition(
//         TextPosition(
//           offset: controller.validTillTimeCtrlr.text.length,
//           affinity: TextAffinity.upstream,
//         ),
//       );
//   }

//   Future<DateTime?> pickDateTill_mobile(BuildContext context) async {
//     DateTime? dateTime = controller.selectedValidTillTime.value;
//     //final initialDate = DateTime.now();
//     final newDate = await showDatePicker(
//       context: context,
//       initialDate: dateTime,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );

//     if (newDate == null) return null;

//     return newDate;
//   }

//   Future<TimeOfDay?> pickTimeTill_mobile(BuildContext context) async {
//     DateTime dateTime = controller.selectedValidTillTime.value;
//     //final initialTime = TimeOfDay(hour: 12, minute: 0);
//     final newTime = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
//         builder: (BuildContext context, Widget? child) {
//           return Theme(
//             data: ThemeData.light(),
//             child: child!,
//           );
//         });

//     if (newTime == null) {
//       return null;
//     }

//     return newTime;
//   }

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
      Padding(
        padding: const EdgeInsets.only(left: 8),
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
              // : null;
            },
            controller: position == 0
                ? controller.startDateTimeCtrlr
                : controller.validTillTimeCtrlr,

            // :null,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              // focusedErrorBorder:
              // hintText: '${position == 1 ? DateFormat.yMEd() : ''}',
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
    final date = await pickDate_web(context, position);
    if (date == null) {
      return;
    }

    final time = await pickTime_web(context, position);
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

  Future<TimeOfDay?> pickTime_web(BuildContext context, int position) async {
    DateTime dateTime = position == 0
        ? controller.selectedBreakdownTime.value
        : controller.selectedValidTillTime.value;
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

      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.75
        //     : MediaQuery.of(context).size.width / 1.1,
        // margin: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 10, right: 18, bottom: 10),
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
            controller: controller.titleTextCtrlr,
            keyboardType: TextInputType.multiline,
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
              errorText:
                  controller.isTitleTextInvalid.value ? "Required field" : null,
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
    ]);
  }

  Widget _buildWorkPermitReferenceTextField_web(BuildContext context) {
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

      Container(
        height: MediaQuery.of(context).size.height * 0.050,
        // width: Responsive.isDesktop(context)
        //     ? MediaQuery.of(context).size.width / 1.75
        //     : MediaQuery.of(context).size.width / 1.1,
        //  margin: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 10, right: 18, bottom: 10),
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
            controller: controller.workPermitNumberTextCtrlr,
            keyboardType: TextInputType.multiline,
            autofocus: false,
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
      Dimens.boxHeight20,
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
                        buttonText: 'Select Equipment Name',
                        title: 'Equipment Name',
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
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

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
          'Select Employee NameHIIIII',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Obx(
            () => Container(
              padding: Dimens.edgeInsets05_0_5_0,
              // height: double.infinity,
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
}
