import 'package:cmms/app/app.dart';
import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/execute_course/execute_course_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/utils/url_path.dart';
import 'package:cmms/app/veg_execution_screen/view/widgets/veg_schedule_approve_dialog.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExecuteCourseWeb extends GetView<ExecuteCourseController> {
  ExecuteCourseWeb({Key? key}) : super(key: key);
  final FileUploadController dropzoneController =
      Get.put(FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          color: Color.fromARGB(255, 234, 236, 238),
          width: Get.width,
          height: Get.height,
          child: Column(
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
                    controller.type.value == 1
                        ? InkWell(
                            onTap: () {
                              controller.clearStoreData();
                              Get.offNamed(Routes.scheduleCourseList);
                            },
                            child: Text(
                              " / Schedule Course".toUpperCase(),
                              style: Styles.greyLight14,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              controller.clearStoreData();
                              Get.offNamed(Routes.scheduleCourseList);
                            },
                            child: Text(
                              " / Training Schedule List".toUpperCase(),
                              style: Styles.greyLight14,
                            ),
                          ),
                    Text(
                      " / Execute Course".toUpperCase(),
                      style: Styles.greyLight14,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width * 7,
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Card(
                      margin: Dimens.edgeInsets12,
                      color: ColorValues.cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Execute Course",
                                  style: Styles.blackBold18,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: ColorValues.greyLightColour,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 30,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            TitleAndInfo(
                                              "Training Course:",
                                              "${controller.scheduleCourseDetails.value.training_course ?? ""}",
                                            ),
                                            Dimens.boxHeight10,
                                            TitleAndInfo(
                                              "Training Agency:",
                                              "${controller.scheduleCourseDetails.value.training_agency ?? ""}",
                                            ),
                                            Dimens.boxHeight10,
                                            TitleAndInfo(
                                              "Venue:",
                                              "${controller.scheduleCourseDetails.value.venue ?? ""}",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            TitleAndInfo(
                                              "Date of Training:",
                                              "${controller.scheduleCourseDetails.value.date_of_Training ?? ""}",
                                            ),
                                            Dimens.boxHeight10,
                                            TitleAndInfo(
                                              "Trainer:",
                                              "${controller.scheduleCourseDetails.value.trainer ?? ""}",
                                            ),
                                            Dimens.boxHeight10,
                                            TitleAndInfo(
                                              "HFE Employee:",
                                              "${controller.scheduleCourseDetails.value.hfe_Employee ?? ""}",
                                            ),
                                            Dimens.boxHeight10,
                                            TitleAndInfo(
                                              "Mode:",
                                              "${controller.scheduleCourseDetails.value.mode ?? ""}",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight20,
                                Center(
                                  child: Container(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(.3)),
                                    ),
                                    constraints: BoxConstraints(
                                      maxWidth: 1400,
                                    ),
                                    child: CustomAppBar(
                                      title: 'Employees'.tr,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Wrap(
                                    children: [
                                      Container(
                                        height: (controller
                                                    .internal_employee.length *
                                                50) +
                                            55,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        constraints: BoxConstraints(
                                          maxWidth: 1400,
                                          minHeight: 60,
                                        ),
                                        child: DataTable2(
                                          // dataRowHeight: 50,
                                          border: TableBorder.all(
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                          columns: [
                                            DataColumn2(
                                              size: ColumnSize.M,
                                              label: Text(
                                                "Employee Name",
                                              ),
                                            ),
                                            DataColumn2(
                                              size: ColumnSize.M,
                                              label: Text(
                                                "Email",
                                              ),
                                            ),
                                            DataColumn2(
                                              size: ColumnSize.M,
                                              label: Text(
                                                "Contact No",
                                              ),
                                            ),
                                            if (controller.type.value == 1) ...[
                                              DataColumn2(
                                                size: ColumnSize.S,
                                                label: Text(
                                                  "RSVP",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.S,
                                                label: Text(
                                                  "Attended",
                                                ),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.L,
                                                label: Text(
                                                  "Note",
                                                ),
                                              ),
                                            ]
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.internal_employee.length,
                                            (index) {
                                              var employeeNameDetails =
                                                  controller
                                                      .internal_employee[index];
                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                    Text(
                                                      '${employeeNameDetails.name ?? ''}',
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      '${employeeNameDetails.email ?? ''}',
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      '${employeeNameDetails.mobile ?? ''}',
                                                    ),
                                                  ),
                                                  if (controller.type.value ==
                                                      1) ...[
                                                    DataCell(
                                                      Text(
                                                        "${employeeNameDetails.rsvp ?? "Undefined"}",
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Checkbox(
                                                        value:
                                                            employeeNameDetails
                                                                .attendend
                                                                !.value,
                                                        onChanged:
                                                            (bool? value) {
                                                          controller.isPresent(
                                                            index,
                                                            1,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    DataCell(
                                                      _buildTextField_web(
                                                        context,
                                                        controller
                                                                .noteListInternal[
                                                            index],
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Dimens.boxHeight15,
                                Center(
                                  child: Container(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(.3)),
                                    ),
                                    constraints: BoxConstraints(
                                      maxWidth: 1400,
                                    ),
                                    child: CustomAppBar(
                                      title: 'External People'.tr,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Wrap(
                                    children: [
                                      Container(
                                        height: (controller
                                                    .external_employee.length *
                                                50) +
                                            55,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        constraints: BoxConstraints(
                                          maxWidth: 1400,
                                          minHeight: 60,
                                        ),
                                        child: DataTable2(
                                          border: TableBorder.all(
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                          columns: [
                                            DataColumn2(
                                              size: ColumnSize.M,
                                              label: Text(
                                                "Name",
                                              ),
                                            ),
                                            DataColumn2(
                                              size: ColumnSize.M,
                                              label: Text(
                                                "Email",
                                              ),
                                            ),
                                            DataColumn2(
                                              size: ColumnSize.M,
                                              label: Text(
                                                "Contact No",
                                              ),
                                            ),
                                            if (controller.type.value == 1) ...[
                                              DataColumn2(
                                                size: ColumnSize.S,
                                                label: Text("RSVP"),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.S,
                                                label: Text("Attended"),
                                              ),
                                              DataColumn2(
                                                size: ColumnSize.L,
                                                label: Text("Note"),
                                              ),
                                            ],
                                          ],
                                          rows: List<DataRow>.generate(
                                            controller.external_employee.length,
                                            (index) {
                                              var employee = controller
                                                  .external_employee[index];
                                              return DataRow(
                                                cells: [
                                                  DataCell(
                                                    Text(
                                                      '${employee.name ?? ''}',
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      '${employee.email ?? ''}',
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      '${employee.mobile ?? ''}',
                                                    ),
                                                  ),
                                                  if (controller.type.value ==
                                                      1) ...[
                                                    DataCell(
                                                      Text(
                                                          "${employee.rsvp ?? 'Undefined'}"),
                                                    ),
                                                    DataCell(
                                                      Checkbox(
                                                        value: employee
                                                            .attendend!.value,
                                                        onChanged: (value) {
                                                          controller.isPresent(
                                                              index, 2);
                                                        },
                                                      ),
                                                    ),
                                                    DataCell(
                                                      _buildTextField_web(
                                                        context,
                                                        controller
                                                                .noteListExternal[
                                                            index],
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                controller.type.value == 1
                                    ? Center(
                                        child: Container(
                                          height: Get.height * 0.2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          constraints:
                                              BoxConstraints(maxWidth: 1400),
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child:
                                                    FileUploadWidgetWithDropzone(),
                                              ),
                                              Dimens.boxWidth10,
                                              Expanded(
                                                flex: 8,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child:
                                                      FileUploadDetailsWidgetWeb2(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Dimens.box0,
                                controller.type.value == 1
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          children: [
                                            CustomRichText(title: "Comments: "),
                                            Dimens.boxWidth10,
                                            _buildCommentFieldWeb(context),
                                          ],
                                        ),
                                      )
                                    : Dimens.box0,
                                Dimens.boxHeight20,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: controller.type.value == 1
          ? Row(
              children: [
                Spacer(),
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.redColor,
                    text: "Cancel",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Dimens.boxWidth10,
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.greenColor,
                    text: 'Execute',
                    onPressed: () {
                      controller.execute();
                    },
                  ),
                ),
                Spacer(),
              ],
            )
          : Row(
              children: [
                Spacer(),
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.greenColor,
                    text: 'Approve',
                    onPressed: () {
                      Get.dialog(
                        CustomScheduleApproveRejectDialog(
                          text: "Schedule Approve",
                          controller: controller,
                          buttonText: "Approve",
                          style: Styles.greenElevatedButtonStyle,
                          onPressed: () {
                            controller.approveCourseSchedule(
                              controller
                                      .scheduleCourseDetails.value.scheduleId ??
                                  0,
                            );
                            Get.offNamed(Routes.trainingCourse);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Dimens.boxWidth10,
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.redColor,
                    text: "Reject",
                    onPressed: () {
                      Get.dialog(
                        CustomScheduleApproveRejectDialog(
                          text: "Schedule Reject",
                          controller: controller,
                          buttonText: "Reject",
                          style: Styles.darkRedElevatedButtonStyle,
                          onPressed: () {
                            controller.rejectCourseSchedule(
                              controller
                                      .scheduleCourseDetails.value.scheduleId ??
                                  0,
                            );
                            Get.offNamed(Routes.trainingCourse);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
    );
  }

  Widget _buildCommentFieldWeb(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
                spreadRadius: 0.5,
              ),
            ],
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SizedBox(
            width: Get.width * 0.6,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16.0,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              controller: controller.comment,
              focusNode: controller.commentFocus,
              scrollController: controller.commentScroll,
              keyboardType: TextInputType.multiline,
              autofocus: false,
              maxLines: 4,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                // contentPadding: Dimens.edgeInsets05_10,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              onChanged: (value) {},
            ),
          ),
        ),
        Dimens.boxHeight10,
      ],
    );
  }

  Widget _buildTextField_web(
    BuildContext context,
    TextEditingController textcontroller,
  ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(vertical: 5),
          width: Get.width * 0.15,
          height: 30,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0,
                spreadRadius: 0.5,
              ),
            ],
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16.0,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              controller: textcontroller,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              textAlignVertical: TextAlignVertical.top,
            ),
          ),
        ),
      ],
    );
  }
}

class TitleAndInfo extends StatelessWidget {
  final String title;
  final String info;

  TitleAndInfo(this.title, this.info);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: Styles.black17,
          ),
        ),
        Expanded(
          child: Text(
            info,
            style: Styles.blue17,
          ),
        ),
      ],
    );
  }
}
