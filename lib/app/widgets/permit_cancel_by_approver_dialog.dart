import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class PermitCancelByApproverDialog extends GetView {
  String? permitCancelDialog;
  int? permitId;
  String? ptwStatus;

  PermitCancelByApproverDialog(
      {super.key, this.permitCancelDialog, this.permitId, this.ptwStatus});
  final ViewPermitController _controller = Get.find();

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
          ptwStatus == '123' || ptwStatus == '130'
              ? 'Cancel Permit By Approver'
              : 'Cancel Permit Request',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 200,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRichText(title: 'Comment '),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller:
                            _controller.cancelCommentByApproverTextFieldCtrlr,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Comment here....',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [

                  //       Dimens.boxWidth10,
                  //       ElevatedButton(
                  //         style: Styles.greenElevatedButtonStyle,
                  //         onPressed: () {
                  //           _controller.permitApprovedButton(permitId:permitId);
                  //           Get.back();
                  //         },
                  //         child: const Text('Permit Approve'),
                  //       ),
                  //       // Dimens.boxWidth10,
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
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Dimens.boxWidth10,
            ElevatedButton(
              style: Styles.darkRedElevatedButtonStyle,
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            Dimens.boxWidth20,
            ElevatedButton(
              style: Styles.greenElevatedButtonStyle,
              onPressed: () {
                _controller.permitCancelByApproverButton(
                    permitId: permitId, ptwStatus: '$ptwStatus');
                Get.back();
              },
              child: Text( ptwStatus == '123' || ptwStatus == '130'
              ? 'Cancel Permit By Approver'
              : 'Cancel Permit Request',),
            ),
          ]),
        ],
      );
    }));
  }
}
