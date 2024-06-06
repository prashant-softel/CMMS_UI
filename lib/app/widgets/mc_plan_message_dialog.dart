import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../navigators/app_pages.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class MCPlanUpdatedMessageDialog extends GetView {
  List<dynamic>? warrantyClaimId;
  String? data;

  MCPlanUpdatedMessageDialog({super.key, this.warrantyClaimId, this.data});
  // final WarrantyClaimController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: StatefulBuilder(builder: ((context, setState) {
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
                        text: 'MC Plan Updated Successfully with Id ',
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
                  Get.offAllNamed(Routes.moduleCleaningListPlan);
                  // controller.getNewPermitList(_controller.facilityId, _controller.userId);
                  // controller.getWarrantyClaimList();
                  Get.back();
                },
                child: const Text('Ok'),
              ),
            ),
          ],
        );
      })),
    );
  }
}
