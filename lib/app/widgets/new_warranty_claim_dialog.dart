import 'package:cmms/app/careate_warranty_calim/create_warranty_claim_controller.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class NewWarrantyClaimDialog extends GetView {
  final String? createPermitData;
  final String? data;
  final List<dynamic>? warrantyClaimId;

  NewWarrantyClaimDialog(
      {super.key, this.createPermitData, this.data, this.warrantyClaimId});
  // final StockManagementAddGoodsOrdersController controller = Get.find();
  final CreateWarrantyClaimController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done,
              color: Colors.green,
            ),
            Center(
              child: Text(
                '$data',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: height / 5.5,
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text:
                            'Warranty Claim Added Successfully with Claim ID ',
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
                    // Text(
                    //   'Warranty Claim Added Successfully with ID $warrantyClaimId',
                    //   style: TextStyle(color: Colors.brown),
                    // ),
                  ),
                  Divider(
                    color: ColorValues.greyLightColour,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: Styles.greenElevatedButtonStyle,
                            onPressed: () {
                              Get.offAllNamed(Routes.warrantyClaimListWeb);
                              controller.getWarrantyClaimList();
                            },
                            child: const Text('Warranty Claim List'),
                          ),
                        ]),
                  ),
                ]),
          );
        }),
        actions: [],
      );
    }));
  }
}
