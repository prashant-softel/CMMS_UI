import 'package:cmms/app/home/home.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class PermitApprovedDialog extends GetView {
  String? permitApprovedDialog;
  String? permitId;
  String? ptwStatus;
  int? jobId;

  PermitApprovedDialog(
      {super.key,
      this.permitApprovedDialog,
      this.permitId,
      this.ptwStatus,
      this.jobId});
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
          ptwStatus == '133' ? 'Extend Approve' : 'Approve Permit',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1.5,
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
                      Text(
                        ptwStatus == '133'
                            ? ''
                            : """This certifies that I (PERMIT APPROVER) have personally completed a safety inspection of the area where this work is to be done as well as the surrounding areas, with specific attention to the type of work for which this PTW is being issued. I have reviewed the necessary precautions required to be taken for safely executing the work as mentioned in the checkpoints of this PTW to protect man and machinery engaged in this work from injury accident. I have made sure that the assigned personnel know the applicable

work is to be done as well as the surrounding areas, with specific attention to the type of work for which this PTW is being issued. I have reviewed the necessary precautions required to be taken for safely executing the work as mentioned in the checkpoints of this PTW to protect man and machinery engaged in this work from injury accident. I have made sure that the assigned personnel know the applicable safety rules and that they know what to do in an emergency.""",
                        textAlign: TextAlign.left,
                        // style: TextStyle(color: Colors.green),
                      ),
                      Dimens.boxHeight20,
                      CustomRichText(title: 'Comment'),
                      Dimens.boxHeight10,
                      TextField(
                        controller: _controller.approveCommentTextFieldCtrlr,
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
                _controller.permitApprovedButton(
                    permitId: permitId, ptwStatus: '$ptwStatus', jobId: jobId);
                print('jobId:$jobId');
                Get.back();
              },
              child: Text(
                  '${ptwStatus == '133' ? 'Extend Approve' : 'Approve Permit'}'),
            ),
          ]),
        ],
      );
    }));
  }
}
