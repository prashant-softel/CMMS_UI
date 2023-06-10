import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/models/job_model.dart';
import '../../home/widgets/header_widget.dart';
import '../../home/widgets/home_drawer.dart';
import '../../theme/color_values.dart';
import '../../theme/dimens.dart';
import '../../utils/app_constants.dart';
import '../../utils/responsive.dart';
import '../../widgets/custom_elevated_button.dart';
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
      appBar: Responsive.isDesktop(context)
          ? AppBar(
              title: HeaderWidget(),
              elevation: 0,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
            )
          : AppBar(
              title: Text('Job Details'),
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Get.back(),
              ),
            ),
      drawer: //
          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? HomeDrawer() //ResponsiveSideMenu()
              : null,
      body:
          //
          Container(
        height: Get.height,
        width: Get.width,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (Responsive.isMobile(context) || Responsive.isTablet(context))
                  ? Dimens.box0
                  : HomeDrawer(),
              Expanded(child: JobDetailsWidgetContent()),
            ]),
      ),
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
                                              ? controller.jobDetailsModel.value
                                                  ?.equipmentCatList
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
                                          title: 'Permit ID',
                                          value: (controller.jobDetailsModel
                                                      .value?.currentPtwId !=
                                                  null)
                                              ? controller.jobDetailsModel.value
                                                      ?.currentPtwId
                                                      .toString() ??
                                                  ''
                                              : '',
                                        ),
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
                                        JobDetailField(
                                          title: 'Current Status',
                                          // value: '', //
                                          value: JobStatusData
                                              .getStatusStringFromInt(controller
                                                  .jobDetailsModel
                                                  .value
                                                  ?.status),
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
                          Wrap(
                              // mainAxisAlignment: MainAxisAlignment.center, //
                              children: [
                                /// ASSIGN/RE-ASSIGN BUTTON

                                //check if status is "CREATED"
                                if (controller.jobDetailsModel.value?.status !=
                                        null &&
                                    JobStatusData.getStatusStringFromInt(
                                            controller.jobDetailsModel.value
                                                ?.status) ==
                                        AppConstants.kJobStatusCreated)
                                  CustomElevatedButton(
                                    onPressed: () =>
                                        controller.goToEditJobScreen(controller
                                            .jobDetailsModel.value?.id),
                                    text: 'Assign',
                                  ),

                                if ((controller.jobDetailsModel.value
                                            ?.assignedId ??
                                        0) >
                                    0) ...[
                                  //check if status is "ASSIGNED"
                                  if (controller
                                              .jobDetailsModel.value?.status !=
                                          null &&
                                      JobStatusData.getStatusStringFromInt(
                                              controller.jobDetailsModel.value
                                                  ?.status) ==
                                          AppConstants.kJobStatusAssigned)
                                    CustomElevatedButton(
                                      onPressed: () => controller
                                          .goToEditJobScreen(controller
                                              .jobDetailsModel.value?.id),
                                      text: 'Re-Assign',
                                      icon: Icons.edit,
                                    ),
                                ],
                                Dimens.boxWidth10,
                                //check if status is "ASSIGNED"
                                if (controller.jobDetailsModel.value?.status !=
                                        null &&
                                    JobStatusData.getStatusStringFromInt(
                                            controller.jobDetailsModel.value
                                                ?.status) ==
                                        AppConstants.kJobStatusAssigned)
                                  CustomElevatedButton(
                                    text: "Link to Existing Permit",
                                    icon: Icons.link,
                                    onPressed: () =>
                                        controller.showPermitsDialog(),
                                    backgroundColor: ColorValues.appYellowColor,
                                  ),
                                Dimens.boxWidth10,
                                //check if status is "ASSIGNED"
                                if (JobStatusData.getStatusStringFromInt(
                                        controller
                                            .jobDetailsModel.value?.status) ==
                                    AppConstants.kJobStatusAssigned)
                                  CustomElevatedButton(
                                    text: "Create New Permit",
                                    icon: Icons.add,
                                    onPressed: () =>
                                        controller.createNewPermit(),
                                    backgroundColor:
                                        ColorValues.appLightBlueColor,
                                  ), //check if status is "LINKED TO PERMIT"
                                if (JobStatusData.getStatusStringFromInt(
                                        controller
                                            .jobDetailsModel.value?.status) ==
                                    AppConstants.kJobStatusLinkedToPermit)
                                  CustomElevatedButton(
                                    text: "Job Card",
                                    icon: Icons.add,
                                    onPressed: () =>
                                        controller.goToJobCardScreen(),
                                    backgroundColor: ColorValues.appPurpleColor,
                                  ),
                              ]),
                        ]),
                  )
                : Dimens.box0,
          ),
        ),
      ),

      /// ASSOCIATED PERMITS TABLE
      (Responsive.isMobile(context) || Responsive.isTablet(context))
          ? Padding(
              padding: Dimens.edgeInsets10_0_10_0,
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Permits',
                  ),
                ),
                for (var associatedPermit
                    in controller.associatedPermitList ?? [])
                  PTWCardWidget(associatedPermit: associatedPermit),
              ]),
            )
          : Container(),
    ]),
  );
}
