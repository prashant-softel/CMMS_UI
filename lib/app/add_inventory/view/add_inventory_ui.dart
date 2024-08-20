import 'package:cmms/app/add_inventory/add_inventory_controller.dart';
import 'package:cmms/app/add_inventory/view/calibartion_widget.dart';
import 'package:cmms/app/add_inventory/view/manufacturar_tab_widget.dart';
import 'package:cmms/app/add_inventory/view/warranty_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/controllers/file_upload_controller2.dart';
import 'package:cmms/app/controllers/file_upload_controller3.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/file_upload_with_dropzone_widget.dart';

class AddInventoryScreen extends GetView<AddInventoryController> {
  AddInventoryScreen({super.key});

  final AddInventoryController controller = Get.find();
  final HomeController homecontroller = Get.find();
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
  final FileUploadController2 dropzoneController2 =
      Get.put(FileUploadController2());
  final FileUploadController3 dropzoneController3 =
      Get.put(FileUploadController3());
  @override
  Widget build(BuildContext context) => SelectionArea(
        child: SelectionArea(
          child: Scaffold(
            appBar: Responsive.isMobile(context)
                ? AppBar(
                    // title: HeaderWidget(),
                    elevation: 0,
                    // toolbarHeight: 60,
                    automaticallyImplyLeading: false,
                  )
                : null,
            drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
                ? HomeDrawer()
                : null,
            body: Obx(
              () => Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 450),
                    margin: EdgeInsets.only(
                        left: homecontroller.menuButton.value ? 250.0 : 70.0),
                    width: Get.width,
                    height: Get.height,
                    child: Row(children: [
                      Expanded(
                        child: Obx(
                          () => Container(
                            margin: Dimens.edgeInsets5,
                            height: Get.height,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3)),
                            ),
                            constraints: BoxConstraints(
                              maxWidth: Get.width,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                          InkWell(
                                              onTap: () {
                                                Get.offNamed(Routes.home);
                                              },
                                              child: Text("DASHBOARD ",
                                                  style: Styles.greyLight14)),
                                          InkWell(
                                            onTap: () {
                                              Get.offNamed(
                                                  Routes.inventoryList);
                                            },
                                            child: Text("/ ASSET LIST",
                                                style: Styles.greyLight14),
                                          ),
                                          Text(
                                            controller.inventoryId.value == 0
                                                ? "/ ADD ASSETS"
                                                : "/ UPDATE ASSETS",
                                            style: Styles.greyLight14,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Dimens.boxHeight10,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 210,
                                          child: Stack(
                                            children: [
                                              controller.selectedImagePath.value
                                                      .isNotEmpty
                                                  ? GestureDetector(
                                                      onTap: () => controller
                                                          .getImage(ImageSource
                                                              .gallery),
                                                      child: Container(
                                                        height: controller
                                                            .thumbnailSize,
                                                        width: controller
                                                            .thumbnailSize,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          child: Image.memory(
                                                            controller
                                                                .selectedImageBytes
                                                                .value,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: controller
                                                          .thumbnailSize,
                                                      width: controller
                                                          .thumbnailSize,
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            255, 195, 192, 192),
                                                        border: Border.all(
                                                          color: ColorValues
                                                              .appLightGreyColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.image,
                                                            size: 70,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    215,
                                                                    192,
                                                                    141),
                                                          ),
                                                          Dimens.boxHeight10,
                                                          Text("Upload Photo",
                                                              style: Styles
                                                                  .greyMediumLight12)
                                                        ],
                                                      ),
                                                    ),
                                              Positioned(
                                                top: 150,
                                                left: 100,
                                                right: 0,
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.getImage(
                                                          ImageSource.gallery);
                                                    },
                                                    child: Container(
                                                      height: 45,
                                                      width: 45,
                                                      decoration: BoxDecoration(
                                                        color: ColorValues
                                                            .appDarkBlueColor,
                                                        border: Border.all(
                                                          color: ColorValues
                                                              .appDarkBlueColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          size: 40,
                                                          color: ColorValues
                                                              .whiteColor,
                                                        ), //Circ
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                CustomRichText(title: 'Block'),
                                                SizedBox(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: DropdownWebStock(
                                                      margin:
                                                          Dimens.edgeInsets5,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      dropdownList:
                                                          controller.blocksList,
                                                      isValueSelected:
                                                          controller
                                                              .isBlocksSelected
                                                              .value,
                                                      selectedValue: controller
                                                          .selectedBlocks.value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRichText(title: "Type"),
                                                SizedBox(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: DropdownWebStock(
                                                      margin:
                                                          Dimens.edgeInsets5,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      dropdownList: controller
                                                          .typeNameList,
                                                      isValueSelected: controller
                                                          .isTypeNameSelected
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedTypeName
                                                          .value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRichText(title: "Status"),
                                                SizedBox(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: DropdownWebStock(
                                                      margin:
                                                          Dimens.edgeInsets5,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      dropdownList: controller
                                                          .statusNameList,
                                                      isValueSelected: controller
                                                          .isStatusNameSelected
                                                          .value,
                                                      selectedValue: controller
                                                          .selectedStatusName
                                                          .value,
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: "Asset Name"),
                                                Container(
                                                  // decoration: BoxDecoration(
                                                  //   boxShadow: [
                                                  //     BoxShadow(
                                                  //       color: Colors.black26,
                                                  //       offset: const Offset(
                                                  //         5.0,
                                                  //         5.0,
                                                  //       ),
                                                  //       blurRadius: 5.0,
                                                  //       spreadRadius: 1.0,
                                                  //     ),
                                                  //   ],
                                                  //   borderRadius:
                                                  //       BorderRadius.circular(
                                                  //           5),
                                                  // ),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.040,
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
                                                    focusNode:
                                                        controller.nameFocus,
                                                    scroll:
                                                        controller.nameScroll,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .deny(
                                                        RegExp('[\'^]'),
                                                      )
                                                    ],
                                                    errorController: controller
                                                            .isAssetsNameInvalid
                                                            .value
                                                        ? "Required field"
                                                        : null,
                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          1) {
                                                        controller
                                                            .isAssetsNameInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isAssetsNameInvalid
                                                            .value = true;
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            controller.selectedEquipmentCategoryNameId
                                                        .value ==
                                                    9
                                                ? Row(
                                                    children: [
                                                      CustomRichText(
                                                          title:
                                                              "Module Quantity"),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              offset:
                                                                  const Offset(
                                                                5.0,
                                                                5.0,
                                                              ),
                                                              blurRadius: 5.0,
                                                              spreadRadius: 1.0,
                                                            ),
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.040,
                                                        margin:
                                                            Dimens.edgeInsets5,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                          minWidth: 100,
                                                        ),
                                                        child:
                                                            LoginCustomTextfield(
                                                          textController: controller
                                                              .moduleQuantityCtrlr,
                                                          scroll: controller
                                                              .nameScroll,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .deny(
                                                              RegExp('[\'^]'),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Dimens.box0
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
                                                SizedBox(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: DropdownWebStock(
                                                      margin:
                                                          Dimens.edgeInsets5,
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    title: "Category"),
                                                SizedBox(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: DropdownWebStock(
                                                      margin:
                                                          Dimens.edgeInsets5,
                                                      width:
                                                          MediaQuery.of(context)
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
                                                      onValueChanged: controller
                                                          .onValueChanged,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                    includeAsterisk: false,
                                                    title: "Serial No"),
                                                Container(
                                                  // decoration: BoxDecoration(
                                                  //   boxShadow: [
                                                  //     BoxShadow(
                                                  //       color: Colors.black26,
                                                  //       offset: const Offset(
                                                  //         5.0,
                                                  //         5.0,
                                                  //       ),
                                                  //       blurRadius: 5.0,
                                                  //       spreadRadius: 1.0,
                                                  //     ),
                                                  //   ],
                                                  //   borderRadius:
                                                  //       BorderRadius.circular(
                                                  //           5),
                                                  // ),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.040,
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
                                                    keyboardType:
                                                        TextInputType.number,
                                                    // inputFormatters: <TextInputFormatter>[
                                                    //   FilteringTextInputFormatter
                                                    //       .digitsOnly
                                                    // ],
                                                    textController: controller
                                                        .serialNoCtrlr,
                                                    // errorController: controller
                                                    //         .isSerialNoInvalid
                                                    //         .value
                                                    //     ? "Required field"
                                                    //     : null,
                                                    // onChanged: (value) {
                                                    //   if (value.trim().length >
                                                    //       1) {
                                                    //     controller
                                                    //         .isSerialNoInvalid
                                                    //         .value = false;
                                                    //   } else {
                                                    //     controller
                                                    //         .isSerialNoInvalid
                                                    //         .value = true;
                                                    //   }
                                                    // },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CustomRichText(
                                                  title: "Asset Description",
                                                ),
                                                Container(
                                                  // decoration: BoxDecoration(
                                                  //   boxShadow: [
                                                  //     BoxShadow(
                                                  //       color: Colors.black26,
                                                  //       offset: const Offset(
                                                  //         5.0,
                                                  //         5.0,
                                                  //       ),
                                                  //       blurRadius: 5.0,
                                                  //       spreadRadius: 1.0,
                                                  //     ),
                                                  //   ],
                                                  //   borderRadius:
                                                  //       BorderRadius.circular(
                                                  //           5),
                                                  // ),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.040,
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
                                                        .assesDiscriptionCtrlr,
                                                    focusNode:
                                                        controller.descFocus,
                                                    scroll:
                                                        controller.descScroll,
                                                    errorController: controller
                                                            .isAssetDescInvalid
                                                            .value
                                                        ? "Required field"
                                                        : null,
                                                    onChanged: (value) {
                                                      if (value.trim().length >
                                                          1) {
                                                        controller
                                                            .isAssetDescInvalid
                                                            .value = false;
                                                      } else {
                                                        controller
                                                            .isAssetDescInvalid
                                                            .value = true;
                                                      }
                                                    },
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
                                              color:
                                                  Colors.grey.withOpacity(.2),
                                              child: TabBar(
                                                tabs: [
                                                  Container(
                                                    height: 40,
                                                    child: Center(
                                                      child:
                                                          Text('Calibration'),
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
                                                  CalibrationTabWidget(),
                                                  WarrantyTabWidget(),
                                                  ManufacturarTabWidget(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 60),
                                                    child: SizedBox(
                                                      height: 300,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
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
                                                          child: Column(
                                                            children: [
                                                              CustomAppBar(
                                                                title:
                                                                    'File Attach Here'
                                                                        .tr,
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Wrap(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      /// FILE UPLOAD WIDGET
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              Get.height * 0.2,
                                                                          width:
                                                                              Get.width,
                                                                          child: Row(
                                                                              //
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: FileUploadWidgetWithDropzone(),
                                                                                ),
                                                                                Dimens.boxWidth10,
                                                                                Expanded(flex: 8, child: FileUploadDetailsWidgetWeb2()),
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
                                  ]),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                  AnimatedPositioned(
                      child: HomeDrawer(),
                      duration: Duration(milliseconds: 450)),
                ],
              ),
            ),
            floatingActionButton: Obx(
              () => Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    controller.inventoryId.value == 0
                        ? Container(
                            height: 40,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.appGreenColor,
                              text: 'Submit',
                              onPressed: () {
                                controller.isFormValid.value = true;
                                controller.AddInventory(
                                    fileIds: dropzoneController.fileIds);
                              },
                            ),
                          )
                        : Container(
                            height: 40,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.appDarkBlueColor,
                              text: 'Update',
                              onPressed: () {
                                // controller.isFormValid.value = true;
                                controller.updateInventory(
                                    fileIds: dropzoneController.fileIds);
                              },
                            ),
                          ),
                    Spacer()
                  ]),
            ),
          ),
        ),
      );
}
