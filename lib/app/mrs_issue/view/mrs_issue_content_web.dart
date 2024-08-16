import 'package:cmms/app/app.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/mrs_issue/mrs_issue_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MrsIssueContentWeb extends GetView<MrsIssueController> {
  MrsIssueContentWeb({Key? key}) : super(key: key);
  final MrsIssueController controller = Get.find();
  final HomeController homecontroller = Get.find();
  final _formKey = GlobalKey<FormState>();
  final _formKeyIssue = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 450),
              margin: EdgeInsets.only(
                  left: homecontroller.menuButton.value ? 250.0 : 70.0),
              width: Get.width,
              height: Get.height,
              color: Color.fromARGB(255, 234, 236, 238),
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
                            final _flutterSecureStorage =
                                const FlutterSecureStorage();

                            _flutterSecureStorage.delete(key: "mrsId");
                            Get.offNamed(Routes.stockManagementDashboardScreen);
                          },
                          child: Text(" / STOCK MANAGEMENT ",
                              style: Styles.greyMediumLight12),
                        ),
                        InkWell(
                            onTap: () {
                              var taskId;
                              var jobId;
                              controller.type.value == 1
                                  ? Get.offAllNamed(Routes.jobDetails,
                                      arguments: {'jobId': jobId})
                                  : controller.type.value == 2
                                      ? Get.offAllNamed(Routes.pmTaskView,
                                          arguments: {'pmTaskId': taskId})
                                      : Get.offNamed(Routes.mrsListScreen);
                            },
                            child: controller.type.value == 1
                                ? Text(
                                    "/ JOB",
                                    style: Styles.greyLight14,
                                  )
                                : controller.type.value == 2
                                    ? Text(
                                        "/ PM TASK",
                                        style: Styles.greyLight14,
                                      )
                                    : Text(
                                        "/ MRS LIST",
                                        style: Styles.greyLight14,
                                      )),
                        Text(" / MATERIAL REQUISITION ISSUE",
                            style: Styles.greyMediumLight12)
                      ],
                    ),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: SingleChildScrollView(
                        child: Container(
                          color: Color.fromARGB(255, 245, 248, 250),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Material Requisition Issue ",
                                      style: Styles.blackBold16,
                                    ),
                                    Spacer(),
                                    Text(
                                      "MRS ID:",
                                      style: Styles.black17,
                                    ),
                                    Text(
                                      "${controller.mrsDetailsModel.value?.id ?? ""}",
                                      style: Styles.blue17,
                                    ),
                                    Dimens.boxWidth3,
                                    Container(
                                      height: 30,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.appLightBlueColor,
                                        onPressed: () async {},
                                        text:
                                            "${controller.mrsDetailsModel.value?.status_short ?? ""}",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 70, top: 20, bottom: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Dimens.boxWidth30,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Requested By:',
                                          style: Styles.black17,
                                        ),
                                        Dimens.boxHeight10,
                                        Text(
                                          'Activity:',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Dimens.boxWidth2,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            controller.mrsDetailsModel.value
                                                    ?.requested_by_name ??
                                                "",
                                            style: Styles.blue17),
                                        Dimens.boxHeight10,
                                        Text(
                                            controller.mrsDetailsModel.value
                                                    ?.activity ??
                                                "",
                                            style: Styles.blue17),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Requested Date Time:',
                                          style: Styles.black17,
                                        ),
                                        Dimens.boxHeight10,
                                        Text(
                                          'Where Used:',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Dimens.boxWidth2,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            controller.mrsDetailsModel.value
                                                    ?.requestd_date ??
                                                "",
                                            style: Styles.blue17),
                                        Dimens.boxHeight10,
                                        Text(
                                          "${controller.mrsDetailsModel.value?.whereUsedTypeName == 'JOBCARD' ? 'JC' : controller.mrsDetailsModel.value?.whereUsedTypeName == 'PMTASK' ? 'PMT' : ''} ${controller.mrsDetailsModel.value?.whereUsedRefID ?? ""}",
                                          style: Styles.blue17,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  margin: Dimens.edgeInsets20,
                                  height: ((controller.mrsDetailsModel.value!
                                                  .cmmrsItems?.length ??
                                              0) *
                                          40) +
                                      120,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            ColorValues.appBlueBackgroundColor,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Material  ",
                                            style: Styles.blue700,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Form(
                                          key: _formKey,
                                          child: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                Obx(() {
                                                  if (controller
                                                              .mrsDetailsModel
                                                              .value
                                                              ?.cmmrsItems ==
                                                          null ||
                                                      controller
                                                          .mrsDetailsModel
                                                          .value!
                                                          .cmmrsItems!
                                                          .isEmpty) {
                                                    return Center(
                                                        child: Text(
                                                            "No items available"));
                                                  }
                                                  return DataTable(
                                                    border: TableBorder.all(
                                                        color: Color.fromARGB(
                                                            255,
                                                            206,
                                                            229,
                                                            234)),
                                                    columns: [
                                                      DataColumn(
                                                          label: Text(
                                                              "Material Name",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      DataColumn(
                                                          label: Text(
                                                              "Asset Type",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      DataColumn(
                                                          label: Text(
                                                              "Available Qty.",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      DataColumn(
                                                          label: Text(
                                                              "Requested Qty.",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      DataColumn(
                                                          label: Text(
                                                              "Approved Qty.",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      DataColumn(
                                                          label: Text(
                                                              "Serial Number",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      DataColumn(
                                                          label: Text(
                                                              "Issued Qty.",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                    ],
                                                    rows:
                                                        List<DataRow>.generate(
                                                      controller
                                                          .mrsDetailsModel
                                                          .value!
                                                          .cmmrsItems!
                                                          .length,
                                                      (index) {
                                                        var item = controller
                                                            .mrsDetailsModel
                                                            .value!
                                                            .cmmrsItems![index];
                                                        // Ensure the lists are synchronized
                                                        if (controller
                                                                .controllers
                                                                .length <=
                                                            index) {
                                                          controller.controllers
                                                              .add(
                                                                  TextEditingController());
                                                        }
                                                        if (controller
                                                                .errorMessages
                                                                .length <=
                                                            index) {
                                                          controller
                                                              .errorMessages
                                                              .add(null);
                                                        }
                                                        return 
                                                        DataRow(cells: [
                                                          DataCell(Text(item
                                                              .asset_name
                                                              .toString())),
                                                          DataCell(Text(item
                                                              .asset_type
                                                              .toString())),
                                                          DataCell(Text(item
                                                              .available_qty
                                                              .toString())),
                                                          DataCell(Text(item
                                                              .requested_qty
                                                              .toString())),
                                                          DataCell(Text(item
                                                              .requested_qty
                                                              .toString())),
                                                          item.asset_type ==
                                                                  "Spare"
                                                              ? 
                                                              DataCell(
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        LoginCustomTextfield(
                                                                      width:
                                                                          (Get.width /
                                                                              9),
                                                                      textController:
                                                                          item.serial_number_controller,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Enter Serial Number',
                                                                        errorText:
                                                                            controller.errorMessages[index],
                                                                      ),
                                                                      validator: (value) => controller.validateField(
                                                                          value,
                                                                          index),
                                                                      onChanged:
                                                                          (value) {
                                                                        controller
                                                                            .clearErrorMessage(index);
                                                                      },
                                                                    ),
                                                                  ),
                                                                )
                                                              : DataCell(
                                                                  Text("NA")),
                                                          DataCell(
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  LoginCustomTextfield(
                                                                width:
                                                                    (Get.width /
                                                                        9),
                                                                 textController:
                                                                    item.issued_qty_controller,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'Enter Issued Quantity',
                                                                  errorText:
                                                                      controller
                                                                              .errorMessages[
                                                                          index],
                                                                ),
                                                                validator: (value) =>
                                                                    controller
                                                                        .validateField(
                                                                            value,
                                                                            index),
                                                                onChanged:
                                                                    (text) {
                                                                  try {
                                                                    if (!RegExp(
                                                                            r'^[0-9]+(?:\.[0-9]+)?$')
                                                                        .hasMatch(
                                                                            text)) {
                                                                      Fluttertoast
                                                                          .showToast(
                                                                        msg:
                                                                            'Enter valid quantity in numbers',
                                                                        fontSize:
                                                                            16.0,
                                                                      );
                                                                       item.issued_qty_controller!
                                                                          .clear();
                                                                      return;
                                                                    }

                                                                    double
                                                                        parsedValue =
                                                                        double.parse(
                                                                            text);
                                                                    double
                                                                        requestedQty =
                                                                        item.requested_qty!;

                                                                    if (parsedValue >
                                                                        requestedQty) {
                                                                      Fluttertoast
                                                                          .showToast(
                                                                        msg:
                                                                            'Enter qty below the approved qty',
                                                                        fontSize:
                                                                            16.0,
                                                                      );
                                                                       item.issued_qty_controller!
                                                                          .clear();
                                                                    }
                                                                  } catch (e) {
                                                                    print(
                                                                        'Error: $e');
                                                                  }
                                                                  controller
                                                                      .clearErrorMessage(
                                                                          index);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ]);
                                                      },
                                                    ),
                                                  );
                                                }),
                                              ])),
                                    ),
                                  ])),
                              Container(
                                margin: Dimens.edgeInsets15,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomRichText(title: "Comment:"),
                                    Dimens.boxWidth2,
                                    Container(
                                        width: (Get.width * .6),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: LoginCustomTextfield(
                                          maxLine: 5,
                                          textController:
                                              controller.commentCtrlr,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.cancelColor,
                                        text: "cancel",
                                        onPressed: () {
                                          final _flutterSecureStorage =
                                              const FlutterSecureStorage();

                                          _flutterSecureStorage.delete(
                                              key: "mrsId");

                                          Get.back();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor: ColorValues.issueColor,
                                        text: 'Issue',
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            print("isssue4 123");

                                            controller.issueMrs();
                                          } else {
                                            print("isssue 123");
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
        ));
  }
}
