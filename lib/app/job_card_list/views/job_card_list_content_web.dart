import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/job_card_list/job_card_list_controller.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/domain/models/job_card_model.dart';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../navigators/app_pages.dart';
import '../../theme/color_values.dart';
import '../../theme/styles.dart';
import '../../widgets/action_button.dart';
import '../../widgets/table_action_button.dart';

class JobCardContentWeb extends StatefulWidget {
  JobCardContentWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<JobCardContentWeb> createState() => _JobCardContentWebState();
}

class _JobCardContentWebState extends State<JobCardContentWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobCardListController>(
        id: 'job_list',
        builder: (controller) {
          return Obx(() {
            final dataSource = JobDataSource(controller);

            return Column(
              children: [
                HeaderWidget(),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 227, 224, 224),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: ColorValues.greyLightColor,
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.home);
                        },
                        child: Text(
                          "DASHBOARD",
                          style: Styles.greyLight14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routes.breakdown);
                        },
                        child: Text(" / BREAKDOWN MAINTAINANCE",
                            style: Styles.greyLight14),
                      ),
                      Text(" / JOB CARD LIST", style: Styles.greyLight14),
                    ],
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      child: Container(
                        width: Get.width * 7,
                        height: Get.height,
                        child: Card(
                          color: Color.fromARGB(255, 245, 248, 250),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Job Card List ",
                                        style: Styles.blackBold16,
                                      ),
                                      Spacer(),
                                      ActionButton(
                                        icon: Icons.add,
                                        label: "Add New",
                                        onPressed: () {
                                          Get.toNamed(Routes.addUser);
                                        },
                                        color: ColorValues.addNewColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: ColorValues.greyLightColour,
                                ),
                                Row(
                                  children: [
                                    // Container(
                                    //   height: 35,
                                    //   margin: EdgeInsets.only(left: 10),
                                    //   child: CustomElevatedButton(
                                    //     backgroundColor:
                                    //         ColorValues.appLightBlueColor,
                                    //     onPressed: () {},
                                    //     text: 'columnVisibility'.tr,
                                    //   ),
                                    // ),
                                    // Container(
                                    //   height: 35,
                                    //   margin: EdgeInsets.only(left: 10),
                                    //   child: CustomElevatedButton(
                                    //       backgroundColor:
                                    //           ColorValues.appLightBlueColor,
                                    //       onPressed: () {},
                                    //       text: 'Copy'),
                                    // ),
                                    // Container(
                                    //   height: 35,
                                    //   margin: EdgeInsets.only(left: 10),
                                    //   child: CustomElevatedButton(
                                    //       backgroundColor:
                                    //           ColorValues.appLightBlueColor,
                                    //       onPressed: () {},
                                    //       text: 'Excel'),
                                    // ),
                                    // Container(
                                    //   height: 35,
                                    //   margin: EdgeInsets.only(left: 10),
                                    //   child: CustomElevatedButton(
                                    //       backgroundColor:
                                    //           ColorValues.appLightBlueColor,
                                    //       onPressed: () {},
                                    //       text: 'PDF'),
                                    // ),
                                    Spacer(),
                                    Container(
                                      width: 200,
                                      height: 35,
                                      margin: Dimens.edgeInsets0_0_16_0,
                                      child: TextField(
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black),
                                        ),
                                        onChanged: (value) =>
                                            controller.search(value),
                                        decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 0.0),
                                          ),
                                          contentPadding:
                                              Dimens.edgeInsets10_0_0_0,
                                          hintText: 'search'.tr,
                                          hintStyle: Styles.grey12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                controller.jobList.isEmpty == true
                                    ? Center(child: Text('No data'))
                                    : Expanded(
                                        child: PaginatedDataTable2(
                                          // border: TableBorder.all(
                                          //     color: Color.fromARGB(
                                          //         255, 9, 5, 20)),
                                          // fixedLeftColumns: 1,
                                          // dataRowHeight: Get.height * 0.12,
                                          columnSpacing: 10,

                                          source:
                                              dataSource, // Custom DataSource class
                                          // headingRowHeight: Get.height * 0.12,
                                          minWidth: Get.width * 1.2,
                                          showCheckboxColumn: false,
                                          rowsPerPage:
                                              10, // Number of rows per page
                                          availableRowsPerPage: [
                                            10,
                                            20,
                                            30,
                                            50
                                          ],
                                          columns: [
                                            // buildDataColumn(
                                            //   'Id',
                                            //   'Id',
                                            //   //  ColumnSize.S,
                                            //   controller.IdFilterText,
                                            //   100,
                                            // ),
                                            buildDataColumn(
                                              'JobCardId',
                                              'Job Card Id',
                                              //  ColumnSize.S,
                                              controller.JobCardIdFilterText,
                                              130,
                                            ),
                                            buildDataColumn(
                                                "JobId",
                                                "Job Id",
                                                // ColumnSize.M,
                                                controller.JobIdFilterText,
                                                130),
                                            buildDataColumn(
                                              'PermitId',
                                              'Permit Id',
                                              //  ColumnSize.S,
                                              controller.PermitIdFilterText,
                                              130,
                                            ),
                                            buildDataColumn(
                                              'PermitNo',
                                              'Permit No.',
                                              //  ColumnSize.S,
                                              controller.PermitNoFilterText,
                                              130,
                                            ),
                                            buildDataColumn(
                                                "JobAssingedTo",
                                                "Assinged To", // ColumnSize.L,
                                                controller
                                                    .JobAssingedToFilterText,
                                                200),
                                            buildDataColumn(
                                                "Description",
                                                "Description",
                                                // ColumnSize.L,
                                                controller
                                                    .DescriptionFilterText,
                                                200),
                                            buildDataColumn(
                                                "StartTime",
                                                "Start Time",
                                                // ColumnSize.L,
                                                controller.StartTimeFilterText,
                                                200),
                                            buildDataColumn(
                                                "EndTime",
                                                "End Time",
                                                // ColumnSize.L,
                                                controller.EndTimeFilterText,
                                                200),
                                            buildDataColumn(
                                                'Action'.tr,
                                                'Actions',
                                                // ColumnSize.L,
                                                controller.ActionFilterText,
                                                150),
                                          ],
                                        ),
                                      )
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  DataColumn2 buildDataColumn(
    String columnName,
    String header,

    /// ColumnSize columnSize,
    RxString filterText,
    double? fixedWidth,
  ) {
    return //
        DataColumn2(
      // size: columnSize,
      fixedWidth: fixedWidth,

      label: //
          Column(
              mainAxisAlignment: MainAxisAlignment.center, //
              children: [
            // SizedBox(
            //   height: Get.height * 0.05,
            //   child: TextField(
            //     style: GoogleFonts.lato(
            //       textStyle: TextStyle(
            //           fontSize: 16.0, height: 1.0, color: Colors.black),
            //     ),
            //     onChanged: (value) {
            //       filterText.value = value;
            //     },
            //     textAlign: TextAlign.left,
            //     decoration: InputDecoration(
            //       hintText: 'Filter',
            //       contentPadding: EdgeInsets.fromLTRB(
            //           5, 0, 5, 0), // Reduced vertical padding
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         borderSide: BorderSide(color: Colors.black),
            //       ),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                header,
                style: Styles.black16W500,
              ),
            ),
          ]),
      // ),
    );
  }
}

