import 'package:cmms/app/app.dart';
import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/mrs_approve/mrs_approve_controller.dart';
import 'package:cmms/app/mrs_view/mrs_view_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/pm_task_view/pm_task_view_controller.dart';
import 'package:cmms/app/pm_task_view/view/observation_view_dialog.dart';
import 'package:cmms/app/view_return_mrs/view_return_mrs_controller.dart';
import 'package:cmms/app/widgets/assign_to_pm_task_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/execution_approve_dialog.dart';
import 'package:cmms/domain/models/mrs_list_by_jobId.dart';
import 'package:cmms/domain/models/pm_task_view_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/models/get_asset_items_model.dart';
import '../../../domain/models/get_return_mrs_detail.dart';
import '../../utils/user_access_constants.dart';

class ReturnMrsViewContentMobile extends GetView<MrsReturnViewController> {
  ReturnMrsViewContentMobile({Key? key}) : super(key: key);

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
                                        title: 'MRS Id',
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
                                      JobDetailField(
                                        title: 'Approved By',
                                        value: controller.returnMrsDetailsModel
                                                .value?.approver_name
                                                .toString() ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Issued By',
                                        value: controller.returnMrsDetailsModel
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
                                        value: controller.returnMrsDetailsModel
                                                .value?.status
                                                .toString() ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Where Used',
                                        value:
                                            '${controller.returnMrsDetailsModel.value?.activity.toString().toUpperCase() ?? ''}${controller.returnMrsDetailsModel.value?.activity ?? ''}',
                                      ),
                                      JobDetailField(
                                        title: 'Requested Date Time',
                                        value: controller.returnMrsDetailsModel
                                                .value?.requestd_date ??
                                            'null',
                                      ),
                                      JobDetailField(
                                        title: 'Approved Date Time',
                                        value: controller.returnMrsDetailsModel
                                                .value?.approval_date ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Issued Date time',
                                        value: controller.returnMrsDetailsModel
                                                .value?.activity ??
                                            '',
                                      ),
                                    ]),
                              ),
                            ]),
                        ListView.builder(
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
                                  : CmmsItems();
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
                                                  '${mrsViewModel?.asset_name}'
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
                                                  mrsViewModel?.asset_type ??
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
                                                  mrsViewModel?.requested_qty
                                                          .toString() ??
                                                      '',
                                                  style: Styles.appDarkBlue12),
                                            )
                                          ]),
                                          Row(children: [
                                            Text('issued Qyt.: ',
                                                style: Styles.appDarkGrey12),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  mrsViewModel?.issued_qty
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
                                                  mrsViewModel?.used_qty
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
                                          // controller.approveMrs();
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
                                          //789    controller.rejectMrs();
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
