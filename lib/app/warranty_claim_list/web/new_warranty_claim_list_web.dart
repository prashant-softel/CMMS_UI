// import 'package:cmms/app/add_job/views/widgets/work_area_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/dropdown.dart';
import 'package:cmms/app/widgets/new_warranty_claim_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class NewWarrantyClaimListWeb extends GetView<HomeController> {
  NewWarrantyClaimListWeb({super.key});

  bool valuefirst = false;

  // final controller = Get.find<HomeController>();
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: HeaderWidget(),
          elevation: 0,
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
        ),
        body: Row(
          children: [
            Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Dimens.box0
                : HomeDrawer(),
            Expanded(
              child: Center(
                child: Container(
                  margin: Dimens.edgeInsets16,
                  height: Get.height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
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
                              Text(
                                "Dashboard",
                                style: Styles.greyLight14,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(" / Warranty Claim List",
                                    style: Styles.greyMediumLight12),
                              ),
                              Text(" / Add Warranty Claim",
                                  style: Styles.greyMediumLight12)
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
                        Wrap(
                          children: [
                            GetBuilder<HomeController>(
                                id: 'block_field',
                                builder: (controller) {
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextField(
                                            label: 'Warranty Claim Title: *',
                                            textController: controller
                                                .assetNameTextController,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CustomTextField(
                                              label:
                                                  'Warranty Brief Description: *',
                                              maxLine: 6,
                                              textController: controller
                                                  .assetDescpTextController,
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.8,
                                                child:
                                                    CustomMultiSelectDialogField(
                                                  buttonText:
                                                      'Select Equipment Categories',
                                                  title: 'Equipment Categories',
                                                  // initialValue: [],
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
                                                          equipmentCategory?.id,
                                                          equipmentCategory
                                                                  ?.name ??
                                                              '',
                                                        ),
                                                      )
                                                      .toList(),
                                                  onConfirm:
                                                      (selectedOptionsList) => {
                                                    controller
                                                        .equipmentCategoriesSelected(
                                                            selectedOptionsList),
                                                    print(
                                                        'Equipment category list ${controller.equipmentCategoryList}')
                                                  },
                                                  // items: [],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              CustomRichText(
                                                  title: 'Equipment Name: '),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              // Text("${controller.inventoryNameList.length}"),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.8,
                                                child: Obx(
                                                  () => DropdownWidget(
                                                    dropdownList: controller
                                                        .eqipmentNameList,
                                                    isValueSelected: controller
                                                        .isInventorySelected
                                                        .value,
                                                    selectedValue: controller
                                                        .selectedInventory
                                                        .value,
                                                    onValueChanged: controller
                                                        .onValueChanged,
                                                  ),
                                                ),

                                                // LoginCustomTextfield(),
                                              ),

                                              // SizedBox(

                                              //   width: MediaQuery.of(context)
                                              //           .size
                                              //           .width /
                                              //       3.8,
                                              //   child:
                                              //       CustomMultiSelectDialogField(
                                              //         buttonText: 'Select Equipment Name',
                                              //         title: 'Equipment Name',
                                              //     // initialValue: [],
                                              //     initialValue: (
                                              //       controller
                                              //             .selectedEquipmentCategoryIdList
                                              //             .isNotEmpty)
                                              //         ? controller
                                              //             .selectedEquipmentCategoryIdList
                                              //         : [],
                                              //     items: controller
                                              //         .equipmentCategoryList
                                              //         .map(
                                              //           (equipmentCategory) =>
                                              //               MultiSelectItem(
                                              //             equipmentCategory?.id,
                                              //             equipmentCategory?.name ??
                                              //                 '',
                                              //           ),
                                              //         )
                                              //         .toList(),
                                              //     onConfirm:
                                              //         (selectedOptionsList) => {
                                              //       controller
                                              //           .equipmentCategoriesSelected(
                                              //               selectedOptionsList),
                                              //       print(
                                              //           'Equipment list ${controller.equipmentCategoryList}')
                                              //     },
                                              //     // items: [],
                                              //   ),
                                              // ),

                                              // SizedBox(
                                              //      width: MediaQuery.of(context).size.width / 3.8,
                                              //   child: CustomTextField(
                                              //   suffixIcon: Icon(Icons.arrow_drop_down),
                                              //   label: 'Equipment Name *',
                                              //   textController:
                                              //       controller.parentEquipmentTextController,
                                              //   onTap: () {
                                              //     controller.getEquipmentList(facilityId: '45');
                                              //     Get.defaultDialog(
                                              //       title: 'Equipment Name',
                                              //       content: GetBuilder<HomeController>(
                                              //         id: 'equipment_list',
                                              //         builder: (_controller) {
                                              //           if (controller.equipmentList.isEmpty) {
                                              //             return CircularProgressIndicator
                                              //                 .adaptive();
                                              //           }
                                              //           return Container(
                                              //             height: Get.height * .4,
                                              //             decoration: BoxDecoration(
                                              //               borderRadius:
                                              //                   BorderRadius.circular(8),
                                              //             ),
                                              //             child: SingleChildScrollView(
                                              //               child: Column(
                                              //                 children: [
                                              //                   ...List.generate(
                                              //                     controller.equipmentList.length,
                                              //                     (index) => ListTile(
                                              //                       onTap: () {
                                              //                         _controller.onSelectEquipment(
                                              //                             _controller.equipmentList[index]);
                                              //                         Get.back();
                                              //                       },
                                              //                       title: Text(
                                              //                           '${_controller.equipmentList[index].name}'),
                                              //                     ),
                                              //                   ).toList(),
                                              //                 ],
                                              //               ),
                                              //             ),
                                              //           );
                                              //         },
                                              //       ),
                                              //     );
                                              //   },
                                              //                             ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      ///Affected Part
                                      SizedBox(
                                        height: 220,
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  CustomAppBar(
                                                    title: 'Affected Part'.tr,
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Wrap(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 150),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  3.8,
                                                              child:
                                                                  CustomMultiSelectDialogField(
                                                                buttonText:
                                                                    'Example_parts',
                                                                title: 'Email',
                                                                initialValue: [],
                                                                onConfirm:
                                                                    (selectedOptionsList) =>
                                                                        {},
                                                                items: [],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 100,
                                                            ),
                                                            ActionButton(
                                                              icon:
                                                                  Icons.remove,
                                                              label: 'Delete',
                                                              // onPress:
                                                              //     () async {},
                                                              color: Colors.red,
                                                              onPressed: () {},
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 150,
                                                                top: 15),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  3.8,
                                                              child:
                                                                  CustomMultiSelectDialogField(
                                                                buttonText:
                                                                    'Example_part',
                                                                title: 'Parts',
                                                                initialValue: [],
                                                                onConfirm:
                                                                    (selectedOptionsList) =>
                                                                        {},
                                                                items: [],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 30,
                                                            ),
                                                            ActionButton(
                                                              icon:
                                                                  Icons.remove,
                                                              label: 'Delete',
                                                              // onPress:
                                                              //     () async {},
                                                              color: Colors.red,
                                                              onPressed: () {},
                                                            ),
                                                            ActionButton(
                                                              icon: Icons.add,
                                                              label: 'Add',
                                                              // onPress:
                                                              //     () async {},
                                                              color:
                                                                  Colors.blue,
                                                              onPressed: () {},
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomTextField(
                                            label: 'Failure Date & Time: *',
                                            suffixIcon: Icon(
                                              Icons.calendar_month,
                                            ),
                                            // textController:
                                            //     controller.categoryTextController,
                                            textController: controller
                                                .startDateTimeCtrlrWeb,
                                            onTap: () {
                                              pickDateTime_web(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomTextField(
                                            label: 'Approximate Daily Loss:*',
                                            // textController:
                                            //     controller.categoryTextController,
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          CustomRichText(title: 'Severity: '),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [

                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: 'null',
                                                      onChanged: (value) {

                                                      }),
                                                  Text(
                                                    'Critical',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: 'null',
                                                      onChanged: (value) {

                                                      }),
                                                  Text(
                                                    'High',
                                                    style: TextStyle(
                                                        color: Colors.orange),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: 'null',
                                                      onChanged: (index) {}),
                                                  Text(
                                                    'Medium',
                                                    style: TextStyle(
                                                        color: Colors.yellow),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 1,
                                                      groupValue: 'null',
                                                      onChanged: (index) {}),
                                                  Text(
                                                    'Low',
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  )
                                                ],
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
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                child: CustomTextField(
                                                  readOnly: true,
                                                  hintText: '24356',
                                                  label: 'Equipment Sr.No.:',
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                child: CustomTextField(
                                                  readOnly: true,
                                                  hintText: 'Justin Fernandez',
                                                  label: 'Manufacturer Name:',
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                child: CustomTextField(
                                                  readOnly: true,
                                                  hintText: 'ORD1678',
                                                  label:
                                                      'Order/Contract Reference No.:',
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                child: CustomTextField(
                                                  readOnly: true,
                                                  hintText: '10/01/2023',
                                                  label: 'Warranty Start Date:',
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                child: CustomTextField(
                                                  readOnly: true,
                                                  hintText: '12/06/2023',
                                                  label: 'Warranty End Date:',
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                child: CustomTextField(
                                                  readOnly: true,
                                                  hintText: '25000 INR',
                                                  label: 'Cost of Replacement:',
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),

                                          ///Additional Email
                                          SizedBox(
                                            height: 400,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
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
                                                            'Additional Emails'
                                                                .tr,
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
                                                                        .width /
                                                                    1.5,
                                                                child:
                                                                    DefaultTabController(
                                                                  length: 2,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(1.0),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              45,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(color: Colors.grey),
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(1),
                                                                          ),
                                                                          child:
                                                                              TabBar(
                                                                            labelPadding:
                                                                                EdgeInsets.symmetric(horizontal: 10.0),
                                                                            labelColor:
                                                                                Colors.black,
                                                                            indicator:
                                                                                BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(1)),
                                                                            unselectedLabelColor:
                                                                                Colors.black,
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
                                                                        height:
                                                                            250,
                                                                        width:
                                                                            MediaQuery.of(context).size.width /
                                                                                2,
                                                                        child: TabBarView(
                                                                            children: [
                                                                              ///First TabBar View
                                                                              Container(
                                                                                  // decoration: BoxDecoration(color: Colors.grey),
                                                                                  child: Column(
                                                                                children: [
                                                                                  SizedBox(
                                                                                    height: 15,
                                                                                  ),
                                                                                  emailDropdown(context, 'Ajit Kumar'),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  emailDropdown(context, 'Sujit Kumar'),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  emailDropdown(context, 'Amit Kumar'),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  emailDropdown(context, 'Joseph Fernandez'),
                                                                                ],
                                                                              )),

                                                                              ////Second TabBar View
                                                                              Center(child: Text('Second Tab'))
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.31,
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
                                                  child:
                                                      Text('Equipment Images'),
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 90,
                                                              top: 30),
                                                      child: CircleAvatar(
                                                        radius: 70,
                                                        child: Text(
                                                          'Drop Files Here',
                                                          style: Styles.white13,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 50,
                                                    ),
                                                    ////
                                                    Container(
                                                      height: 100,
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
                                                              title: '#'.tr,
                                                              action: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  // Text('#'),

                                                                  Text('Name'),
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
                                                            ),
                                                            Dimens.boxHeight10,
                                                            Wrap(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                        'Files list will appear heres'),
                                                                  ],
                                                                ),
                                                                // Row(
                                                                //   mainAxisAlignment:
                                                                //       MainAxisAlignment.spaceEvenly,
                                                                //   children: [
                                                                //     SizedBox(
                                                                //       width:
                                                                //           MediaQuery.of(context).size.width / 3.8,
                                                                //       child:
                                                                //           CustomMultiSelectDialogField(
                                                                //         initialValue: [],
                                                                //         // initialValue: (
                                                                //         //   controller
                                                                //         //         .selectedEquipmentCategoryIdList
                                                                //         //         .isNotEmpty)
                                                                //         //     ? controller
                                                                //         //         .selectedEquipmentCategoryIdList
                                                                //         //     : [],
                                                                //         // items: controller
                                                                //         //     .equipmentCategoryList
                                                                //         //     .map(
                                                                //         //       (equipmentCategory) =>
                                                                //         //           MultiSelectItem(
                                                                //         //         equipmentCategory?.id,
                                                                //         //         equipmentCategory?.name ??
                                                                //         //             '',
                                                                //         //       ),
                                                                //         //     )
                                                                //         //     .toList(),
                                                                //         onConfirm: (selectedOptionsList) => {
                                                                //           // controller
                                                                //           //     .equipmentCategoriesSelected(
                                                                //           //         selectedOptionsList),
                                                                //           // print(
                                                                //           //     'Equipment list ${controller.equipmentCategoryList}')
                                                                //         },
                                                                //         items: [],
                                                                //       ),
                                                                //     ),
                                                                //     ActionButton(
                                                                //       icon:
                                                                //           Icons.remove,
                                                                //       label:
                                                                //           'Delete',
                                                                //       // onPress:
                                                                //       //     () async {},
                                                                //       color:
                                                                //           Colors.red,
                                                                //       onPressed:
                                                                //           () {},
                                                                //     ),
                                                                //   ],
                                                                // )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
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
                                      Wrap(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomTextField(
                                                label:
                                                    'Immediate Corrective Action by Buyer: *',
                                                maxLine: 5,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 210,
                                          ),
                                          CustomTextField(
                                            label: 'Request to Manufacturee: *',
                                            maxLine: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),

                                      ////Supplier Name
                                      // Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: 53,
                                      //     ),
                                      //     CustomRichText(
                                      //         title: 'Supplier Name: '),
                                      //     SizedBox(
                                      //       width: 5,
                                      //     ),
                                      //     // Text("${controller.supplierNameList.length}"),
                                      //     SizedBox(
                                      //       width: MediaQuery.of(context)
                                      //               .size
                                      //               .width /
                                      //           3.8,
                                      //       child: Obx(
                                      //         () => DropdownWidget(
                                      //           dropdownList:
                                      //               controller.supplierNameList,
                                      //           isValueSelected: controller
                                      //               .isSupplierNameSelected
                                      //               .value,
                                      //           selectedValue: controller
                                      //               .selectedInventory.value,
                                      //           onValueChanged:
                                      //               controller.onValueChanged,
                                      //         ),
                                      //       ),

                                      //       // //   // LoginCustomTextfield(),
                                      //     ),
                                      //     //   SizedBox(
                                      //     //     width: MediaQuery.of(context).size.width / 3.8,

                                      //     //     child:
                                      //     //     // Obx(
                                      //     //     //   () =>
                                      //     // DropdownWidget(
                                      //     //   // dropdownList: controller.supplierNameList,
                                      //     //   // isValueSelected: controller.isSupplierNameSelected.value,
                                      //     //   // selectedValue: controller.selectedSupplier.value,
                                      //     //   onValueChanged:controller.onValueChanged,

                                      //     // ),

                                      //     //     // ),

                                      //     // //   //   // LoginCustomTextfield(),
                                      //     //  ),

                                      //     // SizedBox(
                                      //     //   width: MediaQuery.of(context).size.width / 3.8,
                                      //     //   child:
                                      //     //   Obx(
                                      //     //     () =>
                                      //     // DropdownWidget(
                                      //     //   dropdownList: controller.supplierNameList,
                                      //     //   isValueSelected: controller.isSupplierNameSelected.value,
                                      //     //   selectedValue: controller.selectedSupplier.value,
                                      //     //   onValueChanged:controller.onValueChanged,

                                      //     // ),

                                      //     //   ),

                                      //     // ),

                                      //   ],
                                      // ),

                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                    ],
                                  );
                                  // CustomTextField(
                                  //   label: 'Block: *',
                                  //   textController:
                                  //       controller.blockTextController,
                                  //   readOnly: true,
                                  //   onTap: () {
                                  //     controller.getBlockList('45');
                                  //     Get.defaultDialog(
                                  //       title: 'Block List',
                                  //       content: GetBuilder<HomeController>(
                                  //         id: 'block_list',
                                  //         builder: (_controller) {
                                  //           if (controller.blockList.isEmpty) {
                                  //             return Dimens.box0;
                                  //           }
                                  //           return Container(
                                  //             height: Get.height * .4,
                                  //             decoration: BoxDecoration(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(8),
                                  //             ),
                                  //             child: SingleChildScrollView(
                                  //               child: Column(
                                  //                 children: [
                                  //                   ...List.generate(
                                  //                     controller
                                  //                         .blockList.length,
                                  //                     (index) => ListTile(
                                  //                       onTap: () {
                                  //                         _controller.onSelectBlock(
                                  //                             _controller
                                  //                                     .blockList[
                                  //                                 index]);
                                  //                         Get.back();
                                  //                       },
                                  //                       title: Text(
                                  //                           '${_controller.blockList[index].name}'),
                                  //                     ),
                                  //                   ).toList(),
                                  //                 ],
                                  //               ),
                                  //             ),
                                  //           );
                                  //         },
                                  //       ),
                                  //     );
                                  //   },
                                  // );
                                }),
                            // Row(
                            //   children: [
                            //     CustomTextField(
                            //       label: 'Order/Contract Reference Number: *',
                            //       // textController:
                            //       //     controller.parentEquipmentTextController,
                            //       // readOnly: true,
                            //       onTap: () {
                            //         // controller.getEquipmentList(facilityId: '45');
                            //         // Get.defaultDialog(
                            //         //   title: 'Equipment List',
                            //         //   content: GetBuilder<HomeController>(
                            //         //     id: 'equipment_list',
                            //         //     builder: (_controller) {
                            //         //       if (controller.equipmentList.isEmpty) {
                            //         //         return CircularProgressIndicator
                            //         //             .adaptive();
                            //         //       }
                            //         //       return Container(
                            //         //         height: Get.height * .4,
                            //         //         decoration: BoxDecoration(
                            //         //           borderRadius:
                            //         //               BorderRadius.circular(8),
                            //         //         ),
                            //         //         child: SingleChildScrollView(
                            //         //           child: Column(
                            //         //             children: [
                            //         //               ...List.generate(
                            //         //                 controller.equipmentList.length,
                            //         //                 (index) => ListTile(
                            //         //                   onTap: () {
                            //         //                     _controller.onSelectEquipment(
                            //         //                         _controller
                            //         //                                 .equipmentList[
                            //         //                             index]);
                            //         //                     Get.back();
                            //         //                   },
                            //         //                   title: Text(
                            //         //                       '${_controller.equipmentList[index].name}'),
                            //         //                 ),
                            //         //               ).toList(),
                            //         //             ],
                            //         //           ),
                            //         //         ),
                            //         //       );
                            //         //     },
                            //         //   ),
                            //         // );
                            //       },
                            //     ),
                            //   ],
                            // ),
                            // Wrap(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         CustomTextField(
                            //           label: 'Cost Of Replacement: *',
                            //           // textController:
                            //           //     controller.categoryTextController,
                            //         ),
                            //         SizedBox(
                            //           width:
                            //               MediaQuery.of(context).size.width / 7,
                            //           child: Obx(
                            //             () => DropdownWidget(
                            //               dropdownList:
                            //                   controller.unitCurrencyList,
                            //               isValueSelected: controller
                            //                   .isUnitCurrencySelected.value,
                            //               selectedValue: controller
                            //                   .selectedUnitCurrency.value,
                            //               onValueChanged:
                            //                   controller.onValueChanged,
                            //             ),
                            //           ),

                            //           // CustomMultiSelectDialogField(
                            //           //   buttonText: 'Select Unit Currency',
                            //           //   title: 'Unit Currency',
                            //           //   initialValue: [],
                            //           //   items: [],
                            //           //   onConfirm: (selectedOptionsList) => {},
                            //           // ),
                            //         ),
                            //       ],
                            //     ),

                            //     // Container(
                            //     //   margin: Dimens.edgeInsets16,
                            //     //   width: 100,
                            //     //   color: Colors.black,
                            //     //   child: ActionButton(
                            //     //     label: 'Add',
                            //     //     onPressed: () {},
                            //     //     icon: Icons.add,
                            //     //     color: Colors.blue,
                            //     //   ),
                            //     // )
                            //   ],
                            // ),
                            // CustomTextField(
                            //   label: 'Warranty Start Date: *',
                            //   textController: controller.startDateTimeCtrlr2Web,
                            //   suffixIcon: Icon(
                            //     Icons.calendar_month,
                            //   ),
                            //   onTap: () {
                            //     pickDateTime2_web(context);
                            //   },
                            // ),
                            // CustomTextField(
                            //   label: 'Warranty End Date: *',
                            //   textController: controller.startDateTimeCtrlr3,
                            //   suffixIcon: Icon(
                            //     Icons.calendar_month,
                            //   ),
                            //   onTap: () {
                            //     pickDateTime3_web(context);
                            //   },
                            // ),

                            // CustomTextField(
                            //   label: 'Enter Multiplier: ',
                            //   textController:
                            //       controller.enterMultiplierTextController,
                            // ),

                            // SizedBox(
                            //   height: 400,
                            //   width: MediaQuery.of(context).size.width / 1.2,
                            //   child: Center(
                            //     child: Container(
                            //       margin: Dimens.edgeInsets16,
                            //       height: Get.height,
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //             color: Colors.grey.withOpacity(.3)),
                            //       ),
                            //       constraints: BoxConstraints(
                            //         maxWidth: 1100,
                            //       ),
                            //       child: SingleChildScrollView(
                            //         child: Column(
                            //           children: [
                            //             CustomAppBar(
                            //               title:
                            //                   'Schedule of Supplier Actions'.tr,
                            //               action: ActionButton(
                            //                 icon: Icons.add,
                            //                 label: 'Add',
                            //                 // onPress:
                            //                 //     () async {},
                            //                 color: Colors.blue,
                            //                 onPressed: () {},
                            //               ),
                            //             ),
                            //             Dimens.boxHeight10,
                            //             Wrap(
                            //               children: [
                            //                 Row(
                            //                   children: [
                            //                     SizedBox(
                            //                       width: 20,
                            //                     ),
                            //                     Text('#'),
                            //                     SizedBox(
                            //                       width: 25,
                            //                     ),
                            //                     Text('Supplier Action'),
                            //                     SizedBox(
                            //                       width: 375,
                            //                     ),
                            //                     Text('Required by Date'),
                            //                     SizedBox(
                            //                       width: 150,
                            //                     ),
                            //                     Text('Action'),
                            //                   ],
                            //                 ),
                            //                 supplierActionData(
                            //                     '1',
                            //                     'Root Cause Analysis Report',
                            //                     context,
                            //                     0),
                            //                 supplierActionData(
                            //                     '2',
                            //                     'Material Replinishment',
                            //                     context,
                            //                     1),
                            //                 supplierActionData(
                            //                     '3',
                            //                     'Preventive Action Plan',
                            //                     context,
                            //                     2),
                            //                 supplierActionData(
                            //                     '4',
                            //                     'Claim Closure Date',
                            //                     context,
                            //                     3)
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            Wrap(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 250,
                                  width:
                                      MediaQuery.of(context).size.width / 1.31,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        child: Text('Attachments'),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 90, top: 30),
                                            child: CircleAvatar(
                                              radius: 70,
                                              child: Text(
                                                'Drop Files Here',
                                                style: Styles.white13,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          ////
                                          Container(
                                            height: 100,
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
                                                    title: '#'.tr,
                                                    action: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        // Text('#'),

                                                        Text('Name'),
                                                        Dimens.boxWidth20,
                                                        Text('Upload Progress'),
                                                        Dimens.boxWidth20,
                                                        Text(
                                                            'Document Category'),
                                                        Dimens.boxWidth20,
                                                        Text('Size'),
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
                                                          Text(
                                                              'Files list will appear heres'),
                                                        ],
                                                      ),
                                                      // Row(
                                                      //   mainAxisAlignment:
                                                      //       MainAxisAlignment.spaceEvenly,
                                                      //   children: [
                                                      //     SizedBox(
                                                      //       width:
                                                      //           MediaQuery.of(context).size.width / 3.8,
                                                      //       child:
                                                      //           CustomMultiSelectDialogField(
                                                      //         initialValue: [],
                                                      //         // initialValue: (
                                                      //         //   controller
                                                      //         //         .selectedEquipmentCategoryIdList
                                                      //         //         .isNotEmpty)
                                                      //         //     ? controller
                                                      //         //         .selectedEquipmentCategoryIdList
                                                      //         //     : [],
                                                      //         // items: controller
                                                      //         //     .equipmentCategoryList
                                                      //         //     .map(
                                                      //         //       (equipmentCategory) =>
                                                      //         //           MultiSelectItem(
                                                      //         //         equipmentCategory?.id,
                                                      //         //         equipmentCategory?.name ??
                                                      //         //             '',
                                                      //         //       ),
                                                      //         //     )
                                                      //         //     .toList(),
                                                      //         onConfirm: (selectedOptionsList) => {
                                                      //           // controller
                                                      //           //     .equipmentCategoriesSelected(
                                                      //           //         selectedOptionsList),
                                                      //           // print(
                                                      //           //     'Equipment list ${controller.equipmentCategoryList}')
                                                      //         },
                                                      //         items: [],
                                                      //       ),
                                                      //     ),
                                                      //     ActionButton(
                                                      //       icon:
                                                      //           Icons.remove,
                                                      //       label:
                                                      //           'Delete',
                                                      //       // onPress:
                                                      //       //     () async {},
                                                      //       color:
                                                      //           Colors.red,
                                                      //       onPressed:
                                                      //           () {},
                                                      //     ),
                                                      //   ],
                                                      // )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CustomRichText(title: 'Select Approver: '),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.8,
                                    child: Obx(
                                      () => DropdownWidget(
                                        dropdownList: controller.employeeList,
                                        isValueSelected: controller
                                            .isemployeeListSelected.value,
                                        selectedValue: controller
                                            .selectedEmployeeList.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                ),
                                CustomElevatedButton(
                                  backgroundColor: Colors.green,
                                  onPressed: () {},
                                  text: 'Save As Draft',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CustomElevatedButton(
                                  backgroundColor: Colors.green,
                                  onPressed: () {
                                    showAlertDialog();
                                  },
                                  text: 'Submit For Release',
                                ),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // ),
      );

  ///Alert Dialog
  static void showAlertDialog({
    int? facility_id,
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(NewWarrantyClaimDialog());
  }

  /// For Failure Date Time
  Future pickDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedDateTimeWeb.value;
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
    controller.selectedDateTimeWeb.value = dateTime;
    controller.startDateTimeCtrlrWeb
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedDateTimeWeb.value;
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
    DateTime dateTime = controller.selectedDateTimeWeb.value;
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
  Future pickDateTime2_web(BuildContext context) async {
    var dateTime = controller.selectedBreakdownTime2.value;
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
    controller.selectedBreakdownTime2.value = dateTime;
    controller.startDateTimeCtrlr2Web
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlr2Web.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate2_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedBreakdownTime2.value;
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
    DateTime dateTime = controller.selectedBreakdownTime2.value;
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
  Future pickDateTime3_web(BuildContext context) async {
    var dateTime = controller.selectedBreakdownTime3.value;
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
    controller.selectedBreakdownTime3.value = dateTime;
    controller.startDateTimeCtrlr3
      ..text = DateFormat('dd-MMM-yyyy HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.startDateTimeCtrlr3.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickDate3_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedBreakdownTime3.value;
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
    DateTime dateTime = controller.selectedBreakdownTime3.value;
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

  supplierActionData(
      String? title, String? title2, BuildContext context, int? position) {
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
              width: 40,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 206, 204, 204)),
              child: Center(child: Text('$title2')),
            )),
          ),
          Checkbox(
              value: valuefirst,
              onChanged: (bool? value) {
                this.valuefirst = value!;
              }),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3.8,
            child: CustomTextField(
              label: '',
            ),
          ),
          // position == 1 || position == 2 || position == 3
          // ?
          ActionButton(
            icon: Icons.remove,
            label: 'Delete',
            // onPress:
            //     () async {},
            color: Colors.red,
            onPressed: () {},
          )
          // : Text('data')
        ],
      ),
    );
  }

  emailDropdown(BuildContext context, String? title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.8,
          child: CustomMultiSelectDialogField(
            buttonText: '$title',
            title: 'Email',
            initialValue: [],
            // initialValue: (
            //   controller
            //         .selectedEquipmentCategoryIdList
            //         .isNotEmpty)
            //     ? controller
            //         .selectedEquipmentCategoryIdList
            //     : [],
            // items: controller
            //     .equipmentCategoryList
            //     .map(
            //       (equipmentCategory) =>
            //           MultiSelectItem(
            //         equipmentCategory?.id,
            //         equipmentCategory?.name ??
            //             '',
            //       ),
            //     )
            //     .toList(),
            onConfirm: (selectedOptionsList) => {
              // controller
              //     .equipmentCategoriesSelected(
              //         selectedOptionsList),
              // print(
              //     'Equipment list ${controller.equipmentCategoryList}')
            },
            items: [],
          ),
        ),
        ActionButton(
          icon: Icons.delete_outline,
          label: 'Delete',
          // onPress:
          //     () async {},
          color: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}
