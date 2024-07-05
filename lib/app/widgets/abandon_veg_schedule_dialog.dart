import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AbandoneVegScheduleDialog extends GetView<VegExecutionController> {
  final String? permitCloseDialog;
  final int? id;
  AbandoneVegScheduleDialog({super.key, this.permitCloseDialog, this.id});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: ((context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          insetPadding: Dimens.edgeInsets10_0_10_0,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Abandon Scheduled Execution',
            textAlign: TextAlign.center,
            // style: TextStyle(color: Colors.green),
          ),
          content: Builder(
            builder: (context) {
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
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              height: 1.0,
                              color: Colors.black,
                            ),
                          ),
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
                  ],
                ),
              );
            },
          ),
          actions: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Dimens.boxWidth10,
                 SizedBox(width:10),
                ElevatedButton(
                  style: Styles.darkRedElevatedButtonStyle,
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                // Dimens.boxWidth20,
                 SizedBox(width:20),
                ElevatedButton(
                  style: Styles.greenElevatedButtonStyle,
                  onPressed: () {
                    controller.abandonVegScheduleButton(id: id);
                    Get.back();
                  },
                  child: const Text('Abandone Schedule Execution'),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
