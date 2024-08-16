import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';

import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_add_inventory/view/view_calibartion_widget.dart';
import 'package:cmms/app/view_add_inventory/view/view_manufacturar_tab_widget.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_controller.dart';

import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'view/view_warranty_tab_widget.dart';

class ViewAddInventoryScreen extends GetView<ViewAddInventoryController> {
  ViewAddInventoryScreen({super.key});

  final ViewAddInventoryController controller = Get.find();
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    // Responsive.isMobile(context) || Responsive.isTablet(context)
                    //     ? Dimens.box0
                    //     : HomeDrawer(),
                    Expanded(
                      child: Center(
                        child: Container(
                          margin: Dimens.edgeInsets5,
                          height: Get.height,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(.3)),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: Get.width,
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  HeaderWidget(),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
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
                                        Text("DASHBOARD ",
                                            style: Styles.greyMediumLight12),
                                        GestureDetector(
                                          onTap: () {
                                            Get.offNamed(Routes.inventoryList);
                                          },
                                          child: Text(" / ASSETS",
                                              style: Styles.greyMediumLight12),
                                        ),
                                        Text(
                                          "/VIEW ASSETS",
                                          style: Styles.greyLight14,
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),

                                  Dimens.boxHeight10,
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller
                                                    .editAddInventoryDetailsModel
                                                    .value!
                                                    .warrantyStatus ==
                                                "Inactive"
                                            ? Colors.red
                                            : Colors.green,
                                        borderRadius: BorderRadius.circular(
                                            8), // Adjust the radius as needed
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 5),
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        " Warranty Status:${controller.editAddInventoryDetailsModel.value!.warrantyStatus}",
                                        style: TextStyle(
                                          color: Colors
                                              .white, // Text color set to white for visibility on red/green background
                                        ),
                                      ),
                                    ),
                                  ),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // AddPhoto(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              CustomRichText(title: 'Block'),
                                              IgnorePointer(
                                                ignoring: true,
                                                child: DropdownWebWidget(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  isEditable: true,
                                                  margin: Dimens.edgeInsets5,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  dropdownList:
                                                      controller.blocksList,
                                                  isValueSelected: controller
                                                      .isBlocksSelected.value,
                                                  selectedValue: controller
                                                      .selectedBlocks.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomRichText(title: "Type"),
                                              IgnorePointer(
                                                ignoring: true,
                                                child: DropdownWebWidget(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  margin: Dimens.edgeInsets5,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  dropdownList:
                                                      controller.typeNameList,
                                                  isValueSelected: controller
                                                      .isTypeNameSelected.value,
                                                  selectedValue: controller
                                                      .selectedTypeName.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomRichText(title: "Status"),
                                              IgnorePointer(
                                                ignoring: true,
                                                child: DropdownWebWidget(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  margin: Dimens.edgeInsets5,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  dropdownList:
                                                      controller.statusNameList,
                                                  isValueSelected: controller
                                                      .isStatusNameSelected
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedStatusName.value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  title: "Asset Name"),
                                              IgnorePointer(
                                                ignoring: true,
                                                child: Container(
                                                  // decoration: BoxDecoration(
                                                  //     border: Border.all(
                                                  //   color: Color(0xFE50000),
                                                  //   width: 0.5,
                                                  // )),
                                                  height: 45,
                                                  margin: Dimens.edgeInsets5,
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    minWidth: 100,
                                                  ),
                                                  child: LoginCustomTextfield(
                                                    textController: controller
                                                        .assetsNameCtrlr,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  includeAsterisk: false,
                                                  title: 'Parent Equipment'),
                                              IgnorePointer(
                                                ignoring: true,
                                                child: DropdownWebWidget(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  margin: Dimens.edgeInsets5,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  dropdownList: controller
                                                      .eqipmentNameList,
                                                  isValueSelected: controller
                                                      .isEquipmentNameSelected
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedEquipmentName
                                                      .value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomRichText(title: "Category"),
                                              IgnorePointer(
                                                ignoring: true,
                                                child: DropdownWebWidget(
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
                                                      color: ColorValues
                                                          .whiteColor,
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  margin: Dimens.edgeInsets5,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      5,
                                                  dropdownList: controller
                                                      .equipmentCategoryList,
                                                  isValueSelected: controller
                                                      .isEquipmentCategoryNameSelected
                                                      .value,
                                                  selectedValue: controller
                                                      .selectedEquipmentCategoryName
                                                      .value,
                                                  onValueChanged:
                                                      controller.onValueChanged,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomRichText(
                                                  includeAsterisk: false,
                                                  title: "Serial No"),
                                              IgnorePointer(
                                                ignoring: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                    color: Color(0xFE50000),
                                                    width: 0.5,
                                                  )),
                                                  height: 45,
                                                  margin: Dimens.edgeInsets5,
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    minWidth: 100,
                                                  ),
                                                  child: LoginCustomTextfield(
                                                    enabled: false,
                                                    textController: controller
                                                        .serialNoCtrlr,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomRichText(
                                                title: "Asset Description",
                                              ),
                                              IgnorePointer(
                                                ignoring: true,
                                                child: Container(
                                                  // decoration: BoxDecoration(
                                                  //     border: Border.all(
                                                  //   color: Color(0xFE50000),
                                                  //   width: 0.5,
                                                  // )),
                                                  height: 45,
                                                  margin: Dimens.edgeInsets5,
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    minWidth: 100,
                                                  ),
                                                  child: LoginCustomTextfield(
                                                    // enabled: false,
                                                    textController: controller
                                                        .assesDiscriptionCtrlr,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: Dimens.edgeInsets5,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey.withOpacity(.3),
                                      ),
                                    ),
                                    child: DefaultTabController(
                                      length: 4,
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.grey.withOpacity(.2),
                                            child: TabBar(
                                              tabs: [
                                                Container(
                                                  height: 40,
                                                  child: Center(
                                                    child: Text('Calibration'),
                                                  ),
                                                ),
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
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              children: [
                                                ViewCalibrationTabWidget(),
                                                ViewWarrantyTabWidget(),
                                                ViewManufacturarTabWidget(),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: IgnorePointer(
                                                    ignoring: true,
                                                    child: Container(
                                                      height: Get.height * 0.2,
                                                      width: Get.width,
                                                      child: Row(//
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Dimens.boxHeight15,
                                  // controller.id == null
                                  //     ? CustomElevatedButton(
                                  //         backgroundColor: ColorValues.appGreenColor,
                                  //         text: 'Submit',
                                  //         onPressed: () {
                                  //           controller.AddInventory();
                                  //         },
                                  //       )
                                  //     : CustomElevatedButton(
                                  //         backgroundColor:
                                  //             ColorValues.appDarkBlueColor,
                                  //         text: 'Update',
                                  //         onPressed: () {
                                  //           controller.updateInventory();
                                  //         },
                                  //       ),
                                  Dimens.boxHeight30,
                                ],
                              ),
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
      );
}
