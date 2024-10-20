import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:cmms/app/careate_warranty_calim/create_warranty_claim_controller.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class WCPopUp extends GetView {
  final String? data;
  final List<dynamic>? id;

  WCPopUp({super.key, this.data, this.id});
  final CreateWarrantyClaimController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        content: Builder(builder: (context) {
          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 80,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Divider(
                  color: ColorValues.greyLightColour,
                  thickness: 1,
                ),
                Text('${data}',
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.center),
                Text('${id}',
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.center),
              ],
            ),
          );
        }),
        actions: [
          Dimens.boxWidth10,
          Center(
            child: ElevatedButton(
              style: Styles.darkBlueElevatedButtonStyle,
              onPressed: () {
                Get.offAllNamed(Routes.warrantyClaimList);
              },
              child: const Text('WC List'),
            ),
          ),
          Dimens.boxWidth10
        ],
      );
    }));
  }
}
