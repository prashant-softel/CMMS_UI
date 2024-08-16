import 'package:cmms/app/app.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/mrs_approve/mrs_approve_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/models/get_asset_items_model.dart';

class MrsViewApproveContentMobile extends GetView<MrsApproveController> {
  MrsViewApproveContentMobile({Key? key}) : super(key: key);

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
      child: (controller.mrsDetailsModel.value != null)
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
                                        value: (controller.mrsDetailsModel.value
                                                    ?.id !=
                                                null)
                                            ? "MRS${controller.mrsDetailsModel.value?.id.toString() ?? ''}"
                                            : '',
                                      ),
                                      JobDetailField(
                                        title: 'Requested By',
                                        value: controller.mrsDetailsModel.value
                                                ?.requested_by_name ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: "Activity",
                                        value: controller.mrsDetailsModel.value
                                                ?.activity ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: 'Approved By',
                                        value: controller.mrsDetailsModel.value
                                                ?.approver_name
                                                .toString() ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Issued By',
                                        value: controller.mrsDetailsModel.value
                                                ?.approver_name
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
                                        value: controller
                                                .mrsDetailsModel.value?.status
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
                                        value: controller.mrsDetailsModel.value
                                                ?.requestd_date ??
                                            'null',
                                      ),
                                      JobDetailField(
                                        title: 'Approved Date Time',
                                        value: controller.mrsDetailsModel.value
                                                ?.approval_date ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Issued Date time',
                                        value: controller.mrsDetailsModel.value
                                                ?.issued_date ??
                                            '',
                                      ),
                                    ]),
                              ),
                            ]),
                        Text(
                          "Materials  ",
                          style: Styles.blue700,
                        ),
                        ListView.builder(
                            //physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                controller.mrsDetailsModel.value!.cmmrsItems !=
                                        null
                                    ? controller.mrsDetailsModel.value!
                                        .cmmrsItems!.length
                                    : 0,
                            itemBuilder: (context, index) {
                              final mrsViewModel = (controller
                                          .mrsDetailsModel.value!.cmmrsItems !=
                                      null)
                                  ? controller
                                      .mrsDetailsModel.value!.cmmrsItems![index]
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
                                                  '${mrsViewModel.asset_name}'
                                                  '',
                                                  style: Styles.appDarkBlue12),
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
                                                  mrsViewModel.asset_type ?? '',
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Available Qty.: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  mrsViewModel.available_qty
                                                          .toString() ??
                                                      '',
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Requested Qty.: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  mrsViewModel.requested_qty
                                                          .toString() ??
                                                      '',
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('issued Qty.: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  mrsViewModel.issued_qty
                                                          .toString() ??
                                                      '',
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('Consumed Qty.: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  mrsViewModel.used_qty
                                                          .toString() ??
                                                      '',
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                        ]),
                                  ),
                                ),
                              );
                            }),
                        // Spacer(),
                        controller.mrsDetailsModel.value?.status == 321
                            ? Container(
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
                              )
                            : Dimens.box0,
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.mrsDetailsModel.value?.status == 321
                                  ? Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.approveColor,
                                        text: 'Approve',
                                        onPressed: () {
                                          controller.approveMrs();
                                        },
                                      ),
                                    )
                                  : Dimens.box0,
                              SizedBox(
                                width: 20,
                              ),
                              controller.mrsDetailsModel.value?.status == 321
                                  ? Container(
                                      height: 35,
                                      child: CustomElevatedButton(
                                        backgroundColor:
                                            ColorValues.rejectColor,
                                        text: 'Reject',
                                        onPressed: () {
                                          controller.rejectMrs();
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
