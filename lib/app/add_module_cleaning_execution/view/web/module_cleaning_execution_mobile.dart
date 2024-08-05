import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class McExecutionMobile extends StatefulWidget {
  const McExecutionMobile({Key? key}) : super(key: key);

  @override
  _McExecutionMobileState createState() => _McExecutionMobileState();
}

class _McExecutionMobileState extends State<McExecutionMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddModuleCleaningExecutionController>(
      id: "module-cleaning-mobile",
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: Get.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Column(
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
                                        title: 'Plan Id',
                                        value: (controller
                                                    .mcExecutionDetailsModel
                                                    .value
                                                    ?.id !=
                                                null)
                                            ? "MCP${controller.planId}"
                                            : '',
                                      ),
                                      JobDetailField(
                                        title: 'Plan Title',
                                        value: controller
                                                .mcExecutionDetailsModel
                                                .value
                                                ?.title ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: "Planned By",
                                        value: controller
                                                .mcExecutionDetailsModel
                                                .value
                                                ?.plannedBy ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: 'Planning Date Time',
                                        value: controller
                                                .mcExecutionDetailsModel
                                                .value
                                                ?.plannedAt ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Execution started by',
                                        value: controller
                                                .mcExecutionDetailsModel
                                                .value
                                                ?.startedBy
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
                                        title: 'Task ID',
                                        value: 'MCT${controller.mcid}',
                                      ),
                                      JobDetailField(
                                        title: 'Frequency',
                                        value: controller
                                                .mcExecutionDetailsModel
                                                .value
                                                ?.frequency ??
                                            "",
                                      ),
                                      JobDetailField(
                                        title: 'Start Date Time',
                                        value: controller
                                                .mcExecutionDetailsModel
                                                .value
                                                ?.plannedBy ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Planning Date Time',
                                        value: controller
                                                .mcExecutionDetailsModel
                                                .value
                                                ?.abandonedBy
                                                .toString() ??
                                            '',
                                      ),
                                    ]),
                              ),
                            ]),
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
