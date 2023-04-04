import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import 'widgets/job_detail_field.dart';
import 'widgets/job_detail_multi_value_field.dart';
import 'widgets/ptw.dart';

class JobDetailsScreen extends GetView<JobDetailsController> {
  JobDetailsScreen({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
      body:

          ////
          Container(
        width: double.infinity,
        //height: Get.height * 0.99,
        child: //
            // ListView(
            //     // shrinkWrap: true,
            //     scrollDirection: Axis.horizontal, //
            //     children: [
            Column(
          children: [
            Container(
              height: Get.height * 0.99,
              width: Get.width * 0.99,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeDrawer(),
                    JobDetailsWidgetContent(),
                  ]),
            ),
          ],
        ),
      ),

      ///
    );

    /// build ends
  }

  /// class ends
}

class JobDetailsWidgetContent extends GetView<JobDetailsController> {
  JobDetailsWidgetContent({
    super.key,
  });

  ///
  final ButtonStyle editButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: Dimens.fourteen),
    backgroundColor: Color(0xffc4a278),
  );

  ///
  @override
  Widget build(BuildContext context) {
    return //
        //   Obx(
        // () => //
        Expanded(
      child: //
          Container(
        color: ColorValues.appBackGroundColor,
        child: Column(
            //
            children: [
              /// CONTENT
              Expanded(
                child: //
                    Container(
                  width: Get.width,
                  height: Get.height,
                  child: //
                      Column(children: [
                    Card(
                      elevation: 25,
                      color: ColorValues.appLightBlueColor.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: ColorValues.appDarkBlueColor,
                          width: 3,
                        ),
                      ),
                      child: //
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              //
                              children: [
                            Obx(
                              () => //
                                  Expanded(
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    //
                                    children: [
                                      /// LEFT COLUMN
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //
                                          children: [
                                            JobDetailField(
                                              title: 'Job Id',
                                              value: controller
                                                      .jobDetailsModel.value?.id
                                                      .toString() ??
                                                  '',
                                            ),
                                            JobDetailField(
                                              title: 'Assigned To',
                                              value: controller.jobDetailsModel
                                                      .value?.assignedName ??
                                                  "",
                                            ),
                                            JobDetailField(
                                              title: 'Job Title',
                                              value: controller.jobDetailsModel
                                                      .value?.jobTitle ??
                                                  '',
                                            ),
                                            JobDetailField(
                                              title: 'Plant name',
                                              value: controller.jobDetailsModel
                                                      .value?.facilityName ??
                                                  '',
                                            ),
                                            JobDetailMultiValueField(
                                              title: 'Equipment Categories',
                                              values: (controller
                                                          .jobDetailsModel
                                                          .value
                                                          ?.equipmentCatList !=
                                                      null)
                                                  ? controller.jobDetailsModel
                                                      .value?.equipmentCatList
                                                      ?.map((item) => (item
                                                          .equipmentCatName))
                                                      .toList() as List<String>
                                                  : [],
                                            ),
                                            JobDetailField(
                                              title: 'Breakdown Type',
                                              value: controller.jobDetailsModel
                                                      .value?.breakdownType ??
                                                  '',
                                            ),
                                            JobDetailField(
                                              title: 'Permit ID',
                                              value: controller.jobDetailsModel
                                                      .value?.currentPtwId
                                                      .toString() ??
                                                  "",
                                            ),
                                            JobDetailField(
                                              title: 'Standard Action',
                                              value: controller.jobDetailsModel
                                                      .value?.standardAction ??
                                                  "",
                                            ),
                                          ]),
                                      // ),
                                      Dimens.boxWidth10,

                                      /// RIGHT COLUMN
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //
                                          children: [
                                            JobDetailField(
                                              title: 'Current Status',
                                              value: controller.jobDetailsModel
                                                      .value?.statusShort ??
                                                  '',
                                            ),
                                            JobDetailField(
                                              title: 'Raised By',
                                              value: controller.jobDetailsModel
                                                      .value?.createdByName ??
                                                  "",
                                            ),
                                            JobDetailField(
                                              title: 'Job Description',
                                              value: controller.jobDetailsModel
                                                      .value?.jobTitle ??
                                                  '',
                                            ),
                                            JobDetailField(
                                              title: 'Block Name',
                                              value: controller.jobDetailsModel
                                                      .value?.blockName ??
                                                  '',
                                            ),
                                            JobDetailMultiValueField(
                                              title: 'Working Area/Equipments',
                                              values: (controller
                                                          .jobDetailsModel
                                                          .value
                                                          ?.workingAreaList !=
                                                      null)
                                                  ? controller.jobDetailsModel
                                                      .value?.workingAreaList
                                                      ?.map(
                                                        (item) => (item
                                                            .workingAreaName),
                                                      )
                                                      .toList() as List<String>
                                                  : [],
                                            ),
                                            JobDetailMultiValueField(
                                              title: 'Work Type',
                                              values: (controller
                                                          .jobDetailsModel
                                                          .value
                                                          ?.workType !=
                                                      null)
                                                  ? controller.jobDetailsModel
                                                      .value?.workType
                                                      ?.map((item) => (item))
                                                      .toList() as List<String>
                                                  : [],
                                            ),
                                            JobDetailField(
                                              title: 'Site Permit No.',
                                              value: controller
                                                      .jobDetailsModel
                                                      .value
                                                      ?.associatedPermitList
                                                      ?.first
                                                      .sitePermitNo
                                                      .toString() ??
                                                  "",
                                            ),
                                          ]),
                                    ]),
                              ),
                            ),

                            /// ASSIGN/RE-ASSIGN BUTTON
                            if (controller.jobDetailsModel.value?.statusShort
                                    ?.toLowerCase() ==
                                "created") ...[
                              ElevatedButton(
                                style: editButtonStyle,
                                onPressed: () => controller.editJob(),
                                child: Text('Assign'),
                              )
                            ] else if (controller
                                    .jobDetailsModel.value?.statusShort
                                    ?.toLowerCase() ==
                                "assigned") ...[
                              ElevatedButton(
                                style: editButtonStyle,
                                onPressed: () => controller.editJob(),
                                child: Text(
                                  'Re-Assign',
                                ),
                              )
                            ],

                            /// if Mobile
                            (kIsWeb && Responsive.isMobile(context) ||
                                    Responsive.isTablet(context))
                                ?

                                /// ASSOCIATED PERMITS TABLE
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
                                          in controller.associatedPermitList ??
                                              [])
                                        PTWCardWidget(
                                            associatedPermit: associatedPermit),
                                    ]),
                                  )
                                : Container(),

                            // LinkToPermitTableWidget()
                          ]),
                    ),
                  ]),
                ),
              ),
            ]),
      ),
    );
  }
}
