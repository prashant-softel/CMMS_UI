import 'package:cmms/app/add_job/add_job_controller.dart';
import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/create_preventive_checklist/create_preventive_checklist_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/new_permit/new_permit_presenter.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_mobile.dart';
import 'package:cmms/app/preventive_List/view/preventive_listContent_web.dart';
import 'package:cmms/app/theme/color_values.dart';
// import 'package:cmms/app/theme/colors_value.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/date_range_picker.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textfield.dart';
import 'package:cmms/app/widgets/drop_file_widget.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/new_permit/view/new_permit_mobile.dart';
import 'package:cmms/app/new_permit/view/new_permit_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/view_sop_dialog.dart';
import 'package:cmms/app/widgets/view_jsa_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class NewPermitScreen extends GetView<NewPermitController> {
  NewPermitScreen({super.key});
  bool valuefirst = false;
  final NewPermitController _controller = Get.find();
 

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
              title: Text('New Permit'),
              centerTitle: true,
              elevation: 0,
            ),
      body: Container(
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
                         if(Responsive.isMobile(context))
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              //  Text('Select Plantss:'),
                              // DropdownWidget(
                              //   // controller: controller,
                              //   dropdownList: controller.facilityList,
                              //   isValueSelected: controller.isFacilitySelected.value,
                              //   selectedValue: controller.selectedFacility.value,
                              //   onValueChanged: controller.onValueChanged,
                              // )
                              Obx(
                                () => Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: 20),
                                    child: Card(
                                      shadowColor: ColorValues.greyColor,
                                      elevation: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: DropdownWidget(
                                          dropdownList: controller.facilityList,
                                          isValueSelected: controller
                                              .isFacilitySelected.value,
                                          selectedValue:
                                              controller.selectedFacility.value,
                                          onValueChanged:
                                              controller.onValueChanged,
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
                                            ////
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 140),
                                                child: Text(
                                                  'REQUEST A PERMIT TO WORK',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CustomRichText(
                                                        title: 'Block/Plot: '),
                                                    // SizedBox(
                                                    //   width: 5,
                                                    // ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.6,
                                                      child: Obx(
                                                        () => DropdownWidget(
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
                                                          'Type of permit: '),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.82,
                                                    child: DropdownWidget(
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
                                                    width:
                                                        MediaQuery.of(context)
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
                                              _buildStartDateField_mobile(
                                                  context),
                                              _buildValidTillField_mobile(
                                                  context),
                                              _buildPermitDescriptionField_mobile(
                                                  context),
                                              controller.isCheckedJSA.value == true
                                             ? Center(
                                                child: Container(
                                                    height: 45,
                                                    child: CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .navyBlueColor,
                                                      text: "Submit",
                                                      onPressed: () {
                                                        controller
                                                            .createNewPermit();
                                                      },
                                                    )),
                                              )
                                              : 
                                              SizedBox(
                                                height: 90,
                                              ),

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
                                    } else if (Responsive.isDesktop(context)) {
                                      return SingleChildScrollView(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 50),
                                                child: Text(
                                                  'REQUEST A PERMIT TO WORK',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 35,
                                                  ),
                                                  CustomRichText(
                                                      title: 'Block/Plot: '),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.75,
                                                    child: Obx(
                                                      () => DropdownWidget(
                                                        
                                                        dropdownList: controller
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
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  CustomRichText(
                                                      title:
                                                          'Equipment Categories: '),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.7,
                                                    child:
                                                        CustomMultiSelectDialogField(
                                                      title:
                                                          'Select Equipment Category',
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
                                                            'Equipment list ${controller.selectedEquipmentCategoryIdList}')
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    // CustomRichText(
                                                    //     title: 'Block/Plot: '),
                                                    // // SizedBox(
                                                    // //   width: 5,
                                                    // // ),
                                                    // SizedBox(
                                                    //   width: MediaQuery.of(context).size.width / 3.5,
                                                    //   child: Obx(
                                                    //     ()=> DropdownWidget(
                                                    //       dropdownList:controller.blockList,
                                                    //       isValueSelected: controller.isBlockSelected.value,
                                                    //       selectedValue: controller.selectedBlock.value,
                                                    //       onValueChanged:controller.onValueChanged,
                                                    //     ),
                                                    //   ),
                                                    //   // LoginCustomTextfield(),
                                                    // ),

                                                    CustomRichText(
                                                        title:
                                                            'Type of permit: '),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.75,
                                                      child: Obx(
                                                        () => DropdownWidget(
                                                          dropdownList: controller
                                                              .typePermitList,
                                                          isValueSelected:
                                                              controller
                                                                  .isTypePermitSelected
                                                                  .value,
                                                          selectedValue: controller
                                                              .selectedTypePermit
                                                              .value,
                                                          onValueChanged:
                                                              controller
                                                                  .onValueChanged,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 60,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(width: 35,),
                                                  CustomRichText(title: 'Start Date: '),
                                                  _buildStartValidTillDateField_web(
                                                      context, 0,),
                                                  SizedBox(
                                                    width: 125,
                                                  ),
                                                  CustomRichText(title: 'Valid Till: '),
                                                  _buildStartValidTillDateField_web(
                                                      context, 1),
                                                  // _buildValidTillField_web(
                                                  //     context),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 70,),
                                                  CustomRichText(title: 'Title: '),
                                                  SizedBox(width: 5,),
                                                  _buildTitleTextField_web(context),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 25,),
                                                  SizedBox(
                                                    width: 90,
                                                    child: CustomRichText(title: 'Permit Description: ')),
                                                  SizedBox(width: 5,),
                                                  _buildPermitDescriptionField_web(context),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  CustomRichText(
                                                      title:
                                                          'Isolation Required '),
                                                  Switch(
                                                    value: _controller
                                                        .isToggleOn.value,
                                                    onChanged: (value) {
                                                      _controller.toggle();
                                                    },
                                                    activeColor: Colors.white,
                                                    activeTrackColor:
                                                        Colors.green,
                                                    inactiveThumbColor:
                                                        Colors.white,
                                                    inactiveTrackColor:
                                                        Colors.red,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              controller.isToggleOn == true
                                                  ? Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        CustomRichText(
                                                            title:
                                                                'Equipment Isolation '),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2.5,
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
                                                        )
                                                      ],
                                                    )
                                                  : Text(
                                                      'No Isolation Equipment'),

                                              SizedBox(
                                                height: 15,
                                              ),
                                              controller.isToggleOn == true
                                                  ?
                                                  //Loto apply
                                                  SizedBox(
                                                      height: 230,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.2,
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
                                                                  title: ''.tr,
                                                                  action:
                                                                      ActionButton(
                                                                    label:
                                                                        'Add New',
                                                                    icon: Icons
                                                                        .add,
                                                                    onPressed:
                                                                        () {
                                                                      //  showEquipmentNameAlertBox();
                                                                      Get.dialog<
                                                                              void>(
                                                                          showEquipmentNameAlertBox());
                                                                    },
                                                                    color: Colors
                                                                        .green,
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
                                                                          width:
                                                                              MediaQuery.of(context).size.height * 2,
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
                                                                                                            label: 'Delete',
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
                                                                          width:
                                                                              MediaQuery.of(context).size.width / 1.2,
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
                                                    )
                                                  : Text('Nothing to show !!'),

                                              ///Safety measures
                                              SizedBox(
                                                height: 230,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
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
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          CustomAppBar(
                                                            title:
                                                                'Following safety Measures taken to carry out the work'
                                                                    .tr,
                                                          ),
                                                          Dimens.boxHeight10,
                                                          controller.permitId == null
                                                         ? Wrap(
                                                            alignment: WrapAlignment.start,
                                                            spacing: 100,
                                                            children: []..addAll(controller.safetyMeasureList.map((element) => Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                             children: [
                                                                      checkBoxMethod(
                                                                          1),
                                                                          Text("${element.name}")
                                                                          ],))),)
                                                          :Wrap(
                                                            alignment: WrapAlignment.start,
                                                            spacing: 100,
                                                            children: []..addAll(controller.safetyList!.map((element) => Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                             children: [
                                                                      checkBoxMethod(
                                                                          1),
                                                                          Text("${element?.saftyQuestionName}")
                                                                          ],))),),
                                                         
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              ///Team Deploying
                                              controller.permitId == null
                                              ?SizedBox(
                                                height: 230,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
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
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          CustomAppBar(
                                                            title:
                                                                'Team Deploying to carry out the job'
                                                                    .tr,
                                                            action:
                                                                ActionButton(
                                                              label:
                                                                  'Add Employee',
                                                              icon: Icons.add,
                                                              onPressed: () {
                                                                Get.dialog<
                                                                 void>(AddEmployeeListAlertBox());
                  
                                                              },
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                          Dimens.boxHeight10,
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
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1.5,
                                                                    child:
                                                                        Container(
                                                                      height: Get
                                                                          .height,
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
                                                                                  'login_id',
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
                                                                                ]
                                                                                .map((column) {
                                                                                  return TableViewColumn(
                                                                                    minWidth: Get.width * 0.19,
                                                                                    label: column == "name"
                                                                                        ? "Employee Name"
                                                                                        : column == "gender"
                                                                                            ? "Gender"
                                                                                            : column == "login_id"
                                                                                                ? "Login Id"
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
                                                                                        '${employeeNameDetails?.login_id ?? ''}',
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
                                                                                                      label: 'Delete',
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
                                                                                                  ]
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
                                                                          ]
                                                                          ),
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
                                                                ]
                                                              )
                                                            ]

                                                          ),
                                                        ]
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              :SizedBox(
                                                height: 230,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
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
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          CustomAppBar(
                                                            title:
                                                                'Team Deploying to carry out the job'
                                                                    .tr,
                                                            action:
                                                                ActionButton(
                                                              label:
                                                                  'Add Employee',
                                                              icon: Icons.add,
                                                              onPressed: () {
                                                                Get.dialog<
                                                                 void>(AddEmployeeListAlertBox());
                  
                                                              },
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                          Dimens.boxHeight10,
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
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1.5,
                                                                    child:
                                                                        Container(
                                                                      height: Get
                                                                          .height,
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
                                                                                  'action'.tr,
                                                                                ]
                                                                                .map((column) {
                                                                                  return TableViewColumn(
                                                                                    minWidth: Get.width * 0.19,
                                                                                    label: column == "empName"
                                                                                        ? "Employee Name"
                                                                                        : column == "resp"
                                                                                            ? "Responsibility"
                                                                                            // : column == "login_id"
                                                                                            //     ? "Login Id"
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
                                                                                    controller.listEmployee!.length,

                                                                                    (index) {
                                                                                      var employeeNameDetails = controller.listEmployee![index];

                                                                                      //_jobId = jobDetails?.id;

                                                                                      // controller.id.value = employeeNameDetails?.empName ?? 0;
                                                                                      print('Employee Idss5:${controller.id.value}');
                                                                                      return [
                                                                                        '${employeeNameDetails?.empName ?? ''}',
                                                                                        '${employeeNameDetails?.resp ?? ''}',
                                                                                        // '${employeeNameDetails?.login_id ?? ''}',
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
                                                                                                      label: 'Delete',
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
                                                                                                  ]
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
                                                                         
                                                                          ]
                                                                          ),
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
                                                                ]
                                                              )
                                                            ]

                                                          ),
                                                        ]
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              //Tool box talk
                                              SizedBox(
                                                height: 480,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
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
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          CustomAppBar(
                                                            title:
                                                                'Tool Box Talk'
                                                                    .tr,
                                                          ),
                                                          Dimens.boxHeight10,
                                                          Wrap(
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      CustomRichText(
                                                                          title:
                                                                              'Job Type: '),
                                                                      SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                4,
                                                                        child:
                                                                            Obx(
                                                                          () =>
                                                                              DropdownWidget(
                                                                            dropdownList:
                                                                                controller.jobTypeList,
                                                                            isValueSelected:
                                                                                controller.isJobTypeListSelected.value,
                                                                            selectedValue:
                                                                                controller.selectedJobType.value,
                                                                            onValueChanged:
                                                                                controller.onValueChanged,
                                                                          ),
                                                                        ),

                                                                        // LoginCustomTextfield(),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      CustomRichText(
                                                                          title:
                                                                              'SOP: '),
                                                                      SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                4,
                                                                        child:
                                                                            Obx(
                                                                          () =>
                                                                              DropdownWidget(
                                                                            dropdownList:
                                                                                controller.sopPermitList,
                                                                            isValueSelected:
                                                                                controller.isSopPermitListSelected.value,
                                                                            selectedValue:
                                                                                controller.selectedSopPermit.value,
                                                                            onValueChanged:
                                                                                controller.onValueChanged,
                                                                          ),
                                                                        ),
                                                                        // LoginCustomTextfield(),
                                                                      ),
                                                                      
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: 40,),
                                                                    Center(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                            height:
                                                                                30,
                                                                            child:
                                                                                CustomElevatedButton(
                                                                              backgroundColor: ColorValues.navyBlueColor,
                                                                              text: "View JSA",
                                                                              onPressed: () {
                                                                                // controller.createNewPermit();
                                                                                Get.dialog<void>(ViewJSADialog());
                                                                              },
                                                                            )),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Container(
                                                                            height:
                                                                                30,
                                                                            child:
                                                                                CustomElevatedButton(
                                                                              backgroundColor: ColorValues.navyBlueColor,
                                                                              text: "View SOP",
                                                                              onPressed: () {
                                                                                Get.dialog<void>(ViewSOPDialog());
                                                                                // controller.createNewPermit();
                                                                              },
                                                                            )
                                                                            ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 22,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            40,
                                                                      ),
                                                                      CustomRichText(
                                                                          title:
                                                                              'Permit Issuer: '),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width /
                                                                            4,
                                                                        child:
                                                                            Obx(
                                                                          () =>
                                                                              DropdownWidget(
                                                                            dropdownList:
                                                                                controller.permitIssuerList,
                                                                            isValueSelected:
                                                                                controller.isPermitIssuerListSelected.value,
                                                                            selectedValue:
                                                                                controller.selectedPermitIssuerLists.value,
                                                                            onValueChanged:
                                                                                controller.onValueChanged,
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
                                                                        width:
                                                                            40,
                                                                      ),
                                                                      CustomRichText(
                                                                          title:
                                                                              'Permit Approver: '),
                                                                      SizedBox(
                                                                        width:
                                                                            23,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                4,
                                                                        child:
                                                                            Obx(
                                                                          () =>
                                                                              DropdownWidget(
                                                                            dropdownList:
                                                                                controller.permitApproverList,
                                                                            isValueSelected:
                                                                                controller.isPermitApproverListSelected.value,
                                                                            selectedValue:
                                                                                controller.selectedPermitApproverLists.value,
                                                                            onValueChanged:
                                                                                controller.onValueChanged,
                                                                          ),
                                                                        ),
                                                                        // LoginCustomTextfield(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: 40,),
                                                                    //Button
                                                                
                                                                  Wrap(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            20,
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.only(left: 90, top: 30),
                                                                                child: CircleAvatar(
                                                                                  backgroundColor: Color.fromARGB(255, 160, 160, 160),
                                                                                  radius: 70,
                                                                                  child: Text(
                                                                                    'Drop Files Here',
                                                                                    style: Styles.white13,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                                // DropFileWidget(),
                                                                              
                                                                              SizedBox(
                                                                                width: 50,
                                                                              ),
                                                                              ////
                                                                              Container(
                                                                                height: 100,
                                                                                width: MediaQuery.of(context).size.width / 2.5,
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
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            // Text('#'),

                                                                                            Text('Name'),
                                                                                            Dimens.boxWidth20,
                                                                                            Text('Upload Progress'),
                                                                                            Dimens.boxWidth20,
                                                                                            Text('Status'),
                                                                                            Dimens.boxWidth20,
                                                                                            Text('Description'),
                                                                                            Dimens.boxWidth20,
                                                                                            Text('Remove'),
                                                                                            Dimens.boxWidth20,
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
                                                                                              Text('Files list will appear heres'),
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
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
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
                                           
                                         controller.permitId== null   
                                         ? 
                                         Center(
                                                child: Container(
                                                    height: 45,
                                                    child: 
                                                    CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .navyBlueColor,
                                                      text: "Submit",
                                                      onPressed: () {
                                                        controller.isCheckedJSA.value == true && controller.isCheckedSOP.value == true
                                                        ?
                                                        controller
                                                            .createNewPermit()
                                                        : Get.dialog<void>(checkboxAlertBox());
                                                      },
                                                    )
                                                  
                                                    
                                                    ),
                                              )
                                               :  Center(
                                                child: Container(
                                                    height: 45,
                                                    child: 
                                                    CustomElevatedButton(
                                                      backgroundColor:
                                                          ColorValues
                                                              .navyBlueColor,
                                                      text:"Update",
                                                      onPressed: () {
                                                       
                                                      },
                                                    )
                                                  
                                                    
                                                    ),
                                              ),
                                            
                                              // : checkboxAlertBox(),
                                            
                                              SizedBox(
                                                height: 90,
                                              ),
                                              SizedBox(
                                                height: 50,
                                              ),
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
      Dimens.boxHeight10,
    ]);
  }

  ///Below All For WEB

  Widget _buildStartValidTillDateField_web(BuildContext context, int position,) {
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

    final time = await pickTime_web(context,0);
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
      ..text = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime)
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
      Dimens.boxHeight5,
      Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.45,
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

          return 
             Container(
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
                    Text('Please check the JSA and SOP Terms and Condition. \n Please click on View JSA and View SOP Button.')
                    
                  ]
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
                      child:
                       CustomMultiSelectDialogField(
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
            ? controller.isChecked1.value
            : position == 2
                ? controller.isChecked2.value
                : position == 3
                    ? controller.isChecked3.value
                    : position == 4
                        ? controller.isChecked4.value
                        : position == 5
                            ? controller.isChecked5.value
                            : position == 6
                                ? controller.isChecked6.value
                                : position == 7
                                    ? controller.isChecked7.value
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
}
