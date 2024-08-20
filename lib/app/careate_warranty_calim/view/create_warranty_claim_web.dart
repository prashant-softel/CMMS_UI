import 'package:cmms/app/careate_warranty_calim/create_warranty_claim_controller.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/controllers/affected_parts_upload_controller.dart';
import 'package:cmms/app/home/home_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/home/widgets/home_drawer.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/affected_part_detail_widget.dart';
import 'package:cmms/app/widgets/affected_part_dropzone.dart';
import 'package:cmms/app/widgets/approve_wc_dialog.dart';
import 'package:cmms/app/widgets/body_custom_app_bar.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_multiselect_dialog_field.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/dropdown_web.dart';
import 'package:cmms/app/widgets/reject_wc_dialog.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:data_table_2/data_table_2.dart';
// import 'package:cmms/app/widgets/table_action_button.dart';
// import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateWarrantyClaimWeb extends GetView<CreateWarrantyClaimController> {
  CreateWarrantyClaimWeb({Key? key}) : super(key: key);
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());
  final AffectedPartUploadController affectedPartController =
      Get.put(AffectedPartUploadController());
  final HomeController homecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateWarrantyClaimController>(
      id: "create-warranty-claim",
      builder: ((controller) {
        return Scaffold(
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
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            HeaderWidget(),
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
                                      controller.clearStoreData();
                                      Get.offNamed(
                                        Routes.warrantyClaimList,
                                      );
                                    },
                                    child: Text(
                                      " / WARRANTY CLAIM LIST",
                                      style: Styles.greyLight14,
                                    ),
                                  ),
                                  controller.wc_id.value == 0
                                      ? Text(
                                          " / ADD WARRANTY CLAIM",
                                          style: Styles.greyLight14,
                                        )
                                      : controller.type.value == 0
                                          ? Text(
                                              " / UPDATE WARRANTY CLAIM",
                                              style: Styles.greyLight14,
                                            )
                                          : Text(
                                              " / VIEW WARRANTY CLAIM",
                                              style: Styles.greyLight14,
                                            )
                                ],
                              ),
                            ),
                            Expanded(
                              child: ScrollConfiguration(
                                behavior:
                                    ScrollConfiguration.of(context).copyWith(
                                  scrollbars: false,
                                ),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: Get.width * 7,
                                    margin: EdgeInsets.all(15),
                                    child: Card(
                                      color: ColorValues.cardColor,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                ),
                                                child: Text(
                                                  controller.type.value == 1
                                                      ? "View Warranty Claim"
                                                      : controller.wc_id
                                                                  .value !=
                                                              0
                                                          ? "Update Warranty Claim"
                                                          : "New Warranty Claim",
                                                  style: Styles.blackBold14,
                                                ),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: controller
                                                                      .viewWarrantyClaimDetailsModel
                                                                      .value
                                                                      ?.status ==
                                                                  192 ||
                                                              controller
                                                                      .viewWarrantyClaimDetailsModel
                                                                      .value
                                                                      ?.status ==
                                                                  199
                                                          ? ColorValues
                                                              .yellowColor
                                                          : controller
                                                                      .viewWarrantyClaimDetailsModel
                                                                      .value
                                                                      ?.status ==
                                                                  194
                                                              ? ColorValues
                                                                  .primaryColor
                                                              : controller
                                                                          .viewWarrantyClaimDetailsModel
                                                                          .value
                                                                          ?.status ==
                                                                      200
                                                                  ? ColorValues
                                                                      .appGreenColor
                                                                  : controller
                                                                              .viewWarrantyClaimDetailsModel
                                                                              .value
                                                                              ?.status ==
                                                                          191
                                                                      ? ColorValues
                                                                          .draftColor
                                                                      : ColorValues
                                                                          .appRedColor,
                                                      width: 1,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: controller
                                                                        .viewWarrantyClaimDetailsModel
                                                                        .value
                                                                        ?.status ==
                                                                    192 ||
                                                                controller
                                                                        .viewWarrantyClaimDetailsModel
                                                                        .value
                                                                        ?.status ==
                                                                    199
                                                            ? ColorValues
                                                                .yellowColor
                                                            : controller.viewWarrantyClaimDetailsModel.value
                                                                            ?.status ==
                                                                        194 ||
                                                                    controller
                                                                            .viewWarrantyClaimDetailsModel
                                                                            .value
                                                                            ?.status ==
                                                                        200
                                                                ? ColorValues
                                                                    .appGreenColor
                                                                : controller
                                                                            .viewWarrantyClaimDetailsModel
                                                                            .value
                                                                            ?.status ==
                                                                        191
                                                                    ? ColorValues
                                                                        .draftColor
                                                                    : ColorValues
                                                                        .appRedColor,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    '${controller.viewWarrantyClaimDetailsModel.value?.status_short}',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                                ),
                                              ),
                                              // controller.viewWarrantyClaimDetailsModel.value?.status == 192
                                            ],
                                          ),
                                          Divider(
                                            color: ColorValues.greyLightColour,
                                          ),
                                          Dimens.boxHeight10,
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                IgnorePointer(
                                                  ignoring:
                                                      controller.type.value ==
                                                          1,
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
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                title:
                                                                    'Warranty Claim Title: ',
                                                              ),
                                                              Dimens.boxWidth2,
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
                                                                      blurRadius:
                                                                          5.0,
                                                                      spreadRadius:
                                                                          1.0,
                                                                    ),
                                                                  ],
                                                                  color: ColorValues
                                                                      .whiteColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    LoginCustomTextfield(
                                                                  width:
                                                                      (Get.width *
                                                                          0.3),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  maxLine: 1,
                                                                  textController:
                                                                      controller
                                                                          .warrantyClaimTitleTextController,
                                                                  focusNode:
                                                                      controller
                                                                          .wtitleFocus,
                                                                  scrollController:
                                                                      controller
                                                                          .wtitleScroll,
                                                                  errorController: controller
                                                                          .isTitleInvalid
                                                                          .value
                                                                      ? "Required field"
                                                                      : null,
                                                                  onChanged:
                                                                      (value) {
                                                                    if (value
                                                                            .trim()
                                                                            .length >
                                                                        1) {
                                                                      controller
                                                                          .isTitleInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isTitleInvalid
                                                                          .value = true;
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight15,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                title:
                                                                    'Warranty Brief Description: ',
                                                              ),
                                                              Dimens.boxWidth2,
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
                                                                      blurRadius:
                                                                          5.0,
                                                                      spreadRadius:
                                                                          1.0,
                                                                    ),
                                                                  ],
                                                                  color: ColorValues
                                                                      .whiteColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    LoginCustomTextfield(
                                                                  width:
                                                                      (Get.width *
                                                                          0.3),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  maxLine: 3,
                                                                  textController:
                                                                      controller
                                                                          .warrantyClaimBriefDescTextController,
                                                                  focusNode:
                                                                      controller
                                                                          .wdescFocus,
                                                                  scrollController:
                                                                      controller
                                                                          .wdescScroll,
                                                                  errorController: controller
                                                                          .isDescInvalid
                                                                          .value
                                                                      ? "Required field"
                                                                      : null,
                                                                  onChanged:
                                                                      (value) {
                                                                    if (value
                                                                            .trim()
                                                                            .length >
                                                                        1) {
                                                                      controller
                                                                          .isDescInvalid
                                                                          .value = false;
                                                                    } else {
                                                                      controller
                                                                          .isDescInvalid
                                                                          .value = true;
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Dimens.boxWidth15,
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Equipment Categories: '),
                                                              Dimens.boxWidth2,
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    4.2,
                                                                child:
                                                                    DropdownWebWidget(
                                                                  dropdownList:
                                                                      controller
                                                                          .equipmentCategoryList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isEquipmentCategorySelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedEquipmentCategory
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueChanged,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Dimens.boxHeight10,
                                                          Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Equipment Name: '),
                                                              Dimens.boxWidth2,
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    4.2,
                                                                child:
                                                                    DropdownWebWidget(
                                                                  dropdownList:
                                                                      controller
                                                                          .eqipmentNameList,
                                                                  isValueSelected:
                                                                      controller
                                                                          .isEquipmentNameSelected
                                                                          .value,
                                                                  selectedValue:
                                                                      controller
                                                                          .selectedEquipmentName
                                                                          .value,
                                                                  onValueChanged:
                                                                      controller
                                                                          .onValueChanged,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                controller.type.value == 0
                                                    ? Container(
                                                        margin:
                                                            Dimens.edgeInsets20,
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
                                                              offset:
                                                                  Offset(0, 2),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "Upload Affected Part ",
                                                              style: Styles
                                                                  .blue700,
                                                            ),
                                                            Container(
                                                              height:
                                                                  Get.height *
                                                                      0.2,
                                                              width: Get.width,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        AffectedPartDropzone(),
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth5,
                                                                  Expanded(
                                                                    flex: 8,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              15),
                                                                      child:
                                                                          AffectedPartWidgetWeb(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : Dimens.box0,
                                                controller.wc_id.value != 0
                                                    ? Container(
                                                        margin:
                                                            Dimens.edgeInsets20,
                                                        height: ((controller
                                                                    .affectedPartImages
                                                                    .length) *
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
                                                              offset:
                                                                  Offset(0, 2),
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
                                                                    'Affected Parts',
                                                                    style: Styles
                                                                        .blue700,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: DataTable2(
                                                                border:
                                                                    TableBorder
                                                                        .all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234),
                                                                ),
                                                                columns: [
                                                                  DataColumn(
                                                                    label: Text(
                                                                      "Affected Part Name",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Text(
                                                                      "View Image",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                                rows: List<
                                                                    DataRow>.generate(
                                                                  controller
                                                                      .affectedPartImages
                                                                      .length,
                                                                  (index) =>
                                                                      DataRow(
                                                                    cells: [
                                                                      DataCell(
                                                                          Text(
                                                                        controller.affectedPartImages[index]?.description.toString() ??
                                                                            "",
                                                                      )),
                                                                      DataCell(
                                                                        // Text("View Image"),
                                                                        Wrap(
                                                                          children: [
                                                                            TableActionButton(
                                                                              color: ColorValues.appDarkBlueColor,
                                                                              icon: Icons.visibility,
                                                                              message: 'view attachment',
                                                                              onPress: () async {
                                                                                String baseUrl = 'http://172.20.43.9:83/';
                                                                                String fileName = controller.affectedPartImages[index]?.fileName ?? "";
                                                                                String fullUrl = baseUrl + fileName;
                                                                                if (await canLaunch(fullUrl)) {
                                                                                  await launch(fullUrl);
                                                                                } else {
                                                                                  throw 'Could not launch $fullUrl';
                                                                                }
                                                                              },
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : Dimens.box0,
                                                Dimens.boxHeight10,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: 50,
                                                          bottom: 130,
                                                        ),
                                                        child: IgnorePointer(
                                                          ignoring: controller
                                                                  .type.value ==
                                                              1,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    includeAsterisk:
                                                                        false,
                                                                    title:
                                                                        'Sr.No.: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      maxLine:
                                                                          1,
                                                                      ishint:
                                                                          "${controller.inventoryDetailsModel.value?.serialNumber ?? ""}",
                                                                      textController:
                                                                          controller
                                                                              .affectedSerialNoTextController,
                                                                      errorController: controller
                                                                              .isAffectedsrnoInvalid
                                                                              .value
                                                                          ? "Required field"
                                                                          : null,
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.trim().length >
                                                                            1) {
                                                                          controller
                                                                              .isAffectedsrnoInvalid
                                                                              .value = false;
                                                                        } else {
                                                                          controller
                                                                              .isAffectedsrnoInvalid
                                                                              .value = true;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              IgnorePointer(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    CustomRichText(
                                                                      title:
                                                                          'Manufacturer Name: ',
                                                                    ),
                                                                    Dimens
                                                                        .boxWidth10,
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.black26,
                                                                            offset:
                                                                                const Offset(
                                                                              5.0,
                                                                              5.0,
                                                                            ),
                                                                            blurRadius:
                                                                                5.0,
                                                                            spreadRadius:
                                                                                1.0,
                                                                          ),
                                                                        ],
                                                                        color: ColorValues
                                                                            .whiteColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          LoginCustomTextfield(
                                                                        width: (Get.width *
                                                                            0.15),
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        maxLine:
                                                                            1,
                                                                        ishint:
                                                                            '${controller.inventoryDetailsModel.value?.manufacturerName ?? ""}',
                                                                        textController:
                                                                            controller.manufacturerNameTextController,
                                                                        errorController: controller.isManufactureInvalid.value
                                                                            ? "Required field"
                                                                            : null,
                                                                        onChanged:
                                                                            (value) {
                                                                          if (value.trim().length >
                                                                              1) {
                                                                            controller.isManufactureInvalid.value =
                                                                                false;
                                                                          } else {
                                                                            controller.isManufactureInvalid.value =
                                                                                true;
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              IgnorePointer(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    CustomRichText(
                                                                      title:
                                                                          'Request to Warrenty Provider: ',
                                                                    ),
                                                                    Dimens
                                                                        .boxWidth10,
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.black26,
                                                                            offset:
                                                                                const Offset(
                                                                              5.0,
                                                                              5.0,
                                                                            ),
                                                                            blurRadius:
                                                                                5.0,
                                                                            spreadRadius:
                                                                                1.0,
                                                                          ),
                                                                        ],
                                                                        color: ColorValues
                                                                            .whiteColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          LoginCustomTextfield(
                                                                        width: (Get.width *
                                                                            0.15),
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        maxLine:
                                                                            1,
                                                                        ishint:
                                                                            '${controller.inventoryDetailsModel.value?.warrantyProviderName ?? ""}',
                                                                        textController:
                                                                            controller.requestManufactureTextController,
                                                                        errorController: controller.isRequestWarrantyInvalid.value
                                                                            ? "Required field"
                                                                            : null,
                                                                        onChanged:
                                                                            (value) {
                                                                          if (value.trim().length >
                                                                              1) {
                                                                            controller.isRequestWarrantyInvalid.value =
                                                                                false;
                                                                          } else {
                                                                            controller.isRequestWarrantyInvalid.value =
                                                                                true;
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              IgnorePointer(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    CustomRichText(
                                                                      title:
                                                                          'Warranty Start Date: ',
                                                                    ),
                                                                    Dimens
                                                                        .boxWidth10,
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.black26,
                                                                            offset:
                                                                                const Offset(
                                                                              5.0,
                                                                              5.0,
                                                                            ),
                                                                            blurRadius:
                                                                                5.0,
                                                                            spreadRadius:
                                                                                1.0,
                                                                          ),
                                                                        ],
                                                                        color: ColorValues
                                                                            .whiteColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          LoginCustomTextfield(
                                                                        width: (Get.width *
                                                                            0.15),
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        maxLine:
                                                                            1,
                                                                        ishint:
                                                                            '${controller.inventoryDetailsModel.value?.start_date ?? ""}',
                                                                        widget:
                                                                            Icon(
                                                                          Icons
                                                                              .calendar_month,
                                                                        ),
                                                                        ontap:
                                                                            () {
                                                                          pickWarrantyStartDateTime_web(
                                                                              context);
                                                                        },
                                                                        textController:
                                                                            controller.warrantyStartDateTimeCtrlrWeb,
                                                                        errorController: controller.isWStartDateInvalid.value
                                                                            ? "Required field"
                                                                            : null,
                                                                        onChanged:
                                                                            (value) {
                                                                          if (value.trim().length >
                                                                              1) {
                                                                            controller.isWStartDateInvalid.value =
                                                                                false;
                                                                          } else {
                                                                            controller.isWStartDateInvalid.value =
                                                                                true;
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              IgnorePointer(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    CustomRichText(
                                                                      title:
                                                                          'Warranty End Date: ',
                                                                    ),
                                                                    Dimens
                                                                        .boxWidth10,
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.black26,
                                                                            offset:
                                                                                const Offset(
                                                                              5.0,
                                                                              5.0,
                                                                            ),
                                                                            blurRadius:
                                                                                5.0,
                                                                            spreadRadius:
                                                                                1.0,
                                                                          ),
                                                                        ],
                                                                        color: ColorValues
                                                                            .whiteColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          LoginCustomTextfield(
                                                                        width: (Get.width *
                                                                            0.15),
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        maxLine:
                                                                            1,
                                                                        widget:
                                                                            Icon(Icons.calendar_month),
                                                                        ontap:
                                                                            () {
                                                                          pickWarrantyEndDateTime_web(
                                                                              context);
                                                                        },
                                                                        textController:
                                                                            controller.warrantyEndDateTimeCtrlrWeb,
                                                                        errorController: controller.isWEndDateInvalid.value
                                                                            ? "Required field"
                                                                            : null,
                                                                        onChanged:
                                                                            (value) {
                                                                          if (value.trim().length >
                                                                              1) {
                                                                            controller.isWEndDateInvalid.value =
                                                                                false;
                                                                          } else {
                                                                            controller.isWEndDateInvalid.value =
                                                                                true;
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    title:
                                                                        'Failure Date & Time: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      maxLine:
                                                                          1,
                                                                      textController:
                                                                          controller
                                                                              .failureDateTimeCtrlrWeb,
                                                                      widget:
                                                                          Icon(
                                                                        Icons
                                                                            .calendar_month,
                                                                      ),
                                                                      ontap:
                                                                          () {
                                                                        pickFailureDateTime_web(
                                                                            context);
                                                                      },
                                                                      errorController: controller
                                                                              .isFailureDateTimeInvalid
                                                                              .value
                                                                          ? "Required field"
                                                                          : null,
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.trim().length >
                                                                            1) {
                                                                          controller
                                                                              .isFailureDateTimeInvalid
                                                                              .value = false;
                                                                        } else {
                                                                          controller
                                                                              .isFailureDateTimeInvalid
                                                                              .value = true;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,

                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    title:
                                                                        'Applied At: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      widget:
                                                                          Icon(
                                                                        Icons
                                                                            .calendar_month,
                                                                      ),
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      maxLine:
                                                                          1,
                                                                      ontap:
                                                                          () {
                                                                        pickcurrentStartDate_web(
                                                                            context);
                                                                      },
                                                                      textController:
                                                                          controller
                                                                              .currentStartDateCtrlrWeb,
                                                                      errorController: controller
                                                                              .isAppliedAtInvalid
                                                                              .value
                                                                          ? "Required field"
                                                                          : null,
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.trim().length >
                                                                            1) {
                                                                          controller
                                                                              .isAppliedAtInvalid
                                                                              .value = false;
                                                                        } else {
                                                                          controller
                                                                              .isAppliedAtInvalid
                                                                              .value = true;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    title:
                                                                        'Contract Reference No.: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      maxLine:
                                                                          1,
                                                                      textController:
                                                                          controller
                                                                              .orderReferenceNoTextController,
                                                                      errorController: controller
                                                                              .isContractRefInvalid
                                                                              .value
                                                                          ? "Required field"
                                                                          : null,
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.trim().length >
                                                                            1) {
                                                                          controller
                                                                              .isContractRefInvalid
                                                                              .value = false;
                                                                        } else {
                                                                          controller
                                                                              .isContractRefInvalid
                                                                              .value = true;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    title:
                                                                        'Approximate Daily Loss: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      maxLine:
                                                                          1,
                                                                      inputFormatters: [
                                                                        FilteringTextInputFormatter
                                                                            .digitsOnly
                                                                      ],
                                                                      textController:
                                                                          controller
                                                                              .approxdailylosstxtcontroller,
                                                                      errorController: controller
                                                                              .isApproxLossInvalid
                                                                              .value
                                                                          ? "Required field"
                                                                          : null,
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.trim().length >
                                                                            1) {
                                                                          controller
                                                                              .isApproxLossInvalid
                                                                              .value = false;
                                                                        } else {
                                                                          controller
                                                                              .isApproxLossInvalid
                                                                              .value = true;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    title:
                                                                        'Cost of Replacement: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      maxLine:
                                                                          1,
                                                                      ishint:
                                                                          '${controller.inventoryDetailsModel.value?.cost ?? ""}',
                                                                      textController:
                                                                          controller
                                                                              .costOfReplacementTextController,
                                                                      inputFormatters: [
                                                                        FilteringTextInputFormatter
                                                                            .digitsOnly
                                                                      ],
                                                                      errorController: controller
                                                                              .isCostOfReplacementInvalid
                                                                              .value
                                                                          ? "Required field"
                                                                          : null,
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.trim().length >
                                                                            1) {
                                                                          controller
                                                                              .isCostOfReplacementInvalid
                                                                              .value = false;
                                                                        } else {
                                                                          controller
                                                                              .isCostOfReplacementInvalid
                                                                              .value = true;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  CustomRichText(
                                                                    title:
                                                                        'Immediate Corrective Action: ',
                                                                  ),
                                                                  Dimens
                                                                      .boxWidth10,
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black26,
                                                                          offset:
                                                                              const Offset(
                                                                            5.0,
                                                                            5.0,
                                                                          ),
                                                                          blurRadius:
                                                                              5.0,
                                                                          spreadRadius:
                                                                              1.0,
                                                                        ),
                                                                      ],
                                                                      color: ColorValues
                                                                          .whiteColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width: (Get
                                                                              .width *
                                                                          0.15),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      maxLine:
                                                                          1,
                                                                      textController:
                                                                          controller
                                                                              .immediateCorrectiveActionTextController,
                                                                      errorController: controller
                                                                              .isCorrectiveActionInvalid
                                                                              .value
                                                                          ? "Required field"
                                                                          : null,
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value.trim().length >
                                                                            1) {
                                                                          controller
                                                                              .isCorrectiveActionInvalid
                                                                              .value = false;
                                                                        } else {
                                                                          controller
                                                                              .isCorrectiveActionInvalid
                                                                              .value = true;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Dimens
                                                                  .boxHeight10,

                                                              // Dimens.boxHeight90,
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // Dimens.boxWidth10,
                                                    Expanded(
                                                      flex: 1,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          IgnorePointer(
                                                            ignoring: controller
                                                                    .type
                                                                    .value ==
                                                                1,
                                                            child: Row(
                                                              children: [
                                                                CustomRichText(
                                                                  title:
                                                                      'Severity: ',
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    buildRadioButton(
                                                                        'Critical',
                                                                        Colors
                                                                            .red,
                                                                        context),
                                                                    buildRadioButton(
                                                                        'High',
                                                                        Colors
                                                                            .orange,
                                                                        context),
                                                                    buildRadioButton(
                                                                        'Medium',
                                                                        Colors
                                                                            .yellow,
                                                                        context),
                                                                    buildRadioButton(
                                                                        'Low',
                                                                        Colors
                                                                            .green,
                                                                        context),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Dimens.boxHeight10,
                                                          IgnorePointer(
                                                            ignoring: controller
                                                                    .type
                                                                    .value ==
                                                                1,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CustomRichText(
                                                                    title:
                                                                        'Select Currency Unit: '),
                                                                Dimens
                                                                    .boxWidth5,
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      6.3,
                                                                  child: Obx(
                                                                    () =>
                                                                        DropdownWebWidget(
                                                                      dropdownList:
                                                                          controller
                                                                              .unitCurrencyList,
                                                                      isValueSelected: controller
                                                                          .isUnitCurrencySelected
                                                                          .value,
                                                                      selectedValue: controller
                                                                          .selectedUnitCurrency
                                                                          .value,
                                                                      onValueChanged:
                                                                          controller
                                                                              .onValueChanged,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          GetBuilder<
                                                              CreateWarrantyClaimController>(
                                                            id: "employee",
                                                            builder:
                                                                (controller) {
                                                              return SizedBox(
                                                                height: 500,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    2.2,
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
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Obx(
                                                                        () =>
                                                                            Column(
                                                                          children: [
                                                                            CustomAppBar(
                                                                              title: 'Additional Emails'.tr,
                                                                            ),
                                                                            Dimens.boxHeight10,
                                                                            Wrap(
                                                                              children: [
                                                                                Column(
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      width: MediaQuery.of(context).size.width / 1.5,
                                                                                      child: DefaultTabController(
                                                                                        length: 2,
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsets.all(1.0),
                                                                                              child: Container(
                                                                                                height: 45,
                                                                                                decoration: BoxDecoration(
                                                                                                  border: Border.all(color: Colors.grey),
                                                                                                  color: Colors.white,
                                                                                                  borderRadius: BorderRadius.circular(1),
                                                                                                ),
                                                                                                child: TabBar(
                                                                                                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                                                                  labelColor: Colors.black,
                                                                                                  indicator: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(1)),
                                                                                                  unselectedLabelColor: Colors.black,
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
                                                                                            IgnorePointer(
                                                                                              ignoring: controller.type.value == 1,
                                                                                              child: SizedBox(
                                                                                                height: 250,
                                                                                                width: MediaQuery.of(context).size.width / 2,
                                                                                                child: TabBarView(
                                                                                                  children: [
                                                                                                    Container(
                                                                                                        child: Column(
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        SizedBox(
                                                                                                          height: 15,
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                          children: [
                                                                                                            SizedBox(
                                                                                                              width: MediaQuery.of(context).size.width / 4.2,
                                                                                                              child: CustomMultiSelectDialogField(
                                                                                                                buttonText: 'Select Employee',
                                                                                                                title: 'Employees',
                                                                                                                // initialValue: [],
                                                                                                                initialValue: (controller.selectedEmployeeNameIdList.isNotEmpty) ? controller.selectedEmployeeNameIdList : [],
                                                                                                                items: controller.employeesList
                                                                                                                    .map(
                                                                                                                      (equipmentCategory) => MultiSelectItem(
                                                                                                                        equipmentCategory.id,
                                                                                                                        equipmentCategory.name ?? '',
                                                                                                                      ),
                                                                                                                    )
                                                                                                                    .toList(),
                                                                                                                onConfirm: (selectedOptionsList) => {
                                                                                                                  controller.employeesNameSelected(selectedOptionsList),
                                                                                                                  print('Employees Name list Ids ${controller.selectedEmployeeNameIdList}')
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          height: 10,
                                                                                                        ),
                                                                                                      ],
                                                                                                    )),
                                                                                                    SingleChildScrollView(
                                                                                                      child: Column(
                                                                                                        children: [
                                                                                                          SizedBox(
                                                                                                            height: 10,
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              SizedBox(
                                                                                                                width: 75,
                                                                                                              ),
                                                                                                              Text(
                                                                                                                'Name',
                                                                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                              Dimens.boxWidth15,
                                                                                                              Text(
                                                                                                                'Email',
                                                                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                              Dimens.boxWidth40,
                                                                                                              Text(
                                                                                                                'Role',
                                                                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                              Dimens.boxWidth15,
                                                                                                              Text(
                                                                                                                'Mobile',
                                                                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            height: 10,
                                                                                                          ),
                                                                                                          Column(
                                                                                                              children: []..addAll(controller.externalEmails.map((data) => Row(
                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      SizedBox(
                                                                                                                        width: 75,
                                                                                                                      ),
                                                                                                                      SizedBox(width: 100, child: Text('${data.name}')),
                                                                                                                      SizedBox(width: 200, child: Text('${data.email}')),
                                                                                                                      SizedBox(width: 100, child: Text('${data.role}')),
                                                                                                                      SizedBox(width: 100, child: Text('${data.mobile}')),
                                                                                                                    ],
                                                                                                                  )))),
                                                                                                          Dimens.boxHeight10,
                                                                                                          SizedBox(
                                                                                                              width: MediaQuery.of(context).size.width / 3,
                                                                                                              child: Row(
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    ' Name: ',
                                                                                                                    style: Styles.black14,
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                        border: Border.all(
                                                                                                                      color: Color(0xFE50000),
                                                                                                                      width: 0.5,
                                                                                                                    )),
                                                                                                                    height: MediaQuery.of(context).size.height * 0.040,
                                                                                                                    // margin: Dimens.edgeInsets5,
                                                                                                                    constraints: BoxConstraints(
                                                                                                                      maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                                      minWidth: 100,
                                                                                                                    ),
                                                                                                                    child: LoginCustomTextfield(
                                                                                                                      textController: controller.nameTextFieldController,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              )),
                                                                                                          SizedBox(
                                                                                                            width: MediaQuery.of(context).size.width / 3,
                                                                                                            child: Row(
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  '  Email: ',
                                                                                                                  style: Styles.black14,
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                      border: Border.all(
                                                                                                                    color: Color(0xFE50000),
                                                                                                                    width: 0.5,
                                                                                                                  )),
                                                                                                                  height: MediaQuery.of(context).size.height * 0.040,
                                                                                                                  // margin: Dimens.edgeInsets5,
                                                                                                                  constraints: BoxConstraints(
                                                                                                                    maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                                    minWidth: 100,
                                                                                                                  ),
                                                                                                                  child: LoginCustomTextfield(
                                                                                                                    textController: controller.emailTextFieldController,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            width: MediaQuery.of(context).size.width / 3,
                                                                                                            child: Row(
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  '     Role: ',
                                                                                                                  style: Styles.black14,
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                      border: Border.all(
                                                                                                                    color: Color(0xFE50000),
                                                                                                                    width: 0.5,
                                                                                                                  )),
                                                                                                                  height: MediaQuery.of(context).size.height * 0.040,
                                                                                                                  // margin: Dimens.edgeInsets5,
                                                                                                                  constraints: BoxConstraints(
                                                                                                                    maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                                    minWidth: 100,
                                                                                                                  ),
                                                                                                                  child: LoginCustomTextfield(
                                                                                                                    textController: controller.roleTextFieldController,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            width: MediaQuery.of(context).size.width / 3,
                                                                                                            child: Row(
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'Mobile: ',
                                                                                                                  style: Styles.black14,
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                      border: Border.all(
                                                                                                                    color: Color(0xFE50000),
                                                                                                                    width: 0.5,
                                                                                                                  )),
                                                                                                                  height: MediaQuery.of(context).size.height * 0.040,
                                                                                                                  // margin: Dimens.edgeInsets5,
                                                                                                                  constraints: BoxConstraints(
                                                                                                                    maxWidth: MediaQuery.of(context).size.width / 4,
                                                                                                                    minWidth: 100,
                                                                                                                  ),
                                                                                                                  child: LoginCustomTextfield(
                                                                                                                    inputFormatters: [
                                                                                                                      FilteringTextInputFormatter.digitsOnly
                                                                                                                    ],
                                                                                                                    textController: controller.mobileTextFieldController,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          ElevatedButton(
                                                                                                            onPressed: () {
                                                                                                              controller.updateText(controller.nameTextFieldController.text, controller.roleTextFieldController.text, controller.emailTextFieldController.text, int.tryParse('${controller.mobileTextFieldController.text}'));
                                                                                                              controller.nameTextFieldController.clear();
                                                                                                              controller.emailTextFieldController.clear();
                                                                                                              controller.roleTextFieldController.clear();
                                                                                                              controller.mobileTextFieldController.clear();
                                                                                                            },
                                                                                                            child: Text(
                                                                                                              'Add',
                                                                                                              style: TextStyle(color: ColorValues.whiteColor),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                ),
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Dimens.boxHeight10,
                                                IgnorePointer(
                                                  ignoring: controller
                                                                      .viewWarrantyClaimDetailsModel
                                                                      .value
                                                                      ?.status ==
                                                                  192 &&
                                                              controller.type
                                                                      .value ==
                                                                  1 ||
                                                          controller
                                                                  .viewWarrantyClaimDetailsModel
                                                                  .value
                                                                  ?.status ==
                                                              199 ||
                                                          controller
                                                                  .viewWarrantyClaimDetailsModel
                                                                  .value
                                                                  ?.status ==
                                                              200
                                                      ? true
                                                      : false,
                                                  child: Container(
                                                    margin: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                      ),
                                                    ),
                                                    // height: 100,
                                                    width: Get.width * .9,
                                                    constraints: BoxConstraints(
                                                      minHeight: 300,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        CustomAppBar(
                                                          title:
                                                              'Schedule of Supplier Actions'
                                                                  .tr,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10.0),
                                                                child: Column(
                                                                  children: <Widget>[
                                                                    Dimens
                                                                        .boxHeight8,
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "Supplier Action: ",
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
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
                                                                            ],
                                                                            color:
                                                                                ColorValues.whiteColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          child:
                                                                              LoginCustomTextfield(
                                                                            width:
                                                                                (Get.width * 0.15),
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            maxLine:
                                                                                1,
                                                                            textController:
                                                                                controller.supplierActionTextFieldController,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight5,
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "Required: ",
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Checkbox(
                                                                            value:
                                                                                controller.isCheckedRequire.value,
                                                                            onChanged:
                                                                                (bool? value) {
                                                                              controller.requireToggleCheckbox();
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight5,
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          "Required By Date: ",
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
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
                                                                            ],
                                                                            color:
                                                                                ColorValues.whiteColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                          ),
                                                                          child:
                                                                              LoginCustomTextfield(
                                                                            width:
                                                                                (Get.width * 0.15),
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            maxLine:
                                                                                1,
                                                                            widget:
                                                                                Icon(
                                                                              Icons.calendar_month,
                                                                            ),
                                                                            ontap:
                                                                                () {
                                                                              pickRequiredSupplierDate_web(context);
                                                                            },
                                                                            textController:
                                                                                controller.supplierActionDateTimeCtrlrWeb,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Dimens
                                                                        .boxHeight15,
                                                                    Center(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            28,
                                                                        child:
                                                                            CustomElevatedButton(
                                                                          backgroundColor:
                                                                              ColorValues.appGreenColor,
                                                                          onPressed:
                                                                              () {
                                                                            controller.updateSupplierActionText(
                                                                              controller.supplierActionTextFieldController.text,
                                                                              controller.isCheckedRequire.value == true ? 1 : 0,
                                                                              controller.supplierActionDateTimeCtrlrWeb.text,
                                                                              // controller.supplierActionSrNumberTextFieldController.text,
                                                                            );
                                                                            controller.clearSupplierAction();
                                                                          },
                                                                          text:
                                                                              'Add',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Dimens.boxWidth10,
                                                            Expanded(
                                                              flex: 2,
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: (controller.supplierActions.length *
                                                                            40) +
                                                                        55,
                                                                    child:
                                                                        DataTable2(
                                                                      border:
                                                                          TableBorder
                                                                              .all(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            206,
                                                                            229,
                                                                            234),
                                                                      ),
                                                                      headingRowHeight:
                                                                          50,
                                                                      dataRowHeight:
                                                                          40,
                                                                      columns: [
                                                                        DataColumn2(
                                                                          size:
                                                                              ColumnSize.S,
                                                                          label:
                                                                              Text('Serial No'),
                                                                        ),
                                                                        DataColumn2(
                                                                          size:
                                                                              ColumnSize.L,
                                                                          label:
                                                                              Text("Supplier Action"),
                                                                        ),
                                                                        DataColumn2(
                                                                          size:
                                                                              ColumnSize.S,
                                                                          label:
                                                                              Text("Required"),
                                                                        ),
                                                                        DataColumn2(
                                                                          size:
                                                                              ColumnSize.L,
                                                                          label:
                                                                              Text("Required by Date"),
                                                                        ),
                                                                        DataColumn2(
                                                                          size:
                                                                              ColumnSize.S,
                                                                          label:
                                                                              Text("Action"),
                                                                        ),
                                                                      ],
                                                                      rows: List<
                                                                          DataRow>.generate(
                                                                        controller
                                                                            .supplierActions
                                                                            .length,
                                                                        (index) {
                                                                          var supplier =
                                                                              controller.supplierActions[index];
                                                                          return DataRow(
                                                                            cells: [
                                                                              DataCell(
                                                                                Text('${index + 1}'),
                                                                              ),
                                                                              DataCell(
                                                                                Text('${supplier.name ?? ''}'),
                                                                              ),
                                                                              DataCell(
                                                                                Checkbox(
                                                                                  value: supplier.is_required == 1,
                                                                                  onChanged: null,
                                                                                ),
                                                                              ),
                                                                              DataCell(
                                                                                Text('${supplier.required_by_date ?? ''}'),
                                                                              ),
                                                                              DataCell(
                                                                                Wrap(
                                                                                  children: [
                                                                                    TableActionButton(
                                                                                      color: Colors.red,
                                                                                      icon: Icons.delete_outline,
                                                                                      message: 'Remove',
                                                                                      onPress: () {
                                                                                        controller.supplierActions.removeAt(index);
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
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
                                                  ),
                                                ),
                                                Dimens.boxHeight10,
                                                Container(
                                                  height: Get.height * 0.2,
                                                  width: Get.width,
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child:
                                                            FileUploadWidgetWithDropzone(),
                                                      ),
                                                      Dimens.boxWidth5,
                                                      Expanded(
                                                        flex: 8,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15),
                                                          child:
                                                              FileUploadDetailsWidgetWeb(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                controller.wc_id.value != 0
                                                    ? Container(
                                                        margin:
                                                            Dimens.edgeInsets20,
                                                        height: ((controller
                                                                    .images
                                                                    .length) *
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
                                                              offset:
                                                                  Offset(0, 2),
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
                                                                    'Attachments',
                                                                    style: Styles
                                                                        .blue700,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: DataTable2(
                                                                border:
                                                                    TableBorder
                                                                        .all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          206,
                                                                          229,
                                                                          234),
                                                                ),
                                                                columns: [
                                                                  DataColumn(
                                                                    label: Text(
                                                                      "File Description",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Text(
                                                                      "View Image",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                                rows: List<
                                                                    DataRow>.generate(
                                                                  controller
                                                                      .images
                                                                      .length,
                                                                  (index) =>
                                                                      DataRow(
                                                                    cells: [
                                                                      DataCell(
                                                                          Text(
                                                                        controller.images[index]?.description.toString() ??
                                                                            "",
                                                                      )),
                                                                      DataCell(
                                                                        // Text("View Image"),
                                                                        Wrap(
                                                                          children: [
                                                                            TableActionButton(
                                                                              color: ColorValues.appDarkBlueColor,
                                                                              icon: Icons.visibility,
                                                                              message: 'view attachment',
                                                                              onPress: () async {
                                                                                String baseUrl = 'http://172.20.43.9:83/';
                                                                                String fileName = controller.images[index]?.fileName ?? "";
                                                                                String fullUrl = baseUrl + fileName;
                                                                                if (await canLaunch(fullUrl)) {
                                                                                  await launch(fullUrl);
                                                                                } else {
                                                                                  throw 'Could not launch $fullUrl';
                                                                                }
                                                                              },
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : Dimens.box0,
                                                controller
                                                                    .viewWarrantyClaimDetailsModel
                                                                    .value
                                                                    ?.status ==
                                                                192 &&
                                                            controller.type
                                                                    .value ==
                                                                1 ||
                                                        controller
                                                                    .viewWarrantyClaimDetailsModel
                                                                    .value
                                                                    ?.status ==
                                                                199 &&
                                                            controller.type
                                                                    .value ==
                                                                1 ||
                                                        controller
                                                                    .viewWarrantyClaimDetailsModel
                                                                    .value
                                                                    ?.status ==
                                                                200 &&
                                                            controller.type
                                                                    .value ==
                                                                1
                                                    ? Dimens.box0
                                                    : Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 60,
                                                                  right: 60),
                                                          child: Row(
                                                            children: [
                                                              CustomRichText(
                                                                  title:
                                                                      'Comments: '),
                                                              Expanded(
                                                                child:
                                                                    _buildWorkPermitCommentTextField_web(
                                                                        context),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                Dimens.boxHeight10,
                                                controller
                                                        .historyList!.isNotEmpty
                                                    ? Container(
                                                        margin:
                                                            Dimens.edgeInsets20,
                                                        height: ((controller
                                                                        .historyList
                                                                        ?.length ??
                                                                    0) *
                                                                50) +
                                                            125,
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
                                                              offset:
                                                                  Offset(0, 2),
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
                                                                    "Warranty Claim History ",
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
                                                              child: DataTable2(
                                                                border: TableBorder.all(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            206,
                                                                            229,
                                                                            234)),
                                                                columns: [
                                                                  DataColumn(
                                                                      label:
                                                                          Text(
                                                                    "Time Stamp",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                                  DataColumn(
                                                                      label:
                                                                          Text(
                                                                    "Posted By",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                                  DataColumn(
                                                                      label:
                                                                          Text(
                                                                    "Comment",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                                  DataColumn(
                                                                      label:
                                                                          Text(
                                                                    "Location",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                                  DataColumn(
                                                                      label:
                                                                          Text(
                                                                    "Status",
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
                                                                          .historyList
                                                                          ?.length ??
                                                                      0,
                                                                  (index) =>
                                                                      DataRow(
                                                                          cells: [
                                                                        DataCell(
                                                                          Text(
                                                                            controller.historyList?[index]?.createdAt?.result != null
                                                                                ? DateFormat('yyyy-MM-dd HH:mm').format(controller.historyList![index]!.createdAt!.result!)
                                                                                : '',
                                                                          ),
                                                                        ),
                                                                        DataCell(Text(controller.historyList?[index]?.createdByName.toString() ??
                                                                            '')),
                                                                        DataCell(Text(controller.historyList?[index]?.comment.toString() ??
                                                                            '')),
                                                                        DataCell(
                                                                            Text('--')),
                                                                        DataCell(Text(controller.historyList?[index]?.status_name.toString() ??
                                                                            '')),
                                                                      ]),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    : Dimens.box0,
                                                Dimens.boxHeight40,
                                              ],
                                            ),
                                          ),
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
                    ],
                  ),
                ),
                AnimatedPositioned(
                  child: HomeDrawer(),
                  duration: Duration(milliseconds: 450),
                ),
              ],
            ),
          ),
          floatingActionButton: Obx(
            () => controller.type.value == 0
                ? Row(
                    children: <Widget>[
                      Spacer(),
                      controller.wc_id.value != 0 &&
                              controller.viewWarrantyClaimDetailsModel.value
                                      ?.status ==
                                  192
                          ? Container(
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                onPressed: () {
                                  controller.isFormInvalid.value = false;
                                  controller.updateWarrantyClaim(
                                    isDraft: false,
                                    fileIds: dropzoneController.fileIds,
                                    affectedFileIds:
                                        affectedPartController.fileIds,
                                  );
                                },
                                text: 'Update',
                              ),
                            )
                          : Dimens.box0,
                      controller.wc_id.value != 0 &&
                              controller.viewWarrantyClaimDetailsModel.value
                                      ?.status ==
                                  191
                          ? Container(
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                onPressed: () {
                                  controller.isFormInvalid.value = false;
                                  controller.updateWarrantyClaim(
                                    isDraft: true,
                                    fileIds: dropzoneController.fileIds,
                                    affectedFileIds:
                                        affectedPartController.fileIds,
                                  );
                                },
                                text: 'Update Draft',
                              ),
                            )
                          : Dimens.box0,
                      Dimens.boxWidth10,
                      controller.wc_id.value != 0 &&
                              controller.viewWarrantyClaimDetailsModel.value
                                      ?.status ==
                                  191
                          ? Container(
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                onPressed: () {
                                  controller.isFormInvalid.value = false;
                                  controller.updateWarrantyClaim(
                                    isDraft: false,
                                    fileIds: dropzoneController.fileIds,
                                    affectedFileIds:
                                        affectedPartController.fileIds,
                                  );
                                },
                                text: 'Submit For Release',
                              ),
                            )
                          : Dimens.box0,
                      controller.wc_id.value != 0 &&
                              controller.viewWarrantyClaimDetailsModel.value
                                      ?.status ==
                                  193
                          ? Container(
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                onPressed: () {
                                  controller.isFormInvalid.value = false;
                                  controller.resubmitWarrantyClaim(
                                    fileIds: dropzoneController.fileIds,
                                    affectedFileIds:
                                        affectedPartController.fileIds,
                                  );
                                },
                                text: 'Resubmit',
                              ),
                            )
                          : Dimens.box0,
                      controller.wc_id.value == 0
                          ? Container(
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                onPressed: () {
                                  controller.saveAsDraft(
                                    fileIds: dropzoneController.fileIds,
                                    affectedFileIds:
                                        affectedPartController.fileIds,
                                  );
                                },
                                text: 'Save As Draft',
                              ),
                            )
                          : Dimens.box0,
                      SizedBox(
                        width: 20,
                      ),
                      controller.wc_id.value == 0
                          ? Container(
                              height: 30,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                onPressed: () {
                                  controller.isFormInvalid.value = false;
                                  controller.createWarrantyClaim(
                                    fileIds: dropzoneController.fileIds,
                                    affectedFileIds:
                                        affectedPartController.fileIds,
                                  );
                                },
                                text: 'Submit For Release',
                              ),
                            )
                          : Dimens.box0,
                      Spacer(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      varUserAccessModel.value.access_list!
                                          .where((e) =>
                                              e.feature_id ==
                                                  UserAccessConstants
                                                      .kWarrantyClaimFeatureId &&
                                              e.approve ==
                                                  UserAccessConstants
                                                      .kHaveApproveAccess)
                                          .length >
                                      0 &&
                                  controller.viewWarrantyClaimDetailsModel.value
                                          ?.status ==
                                      192 ||
                              controller.viewWarrantyClaimDetailsModel.value
                                      ?.status ==
                                  199
                          ? Container(
                              height: 28,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appGreenColor,
                                text: "Approve",
                                icon: Icons.check,
                                onPressed: () {
                                  Get.dialog(ApproveWCDialog(
                                    id: controller.wc_id.value,
                                  ));
                                },
                              ),
                            )
                          : Dimens.box0,
                      Dimens.boxWidth10,
                      varUserAccessModel.value.access_list!
                                          .where((e) =>
                                              e.feature_id ==
                                                  UserAccessConstants
                                                      .kWarrantyClaimFeatureId &&
                                              e.approve ==
                                                  UserAccessConstants
                                                      .kHaveApproveAccess)
                                          .length >
                                      0 &&
                                  controller.viewWarrantyClaimDetailsModel.value
                                          ?.status ==
                                      192 ||
                              controller.viewWarrantyClaimDetailsModel.value
                                      ?.status ==
                                  199
                          ? Container(
                              height: 28,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appRedColor,
                                text: "Reject",
                                icon: Icons.close,
                                onPressed: () {
                                  Get.dialog(RejectWCDialog(
                                    id: controller.wc_id.value,
                                  ));
                                },
                              ),
                            )
                          : Dimens.box0,
                      // controller.viewWarrantyClaimDetailsModel.value?.status ==
                      //         194
                      //     ? Container(
                      //         height: 28,
                      //         child: CustomElevatedButton(
                      //           icon: Icons.print_outlined,
                      //           backgroundColor: ColorValues.appDarkBlueColor,
                      //           text: "Print",
                      //           onPressed: () {
                      //             // controller.printScreen();
                      //           },
                      //         ),
                      //       )
                      //     : Dimens.box0,
                      // Dimens.boxWidth10,
                      controller.viewWarrantyClaimDetailsModel.value?.status ==
                              194
                          ? Container(
                              height: 28,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.updateColor,
                                text: "Update",
                                onPressed: () {
                                  controller.updateWarranty(
                                    fileIds: dropzoneController.fileIds,
                                  );
                                },
                              ),
                            )
                          : Dimens.box0,
                      Dimens.boxWidth10,
                      controller.viewWarrantyClaimDetailsModel.value?.status ==
                              194
                          ? Container(
                              height: 28,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.approveColor,
                                text: "Fully Paid",
                                onPressed: () {
                                  controller.closeWarranty(
                                    type: 1,
                                    fileIds: dropzoneController.fileIds,
                                  );
                                },
                              ),
                            )
                          : Dimens.box0,
                      Dimens.boxWidth10,
                      controller.viewWarrantyClaimDetailsModel.value?.status ==
                              194
                          ? Container(
                              height: 28,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.primaryColor,
                                text: "Partially Paid",
                                onPressed: () {
                                  controller.closeWarranty(
                                    type: 2,
                                    fileIds: dropzoneController.fileIds,
                                  );
                                },
                              ),
                            )
                          : Dimens.box0,
                      Dimens.boxWidth10,
                      controller.viewWarrantyClaimDetailsModel.value?.status ==
                              194
                          ? Container(
                              height: 28,
                              child: CustomElevatedButton(
                                backgroundColor: ColorValues.appRedColor,
                                text: "Rejected",
                                onPressed: () {
                                  controller.closeWarranty(
                                    type: 3,
                                    fileIds: dropzoneController.fileIds,
                                  );
                                },
                              ),
                            )
                          : Dimens.box0,
                      Spacer(),
                    ],
                  ),
          ),
        );
      }),
    );
  }

  Future pickFailureDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedFailureDateTimeWeb.value;
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
    controller.selectedFailureDateTimeWeb.value = dateTime;
    controller.failureDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd HH:mm').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.failureDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print('FailureDateTime:${controller.failureDateTimeCtrlrWeb.text}');
    controller.failureDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedFailureDateTimeWeb.value;
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
    DateTime dateTime = controller.selectedFailureDateTimeWeb.value;
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

  Widget buildRadioButton(String severity, Color color, BuildContext context) {
    return Obx(() {
      return Container(
        height: 35,
        width: MediaQuery.of(context).size.width / 10,
        child: RadioListTile(
          dense: true,
          title: Text(
            severity,
            style: TextStyle(color: color),
          ),
          value: severity,
          groupValue: controller.selectedSeverity.value,
          onChanged: (value) {
            controller.setSelectedSeverity(value as String);
            print('DAta:${controller.selectedSeverity.value}');
          },
        ),
      );
    });
  }

////Warranty Start Date
  Future pickWarrantyStartDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedWarrantyStartDateTime.value;
    final date = await pickDate2_web(context);
    if (date == null) {
      return;
    }
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    controller.selectedWarrantyStartDateTime.value = dateTime;
    controller.warrantyStartDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.warrantyStartDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'Warranty Start Date Time: ${controller.warrantyStartDateTimeCtrlrWeb.text}');
    controller.warrantyStartDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print(
        'Warranty Start Date sending Time: ${controller.warrantyStartDateTimeCtrlrWebBuffer}');
  }

  Future<DateTime?> pickDate2_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedWarrantyStartDateTime.value;
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

  Future pickcurrentStartDate_web(BuildContext context) async {
    var dateTime = controller.selectedcurrentStartDate.value;
    final date = await pickDate2_web(context);
    if (date == null) {
      return;
    }
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    controller.dateController.value = dateTime;
    controller.currentStartDateCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.currentStartDateCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print('Current Date: ${controller.currentStartDateCtrlrWeb.text}');
    controller.currentStartDateCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
    print(
        'Current Date sending Time: ${controller.currentStartDateCtrlrWebBuffer}');
  }

  Future<DateTime?> pickcurrentDate2_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedcurrentStartDate.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return null;
    return newDate;
  }

////Warranty End Date
  Future pickWarrantyEndDateTime_web(BuildContext context) async {
    var dateTime = controller.selectedWarrantyEndDateTime.value;
    final date = await pickDate3_web(context);
    if (date == null) {
      return;
    }
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    controller.selectedWarrantyEndDateTime.value = dateTime;
    controller.warrantyEndDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.warrantyEndDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
    print(
        'Warranty End Date Time: ${controller.warrantyEndDateTimeCtrlrWeb.text}');
    controller.warrantyEndDateTimeCtrlrWebBuffer =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(dateTime);
  }

  Future<DateTime?> pickDate3_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedWarrantyEndDateTime.value;
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
    DateTime dateTime = controller.selectedWarrantyEndDateTime.value;
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

  ///Supplier Action Required by date
  Future pickRequiredSupplierDate_web(BuildContext context) async {
    var dateTime = controller.selectedSupplierActionDateTimeWeb.value;
    final date = await pickRequiredDate_web(context);
    if (date == null) {
      return;
    }
    dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );
    controller.selectedSupplierActionDateTimeWeb.value = dateTime;
    controller.supplierActionDateTimeCtrlrWeb
      ..text = DateFormat('yyyy-MM-dd').format(dateTime)
      ..selection = TextSelection.fromPosition(
        TextPosition(
          offset: controller.supplierActionDateTimeCtrlrWeb.text.length,
          affinity: TextAffinity.upstream,
        ),
      );
  }

  Future<DateTime?> pickRequiredDate_web(BuildContext context) async {
    DateTime? dateTime = controller.selectedSupplierActionDateTimeWeb.value;
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return null;
    return newDate;
  }

  Future<TimeOfDay?> pickRequiredTime_web(BuildContext context) async {
    DateTime dateTime = controller.selectedSupplierActionDateTimeWeb.value;
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

  // emailDropdown(
  //   BuildContext context,
  //   String? title,
  // ) {
  //   return Obx(
  //     () =>
  //   );
  // }

  supplierActionData(
    String? title,
    String? title2,
    BuildContext context,
    int? position,
    String? date,
  ) {
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
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 206, 204, 204)),
              child: Center(child: Text('$title2')),
            )),
          ),
          Checkbox(
            value: true,
            onChanged: null,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: CustomTextField(
              label: '',
              hintText: '$date',
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkPermitCommentTextField_web(BuildContext context) {
    return Column(children: [
      Container(
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
            controller: controller.commentCtrl,
            focusNode: controller.commentFocus,
            scrollController: controller.commentScroll,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: Dimens.edgeInsets05_10,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: controller.isCommentInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isCommentInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText:
                  controller.isCommentInvalid.value ? "Required field" : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isCommentInvalid.value = false;
              } else {
                controller.isCommentInvalid.value = true;
              }
            },
          ),
        ),
      ),
      Dimens.boxHeight10,
    ]);
  }
}
