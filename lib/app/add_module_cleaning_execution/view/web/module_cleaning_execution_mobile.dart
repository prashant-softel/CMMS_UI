import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/job_details/views/widgets/job_detail_field.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
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
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// LEFT COLUMN
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  JobDetailField(
                                    title: 'Plan Id',
                                    value: (controller.mcExecutionDetailsModel
                                                .value?.id !=
                                            null)
                                        ? "MCP${controller.planId}"
                                        : '',
                                  ),
                                  JobDetailField(
                                    title: 'Plan Title',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.title ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: "Planned By",
                                    value: controller.mcExecutionDetailsModel
                                            .value?.plannedBy ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Planning Date Time',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.plannedAt ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: 'Execution started by',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.startedBy
                                            .toString() ??
                                        '',
                                  ),
                                ],
                              ),
                            ),
                            Dimens.boxWidth10,

                            /// RIGHT COLUMN
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  JobDetailField(
                                    title: 'Task ID',
                                    value: 'MCT${controller.mcid}',
                                  ),
                                  JobDetailField(
                                    title: 'Frequency',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.frequency ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Start Date Time',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.plannedBy ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: 'Planning Date Time',
                                    value: controller.mcExecutionDetailsModel
                                            .value?.abandonedBy
                                            .toString() ??
                                        '',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Schedule Execution",
                          style: Styles.blue700,
                        ),
                        Container(
                          width: Get.width,
                          child: Obx(
                            () => Container(
                              margin: Dimens.edgeInsets10,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      ColorValues.lightGreyColorWithOpacity35,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorValues.appBlueBackgroundColor,
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children:
                                    controller.rowItem.value.map((record) {
                                  return Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 206, 229, 234),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: record.map((mapData) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                mapData['key'] ?? '',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  mapData['value'] ?? '',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 92, 163),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
