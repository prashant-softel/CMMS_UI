import 'package:cmms/app/app.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';

class CreateNewPermitDialog extends GetView {
  String? createPermitData;
  String? data;
  List<dynamic>? PtwId;

  CreateNewPermitDialog(
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
            height: Responsive.isDesktop(context) ? 135 : 160,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Permit Generated with Permit Id ',
                        style: Styles.black16,
                      ),
                      Text(
                        "$PtwId",
                        style: Styles.green700,
                      ),
                    ],
                  ),

                  Text(
                    'Please wait for Approval, you can start',
                    style: Styles.black16,
                  ),
                  Text(
                    'the job only after PTW is approved',
                    style: Styles.black16,
                  ), // RichText(

                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Spacer(),
                    ElevatedButton(
                      style: Styles.greenElevatedButtonStyle,
                      onPressed: () {
                        Get.offAllNamed(Routes.newPermitList);
                        // _controller.getNewPermitList(_controller.facilityId, _controller.userId);
                      },
                      child: const Text('Permit List'),
                    ),
                    // Dimens.boxWidth10,
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: Styles.blueElevatedButtonStyle,
                      onPressed: () {
                        // Get.offAndToNamed(Routes.viewPermitWebScreen);
                        controller.viewNewPermitList(permitId: PtwId![0]);
                      },
                      child: const Text('View This Permit'),
                    ),
                    // Dimens.boxWidth10,
                    Spacer(),
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
