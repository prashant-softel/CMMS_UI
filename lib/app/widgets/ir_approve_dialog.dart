import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_incident_report/view_incident_report_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class IRApproveDialog extends GetView {
  int? id;

  IRApproveDialog({super.key, this.id});
  final ViewIncidentReportController _controller = Get.find();

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
          "Approve IR",
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 200,
            width: 400,
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
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 16.0, height: 1.0, color: Colors.black),
                        ),
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
                ]),
          );
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
            ElevatedButton(
              style: Styles.greenElevatedButtonStyle,
              onPressed: () {
                _controller.approveIrButton(id: id);
                print('Goods order id:$id');
                Get.back();
              },
              child: Text('Approve IR'),
            ),
          ]),
        ],
      );
    }));
  }
}
