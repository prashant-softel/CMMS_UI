import 'package:cmms/app/app.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/tbt_list_sop/tbt_list_sop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class CreateSopDialog extends GetView {
  String? createSopData;
  String? data;
  List<dynamic>? SopId;

  CreateSopDialog({super.key, this.createSopData, this.data, this.SopId});
  final TBTSOPListController _controller = Get.find();

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
          '$data',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: Responsive.isDesktop(context) ? 80 : 160,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Sop is Created Successfully with Id ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '$SopId',
                          style: TextStyle(
                            color: Colors.blue, // Set the desired text color
                            fontWeight: FontWeight
                                .bold, // Set any additional styles as needed
                          ),
                        ),
                        TextSpan(
                            text: '. Please Click on OK button to go back.'),
                      ],
                    ),
                  ),
                ]),
          );
        }),
        actions: [
          Dimens.boxWidth10,
          Center(
            child: ElevatedButton(
              style: Styles.darkBlueElevatedButtonStyle,
              onPressed: () {
                Get.back();
                // _controller.getSopPermitList();
                // _controller.getJobTypePermitList();
                // _controller.descriptionTextFieldCtrlr.clear();
                Get.offAllNamed(Routes.tbtSOPListScreen);
                _controller.titleTextFieldCtrlr.clear();
              },
              child: const Text('Ok'),
            ),
          ),
        ],
      );
    }));
  }
}
