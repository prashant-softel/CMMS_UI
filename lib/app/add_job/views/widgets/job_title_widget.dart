import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color_values.dart';
import '../../../theme/dimens.dart';
import '../../../theme/styles.dart';
import '../../add_job_controller.dart';

class JobTitleWidget extends StatelessWidget {
  JobTitleWidget({super.key});

  ///
  var controller = Get.find<AddJobController>();

  ///
  @override
  Widget build(BuildContext context) {
    return //
        Obx(
      () => //
          Column(//
              children: [
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
                text: 'Job Title: ',
                style: Styles.blackBold16,
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: ColorValues.orangeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
          ),
        ),
        Dimens.boxHeight5,
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ), //BoxShadow
              BoxShadow(
                color: ColorValues.whiteColor,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            color: ColorValues.whiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: controller.jobTitleCtrlr,
            autofocus: false,
            decoration: InputDecoration(
              fillColor: ColorValues.whiteColor,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedErrorBorder: controller.isJobTitleInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: controller.isJobTitleInvalid.value
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorValues.redColorDark,
                      ),
                    )
                  : null,
              errorText:
                  controller.isJobTitleInvalid.value ? "Required field" : null,
            ),
            onChanged: (value) {
              if (value.trim().length > 3) {
                controller.isJobTitleInvalid.value = false;
              } else {
                controller.isJobTitleInvalid.value = true;
              }
            },
          ),
        ),
        Dimens.boxHeight20,
      ]),
    );
  }
}
