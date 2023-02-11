import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/dimens.dart';
import '../../theme/styles.dart';

class JobDetailsScreen extends GetView<JobDetailsController> {
  JobDetailsScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        centerTitle: true,
      ),
      body:
          ////
          Container(
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
                    padding: Dimens.edgeInsets10,
                    child: Row(
                        //
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //
                                children: [
                                  JobDetailField(
                                    title: 'Plant name',
                                    value: controller.jobDetailsModel.value
                                            ?.facilityName ??
                                        '',
                                  ),
                                  JobDetailField(
                                    title: 'Working Area/Equipment',
                                    value: controller
                                            .jobDetailsModel
                                            .value
                                            ?.lstCMequipmentCatList?[0]
                                            .equipmentCatName ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Breakdown Type',
                                    value: controller.jobDetailsModel.value
                                            ?.facilityName ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Permit ID',
                                    value: controller
                                            .jobDetailsModel.value?.workType ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Standard Action',
                                    value: controller
                                            .jobDetailsModel.value?.workType ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Raised By',
                                    value: controller
                                            .jobDetailsModel.value?.workType ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'AssignedTo',
                                    value: controller.jobDetailsModel.value
                                            ?.assignedName ??
                                        "",
                                  ),
                                ]),
                          ),
                          Dimens.boxWidth10,
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //
                                children: [
                                  JobDetailField(
                                    title: 'Work Type',
                                    value: controller
                                            .jobDetailsModel
                                            .value
                                            ?.lstCMworkingAreaNameList
                                            ?.first
                                            .workingAreaName ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Equipment Categories',
                                    value: controller
                                            .jobDetailsModel
                                            .value
                                            ?.lstCMequipmentCatList
                                            ?.first
                                            .equipmentCatName ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Brakdown Time',
                                    value: controller
                                            .jobDetailsModel.value?.workType ??
                                        "",
                                  ),
                                  JobDetailField(
                                    title: 'Site Permit No.',
                                    value: controller
                                            .jobDetailsModel.value?.workType ??
                                        "",
                                  ),
                                ]),
                          ),
                        ]),
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

class JobDetailField extends StatelessWidget {
  const JobDetailField({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
        //
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //
                children: [
                  Text(
                    '$title: ',
                    style: Styles.greyLight10,
                  ),
                  Text(
                    value,
                    style: Styles.navyBlue12,
                  ),
                  Dimens.boxHeight10,
                ]),
          ),
        ]);
  }
}
