import 'package:cmms/app/app.dart';
import 'package:cmms/app/create_mrs/create_mrs_controller.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';

class CreateMrsSuccessDialog extends GetView {
  String? createPermitData;
  String? data;
  dynamic mrsId;
  int? type;
  String? route;

  CreateMrsSuccessDialog(
      {super.key,
      this.createPermitData,
      this.data,
      this.mrsId,
      this.type,
      this.route});

  final CreateMrsController controller = Get.find();

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
                        'MRS Generated with MRS Id ',
                        style: Styles.black16,
                      ),
                      Text(
                        "$mrsId",
                        style: Styles.green700,
                      ),
                    ],
                  ),

                  // Text(
                  //   'Please wait for Approval, you can start',
                  //   style: Styles.black16,
                  // ),
                  // Text(
                  //   'the job only after PTW is approved',
                  //   style: Styles.black16,
                  // ), // RichText(

                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Spacer(),
                    ElevatedButton(
                      style: Styles.greenElevatedButtonStyle,
                      onPressed: () {
                        Get.offAllNamed(Routes.mrsListScreen);
                      },
                      child: const Text('MRS List'),
                    ),
                    // Dimens.boxWidth10,
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: Styles.yellowElevatedButtonStyle,
                      onPressed: () {
                        controller.clearStoreData();
                        String typee = type.toString();
                        Get.offNamed(
                            '${Routes.mrsApprovalScreen}/${mrsId![0].toString()}/$typee');

                        // Get.toNamed(Routes.mrsApprovalScreen,
                        //     arguments: {'mrsId': mrsId![0].toString(), 'type': type});
                      },
                      child: const Text('View MRS'),
                    ),
                    type == 1 || type == 2 ? SizedBox(width: 10) : Dimens.box0,
                    type == 1
                        ? ElevatedButton(
                            style: Styles.darkBlueElevatedButtonStyle,
                            onPressed: () {
                              Get.offAllNamed('${Routes.jobDetails}/$route');
                            },
                            child: const Text('View Job'),
                          )
                        : type == 2
                            ? ElevatedButton(
                                style: Styles.darkBlueElevatedButtonStyle,
                                onPressed: () {
                                  Get.offAllNamed(
                                      '${Routes.pmTaskView}/$route');
                                  // Get.offAndToNamed(Routes.pmTaskView);
                                  // controller.viewNewPermitList(permitId: PtwId![0]);
                                },
                                child: const Text('View Task'),
                              )
                            : Dimens.box0,
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
