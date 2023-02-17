import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:cmms/app/job_details/views/widgets/ptw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/models/job_model.dart';
import '../../../theme/dimens.dart';
import '../widgets/job_detail_field.dart';
import '../widgets/job_detail_multi_value_field.dart';

class JobDetailsScreen extends GetView<JobDetailsController> {
  JobDetailsScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    ///

    final ButtonStyle editButtonStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: Dimens.fourteen),
      backgroundColor: Color(0xffc4a278),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        centerTitle: true,
      ),
      body:
          ////
          Container(
        width: double.infinity,
        padding: Dimens.edgeInsets5,
        child: Obx(
          () =>
              //
              Card(
            elevation: 25,
            shadowColor: Colors.black87,
            color: Colors.blue.shade50,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blue.shade300,
                width: 5,
              ),
            ),
            child: Column(
                //
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //
                        children: [
                          /// LEFT COLUMN
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //
                                children: [
                                  JobDetailField(
                                    title: 'Job Id',
                                    value: controller.jobDetailsModel.value?.id
                                            .toString() ??
                                        '',
                                  ),
                                  // Row(children: [
                                  //   Icon(
                                  //     Icons.calendar_month_rounded,
                                  //     color: ColorsValue.greyLightColor,
                                  //   ),
                                  //   Text(
                                  //     controller.jobDetailsModel.value
                                  //             ?.breaKdownTime ??
                                  //         '',
                                  //   ),
                                  // ]),
                                  //Dimens.boxHeight10,
                                  JobDetailField(
                                    title: 'Assigned To',
                                    value: controller.jobDetailsModel.value
                                            ?.assignedName ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Job Title',
                                    value: controller
                                            .jobDetailsModel.value?.jobTitle ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: 'Plant name',
                                    value: controller.jobDetailsModel.value
                                            ?.facilityName ??
                                        '',
                                  ),
                                  JobDetailMultiValueField(
                                    title: 'Equipment Categories',
                                    values: controller
                                        .jobDetailsModel.value?.equipmentCatList
                                        ?.map((item) => (item.equipmentCatName))
                                        .toList() as List<String>,
                                  ),

                                  JobDetailField(
                                    title: 'Breakdown Type',
                                    value: "",
                                  ),
                                  JobDetailField(
                                    title: 'Permit ID',
                                    value: controller
                                            .jobDetailsModel.value?.currentPtwId
                                            .toString() ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Standard Action',
                                    value: controller
                                            .jobDetailsModel.value?.workType ??
                                        "",
                                  ),
                                ]),
                          ),
                          Dimens.boxWidth10,

                          /// RIGHT COLUMN
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //
                                children: [
                                  JobDetailField(
                                    title: 'Current Status',
                                    value: JobStatus
                                        .values[controller.jobDetailsModel.value
                                                ?.status ??
                                            0]
                                        .name,
                                  ),
                                  JobDetailField(
                                    title: 'Raised By',
                                    value: controller
                                            .jobDetailsModel.value?.workType ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Job Description',
                                    value: controller
                                            .jobDetailsModel.value?.jobTitle ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: 'Block Name',
                                    value: controller
                                            .jobDetailsModel.value?.blockName ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: 'Working Area/Equipments',
                                    value: controller
                                            .jobDetailsModel
                                            .value
                                            ?.workingAreaNameList?[0]
                                            .workingAreaName ??
                                        "",
                                  ),
                                  JobDetailMultiValueField(
                                    title: 'Work Type',
                                    values: controller.jobDetailsModel.value
                                        ?.workingAreaNameList
                                        ?.map((item) => (item.workingAreaName))
                                        .toList() as List<String>,
                                  ),
                                  JobDetailField(
                                    title: 'Site Permit No.',
                                    value: controller
                                            .jobDetailsModel
                                            .value
                                            ?.associatedPermit
                                            ?.first
                                            .sitePermitNo
                                            .toString() ??
                                        "",
                                  ),
                                ]),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: Dimens.edgeInsets10_0_10_0,
                    child: Column(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Permits',
                        ),
                      ),
                      for (var associatedPermit
                          in controller.associatedPermitList?.value ?? [])
                        PTWCardWidget(associatedPermit: associatedPermit),
                    ]),
                  ),

                  /// SAVE BUTTON
                  if (controller.jobDetailsModel.value?.assignedId == null ||
                      controller.jobDetailsModel.value?.assignedId == 0)
                    ElevatedButton(
                      style: editButtonStyle,
                      onPressed: () => controller.editJob(),
                      child: Text(
                        (controller.jobDetailsModel.value?.assignedId == null ||
                                controller.jobDetailsModel.value?.assignedId ==
                                    0)
                            ? 'Assign'
                            : 'Re-Assign',
                      ),
                    ),
                ]),
          ),
        ),
      ),

      ///
    );

    /// build ends
  }

  /// class ends
}
