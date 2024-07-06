import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:cmms/app/widgets/stock_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
// import '../view_incident_report/view_incident_report_controller.dart';

class CreateSchedule extends GetView {
  CreateSchedule();

  // final IncidentReportListController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        // contentPadding: EdgeInsets.zero,
        title: Text(
          "Create Schedule",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorValues.lightGreyColorWithOpacity35,
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
            padding: EdgeInsets.only(right: 30, top: 10),
            height: height / 2.3,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomRichText(title: 'Block  :'),
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255, 227, 224, 224),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 236, 234, 234)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width / 6,
                        child: LoginCustomTextfield(
                            // textController: controller.girNoCtrlr,
                            )),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    CustomRichText(title: 'Equipment :'),
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    SizedBox(
                      child: DropdownWebStock(
                        width: MediaQuery.of(context).size.width / 6,
                        onValueChanged: (p0, p1) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    CustomRichText(title: 'Equipment Category :'),
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    SizedBox(
                      child: DropdownWebStock(
                        width: MediaQuery.of(context).size.width / 6,
                        onValueChanged: (p0, p1) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomRichText(title: 'Module Quantity :'),
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 227, 224, 224),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 236, 234, 234)
                                .withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width / 6,
                      child: LoginCustomTextfield(
                          // textController: controller.girNoCtrlr,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    CustomRichText(title: 'Type of Cleaning :'),
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    SizedBox(
                      child: DropdownWebStock(
                        width: MediaQuery.of(context).size.width / 6,
                        onValueChanged: (p0, p1) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    CustomRichText(title: 'Estimated Duration\n(In Days) :'),
                    // Dimens.boxWidth10,
                     SizedBox(width:10),
                    SizedBox(
                      child: DropdownWebStock(
                        width: MediaQuery.of(context).size.width / 6,
                        onValueChanged: (p0, p1) {},
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    style: Styles.darkRedElevatedButtonStyle,
                    onPressed: () {
                      Get.offAllNamed(Routes.moduleCleaningPlanning);
                    },
                    child: const Text('Cancel'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: Styles.greenElevatedButtonStyle,
                    onPressed: () {
                      // print('Incident Report Id${incidentReportId![0]}');
                    },
                    child: const Text('Create'),
                  ),
                ]),
                Spacer(),
              ],
            ),
          );
        }),
      );
    }));
  }
}
