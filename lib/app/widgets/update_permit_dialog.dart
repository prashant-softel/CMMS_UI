import 'package:cmms/app/app.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';

class UpdateNewPermitDialog extends GetView {
  String? createPermitData;
  String? data;
  List<dynamic>? PtwId;
  int? type;
  int? vegexid;
  int? vegplanId;

  UpdateNewPermitDialog(
      {super.key,
      this.createPermitData,
      this.data,
      this.PtwId,
      this.type,
      this.vegplanId,
      this.vegexid});
  final NewPermitController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: data == "Permit Updated Successfully"
            ? Text("Permit Updation !!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black))
            : Text('Permit Re-Submission !!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black)),
        // Text(
        //   '${data == }',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(color: Colors.black),
        // ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: Responsive.isDesktop(context) ? 100 : 160,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'The ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '$data',
                          style: TextStyle(
                            color: Colors.green, // Set the desired text color
                            fontWeight: FontWeight
                                .bold, // Set any additional styles as needed
                          ),
                        ),
                        TextSpan(text: ' with Permit Id '),
                        TextSpan(
                          text: '$PtwId.',
                          style: TextStyle(
                            color: Colors.blue, // Set the desired text color
                            fontWeight: FontWeight
                                .bold, // Set any additional styles as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                  //     SizedBox(height: 20,),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //         width: 15,
                  //       ),
                  //       ElevatedButton(
                  //         style: Styles.greenElevatedButtonStyle,
                  //         onPressed: () {
                  //           Get.offAllNamed(Routes.newPermitList);
                  //           // _controller.getNewPermitList(_controller.facilityId, _controller.userId);

                  //         },
                  //         child: const Text('Permit List'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       ElevatedButton(
                  //         style: Styles.blueElevatedButtonStyle,
                  //         onPressed: () {},
                  //         //  Get.offAndToNamed(Routes.newPermitList),
                  //         child: const Text('View This Permit'),
                  //       ),
                  //       Dimens.boxWidth10,
                  //       // ElevatedButton(
                  //       //   style: Styles.redElevatedButtonStyle,
                  //       //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                  //       //   child: const Text('Add New Job'),
                  //       // ),
                  //     ]),
                ]),
          );
        }),
        actions: [
          Dimens.boxWidth10,
          // Center(
          //   child: ElevatedButton(
          //     style: Styles.darkBlueElevatedButtonStyle,
          //     onPressed: () {
          //       Get.offAllNamed(Routes.newPermitList);
          //       // _controller.getNewPermitList(
          //       //     _controller.facilityId, _controller.userId,_controller.formattedTodate, _controller.formattedFromdate, false, false, false);
          //     },
          //     child: const Text('Ok'),
          //   ),
          // ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
              style: Styles.greenElevatedButtonStyle,
              onPressed: () {
                Get.offAllNamed(Routes.newPermitList);
                // _controller.getNewPermitList(_controller.facilityId, _controller.userId);
              },
              child: const Text('Permit List'),
            ),
            Dimens.boxWidth10,
            ElevatedButton(
              style: Styles.blueElevatedButtonStyle,
              onPressed: () {
                // Get.offAndToNamed(Routes.viewPermitWebScreen);
                controller.viewNewPermitList(permitId: PtwId![0]);
              },
              child: const Text('View This Permit'),
            ),
            Dimens.boxWidth10,
            type == 1
                ? ElevatedButton(
                    style: Styles.darkBlueElevatedButtonStyle,
                    onPressed: () => Get.offAllNamed(Routes.jobCard),
                    child: const Text('View JC'),
                  )
                : type == 2
                    ? ElevatedButton(
                        style: Styles.darkBlueElevatedButtonStyle,
                        onPressed: () => Get.offAllNamed(Routes.pmTaskView),
                        child: const Text('View Task'),
                      )
                    : type == 3
                        ? ElevatedButton(
                            style: Styles.darkBlueElevatedButtonStyle,
                            onPressed: () =>
                                Get.offAllNamed(Routes.viewAuditTask),
                            child: const Text('View Audit'),
                          )
                        : type == 4
                            ? ElevatedButton(
                                style: Styles.darkBlueElevatedButtonStyle,
                                onPressed: () => Get.offAllNamed(Routes
                                    .addModuleCleaningExecutionContentWeb),
                                child: const Text('View MC'),
                              )
                            : type == 5
                                ? ElevatedButton(
                                    style: Styles.darkBlueElevatedButtonStyle,
                                    onPressed: () => Get.offAllNamed(
                                      Routes.vegExecutionScreen,
                                      arguments: {
                                        "vegexe": vegexid,
                                        "vegid": vegplanId,
                                      },
                                    ),
                                    child: const Text('View VEG'),
                                  )
                                : Dimens.box0,
            Dimens.boxWidth10,
          ]),
        ],
      );
    }));
  }
}
