import 'package:cmms/app/home/home.dart';
import 'package:cmms/app/new_permit/new_permit_controller.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
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
String? permitId;
 
  PermitIssueDialog({super.key, this.permitIssueDialog, this. permitId});
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
          'Issue Permit',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                       CustomRichText(title: 'Comment'),
                       SizedBox(height: 20,),
                       TextField(
                        controller: _controller.commentTextFieldCtrlr,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Comment here....',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black,),
                          
                          ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Colors.black),
                           ),
                          
                        ),
                       ),
                       
                       

                      ],
                    ),
                    
                  ]),
            );
          
        }),
        actions: [
            SizedBox(
                      height: 20,
                    ),
                    Row(
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
                           Dimens.boxWidth20,
                          ElevatedButton(
                            style: Styles.greenElevatedButtonStyle,
                            onPressed: () {
                              _controller.permitIssueButton(permitId:permitId);
                              Get.back();
                              // _controller.getNewPermitList(_controller.facilityId, _controller.userId);

                            },
                            child: const Text('Issue Permit'),
                          ),
                        ]),
        ],
      );
    }));
 
  }
}