class JobDataSource extends DataTableSource {
  final JobCardListController controller;

  late List<JobCardModel?> filteredJobList;

  JobDataSource(this.controller) {
    filterUsers();
  }

  ///
  void filterUsers() {
    filteredJobList = <JobCardModel?>[];
    filteredJobList = controller.jobList.where((Job) {
      return (Job?.id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.IdFilterText.value.toLowerCase()) &&
          (Job?.jobCardId ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.JobCardIdFilterText.value.toLowerCase()) &&
          (Job?.jobId ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.JobIdFilterText.value.toLowerCase()) &&
          (Job?.job_assinged_to ?? '').toLowerCase().contains(
              controller.JobAssingedToFilterText.value.toLowerCase()) &&
          (Job?.description ?? '')
              .toLowerCase()
              .contains(controller.DescriptionFilterText.value.toLowerCase()) &&
          (Job?.start_time ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.StartTimeFilterText.value.toLowerCase()) &&
          (Job?.end_time ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.EndTimeFilterText.value.toLowerCase()) &&
          (Job?.permit_id ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.PermitIdFilterText.value.toLowerCase()) &&
          (Job?.permit_no ?? '')
              .toString()
              .toLowerCase()
              .contains(controller.PermitNoFilterText.value.toLowerCase());

      // (User?.status ?? '')
      //     .toString()
      //     .toLowerCase()
      //     .contains(controller.statusFilterText.value.toLowerCase());
      // Add other filter conditions as needed
    }).toList();
  }

  @override
  DataRow? getRow(int index) {
    final JobDetails = filteredJobList[index];

    controller.jobId.value = JobDetails?.id ?? 0;

    return DataRow.byIndex(
      index: index,
      onSelectChanged: (value) {
        controller.clearStoreData();
        controller.clearStoreData();
        int jobCardId = JobDetails?.jobCardId ?? 0;
        if (jobCardId != 0) {
          Get.toNamed(Routes.jobCard, arguments: {'JcId': jobCardId});
        }
      },
      cells: [
        // '${JobDetails?.id ?? ''}',
        'JC${JobDetails?.jobCardId ?? ''}',
        'JOB${JobDetails?.jobId ?? ''}', '${JobDetails?.permit_id ?? ''}',
        '${JobDetails?.permit_no ?? ''}',

        '${JobDetails?.job_assinged_to ?? ''}',
        '${JobDetails?.description ?? ''}',
        '${JobDetails?.start_time ?? ''}',
        '${JobDetails?.end_time ?? ''}',
        'Actions',
      ].map((value) {
        return DataCell(
          Padding(
            padding: EdgeInsets.zero,
            child: (value == 'Actions')
                ? Wrap(children: [
                    TableActionButton(
                      color: ColorValues.viewColor,
                      icon: Icons.remove_red_eye_outlined,
                      message: 'view',
                      onPress: () {
                        controller.clearStoreData();
                        int jobCardId = JobDetails?.jobCardId ?? 0;
                        if (jobCardId != 0) {
                          Get.toNamed(Routes.jobCard,
                              arguments: {'JcId': jobCardId});
                        }
                      },
                    ),
                  ])
                : Text(value.toString()),
          ),
        );
      }).toList(),
    );
  }

  @override
  int get rowCount => filteredJobList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
