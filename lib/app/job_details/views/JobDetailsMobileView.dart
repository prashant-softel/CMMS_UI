import 'package:cmms/app/constant/constant.dart';
import 'package:cmms/app/job_details/job_details_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/utils/user_access_constants.dart';
import 'package:cmms/app/widgets/table_action_button.dart';
import 'package:cmms/domain/models/job_details_model.dart';
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
  return (controller.jobDetailsModel.value != null)
      ? //
      Obx(
          () => //
              SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: Get.height,
                child: Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                        value: (controller.jobDetailsModel.value
                                                    ?.id !=
                                                null)
                                            ? controller
                                                    .jobDetailsModel.value?.id
                                                    .toString() ??
                                                ''
                                            : '',
                                      ),
                                      JobDetailField(
                                        title: 'Job Title',
                                        value: controller.jobDetailsModel.value
                                                ?.jobTitle ??
                                            '',
                                      ),
                                      JobDetailField(
                                        title: 'Assigned To',
                                        value: controller.jobDetailsModel.value
                                                ?.assignedName ??
                                            "",
                                      ),

                                      JobDetailField(
                                        title: 'Plant name',
                                        value: controller.jobDetailsModel.value
                                                ?.facilityName ??
                                            '',
                                      ),
                                      JobDetailMultiValueField(
                                        title: 'Equipment Categories',
                                        values: (controller.jobDetailsModel
                                                    .value?.equipmentCatList !=
                                                null)
                                            ? controller.jobDetailsModel.value
                                                ?.equipmentCatList
                                                ?.map<String>((item) =>
                                                    item.name.toString())
                                                .toList()
                                            : [],
                                      ),
                                      JobDetailMultiValueField(
                                        title: 'Fault',
                                        values: (controller.jobDetailsModel
                                                    .value?.workType !=
                                                null)
                                            ? controller
                                                .jobDetailsModel.value?.workType
                                                ?.map<String>((item) => item
                                                    .equipmentCatName
                                                    .toString())
                                                .toList()
                                            : [],
                                      ),
                                      JobDetailField(
                                        title: 'Breakdown Time',
                                        value: controller.jobDetailsModel.value
                                                ?.breakdownTime
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
                                        value: controller.jobDetailsModel.value
                                                ?.jobDescription ??
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
                                        value: controller.jobDetailsModel.value
                                                ?.standardAction ??
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
                                        value: controller.jobDetailsModel.value
                                                ?.createdByName ??
                                            "",
                                      ),

                                      JobDetailField(
                                        title: 'Block Name',
                                        value: controller.jobDetailsModel.value
                                                ?.blockName ??
                                            '',
                                      ),
                                      // JobDetailMultiValueField(
                                      //   title: 'Working Area/Equipments',
                                      //   values: (controller.jobDetailsModel
                                      //               .value?.workingAreaList !=
                                      //           null)
                                      //       ? controller.jobDetailsModel.value
                                      //           ?.workingAreaList
                                      //           ?.map<String>((item) => item
                                      //               .workingAreaName
                                      //               .toString())
                                      //           .toList()
                                      //       : [],
                                      // ),

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
                        Text(
                          "Associated JobCard(s) ",
                          style: Styles.blue700,
                        ),
                        Dimens.boxHeight10,
                        controller.jobAssociatedModelsList!.length > 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.jobAssociatedModelsList !=
                                        null
                                    ? controller.jobAssociatedModelsList.length
                                    : 0,
                                itemBuilder: (context, index) {
                                  final jobAssociatedModelsListModel =
                                      controller.jobAssociatedModelsList != null
                                          ? controller
                                              .jobAssociatedModelsList[index]
                                          : JobAssociatedModel();

                                  // print('Current Status: $status');
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      color: Colors.lightBlue.shade50,
                                      elevation: 10,
                                      shadowColor: Colors.black87,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Job Card Id: ${jobAssociatedModelsListModel?.jobCardId ?? 0}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),

                                                // GestureDetector(
                                                //   onTap: () {
                                                //     _showPopupMenu(context);
                                                //   },
                                                //   child: Image.asset(
                                                //     'assets/files/menu_vertical.png',
                                                //     width: 40,
                                                //   ),
                                                // ),
                                              ]),
                                          Row(children: [
                                            Expanded(
                                              child: Text(
                                                'Permit ID ',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'PTW${jobAssociatedModelsListModel?.permitId ?? ''}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Job Card Date: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${jobAssociatedModelsListModel?.jobCardDate ?? ''}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Status: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  jobAssociatedModelsListModel
                                                          ?.status_short ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Dimens.boxHeight10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              controller.listMrsByJobId!
                                                          .length >
                                                      0
                                                  ? Dimens.box0
                                                  : TableActionButton(
                                                      color: ColorValues
                                                          .addNewColor,
                                                      message: "Add MRS",
                                                      icon: Icons.assignment,
                                                      onPress: () async {
                                                        controller
                                                            .clearTypeStoreData();
                                                        controller
                                                            .clearStoreTaskData();
                                                        controller
                                                            .clearStoreTaskActivityData();
                                                        controller
                                                            .clearStoreTasktoActorData();
                                                        controller
                                                            .clearStoreTaskWhereUsedData();
                                                        controller
                                                            .clearStoreTaskfromActorData();

                                                        Get.offAllNamed(
                                                            Routes.createMrs,
                                                            arguments: {
                                                              "whereUsedId":
                                                                  controller
                                                                      .jobAssociatedModelsList?[
                                                                          index]
                                                                      ?.jobCardId,
                                                              "activity": controller
                                                                  .jobDetailsModel
                                                                  .value
                                                                  ?.jobTitle,
                                                              "type": 1,
                                                              "whereUsed": 4,
                                                              "fromActorTypeId":
                                                                  2,
                                                              "to_actor_type_id":
                                                                  4
                                                            });
                                                      },
                                                    ),
                                              TableActionButton(
                                                  color: ColorValues.viewColor,
                                                  icon: Icons.remove_red_eye,
                                                  message: "View Job Card",
                                                  onPress: () {
                                                    controller.clearStoreData();
                                                    controller
                                                        .clearValueJobId();
                                                    String jobCardId = controller
                                                            .jobAssociatedModelsList?[
                                                                index]
                                                            ?.jobCardId
                                                            .toString() ??
                                                        "";
                                                    print({"JcId": jobCardId});

                                                    Get.toNamed(
                                                        '${Routes.jobCard}/$jobCardId');
                                                  }),
                                              varUserAccessModel
                                                          .value.access_list!
                                                          .where((e) =>
                                                              e.feature_id ==
                                                                  UserAccessConstants
                                                                      .kJobFeatureId &&
                                                              e.view ==
                                                                  UserAccessConstants
                                                                      .kHaveViewAccess)
                                                          .length >
                                                      0
                                                  ? TableActionButton(
                                                      color: ColorValues
                                                          .appLightBlueColor,
                                                      icon:
                                                          Icons.remove_red_eye,
                                                      message: "View Permit",
                                                      onPress: () {
                                                        controller
                                                            .clearPermitStoreData();
                                                        controller.viewNewPermitList(
                                                            permitId: controller
                                                                    .jobAssociatedModelsList?[
                                                                        index]
                                                                    ?.permitId ??
                                                                0,
                                                            jobId: controller
                                                                    .jobDetailsModel
                                                                    .value!
                                                                    .id ??
                                                                0);
                                                      })
                                                  : Container(),
                                              TableActionButton(
                                                  color: ColorValues
                                                      .appYellowColor,
                                                  icon: Icons.copy,
                                                  message: "Clone Permit"
                                                  // onPress:
                                                  //     () =>
                                                  //         controller.goToJobCardScreen(),
                                                  ),
                                            ],
                                          )
                                        ]),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container(
                                // margin: Dimens.edgeInsets20,
                                height: Get.height / 7,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "Associated JobCard(s) ",
                                        style: Styles.blue700,
                                      ),
                                    ),
                                    Divider(
                                      color: ColorValues.greyLightColour,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("No Data Found"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                        Dimens.boxHeight10,
                        Text(
                          "Material Issue / Used",
                          style: Styles.blue700,
                        ),
                        Dimens.boxHeight10,
                        controller.listMrsByJobId!.length > 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.listMrsByJobId != null
                                    ? controller.listMrsByJobId.length
                                    : 0,
                                itemBuilder: (context, index) {
                                  final listMrsByJobIdModel =
                                      controller.listMrsByJobId != null
                                          ? controller.listMrsByJobId[index]
                                          : JobAssociatedModel();

                                  // print('Current Status: $status');
                                  return SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      color: Colors.lightBlue.shade50,
                                      elevation: 10,
                                      shadowColor: Colors.black87,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Job Card Id: ${listMrsByJobIdModel?.jobCardId ?? 0}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorValues
                                                          .navyBlueColor,
                                                    ),
                                                  ),
                                                ),

                                                // GestureDetector(
                                                //   onTap: () {
                                                //     _showPopupMenu(context);
                                                //   },
                                                //   child: Image.asset(
                                                //     'assets/files/menu_vertical.png',
                                                //     width: 40,
                                                //   ),
                                                // ),
                                              ]),
                                          Row(children: [
                                            Expanded(
                                              child: Text(
                                                'MRS ID:',
                                                style: const TextStyle(
                                                  color: ColorValues.blackColor,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'PTW${listMrsByJobIdModel?.mrsId ?? ''}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorValues.navyBlueColor,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Mrs Items List: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${listMrsByJobIdModel?.mrsItems ?? ''}',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Status: ',
                                                  style: const TextStyle(
                                                    color:
                                                        ColorValues.blackColor,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  listMrsByJobIdModel
                                                          ?.status_short ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: ColorValues
                                                        .navyBlueColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Dimens.boxHeight10,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TableActionButton(
                                                  color: ColorValues.viewColor,
                                                  icon: Icons.remove_red_eye,
                                                  message: "View MRS",
                                                  onPress: () {
                                                    // controller
                                                    //     .clearMrsIdStoreData();
                                                    String mrsId = controller
                                                            .listMrsByJobId?[
                                                                index]
                                                            ?.mrsId
                                                            .toString() ??
                                                        "";

                                                    String type = 1.toString();
                                                    Get.offNamed(
                                                        '${Routes.mrsApprovalScreen}/$mrsId/$type');

                                                    // print({"mrsId": mrsId});
                                                    // Get.toNamed(
                                                    //     Routes
                                                    //         .mrsApprovalScreen,
                                                    //     arguments: {
                                                    //       'mrsId': int.tryParse(
                                                    //           "$mrsId"),
                                                    //       'type': 1
                                                    //     });

                                                    Get.offNamed(
                                                        '${Routes.mrsApprovalScreen}/$mrsId/$type');
                                                  }),
                                              TableActionButton(
                                                  color: ColorValues.editColor,
                                                  icon: Icons.edit,
                                                  message: "Edit MRS",
                                                  onPress: () {
                                                    // final _flutterSecureStorage =
                                                    //     const FlutterSecureStorage();

                                                    // _flutterSecureStorage.delete(
                                                    //     key: "mrsId");
                                                    String mrsId = controller
                                                            .listMrsByJobId?[
                                                                index]
                                                            ?.mrsId
                                                            .toString() ??
                                                        "";
                                                    print({"mrsId": mrsId});
                                                    Get.toNamed(Routes.editMrs,
                                                        arguments: {
                                                          'mrsId': int.tryParse(
                                                              "$mrsId"),
                                                          'type': 1
                                                        });
                                                  })
                                            ],
                                          )
                                        ]),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Dimens.box0,

                        ///  Spacer(),
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
                          if (controller
                                      .jobDetailsModel.value?.latestJCStatus ==
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
                ),
              ),
            ),
          ),
        )
      : Dimens.box0;
}
