import 'package:cmms/app/edit_warranty_claim/edit_warranty_claim_controller.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class WarrantyClaimUpdatedMessageDialog extends GetView {
  List<dynamic>? warrantyClaimId;
  String? data;

  WarrantyClaimUpdatedMessageDialog({super.key, this.warrantyClaimId, this.data});
  // final WarrantyClaimController controller = Get.find();

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
          '${data}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: 50,
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
                      text: 'Warranty Claim Details Updated Successfully with Id ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '$warrantyClaimId',
                          style: TextStyle(
                            color: Colors.blue, // Set the desired text color
                            fontWeight: FontWeight
                                .bold, // Set any additional styles as needed
                          ),
                        ),
                        TextSpan(
                            text: '. Please Click on OK button to go to Warranty Claim List.'),
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
                Get.offAllNamed(Routes.warrantyClaimListWeb);
                // controller.getNewPermitList(_controller.facilityId, _controller.userId);
                // controller.getWarrantyClaimList();
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
