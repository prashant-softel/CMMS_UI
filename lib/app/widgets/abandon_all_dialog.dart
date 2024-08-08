import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class AbandonAllDialog extends GetView {
  int? id;
  AbandonAllDialog({this.id});

  final AddModuleCleaningExecutionController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        // contentPadding: EdgeInsets.zero,
        title: Text(
          "Aborting Schedule",
          style: TextStyle(
            fontSize: 15,
            color: ColorValues.appRedColor,
          ),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorValues.lightGreyColorWithOpacity35,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorValues.appBlueBackgroundColor,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.only(right: 30, top: 10),
            height: height / 4.7,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CustomRichText(title: 'Reason  :'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255, 227, 224, 224),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 236, 234, 234)
                                  .withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width / 6,
                        child: LoginCustomTextfield(
                          ishint: 'Enter Reason',
                          textController: _controller.commentTextFieldCtrlr,
                        )),
                  ],
                ),
                Spacer(),
                SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    style: Styles.darkRedElevatedButtonStyle,
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancel'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: Styles.greenElevatedButtonStyle,
                    onPressed: () {
                      _controller.abandonAllExecutionButton(id: id);
                      // Get.back();
                    },
                    child: const Text('Submit'),
                  ),
                ]),
                Spacer(),
              ],
            ),
          );
        }),
      );
    }));
  }
}
