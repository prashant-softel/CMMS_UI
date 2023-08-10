import 'package:cmms/app/add_inventory/add_inventory_controller.dart';
import 'package:cmms/app/add_inventory/view/calibartion_widget.dart';
import 'package:cmms/app/add_inventory/view/manufacturar_tab_widget.dart';
import 'package:cmms/app/add_inventory/view/warranty_widget.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../widgets/file_upload_with_dropzone_widget.dart';

class AddInventoryScreen extends GetView<AddInventoryController> {
  AddInventoryScreen({super.key});

  final AddInventoryController controller = Get.find();
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: Responsive.isDesktop(context)
            ? AppBar(
                title: HeaderWidget(),
                elevation: 0,
                toolbarHeight: 60,
                automaticallyImplyLeading: false,
              )
            : AppBar(
                title: Text('Calibration History'),
                centerTitle: true,
                elevation: 0,
              ),
        drawer: Responsive.isMobile(context) || Responsive.isTablet(context)
            ? HomeDrawer()
            : null,
        body: Row(children: [
          Responsive.isMobile(context) || Responsive.isTablet(context)
              ? Dimens.box0
              : HomeDrawer(),
          Expanded(
            child: Obx(
              () => Center(
                child: Container(
                  margin: Dimens.edgeInsets5,
                  height: Get.height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: Get.width,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                  Text(" /DASHBOARD ",
                                      style: Styles.greyMediumLight12),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(" / Assets",
                                        style: Styles.greyMediumLight12),
                                  ),
                                  Text(
                                    "/ ADD Assets",
                                    style: Styles.greyLight14,
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.menu,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            ),
                            Dimens.boxHeight10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 210,
                                  child: Stack(
                                    children: [
                                      controller.selectedImagePath.value
                                              .isNotEmpty
                                          ? GestureDetector(
                                              onTap: () => controller.getImage(
                                                  ImageSource.gallery),
                                              child: Container(
                                                height:
                                                    controller.thumbnailSize,
                                                width: controller.thumbnailSize,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                              height: controller.thumbnailSize,
                                              width: controller.thumbnailSize,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 195, 192, 192),
                                                border: Border.all(
                                                  color: ColorValues
                                                      .appLightGreyColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.image,
                                                    size: 70,
                                                    color: Color.fromARGB(
                                                        255, 215, 192, 141),
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
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  size: 40,
                                                  color: ColorValues.whiteColor,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        CustomRichText(title: 'Block'),
                                        SizedBox(
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ),
                                            ],
                                            margin: Dimens.edgeInsets5,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            dropdownList: controller.blocksList,
                                            isValueSelected: controller
                                                .isBlocksSelected.value,
                                            selectedValue:
                                                controller.selectedBlocks.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomRichText(title: "Type"),
                                        SizedBox(
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                        SizedBox(
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                                .isStatusNameSelected.value,
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
                                        CustomRichText(title: "Asset Name"),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            color: Color(0xFE50000),
                                            width: 0.5,
                                          )),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.040,
                                          margin: Dimens.edgeInsets5,
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            minWidth: 100,
                                          ),
                                          child: LoginCustomTextfield(
                                            textController:
                                                controller.assetsNameCtrlr,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        CustomRichText(
                                            title: 'Parent Equipment'),
                                        SizedBox(
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                                controller.eqipmentNameList,
                                            isValueSelected: controller
                                                .isEquipmentNameSelected.value,
                                            selectedValue: controller
                                                .selectedEquipmentName.value,
                                            onValueChanged:
                                                controller.onValueChanged,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomRichText(title: "Category"),
                                        SizedBox(
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
                                                color: ColorValues.whiteColor,
                                                offset: const Offset(0.0, 0.0),
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
                                        CustomRichText(title: "Serial No"),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            color: Color(0xFE50000),
                                            width: 0.5,
                                          )),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.040,
                                          margin: Dimens.edgeInsets5,
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            minWidth: 100,
                                          ),
                                          child: LoginCustomTextfield(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            textController:
                                                controller.serialNoCtrlr,
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
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            color: Color(0xFE50000),
                                            width: 0.5,
                                          )),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.040,
                                          margin: Dimens.edgeInsets5,
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            minWidth: 100,
                                          ),
                                          child: LoginCustomTextfield(
                                            textController: controller
                                                .assesDiscriptionCtrlr,
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
                                        children: [
                                          CalibrationTabWidget(),
                                          WarrantyTabWidget(),
                                          ManufacturarTabWidget(),
                                          Container(
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
              ),
            ),
          )
        ]),
        floatingActionButton: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
              ),
              controller.id == null
                  ? Container(
                      height: 40,
                      child: CustomElevatedButton(
                        backgroundColor: ColorValues.appGreenColor,
                        text: 'Submit',
                        onPressed: () {
                          controller.AddInventory();
                        },
                      ),
                    )
                  : Container(
                      height: 40,
                      child: CustomElevatedButton(
                        backgroundColor: ColorValues.appDarkBlueColor,
                        text: 'Update',
                        onPressed: () {
                          controller.updateInventory();
                        },
                      ),
                    ),
              Spacer()
            ]),
      );
}
