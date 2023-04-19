import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class NewWarrantyClaimListWeb extends GetView<HomeController> {
  NewWarrantyClaimListWeb({super.key});

  // final controller = Get.find<HomeController>();

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
                        SizedBox(height: 30,),
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
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomRichText(
                                                  title:
                                                      'Equipment Categories: '),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.8,
                                                child:
                                                    CustomMultiSelectDialogField(
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
                                                  onConfirm:
                                                      (selectedOptionsList) => {
                                                    // controller
                                                    //     .equipmentCategoriesSelected(
                                                    //         selectedOptionsList),
                                                    // print(
                                                    //     'Equipment list ${controller.equipmentCategoryList}')
                                                  },
                                                  items: [],
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
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.8,
                                                child:
                                                    CustomMultiSelectDialogField(
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
                                                  onConfirm:
                                                      (selectedOptionsList) => {
                                                    // controller
                                                    //     .equipmentCategoriesSelected(
                                                    //         selectedOptionsList),
                                                    // print(
                                                    //     'Equipment list ${controller.equipmentCategoryList}')
                                                  },
                                                  items: [],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 53,
                                          ),
                                          CustomRichText(
                                              title: 'Supplier Name: '),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3.8,
                                            child: CustomMultiSelectDialogField(
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
                                              onConfirm:
                                                  (selectedOptionsList) => {
                                                // controller
                                                //     .equipmentCategoriesSelected(
                                                //         selectedOptionsList),
                                                // print(
                                                //     'Equipment list ${controller.equipmentCategoryList}')
                                              },
                                              items: [],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.75,
                                            child: CustomTextField(
                                              label: 'Equipment Sr.No.',
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),

                                      ///Additional Email
                                      SizedBox(
                                        height: 350,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.38,
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
                                                        'Additional Emails'.tr,
                                                  ),
                                                  Dimens.boxHeight10,
                                                  Wrap(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                          Text('Employee'),
                                                          SizedBox(
                                                            width: 50,
                                                          ),
                                                          Text(
                                                              'External Emails'),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          SizedBox(
                                                            height: 30,
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 0.25,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.2,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .black),
                                                      ),

                                                      /// Employee
                                                      SizedBox(
                                                        height: 220,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            1.5,
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
                                                                        'Employee'
                                                                            .tr,
                                                                    action:
                                                                        ActionButton(
                                                                      icon: Icons
                                                                          .add,
                                                                      label:
                                                                          'Add',
                                                                      // onPress:
                                                                      //     () async {},
                                                                      color: Colors
                                                                          .blue, 
                                                                          onPressed: () {  },
                                                                    ),
                                                                  ),
                                                                  Dimens
                                                                      .boxHeight10,
                                                                  Wrap(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                30,
                                                                          ),
                                                                          Text(
                                                                              'Email'),
                                                                          SizedBox(
                                                                            width:
                                                                                80,
                                                                          ),
                                                                          Text(
                                                                              'Action'),
                                                                          SizedBox(
                                                                            height:
                                                                                50,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 3.8,
                                                                            child:
                                                                                CustomMultiSelectDialogField(
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
                                                                            icon:
                                                                                Icons.remove,
                                                                            label:
                                                                                'Delete',
                                                                            // onPress:
                                                                            //     () async {},
                                                                            color:
                                                                                Colors.red, 
                                                                                onPressed: () {  },
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
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
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
                            CustomTextField(
                              label: 'Parent Equipment *',
                              textController:
                                  controller.parentEquipmentTextController,
                              readOnly: true,
                              onTap: () {
                                controller.getEquipmentList(facilityId: '45');
                                Get.defaultDialog(
                                  title: 'Equipment List',
                                  content: GetBuilder<HomeController>(
                                    id: 'equipment_list',
                                    builder: (_controller) {
                                      if (controller.equipmentList.isEmpty) {
                                        return CircularProgressIndicator
                                            .adaptive();
                                      }
                                      return Container(
                                        height: Get.height * .4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              ...List.generate(
                                                controller.equipmentList.length,
                                                (index) => ListTile(
                                                  onTap: () {
                                                    _controller.onSelectEquipment(
                                                        _controller
                                                                .equipmentList[
                                                            index]);
                                                    Get.back();
                                                  },
                                                  title: Text(
                                                      '${_controller.equipmentList[index].name}'),
                                                ),
                                              ).toList(),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            Wrap(
                              children: [
                                CustomTextField(
                                  label: 'Type *',
                                  textController: controller.typeTextController,
                                ),
                                Container(
                                  margin: Dimens.edgeInsets16,
                                  width: 100,
                                  color: Colors.black,
                                  child: ActionButton(
                                    label: 'Add',
                                    // onPress: () {},
                                    icon: Icons.add,
                                    color: Colors.blue, 
                                    onPressed: () {  }, 
                                    
                                  ),
                                )
                              ],
                            ),
                            Wrap(
                              children: [
                                CustomTextField(
                                  label: 'Category *',
                                  textController:
                                      controller.categoryTextController,
                                ),
                                Container(
                                  margin: Dimens.edgeInsets16,
                                  width: 100,
                                  color: Colors.black,
                                  child: ActionButton(
                                    label: 'Add',
                                    onPressed: () {},
                                    icon: Icons.add,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                            CustomTextField(
                              label: 'Serial No.',
                              textController: controller.serialNoTextController,
                            ),
                            CustomTextField(
                              label: 'Status',
                              textController: controller.statusTextController,
                            ),
                            CustomTextField(
                              label: 'Asset Name: *',
                              textController:
                                  controller.assetNameTextController,
                            ),
                            CustomTextField(
                              label: 'Enter Multiplier: ',
                              textController:
                                  controller.enterMultiplierTextController,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Asset Description: ',
                                    maxLine: 6,
                                    textController:
                                        controller.assetDescpTextController,
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextField(
                                      label: 'Calibration Frequency: ',
                                      width: 300,
                                    ),
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding:
                                              Dimens.edgeInsets16_0_16_0,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CustomTextField(
                                  label: 'Last calibration date: ',
                                ),
                              ],
                            ),
                            Wrap(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomTextField(
                                      label: 'Calibration remainder In: ',
                                      width: 300,
                                    ),
                                    Container(
                                      width: 100,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding:
                                              Dimens.edgeInsets16_0_16_0,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: .2),
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: Dimens.edgeInsets16,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Calibration cirtificate'),
                                      Dimens.boxWidth10,
                                      ActionButton(
                                        label: 'Upload cirtification file',
                                        onPressed: () {},
                                        icon: Icons.file_upload_outlined,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: Dimens.edgeInsets16,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(.3),
                                ),
                              ),
                              child: DefaultTabController(
                                length: 3,
                                child: Column(
                                  children: [
                                    Container(
                                      color: Colors.grey.withOpacity(.2),
                                      child: TabBar(
                                        tabs: [
                                          Container(
                                            height: 40,
                                            child: Center(
                                              child: Text('Warranties'),
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            child: Center(
                                              child: Text('Purchasing'),
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            child: Center(
                                              child: Text('Files'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 400,
                                      child: TabBarView(
                                        children: [
                                          WarrantyTab(),
                                          ManufacturarTab(),
                                          Files(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
          ],
        ),
      );
}
