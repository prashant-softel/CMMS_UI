import 'package:cmms/app/attendance_screen/attendance_controller.dart';
import 'package:cmms/app/home/widgets/mobile_header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AttendanceMobile extends StatefulWidget {
  const AttendanceMobile({Key? key}) : super(key: key);

  @override
  _AttendanceMobileState createState() => _AttendanceMobileState();
}

class _AttendanceMobileState extends State<AttendanceMobile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      id: "mark-attendance",
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Dimens.boxHeight5,
                    HeaderWidgetMobile(),
                    Dimens.boxHeight3,
                    Card(
                      color: ColorValues.cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "HFE Employee Attendance",
                                  style: Styles.blue17,
                                ),
                                Spacer(),
                                _buildDateField_mobile(
                                  context,
                                  controller.dateController,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.attendanceModel.length,
                              itemBuilder: (context, index) {
                                final attendance =
                                    controller.attendanceModel[index];
                                return Card(
                                  color: Color.fromARGB(255, 232, 239, 242),
                                  elevation: 10,
                                  shadowColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: <Widget>[
                                        buildInfoRow(
                                          "Employee ID: ",
                                          "EMP ${attendance?.id}",
                                        ),
                                        Dimens.boxHeight10,
                                        buildInfoRow(
                                          "Employee Name: ",
                                          "${attendance?.name}",
                                        ),
                                        Dimens.boxHeight10,
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "Present: ",
                                              style: TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Dimens.boxWidth3,
                                            Obx(
                                              () => Checkbox(
                                                value:
                                                    attendance?.present.value,
                                                onChanged: (bool? value) {
                                                  controller.isPresent(index);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "InTime:    ",
                                              style: TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Dimens.boxWidth3,
                                            Obx(
                                              () => IgnorePointer(
                                                ignoring:
                                                    attendance?.present.value ==
                                                            true
                                                        ? false
                                                        : true,
                                                child: _buildTimeField_mobile(
                                                  context: context,
                                                  index: index,
                                                  position: 1,
                                                  textcontroller: controller
                                                      .inTimeControllers[index],
                                                  controller: controller,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "OutTime: ",
                                              style: TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Dimens.boxWidth3,
                                            Obx(
                                              () => IgnorePointer(
                                                ignoring:
                                                    attendance?.present.value ==
                                                            true
                                                        ? false
                                                        : true,
                                                child: _buildTimeField_mobile(
                                                  context: context,
                                                  index: index,
                                                  position: 2,
                                                  textcontroller: controller
                                                          .outTimeControllers[
                                                      index],
                                                  controller: controller,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight10,
                    Card(
                      color: ColorValues.cardColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Text(
                              "Contract Labour Attendance",
                              style: Styles.blue17,
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Purpose: ",
                                    style: Styles.black14,
                                  ),
                                ),
                                _buildPurposeFieldWeb(context, controller),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight40,
                  ],
                ),
              ),
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
      },
    );
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

  Widget _buildPurposeFieldWeb(
    BuildContext context,
    AttendanceController controller,
  ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
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
            width: MediaQuery.of(context).size.width * .93,
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

  Widget buildInfoRow(String title, String value) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorValues.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: ColorValues.navyBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeField_mobile({
    required BuildContext context,
    required int index,
    required int position, // 1 = in time and 2 = out time
    required TextEditingController textcontroller,
    required AttendanceController controller,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            width: Get.width * 0.3,
            height: 35,
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
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onTap: () => _pickTime(
                  context,
                  textcontroller,
                  index,
                  position,
                  controller,
                ),
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
    AttendanceController controller,
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

  Widget _buildDateField_mobile(
    BuildContext context,
    TextEditingController textcontroller,
  ) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          width: Get.width * .3,
          height: 35,
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
      firstDate: DateTime(2000), // Adjust the range as needed
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.tryParse(textController.text)) {
      textController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }
}
