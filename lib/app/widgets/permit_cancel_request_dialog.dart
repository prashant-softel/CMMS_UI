import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/strings/string_constants.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/file_upload_widget_web2.dart';
import 'package:cmms/app/widgets/file_upload_with_dropzone_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class PermitCancelReQuestDialog extends GetView {
  String? permitCancelDialog;
  String? permitId;
  int? jobId;

  PermitCancelReQuestDialog(
      {super.key, this.permitCancelDialog, this.permitId, this.jobId});
  final ViewPermitController controller = Get.find();
  final FileUploadController dropzoneController =
      Get.put(FileUploadController());

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
          'Cancel Permit Request',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          return Obx(() {
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
                          Container(
                            margin: Dimens.edgeInsets20,
                            // decoration: BoxDecoration(
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
                            // height: ,
                            width: MediaQuery.of(context).size.width / 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      // Text(
                                      //   "Cancel Permit Request",
                                      //   style: Styles.blue700,
                                      // ),
                                    ],
                                  ),
                                ),
                                // Divider(
                                //   color: ColorValues.greyLightColour,
                                // ),
                                Text(
                                  StringConstants.cancelWorkPermit,
                                  style: Styles.black17,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     checkBoxInstructionMethod(6),
                                //     Padding(
                                //       padding: const EdgeInsets.only(top: 3),
                                //       child: Text(
                                //         StringConstants.cancelWorkPermitCheck1,
                                //         style: Styles.black17,
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     checkBoxInstructionMethod(7),
                                //     Padding(
                                //       padding: const EdgeInsets.only(top: 5),
                                //       child: Text(
                                //         StringConstants.cancelWorkPermitCheck2,
                                //         style: Styles.black17,
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     checkBoxInstructionMethod(8),
                                //     Padding(
                                //       padding: const EdgeInsets.only(top: 5),
                                //       child: Text(
                                //         StringConstants.cancelWorkPermitCheck3,
                                //         style: Styles.black17,
                                //       ),
                                //     )
                                //   ],
                                // ),

                                Column(
                                  children: []..addAll(controller
                                      .permitCancelConditionList!
                                      .map((element) => Column(
                                            // mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  // Text('${element!.isChecked}'),

                                                  Checkbox(
                                                    value: element!.isChecked,
                                                    onChanged: (bool? value) {
                                                      // controller.toggleItemSelection(index);
                                                      setState(
                                                        () {
                                                          element.isChecked =
                                                              !element
                                                                  .isChecked!;
                                                        },
                                                      );
                                                      print(
                                                          'Element Cancel:${element.isChecked}');
                                                    },
                                                  ),

                                                  Expanded(
                                                      child: Text(
                                                    "${element.name}",
                                                    style: Styles.black17,
                                                  ))
                                                ],
                                              ),
                                            ],
                                          ))),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    checkBoxInstructionMethod(9),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        StringConstants.cancelWorkPermitCheck4,
                                        style: Styles.black17,
                                      ),
                                    ),
                                    Dimens.boxWidth5,
                                    SizedBox(
                                        width: 130,
                                        child: CustomTextFieldForPermit())
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Above Conditions, Validated By:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Authorized Person',
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
                                            '${controller.viewPermitDetailsModel.value?.cancelRequestByDesignation}',
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
                                            '${controller.viewPermitDetailsModel.value?.cancelRequestByCompany}',
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
                                Dimens.boxHeight20,
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Column(
                                //       crossAxisAlignment: CrossAxisAlignment.end,
                                //       children: [
                                //         // Row(
                                //         //   children: [
                                //         //     Text(
                                //         //       'Cancellation Remark',
                                //         //       style: Styles.black17,
                                //         //     ),
                                //         //     Dimens.boxWidth5,
                                //         //     SizedBox(width: 130, child: CustomTextFieldForPermit())
                                //         //   ],
                                //         // ),
                                //         // CustomTextField(
                                //         //   label: 'Cancellation Remark',
                                //         // )
                                //       ],
                                //     ),
                                //     Spacer(),
                                //     Column(
                                //       crossAxisAlignment: CrossAxisAlignment.end,
                                //       children: [
                                //         // Text(
                                //         //   'Upload Photo',
                                //         //   style: Styles.black17,
                                //         // ),
                                //         Padding(
                                //           padding: const EdgeInsets.only(left: 10, right: 10),
                                //           child: Obx(
                                //             () => Row(
                                //               // mainAxisAlignment: MainAxisAlignment.center,
                                //               children: [
                                //                 Container(
                                //                   height: 45,
                                //                   width: 200,
                                //                   decoration: BoxDecoration(
                                //                     border: Border.all(
                                //                       color: Color.fromARGB(255, 227, 224, 224),
                                //                       width: 1,
                                //                     ),
                                //                     boxShadow: [
                                //                       BoxShadow(
                                //                         color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                                //                         spreadRadius: 2,
                                //                         blurRadius: 5,
                                //                         offset: Offset(0, 2),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                   child: Padding(
                                //                     padding: const EdgeInsets.all(8.0),
                                //                     child: Align(
                                //                       alignment: Alignment.topLeft,
                                //                       child: Text(
                                //                         controller.fileName.value == "" ? 'Upload Photo' : controller.fileName.value,
                                //                         maxLines: 3,
                                //                         textAlign: TextAlign.center,
                                //                         style: Styles.greyLight14,
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 Dimens.boxWidth5,
                                //                 Container(
                                //                   height: 45,
                                //                   child: CustomElevatedButton(
                                //                     backgroundColor: ColorValues.appDarkBlueColor,
                                //                     text: "Browse",
                                //                     onPressed: () async {
                                //                       final result = await FilePicker.platform.pickFiles();
                                //                       if (result != null) {
                                //                         // for (var file in result.files) {
                                //                         controller.fileName.value = result.files.single.name;
                                //                         controller.fileBytes = result.files.single.bytes;
                                //                         print('Data:${controller.fileName.value}');
                                //                         //controller.filePath.value = file.;
                                //                         //  print({"filepathes", fileBytes});
                                //                         // }
                                //                       }
                                //                     },
                                //                   ),
                                //                 ),
                                //                 Container(
                                //                   height: 45,
                                //                   child: CustomElevatedButton(
                                //                     backgroundColor: ColorValues.greenColor,
                                //                     text: 'Upload',
                                //                     onPressed: () {
                                //                       if (controller.fileName.value != "") {
                                //                         controller.browseFiles(fileBytes: controller.fileBytes, position: 1).then((value) {
                                //                           controller.isSuccessDialog();

                                //                           // Fluttertoast.showToast(
                                //                           //     msg: "file upload  Successfully",
                                //                           //     fontSize: 16.0);
                                //                         });
                                //                       } else {
                                //                         Fluttertoast.showToast(msg: "Please Select file...", fontSize: 16.0);
                                //                       }

                                //                       //  controller.savePmMapping();
                                //                     },
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ],
                                // ),

                                // Dimens.boxHeight10,

                                /// FILE UPLOAD WIDGET
                                Container(
                                  height: Get.height * 0.2,
                                  width: Get.width,
                                  child: Row(
                                      //
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: FileUploadWidgetWithDropzone(),
                                        ),
                                        Dimens.boxWidth10,
                                        Expanded(
                                            flex: 8,
                                            child:
                                                FileUploadDetailsWidgetWeb2()),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          CustomRichText(title: 'Cancellation Remark '),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16.0,
                                  height: 1.0,
                                  color: Colors.black),
                            ),
                            controller:
                                controller.cancelCommentRequestTextFieldCtrlr,
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
              ),
            );
          });
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
                controller.permitCancelRequestButton(
                    permitId: permitId,
                    fileIds: dropzoneController.fileIds,
                    jobId: jobId);
                Get.back();
              },
              child: const Text('Cancel Permit'),
            ),
          ]),
        ],
      );
    }));
  }

  checkBoxInstructionMethod(int position) {
    return Obx(
      () => Checkbox(
        value: position == 6
            ? controller.isCheckedRequire6.value
            : position == 7
                ? controller.isCheckedRequire7.value
                : position == 8
                    ? controller.isCheckedRequire8.value
                    : position == 9
                        ? controller.isCheckedRequire9.value
                        : null,
        onChanged: (bool? value) {
          position == 6
              ? controller.requiretoggleCheckbox6(value!)
              : position == 7
                  ? controller.requiretoggleCheckbox7(value!)
                  : position == 8
                      ? controller.requiretoggleCheckbox8()
                      : position == 9
                          ? controller.requiretoggleCheckbox9()
                          : null;
          // print('Checkbox:${controller.intValue.value}');
        },
      ),
    );
  }
}
