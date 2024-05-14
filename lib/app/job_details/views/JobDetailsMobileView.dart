import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../utils/responsive.dart';
import '../../widgets/custom_elevated_button.dart';
import 'widgets/job_detail_field.dart';
import 'widgets/job_detail_multi_value_field.dart';

class JobDetailsMobileView extends GetView<JobDetailsController> {
  JobDetailsMobileView({
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
        Obx(() {
      if (controller.isDataLoading.value == true) {
        return Dimens.box0;
      } //
      else {
        return (Responsive.isMobile(context) || Responsive.isTablet(context))
            ? SafeArea(child: _content(context, controller))
            : _content(context, controller); //
      }
    });
  }
}

Widget _content(context, controller) {
  return Container(
    height: Get.height,
    child: //
        Column(//
            children: [
      Expanded(
        child: Card(
          color: ColorValues.appBlueBackgroundColor,
          elevation: 25,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ColorValues.appDarkBlueColor,
              width: 3,
            ),
          ),
          child: //
              Padding(
            padding: Dimens.edgeInsets20,
            child: (controller.jobDetailsModel.value != null)
                ? //
                Obx(
                    () => //
                        Column(
                            mainAxisSize: MainAxisSize.min,
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
                                          title: 'Job Id',
                                          value: (controller.jobDetailsModel
                                                      .value?.id !=
                                                  null)
                                              ? controller
                                                      .jobDetailsModel.value?.id
                                                      .toString() ??
                                                  ''
                                              : '',
                                        ),
                                        JobDetailField(
                                          title: 'Job Title',
                                          value: controller.jobDetailsModel
                                                  .value?.jobTitle ??
                                              '',
                                        ),
                                        JobDetailField(
                                          title: 'Assigned To',
                                          value: controller.jobDetailsModel
                                                  .value?.assignedName ??
                                              "",
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
                                              ? controller.jobDetailsModel.value
                                                  ?.equipmentCatList
                                                  ?.map<String>((item) => item
                                                      .equipmentCatName
                                                      .toString())
                                                  .toList()
                                              : [],
                                        ),
                                        JobDetailMultiValueField(
                                          title: 'Fault',
                                          values: (controller.jobDetailsModel
                                                      .value?.workType !=
                                                  null)
                                              ? controller.jobDetailsModel.value
                                                  ?.workType
                                                  ?.map<String>((item) => item
                                                      .equipmentCatName
                                                      .toString())
                                                  .toList()
                                              : [],
                                        ),
                                        JobDetailField(
                                          title: 'Breakdown Time',
                                          value: controller.jobDetailsModel
                                                  .value?.breakdownTime
                                                  .toString() ??
                                              '',
                                        ),
                                        // JobDetailField(
                                        //   title: 'Breakdown Type',
                                        //   value: controller.jobDetailsModel
                                        //           .value?.breakdownType ??
                                        //       '',
                                        // ),
                                        JobDetailField(
                                          title: 'Job Description',
                                          value: controller.jobDetailsModel
                                                  .value?.jobDescription ??
                                              '',
                                        ),
                                        // JobDetailField(
                                        //   title: 'Permit ID',
                                        //   value: (controller.jobDetailsModel
                                        //               .value?.currentPtwId !=
                                        //           null)
                                        //       ? controller.jobDetailsModel.value
                                        //               ?.currentPtwId
                                        //               .toString() ??
                                        //           ''
                                        //       : '',
                                        // ),
                                        JobDetailField(
                                          title: 'Standard Action',
                                          value: controller.jobDetailsModel
                                                  .value?.standardAction ??
                                              "",
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
                                        // JobDetailField(
                                        //   title: 'Current Status',
                                        //   value: controller.jobDetailsModel
                                        //           .value.latestJCStatus ??
                                        //       "",
                                        //   // value: '', //
                                        //   // value: JobStatusData
                                        //   //     .getStatusStringFromInt(controller
                                        //   //     .jobDetailsModel
                                        //   //     .value
                                        //   //     ?.status),
                                        // ),
                                        JobDetailField(
                                          title: 'Raised By',
                                          value: controller.jobDetailsModel
                                                  .value?.createdByName ??
                                              "",
                                        ),

                                        JobDetailField(
                                          title: 'Block Name',
                                          value: controller.jobDetailsModel
                                                  .value?.blockName ??
                                              '',
                                        ),
                                        JobDetailMultiValueField(
                                          title: 'Working Area/Equipments',
                                          values: (controller.jobDetailsModel
                                                      .value?.workingAreaList !=
                                                  null)
                                              ? controller.jobDetailsModel.value
                                                  ?.workingAreaList
                                                  ?.map<String>((item) => item
                                                      .workingAreaName
                                                      .toString())
                                                  .toList()
                                              : [],
                                        ),

                                        // JobDetailMultiValueField(
                                        //   title: 'Work Type',
                                        //   values: (controller.jobDetailsModel
                                        //               .value?.workType !=
                                        //           null)
                                        //       ? controller.jobDetailsModel.value
                                        //           ?.workType
                                        //           ?.map<String>(
                                        //               (item) => item.toString())
                                        //           .toList()
                                        //       : [],
                                        // ),
                                        if (controller
                                                .jobDetailsModel
                                                .value
                                                ?.associatedPermitList
                                                ?.isNotEmpty ??
                                            false)
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
                                ),
                              ]),
                          Spacer(),
                          Wrap(children: [
                            if (controller.jobDetailsModel.value?.status == 101)
                              CustomElevatedButton(
                                onPressed: () => controller.goToEditJobScreen(
                                    controller.jobDetailsModel.value?.id),
                                text: 'Assign',
                              ),
                            if ((controller.jobDetailsModel.value?.assignedId ??
                                    0) >
                                0) ...[
                              CustomElevatedButton(
                                onPressed: () => controller.goToEditJobScreen(
                                    controller.jobDetailsModel.value?.id),
                                text: 'Re-Assign',
                                icon: Icons.edit,
                              ),
                            ],
                            Dimens.boxWidth10,
                            if (controller.jobDetailsModel.value
                                        ?.latestJCStatus ==
                                    155 ||
                                controller.jobDetailsModel.value?.status == 102)
                              CustomElevatedButton(
                                text: "Create New Permit",
                                icon: Icons.add,
                                onPressed: () => controller.createNewPermit(),
                                backgroundColor: ColorValues.appLightBlueColor,
                              ),
                          ]),
                        ]),
                  )
                : Dimens.box0,
          ),
        ),
      ),
    ]),
  );
}
