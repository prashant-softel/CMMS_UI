import 'package:cmms/app/controllers/file_upload_controller.dart';
import 'package:cmms/app/home/home_screen.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/responsive.dart';
import 'package:cmms/app/utils/strings/string_constants.dart';
import 'package:cmms/app/utils/url_path.dart';
import 'package:cmms/app/view_permit/view_permit_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/file_upload_details_widget_mobile.dart';
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
      Get.put(FileUploadController( apiUrl: UrlPath.deployUrl + 'api/FileUpload/UploadFile',));

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
        ),
        content: Builder(builder: (context) {
          return Obx(() {
            return Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height:
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? MediaQuery.of(context).size.height / 1.5
                      : MediaQuery.of(context).size.height / 1,
              width:
                  Responsive.isMobile(context) || Responsive.isTablet(context)
                      ? MediaQuery.of(context).size.width / 1.2
                      : MediaQuery.of(context).size.width / 1.5,
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
                            width: MediaQuery.of(context).size.width / 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstants.cancelWorkPermit,
                                  style: Styles.black17,
                                ),
                                Column(
                                  children: []..addAll(controller
                                      .permitCancelConditionList!
                                      .map((element) => Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    value: element!.isChecked,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        element.isChecked =
                                                            !element.isChecked!;
                                                      });
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
                                Responsive.isDesktop(context)
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          checkBoxInstructionMethod(9),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              StringConstants
                                                  .cancelWorkPermitCheck4,
                                              style: Styles.black17,
                                            ),
                                          ),
                                          Dimens.boxWidth5,
                                          SizedBox(
                                              width: 130,
                                              child: CustomTextFieldForPermit())
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            children: [
                                              checkBoxInstructionMethod(9),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(
                                                  StringConstants
                                                      .cancelWorkPermitCheck4,
                                                  style: Styles.black17,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
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
                                _buildDetailsSection(context),
                                Dimens.boxHeight20,
                                _buildFileUploadSection(context),
                              ],
                            ),
                          ),
                          CustomRichText(title: 'Cancellation Remark '),
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
                    ]),
              ),
            );
          });
        }),
        actions: _buildActions(context),
      );
    }));
  }

  Widget _buildDetailsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Responsive.isDesktop(context)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailColumn('Authorized Person',
                    controller.viewPermitDetailsModel.value?.requestedByName),
                Spacer(),
                _buildDetailColumn(
                    'Designation',
                    controller.viewPermitDetailsModel.value
                        ?.cancelRequestByDesignation),
                Spacer(),
                _buildDetailColumn(
                    'Company',
                    controller
                        .viewPermitDetailsModel.value?.cancelRequestByCompany),
                Spacer(),
                _buildDetailColumn(
                    'Date & Time',
                    controller.viewPermitDetailsModel.value?.start_datetime
                        .toString()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailColumn('Authorized Person',
                    controller.viewPermitDetailsModel.value?.requestedByName),
                Dimens.boxHeight10,
                _buildDetailColumn(
                    'Designation',
                    controller.viewPermitDetailsModel.value
                        ?.cancelRequestByDesignation),
                Dimens.boxHeight10,
                _buildDetailColumn(
                    'Company',
                    controller
                        .viewPermitDetailsModel.value?.cancelRequestByCompany),
                Dimens.boxHeight10,
                _buildDetailColumn(
                    'Date & Time',
                    controller.viewPermitDetailsModel.value?.start_datetime
                        .toString()),
              ],
            ),
    );
  }

  Widget _buildDetailColumn(String title, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.blackBold17,
        ),
        Text(
          value?.toString() ?? '',
          style: Styles.black17,
        ),
      ],
    );
  }

  Widget _buildFileUploadSection(BuildContext context) {
    return Container(
      height: Responsive.isDesktop(context) ? Get.height * 0.2 : 0,
      width: Get.width,
      child: Responsive.isDesktop(context)
          ? Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FileUploadWidgetWithDropzone(),
                ),
                Dimens.boxWidth10,
                Expanded(
                  flex: 8,
                  child: FileUploadDetailsWidgetWeb2(),
                )
              ],
            )
          : Dimens.box0,
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return Responsive.isDesktop(context)
        ? [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: Styles.darkRedElevatedButtonStyle,
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                Dimens.boxWidth10,
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
              ],
            )
          ]
        : [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: Styles.darkRedElevatedButtonStyle,
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                Dimens.boxWidth10,
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
              ],
            ),
          ];
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
        },
      ),
    );
  }
}
