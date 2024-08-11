import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/doc_upload/doc_upload_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_web.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DocumentUploadWeb extends GetView<DocumentUploadController> {
  DocumentUploadWeb({
    Key? key,
  });
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentUploadController>(
      id: 'stock_Mangement',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Container(
              color: Color.fromARGB(255, 234, 236, 238),
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
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
                            Get.offNamed(Routes.docVersionDashboard);
                          },
                          child: Text(" / DOCUMENT VERSION",
                              style: Styles.greyLight14),
                        ),
                        Text(" / DOCUMENT UPLOAD", style: Styles.greyLight14)
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            height: Get.height,
                            color: Color.fromARGB(255, 245, 248, 250),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "DOCUMENT UPLOAD",
                                        style: Styles.blackBold16,
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: Dimens.edgeInsets20,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      title:
                                                          'Document Type Name: '),
                                                  Dimens.boxWidth2,
                                                  SizedBox(
                                                    child: Obx(
                                                      () => DropdownWebStock(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            5,
                                                        dropdownList: controller
                                                            .documentNameType,
                                                        isValueSelected: controller
                                                            .isSelectedDocumentNameType
                                                            .value,
                                                        selectedValue: controller
                                                            .selecteddocumentNameType
                                                            .value,
                                                        onValueChanged:
                                                            controller
                                                                .onValueChanged,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight5,
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
                                                      title:
                                                          'Sub Group Document Name: '),
                                                  Dimens.boxWidth2,
                                                  LoginCustomTextfield(
                                                    textController:
                                                        controller.subDocName,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                  ),
                                                ],
                                              ),
                                              Dimens.boxHeight10,
                                              Row(
                                                children: [
                                                  CustomRichText(
                                                      includeAsterisk: false,
                                                      title:
                                                          'Please Mention The ReNew Date: '),
                                                  Dimens.boxWidth2,
                                                  CustomTextFieldForStock(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    numberTextField: true,
                                                    onTap: () {
                                                      controller
                                                              .openrenewDateTcDatePicker =
                                                          !controller
                                                              .openrenewDateTcDatePicker;
                                                      controller.update(
                                                          ['stock_Mangement']);
                                                    },
                                                    textController:
                                                        controller.renewDateTc,
                                                    onChanged: (value) {},
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, right: 20, left: 20),
                                      height: Get.height * 0.2,
                                      width: Get.width,
                                      child: Row(
                                          //
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child:
                                                  FileUploadWidgetWithDropzone(
                                                uploadSingleFile: false,
                                              ),
                                            ),
                                            Dimens.boxWidth10,
                                            Expanded(
                                                flex: 8,
                                                child:
                                                    FileUploadDetailsWidgetWeb()),
                                          ]),
                                    ),
                                    Dimens.boxHeight10,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(children: [
                                        CustomRichText(title: 'Remark: '),
                                        Expanded(
                                          child: TextField(
                                            style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 16.0,
                                                  height: 1.0,
                                                  color: Colors.black),
                                            ),
                                            controller: controller.remark,
                                            decoration: InputDecoration(
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: ColorValues
                                                      .appLightGreyColor,
                                                  width: 1.0,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: ColorValues
                                                      .appLightBlueColor,
                                                  width: 1.0,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: ColorValues
                                                      .appLightBlueColor,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            minLines: 5,
                                            maxLines: null,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (controller.openrenewDateTcDatePicker)
                            Positioned(
                              right: 210,
                              top: 110,
                              child: DatePickerWidget(
                                minDate: DateTime(DateTime.now().year),
                                maxDate: DateTime(DateTime.now().year, 13,
                                    0), // last date of this year
                                controller: DateRangePickerController(),
                                selectionChanges: (p0) {
                                  print('po valu ${p0.value.toString()}');
                                  controller.renewDateTc.text =
                                      DateFormat('yyyy-MM-dd').format(p0.value);
                                  controller.openrenewDateTcDatePicker =
                                      !controller.openrenewDateTcDatePicker;
                                  // controller.isPOdateInvalid.value = false;
                                  controller.update(['stock_Mangement']);
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              children: [
                Spacer(),
                Container(
                  height: 45,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.cancelColor,
                    text: "Cancel",
                    onPressed: () {
                      // controller.clearData();
                      Get.back();
                    },
                  ),
                ),
                Dimens.boxWidth10,
                Container(
                  height: 45,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.submitColor,
                    text: "Upload",
                    onPressed: () {
                      controller.uploadDocumentNew(
                          fileIds: dropzoneController.fileIds);
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
