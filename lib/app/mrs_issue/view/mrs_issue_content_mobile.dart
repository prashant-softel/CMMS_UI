import 'package:cmms/app/app.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/mrs_issue/mrs_issue_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../domain/models/get_asset_items_model.dart';

class MrsIssueContentMobile extends GetView<MrsIssueController> {
  MrsIssueContentMobile({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ///
    return
        //   Scaffold(
        // body: //
        //   Obx(
        // () =>
        (controller.mrsDetailsModel.value != null)
            ? //
            Obx(
                () => //
                    SingleChildScrollView(
                  child: Container(
                      height: Get.height,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          //
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //
                                children: [
                                  /// LEFT COLUMN
                                  Expanded(
                                    child: //
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            //
                                            children: [
                                          JobDetailField(
                                            title: 'MRS Id',
                                            value: (controller.mrsDetailsModel
                                                        .value?.id !=
                                                    null)
                                                ? "MRS${controller.mrsDetailsModel.value?.id.toString() ?? ''}"
                                                : '',
                                          ),
                                          JobDetailField(
                                            title: 'Requested By',
                                            value: controller.mrsDetailsModel
                                                    .value?.requested_by_name ??
                                                '',
                                          ),
                                          JobDetailField(
                                            title: "Activity",
                                            value: controller.mrsDetailsModel
                                                    .value?.activity ??
                                                "",
                                          ),
                                          JobDetailField(
                                            title: 'Approved By',
                                            value: controller.mrsDetailsModel
                                                    .value?.approver_name
                                                    .toString() ??
                                                '',
                                          ),
                                        ]),
                                  ),
                                  // ),
                                  Dimens.boxWidth10,

                                  /// RIGHT COLUMN
                                  Expanded(
                                    child: //
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            //
                                            children: [
                                          JobDetailField(
                                            title: 'Status',
                                            value: controller.mrsDetailsModel
                                                    .value?.status
                                                    .toString() ??
                                                '',
                                          ),
                                          JobDetailField(
                                            title: 'Where Used',
                                            value:
                                                '${controller.mrsDetailsModel.value?.whereUsedTypeName.toString().toUpperCase() ?? ''}${controller.mrsDetailsModel.value?.whereUsedRefID ?? ''}',
                                          ),
                                          JobDetailField(
                                            title: 'Requested Date Time',
                                            value: controller.mrsDetailsModel
                                                    .value?.requestd_date ??
                                                'null',
                                          ),
                                          JobDetailField(
                                            title: 'Approved Date Time',
                                            value: controller.mrsDetailsModel
                                                    .value?.approval_date ??
                                                '',
                                          ),
                                        ]),
                                  ),
                                ]),
                            Text(
                              "Materials  ",
                              style: Styles.blue700,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  //physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.mrsDetailsModel.value!
                                              .cmmrsItems !=
                                          null
                                      ? controller.mrsDetailsModel.value!
                                          .cmmrsItems!.length
                                      : 0,
                                  itemBuilder: (context, index) {
                                    final mrsViewModel = (controller
                                                .mrsDetailsModel
                                                .value!
                                                .cmmrsItems !=
                                            null)
                                        ? controller.mrsDetailsModel.value!
                                            .cmmrsItems![index]
                                        : GetAssetItemsModel();
                                    return GestureDetector(
                                      onTap: () {
                                        // var _taskId =
                                        //     controller.scheduleCheckPoint[index]!.id ?? 0;
                                        // Get.toNamed(Routes.pmTaskView,
                                        //     arguments: {'pmTaskId': _taskId});
                                      },
                                      child: Card(
                                        color: Colors.lightBlue.shade50,
                                        elevation: 10,
                                        shadowColor: Colors.black87,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(children: [
                                                  Text('Material Name:',
                                                      style:
                                                          Styles.appDarkGrey12),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        '${mrsViewModel.asset_name}'
                                                        '',
                                                        style: Styles
                                                            .appDarkBlue12),
                                                  ),
                                                ]),
                                                Row(//
                                                    children: [
                                                  Text("Asset Type: ",
                                                      style:
                                                          Styles.appDarkGrey12),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        mrsViewModel
                                                                .asset_type ??
                                                            '',
                                                        style: Styles
                                                            .appDarkBlue12),
                                                  )
                                                ]),
                                                Row(children: [
                                                  Text('Available Qty.: ',
                                                      style:
                                                          Styles.appDarkGrey12),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        mrsViewModel
                                                                .available_qty
                                                                .toString() ??
                                                            '',
                                                        style: Styles
                                                            .appDarkBlue12),
                                                  )
                                                ]),
                                                Row(children: [
                                                  Text('Requested Qty.: ',
                                                      style:
                                                          Styles.appDarkGrey12),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        mrsViewModel
                                                                .requested_qty
                                                                .toString() ??
                                                            '',
                                                        style: Styles
                                                            .appDarkBlue12),
                                                  )
                                                ]),
                                                Row(children: [
                                                  Text('Approved Qyt.: ',
                                                      style:
                                                          Styles.appDarkGrey12),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        mrsViewModel
                                                                .requested_qty
                                                                .toString() ??
                                                            '',
                                                        style: Styles
                                                            .appDarkBlue12),
                                                  )
                                                ]),
                                                controller
                                                            .mrsDetailsModel
                                                            .value!
                                                            .cmmrsItems![index]
                                                            .asset_type ==
                                                        "Spare"
                                                    ? Row(children: [
                                                        Text('Serial Number: ',
                                                            style: Styles
                                                                .appDarkGrey12),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              LoginCustomTextfield(
                                                            width: (Get.width *
                                                                .4),
                                                            textController: controller
                                                                    .mrsDetailsModel
                                                                    .value!
                                                                    .cmmrsItems![
                                                                        index]
                                                                    .serial_number_controller
                                                                as TextEditingController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter Serial Number',
                                                              errorText: controller
                                                                      .errorMessages[
                                                                  index],
                                                            ),
                                                            validator: (value) =>
                                                                controller
                                                                    .validateField(
                                                                        value,
                                                                        index),
                                                            onChanged: (value) {
                                                              controller
                                                                  .clearErrorMessage(
                                                                      index);
                                                            },
                                                          ),
                                                        ),

                                                        // Form(
                                                        //   key: _formKey,
                                                        //   child:
                                                        //   Padding(
                                                        //     padding:
                                                        //         const EdgeInsets
                                                        //             .all(8.0),
                                                        //     child: Container(
                                                        //         width:
                                                        //             (Get.width *
                                                        //                 .4),
                                                        //         decoration:
                                                        //             BoxDecoration(
                                                        //           boxShadow: [
                                                        //             BoxShadow(
                                                        //               color: Colors
                                                        //                   .black26,
                                                        //               offset:
                                                        //                   const Offset(
                                                        //                 5.0,
                                                        //                 5.0,
                                                        //               ),
                                                        //               blurRadius:
                                                        //                   5.0,
                                                        //               spreadRadius:
                                                        //                   1.0,
                                                        //             ),
                                                        //           ],
                                                        //           color: ColorValues
                                                        //               .whiteColor,
                                                        //           borderRadius:
                                                        //               BorderRadius
                                                        //                   .circular(
                                                        //                       5),
                                                        //         ),
                                                        //         child:
                                                        //             LoginCustomTextfield(
                                                        //           validator:
                                                        //               (value) {
                                                        //             if (value ==
                                                        //                     null ||
                                                        //                 value
                                                        //                     .isEmpty) {
                                                        //               return 'This field cannot be empty';
                                                        //             }
                                                        //             return null;
                                                        //           },
                                                        //           textController: controller
                                                        //               .mrsDetailsModel
                                                        //               .value!
                                                        //               .cmmrsItems![
                                                        //                   index]
                                                        //               .serial_number_controller as TextEditingController,
                                                        //         )),
                                                        //   ),
                                                        // ),
                                                      ])
                                                    : Dimens.box0,
                                                Row(children: [
                                                  Text('Issued Qty.: ',
                                                      style:
                                                          Styles.appDarkGrey12),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                        width: (Get.width * .4),
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
                                                          color: ColorValues
                                                              .whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child:
                                                            LoginCustomTextfield(
                                                                inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly, // Restrict input to digits only
                                                            ],
                                                                textController: controller
                                                                        .mrsDetailsModel
                                                                        .value!
                                                                        .cmmrsItems![
                                                                            index]
                                                                        .issued_qty_controller
                                                                    as TextEditingController,
                                                                onChanged:
                                                                    (text) {
                                                                  try {
                                                                    // Validate input using a regular expression
                                                                    if (!RegExp(
                                                                            r'^[0-9]+(?:\.[0-9]+)?$')
                                                                        .hasMatch(
                                                                            text)) {
                                                                      // Input is not a valid double
                                                                      Fluttertoast
                                                                          .showToast(
                                                                        msg:
                                                                            'Enter valid quantity in numbers',
                                                                        fontSize:
                                                                            16.0,
                                                                      );
                                                                      return; // Exit early
                                                                    }

                                                                    double
                                                                        parsedValue =
                                                                        double.parse(
                                                                            text);
                                                                    double requestedQty = controller
                                                                        .mrsDetailsModel
                                                                        .value!
                                                                        .cmmrsItems![
                                                                            index]
                                                                        .requested_qty!;

                                                                    if (parsedValue >
                                                                        requestedQty) {
                                                                      Fluttertoast
                                                                          .showToast(
                                                                        msg:
                                                                            'Enter qty below the approved qty',
                                                                        fontSize:
                                                                            16.0,
                                                                      );
                                                                      controller
                                                                          .mrsDetailsModel
                                                                          .value!
                                                                          .cmmrsItems![
                                                                              index]
                                                                          .issued_qty_controller!
                                                                          .text = ''; 
                                                                    }
                                                                  } catch (e) {
                                                                    // Handle the case where parsing fails
                                                                    print(
                                                                        'Error: $e');
                                                                  }
                                                                })),
                                                  ),
                                                ]),
                                              ]),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            // Spacer(),
                            Container(
                              margin: Dimens.edgeInsets15,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomRichText(title: "Comment:"),
                                  Dimens.boxWidth10,
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: LoginCustomTextfield(
                                        maxLine: 5,
                                        textController: controller.commentCtrlr,
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
                                      backgroundColor: ColorValues.cancelColor,
                                      text: "cancel",
                                      onPressed: () {
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
                                        controller.issueMrs();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ])),
                ),
              )
            : Dimens.box0;
  }

  ///////////
}
