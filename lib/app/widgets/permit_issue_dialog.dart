import 'package:cmms/app/home/home.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class PermitIssueDialog extends GetView {
 String? permitIssueDialog;
  bool safetyValue1 = true;
  bool safetyValue2 = true;
  bool safetyValue3 = true;
  bool safetyValue4 = true;
  bool safetyValue5 = false;
  bool safetyValue6 = false;
  bool safetyValue7 = true;

 
  PermitIssueDialog({super.key, this.permitIssueDialog});
  final NewPermitListController _controller = Get.find();


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
          'Permit Issue',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return 
             Container(
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       
                        CustomTextField(
                          textController: _controller.commentTextFieldCtrlr,
                          label: 'Comment: ',
                          hintText: 'Comment',
                        )

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          
                          Dimens.boxWidth10,
                          ElevatedButton(
                            style: Styles.greenElevatedButtonStyle,
                            onPressed: () {
                              _controller.getPermitIssueButton();
                            },
                            child: const Text('Permit Issue'),
                          ),
                          // Dimens.boxWidth10,
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
