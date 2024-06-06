import 'package:cmms/app/app.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';

class CreateNewPermitForJobDialog extends GetView {
  String? createPermitData;
  String? data;
  List<dynamic>? PtwId;

  CreateNewPermitForJobDialog(
      {super.key, this.createPermitData, this.data, this.PtwId});

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
        title: Text(
          '$data',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: Responsive.isDesktop(context) ? 120 : 160,
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
                      text: 'Permit Generated with Permit Id ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '$PtwId',
                          style: TextStyle(
                            color: Colors.blue, // Set the desired text color
                            fontWeight: FontWeight
                                .bold, // Set any additional styles as needed
                          ),
                        ),
                        TextSpan(
                            text:
                                ' \nPlease wait for Approval, you can start the job only after PTW is approved'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                          style: Styles.yellowElevatedButtonStyle,
                          onPressed: () {
                            controller.createJobCard();

                            // Get.offAndToNamed(Routes.viewPermitWebScreen);
                            // controller.viewNewPermitList(permitId: PtwId![0]);
                          },
                          child: const Text('Add Mrs'),
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
                        // ElevatedButton(
                        //   style: Styles.redElevatedButtonStyle,
                        //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                        //   child: const Text('Add New Job'),
                        // ),
                      ]),
                ]),
          );
        }),
        actions: [],
      );
    }));
  }
}
