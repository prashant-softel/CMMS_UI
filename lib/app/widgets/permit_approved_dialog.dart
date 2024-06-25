import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class PermitApprovedDialog extends GetView<ViewPermitController> {
  final String? permitApprovedDialog;
  final int? permitId;
  final String? ptwStatus;
  final int? jobId;
  final int? type;

  PermitApprovedDialog(
      {super.key,
      this.permitApprovedDialog,
      this.permitId,
      this.ptwStatus,
      this.jobId,
      this.type});
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
          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: MediaQuery.of(context).size.height / 1,
            width: MediaQuery.of(context).size.width / 1.5,
            child: SingleChildScrollView(
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
                          // ptwStatus == '133'
                          //     ? ''
                          //     :
                          """This certifies that I (PERMIT APPROVER) have personally completed a safety inspection of the area where this work is to be done as well as the surrounding areas, with specific attention to the type of work for which this PTW is being issued. I have reviewed the necessary precautions required to be taken for safely executing the work as mentioned in the checkpoints of this PTW to protect man and machinery engaged in this work from injury accident. I have made sure that the assigned personnel know the applicable
                    
                    work is to be done as well as the surrounding areas, with specific attention to the type of work for which this PTW is being issued. I have reviewed the necessary precautions required to be taken for safely executing the work as mentioned in the checkpoints of this PTW to protect man and machinery engaged in this work from injury accident. I have made sure that the assigned personnel know the applicable safety rules and that they know what to do in an emergency.""",
                          textAlign: TextAlign.left,
                          // style: TextStyle(color: Colors.green),
                        ),
                        Dimens.boxHeight20,
                        Container(
                          margin: Dimens.edgeInsets20,
                          //    decoration: BoxDecoration(
                          //   border: Border.all(
                          //     color: ColorValues.lightGreyColorWithOpacity35,
                          //     width: 1,
                          //   ),
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color: ColorValues.appBlueBackgroundColor,
                          //       spreadRadius: 2,
                          //       blurRadius: 5,
                          //       offset: Offset(0, 2),
                          //     ),
                          //   ],
                          // ),
                          child: Column(
                            children: [
                              //   Padding(
                              //   padding: const EdgeInsets.all(10.0),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         "Approve Permit ",
                              //         style: Styles.blue700,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Divider(
                                color: ColorValues.greyLightColour,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'ISSUED BY:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Permit Approver Name',
                                          style: Styles.blackBold17,
                                        ),
                                        Text(
                                          '${controller.viewPermitDetailsModel.value?.approvedByName}',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Designation',
                                          style: Styles.blackBold17,
                                        ),
                                        Text(
                                          '${controller.viewPermitDetailsModel.value?.approverDesignation}',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Company',
                                          style: Styles.blackBold17,
                                        ),
                                        Text(
                                          '${controller.viewPermitDetailsModel.value?.approverCompany}',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Date & Time',
                                          style: Styles.blackBold17,
                                        ),
                                        Text(
                                          '${controller.viewPermitDetailsModel.value?.approve_at}',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Dimens.boxHeight20,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'RESPONSIBILITY ACCEPTED BY:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Permit Requester Name',
                                          style: Styles.blackBold17,
                                        ),
                                        Text(
                                          '${controller.viewPermitDetailsModel.value?.requestedByName}',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Designation',
                                          style: Styles.blackBold17,
                                        ),
                                        Text(
                                          '${controller.viewPermitDetailsModel.value?.requesterDesignation}',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Company',
                                          style: Styles.blackBold17,
                                        ),
                                        Text(
                                          '${controller.viewPermitDetailsModel.value?.requesterCompany}',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Date & Time',
                                          style: Styles.blackBold17,
                                        ),
                                        Text(
                                          '${controller.viewPermitDetailsModel.value?.start_datetime}',
                                          style: Styles.black17,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomRichText(title: 'Comment'),
                        Dimens.boxHeight10,
                        Obx(
                         () => TextField(
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16.0,
                                  height: 1.0,
                                  color: Colors.black),
                            ),
                            controller: controller.approveCommentTextFieldCtrlr,
                            maxLines: 4,
                            decoration: InputDecoration(
                               hintText: 'Comment here....',
                              fillColor: ColorValues.whiteColor,
                              filled: true,
                              contentPadding: Dimens.edgeInsets05_10,
                              border: InputBorder.none,
                                                          enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder:OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedErrorBorder:
                                  controller.iscommentTextInvalid.value
                                      ? OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                            color: ColorValues.redColorDark,
                                          ),
                                        )
                                      : InputBorder.none,
                              errorBorder: controller.iscommentTextInvalid.value
                                  ? OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: ColorValues.redColorDark,
                                      ),
                                    )
                                  : null,
                              errorText: controller.iscommentTextInvalid.value
                                  ? "Required field"
                                  : null,
                            ),
                            onChanged: (value) {
                              if (value.trim().length > 3) {
                                controller.iscommentTextInvalid.value = false;
                              } else {
                                controller.iscommentTextInvalid.value = true;
                              }
                            },
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
            ),
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
                if (controller.checkComment()) {
                  return;
                } else {
                  controller.permitApprovedButton(
                      permitId: permitId,
                      ptwStatus: '$ptwStatus',
                      jobId: jobId,
                      type: type);
                  print('jobId:$jobId');
                  Get.offAndToNamed(Routes.newPermitList);
                }
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
