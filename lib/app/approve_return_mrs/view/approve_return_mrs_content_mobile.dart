import 'package:cmms/app/app.dart';
import 'package:cmms/app/approve_return_mrs/approve_return_mrs_controller.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/get_plant_Stock_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textfield.dart';

class ApproveReturnMrsViewContentMobile
    extends GetView<ApproveReturnMrsController> {
  ApproveReturnMrsViewContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return
        //   Scaffold(
        // body: //
        //   Obx(
        // () =>
        Padding(
      padding: Dimens.edgeInsets10,
      child: (controller.returnMrsDetailsModel.value != null)
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
                                        title: 'MRS Id1',
                                        value: (controller.returnMrsDetailsModel
                                                    .value?.id !=
                                                null)
                                            ? "MRS${controller.returnMrsDetailsModel.value?.id.toString() ?? ''}"
                                            : '',
                                      ),
                                      JobDetailField(
                                        title: 'Requested By',
                                        value: controller.returnMrsDetailsModel
                                                .value?.requested_by_name ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: "Activity",
                                        value: controller.returnMrsDetailsModel
                                                .value?.activity ??
                                            "",
                                      ),
                                      controller.returnMrsDetailsModel.value
                                                  ?.status ==
                                              321
                                          ? Dimens.box0
                                          : JobDetailField(
                                              title: 'Approved By',
                                              value: controller
                                                      .returnMrsDetailsModel
                                                      .value
                                                      ?.approver_name
                                                      .toString() ??
                                                  '',
                                            )
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
                                        value: controller.returnMrsDetailsModel
                                                .value?.status_short
                                                .toString() ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Where Used',
                                        value:
                                            "${controller.returnMrsDetailsModel.value?.whereUsedType ?? ""}${controller.returnMrsDetailsModel.value?.whereUsedTypeId ?? ""}",
                                      ),
                                      JobDetailField(
                                        title: 'Requested Date Time',
                                        value: controller.returnMrsDetailsModel
                                                .value?.returnDate ??
                                            'null',
                                      ),
                                      controller.returnMrsDetailsModel.value
                                                  ?.status ==
                                              321
                                          ? Dimens.box0
                                          : JobDetailField(
                                              title: 'Approved Date Time',
                                              value: controller
                                                      .returnMrsDetailsModel
                                                      .value
                                                      ?.approval_date ??
                                                  '',
                                            ),
                                    ]),
                              ),
                            ]),
                        Dimens.boxHeight10,
                        Text(
                          "Issued Return Material  ",
                          style: Styles.blue700,
                        ),
                        Dimens.boxHeight5,
                        Expanded(
                          child: ListView.builder(
                              //physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.returnMrsDetailsModel.value!
                                          .cmmrsItems !=
                                      null
                                  ? controller.returnMrsDetailsModel.value!
                                      .cmmrsItems!.length
                                  : 0,
                              itemBuilder: (context, index) {
                                final mrsViewModel = (controller
                                            .returnMrsDetailsModel
                                            .value!
                                            .cmmrsItems !=
                                        null)
                                    ? controller.returnMrsDetailsModel.value!
                                        .cmmrsItems![index]
                                    : StockDetails();
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
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Text('Material Name:',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    '${mrsViewModel.name}'
                                                    '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              ),
                                            ]),
                                            Row(//
                                                children: [
                                              Text("Asset Type: ",
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    mrsViewModel.asset_type ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Issued Qty.: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    mrsViewModel.issued_qty
                                                            .toString() ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Issued Date: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    mrsViewModel.issued_date
                                                            .toString() ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Return Qty.: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    mrsViewModel.returned_qty
                                                            .toString() ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Remarks: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    mrsViewModel.return_remarks
                                                            .toString() ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                          ]),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Dimens.boxHeight10,
                        Text(
                          "Faulty Return Material  ",
                          style: Styles.blue700,
                        ),
                        Dimens.boxHeight5,
                        Expanded(
                          child: ListView.builder(
                              //physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.returnMrsDetailsModel.value!
                                          .cmmrsFaultyItems !=
                                      null
                                  ? controller.returnMrsDetailsModel.value!
                                      .cmmrsFaultyItems!.length
                                  : 0,
                              itemBuilder: (context, index) {
                                final faultyMaterial = (controller
                                            .returnMrsDetailsModel
                                            .value!
                                            .cmmrsFaultyItems !=
                                        null)
                                    ? controller.returnMrsDetailsModel.value!
                                        .cmmrsFaultyItems![index]
                                    : GetAssetDataModel();
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
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Text('Material Name:',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    '${faultyMaterial.name}'
                                                    '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              ),
                                            ]),
                                            Row(//
                                                children: [
                                              Text("Remove From: ",
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    faultyMaterial
                                                            .fromActorName ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Material Code: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    faultyMaterial.asset_code
                                                            .toString() ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Serial No.: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    faultyMaterial.serial_number
                                                            .toString() ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Return Qty.: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    faultyMaterial.returned_qty
                                                            .toString() ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                            Row(children: [
                                              Text('Remarks: ',
                                                  style: Styles.appDarkGrey12),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    faultyMaterial
                                                            .return_remarks
                                                            .toString() ??
                                                        '',
                                                    style:
                                                        Styles.appDarkBlue12),
                                              )
                                            ]),
                                          ]),
                                    ),
                                  ),
                                );
                              }),
                        ),

                        //Spacer(),
                        controller.returnMrsDetailsModel.value?.status == 321
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomRichText(title: "Comment:"),
                                  Dimens.boxHeight10,
                                  LoginCustomTextfield(
                                    // width: (Get.width * .6),
                                    maxLine: 5,
                                    textController: controller.commentCtrlr,
                                  ),
                                ],
                              )
                            : Dimens.box0,
                        Dimens.boxHeight15,
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.returnMrsDetailsModel.value?.status ==
                                      321
                                  ? Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.approveColor,
                                        text: 'Approve',
                                        onPressed: () {
                                          controller.approveReturnMrs();
                                        },
                                      ),
                                    )
                                  : Dimens.box0,
                              SizedBox(
                                width: 20,
                              ),
                              controller.returnMrsDetailsModel.value?.status ==
                                      321
                                  ? Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.rejectColor,
                                        text: 'Reject',
                                        onPressed: () {
                                          controller.rejectRetrunMrs();
                                        },
                                      ),
                                    )
                                  : Dimens.box0,
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            )
          : Dimens.box0,
    );
  }

  ///////////
}
