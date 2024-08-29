import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/utils/responsive.dart';
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
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          ptwStatus == '133' ? 'Extend Approve' : 'Approve Permit',
          textAlign: TextAlign.center,
        ),
        content: Builder(builder: (context) {
          if (Responsive.isMobile(context) || Responsive.isTablet(context)) {
            // Mobile or Tablet view
            return Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height:
                  MediaQuery.of(context).size.height / 1.5, // Adjusted height
              width: MediaQuery.of(context).size.width / 1.2, // Adjusted width
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    _buildDialogContent(context),
                    Dimens.boxHeight20,
                    _buildActions(context),
                  ],
                ),
              ),
            );
          } else if (Responsive.isDesktop(context)) {
            // Desktop view
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
                    _buildDialogContent(context),
                    Dimens.boxHeight20,
                    _buildActions(context),
                  ],
                ),
              ),
            );
          } else {
            // Default view (for any other cases, fallback to desktop layout)
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
                    _buildDialogContent(context),
                    Dimens.boxHeight20,
                    _buildActions(context),
                  ],
                ),
              ),
            );
          }
        }),
      );
    });
  }

  Widget _buildDialogContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            """This certifies that I (PERMIT APPROVER) have personally completed a safety inspection of the area where this work is to be done as well as the surrounding areas, with specific attention to the type of work for which this PTW is being issued. I have reviewed the necessary precautions required to be taken for safely executing the work as mentioned in the checkpoints of this PTW to protect man and machinery engaged in this work from injury accident. I have made sure that the assigned personnel know the applicable safety rules and that they know what to do in an emergency.""",
          ),
        ),
        Dimens.boxHeight20,
        _buildDetailsSection(context),
        CustomRichText(title: 'Comment'),
        Dimens.boxHeight10,
        Obx(
          () => TextField(
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 16.0,
                height: 1.0,
                color: Colors.black,
              ),
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
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedErrorBorder: controller.iscommentTextInvalid.value
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
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return Container(
      margin: Dimens.edgeInsets20,
      child: Responsive.isDesktop(context)
          ? Column(
              children: [
                Divider(
                  color: ColorValues.greyLightColour,
                ),
                _buildDetailRow(
                  context,
                  'ISSUED BY:',
                  controller.viewPermitDetailsModel.value?.approvedByName
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.approverDesignation
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.approverCompany
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.approve_at
                          ?.toString() ??
                      '',
                ),
                Dimens.boxHeight20,
                _buildDetailRow(
                  context,
                  'RESPONSIBILITY ACCEPTED BY:',
                  controller.viewPermitDetailsModel.value?.requestedByName
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.requesterDesignation
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.requesterCompany
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.start_datetime
                          ?.toString() ??
                      '',
                ),
              ],
            )
          : Column(
              children: [
                Divider(
                  color: ColorValues.greyLightColour,
                ),
                _buildDetailRowMobile(
                  context,
                  'ISSUED BY:',
                  controller.viewPermitDetailsModel.value?.approvedByName
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.approverDesignation
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.approverCompany
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.approve_at
                          ?.toString() ??
                      '',
                ),
                Dimens.boxHeight20,
                _buildDetailRowMobile(
                  context,
                  'RESPONSIBILITY ACCEPTED BY:',
                  controller.viewPermitDetailsModel.value?.requestedByName
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.requesterDesignation
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.requesterCompany
                          ?.toString() ??
                      '',
                  controller.viewPermitDetailsModel.value?.start_datetime
                          ?.toString() ??
                      '',
                ),
              ],
            ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String title,
    String name,
    String designation,
    String company,
    String dateTime,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Permit Approver Name', style: Styles.blackBold17),
                  Text(name, style: Styles.black17),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Designation', style: Styles.blackBold17),
                  Text(designation, style: Styles.black17),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Company', style: Styles.blackBold17),
                  Text(company, style: Styles.black17),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Date & Time', style: Styles.blackBold17),
                  Text(dateTime, style: Styles.black17),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRowMobile(
    BuildContext context,
    String title,
    String name,
    String designation,
    String company,
    String dateTime,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Permit Approver Name', style: Styles.blackBold17),
              Text(name, style: Styles.black17),
              Dimens.boxHeight10,
              Text('Designation', style: Styles.blackBold17),
              Text(designation, style: Styles.black17),
              Dimens.boxHeight10,
              Text('Company', style: Styles.blackBold17),
              Text(company, style: Styles.black17),
              Dimens.boxHeight10,
              Text('Date & Time', style: Styles.blackBold17),
              Text(dateTime, style: Styles.black17),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Responsive.isDesktop(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dimens.boxWidth10,
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
                  if (controller.checkComment()) {
                    return;
                  } else {
                    controller.permitApprovedButton(
                      permitId: permitId,
                      ptwStatus: '$ptwStatus',
                      jobId: jobId,
                      type: type,
                    );
                  }
                },
                child: Text(
                  '${ptwStatus == '133' ? 'Extend Approve' : 'Approve Permit'}',
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      if (controller.checkComment()) {
                        return;
                      } else {
                        controller.permitApprovedButton(
                          permitId: permitId,
                          ptwStatus: '$ptwStatus',
                          jobId: jobId,
                          type: type,
                        );
                      }
                    },
                    child: Text(
                      '${ptwStatus == '133' ? 'Extend Approve' : 'Approve Permit'}',
                    ),
                  ),
                ],
              ),
              Dimens.boxHeight10
            ],
          );
  }
}
