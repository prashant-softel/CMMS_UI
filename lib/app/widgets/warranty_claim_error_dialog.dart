import 'package:cmms/app/app.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/tbt_list_sop/tbt_list_sop_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class WarrantyClaimErrorDialog extends GetView {
  String? createSopData;
  String? data;
  List<dynamic>? SopId;

  WarrantyClaimErrorDialog(
      {super.key, this.createSopData, this.data, this.SopId});
  // final TBTSOPListController _controller = Get.find();

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
          'Some Fields are Empty !!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red),
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
              },
              child: const Text('Ok'),
            ),
          ),
        ],
      );
    }));
  }
}
