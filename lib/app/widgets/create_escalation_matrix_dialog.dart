import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class CreateEscalationMatrixDialog extends GetView {
  final String? createEscalationMatrixData;
  final String? data;
  final List<dynamic>? escalationMatrixId;
  final int? moduleId;
  final int? statusId;

  CreateEscalationMatrixDialog({
    super.key,
    this.createEscalationMatrixData,
    this.data,
    this.escalationMatrixId,
    this.moduleId,
    this.statusId,
  });

  final AddEscalationMatrixController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: StatefulBuilder(builder: ((context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: Dimens.edgeInsets10_0_10_0,
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.done,
                color: Colors.green,
              ),
              Center(
                child: Text(
                  '$data',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
          content: Builder(builder: (context) {
            var height = MediaQuery.of(context).size.height;

            return Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: height / 7,
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Created Escalation Marix Successfully with ID ',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: '$escalationMatrixId ',
                              style: TextStyle(
                                color:
                                    Colors.blue, // Set the desired text color
                                fontWeight: FontWeight
                                    .bold, // Set any additional styles as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   'Warranty Claim Added Successfully with ID $warrantyClaimId',
                      //   style: TextStyle(color: Colors.brown),
                      // ),
                    ),
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                  ]),
            );
          }),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                style: Styles.greenElevatedButtonStyle,
                onPressed: () {
                  Get.offAllNamed(Routes.escalationMatrixListWeb);
                },
                child: const Text('Escalation Matrix List'),
              ),
              SizedBox(
                width: 5,
              ),
              // ElevatedButton(
              //   style: Styles.darkBlueElevatedButtonStyle,
              //   onPressed: () {
              //     Get.offAllNamed(Routes.incidentReportListWeb);
              //   },
              //   child: const Text('Ok'),
              // ),

              ElevatedButton(
                style: Styles.yellowElevatedButtonStyle,
                onPressed: () {
                  _controller.viewEscalationMatrix(
                    moudle_id: moduleId ?? 0,
                    status_id: statusId ?? 0,
                  );
                },
                child: const Text('View This Escalation Matrix'),
              ),
            ]),
          ],
        );
      })),
    );
  }
}
