import 'package:cmms/app/attendance_screen/attendance_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AttendanceWeb extends GetView<AttendanceController> {
  AttendanceWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
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
                    color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
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
                      controller.clearStoreData();
                      Get.offNamed(Routes.admin_dashboard);
                    },
                    child: Text(
                      "/ ADMINISTRATION",
                      style: Styles.greyLight14,
                    ),
                  ),
                  Text(
                    " / MARK ATTENDANCE",
                    style: Styles.greyLight14,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width * 7,
                    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Card(
                      color: ColorValues.cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: (controller.attendanceModel.length * 50) +
                                  125,
                              width: Get.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "HFE Employee Attendance",
                                          style: Styles.blue17,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Choose Date: ",
                                              style: Styles.black14,
                                            ),
                                            _buildDateField_web(
                                              context,
                                              controller.dateController,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Container(
                                    height: (controller.attendanceModel.length *
                                            50) +
                                        60,
                                    child: Obx(
                                      () => DataTable2(
                                        // border: TableBorder.all(
                                        //   color: ColorValues.greyLightColour,
                                        // ),
                                        dataRowHeight: 50.0,
                                        columns: const [
                                          DataColumn2(
                                            label: Text('Sr. No'),
                                            fixedWidth: 70,
                                          ),
                                          DataColumn2(
                                            label: Text('Employee ID'),
                                            size: ColumnSize.S,
                                          ),
                                          DataColumn2(
                                            label: Text('Employee Name'),
                                            size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            label: Text('Present'),
                                            size: ColumnSize.S,
                                          ),
                                          DataColumn2(
                                            label: Text('In Time'),
                                            size: ColumnSize.L,
                                          ),
                                          DataColumn2(
                                            label: Text('Out Time'),
                                            size: ColumnSize.L,
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          controller.attendanceModel.length,
                                          (index) {
                                            final employee = controller
                                                .attendanceModel[index];
                                            return DataRow(
                                              cells: [
                                                DataCell(
                                                  Text(
                                                    "${index + 1}",
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    "EMP ${employee?.id}",
                                                  ),
                                                ),
                                                DataCell(
                                                  Text(
                                                    "${employee?.name}",
                                                  ),
                                                ),
                                                DataCell(
                                                  Checkbox(
                                                    value:
                                                        employee?.present.value,
                                                    onChanged: (bool? value) {
                                                      controller
                                                          .isPresent(index);
                                                    },
                                                  ),
                                                ),
                                                DataCell(
                                                  IgnorePointer(
                                                    ignoring: employee?.present
                                                                .value ==
                                                            true
                                                        ? false
                                                        : true,
                                                    child: _buildTimeField_web(
                                                      context: context,
                                                      index: index,
                                                      position: 1,
                                                      textcontroller: controller
                                                              .inTimeControllers[
                                                          index],
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  IgnorePointer(
                                                    ignoring: employee?.present
                                                                .value ==
                                                            true
                                                        ? false
                                                        : true,
                                                    child: _buildTimeField_web(
                                                      context: context,
                                                      index: index,
                                                      position: 2,
                                                      textcontroller: controller
                                                              .outTimeControllers[
                                                          index],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              width: Get.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Contract Labour Attendance",
                                      style: Styles.blue17,
                                    ),
                                  ),
                                  Divider(
                                    color: ColorValues.greyLightColour,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: Get.width * 0.2,
                                        margin: EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            contractLaborNumberField(
                                              context,
                                              "Age Less Than 35: ",
                                              controller.lessThan35,
                                            ),
                                            contractLaborNumberField(
                                              context,
                                              "Age Between 35-50: ",
                                              controller.between35To50,
                                            ),
                                            contractLaborNumberField(
                                              context,
                                              "Age Greater Than 50: ",
                                              controller.greaterThan50,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        width: Get.width * 0.5,
                                        margin: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Purpose: ",
                                              style: Styles.black14,
                                            ),
                                            Dimens.boxWidth7,
                                            _buildPurposeFieldWeb(context)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Dimens.boxHeight60,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Spacer(),
          Container(
            height: 45,
            child: CustomElevatedButton(
              backgroundColor: ColorValues.cancelColor,
              text: "Close",
              onPressed: () {
                controller.clearData();
                Get.offNamed(Routes.admin_dashboard);
              },
            ),
          ),
          Dimens.boxWidth10,
          Container(
            height: 45,
            child: CustomElevatedButton(
              backgroundColor: ColorValues.submitColor,
              text: "Submit",
              onPressed: () {
                controller.addAttendance();
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildTimeField_web({
    required BuildContext context,
    required int index,
    required int position, // 1 = in time and 2 = out time
    required TextEditingController textcontroller,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width / 7,
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
            child: SizedBox(
              child: TextField(
                textAlign: TextAlign.left,
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
                  // contentPadding: EdgeInsets.only(bottom: 3),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onTap: () =>
                    _pickTime(context, textcontroller, index, position),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickTime(
    BuildContext context,
    TextEditingController controllertxt,
    int index,
    int position,
  ) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: position == 1
          ? TimeOfDay(hour: 10, minute: 00)
          : TimeOfDay(hour: 18, minute: 00),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      controllertxt.text = pickedTime.format(context);
      if (position == 1) {
        controller.updateInTime(index, controllertxt.text);
      } else {
        controller.updateOutTime(index, controllertxt.text);
      }
    }
  }

  Widget contractLaborNumberField(
    BuildContext context,
    String text,
    TextEditingController numcontroller,
  ) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Styles.black14,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            width: 70,
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
            child: SizedBox(
              child: TextField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    height: 1.0,
                    color: Colors.black,
                  ),
                ),
                controller: numcontroller,
                decoration: InputDecoration(
                  fillColor: ColorValues.whiteColor,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurposeFieldWeb(BuildContext context) {
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
            width: MediaQuery.of(context).size.width * .4,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16.0,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              controller: controller.purposeCtrl,
              focusNode: controller.focusPurpose,
              scrollController: controller.scrollPurpose,
              keyboardType: TextInputType.multiline,
              autofocus: false,
              maxLines: 7,
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

  Widget _buildDateField_web(
    BuildContext context,
    TextEditingController textcontroller,
  ) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width / 7,
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
          child: SizedBox(
            child: TextField(
              textAlign: TextAlign.left,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 16.0,
                  height: 1.0,
                  color: Colors.black,
                ),
              ),
              readOnly: true,
              controller: textcontroller,
              decoration: InputDecoration(
                fillColor: ColorValues.whiteColor,
                filled: true,
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onTap: () => _selectDate(context, textcontroller),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController textController) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Adjust to your earliest allowed date
      lastDate: DateTime.now(), // Restricting to today or past dates
    );
    if (picked != null && picked != DateTime.tryParse(textController.text)) {
      textController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }
}
