import 'package:cmms/app/theme/color_values.dart';
import 'package:cmms/app/view_add_goods_orders.dart/stock_management_view_add_goods_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigators/app_pages.dart';
// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class GoodsOrderMessageRejectDialog extends GetView {
  String? data;
  List<dynamic>? id;

  GoodsOrderMessageRejectDialog({super.key, this.data, this.id});
  final ViewAddGoodsOrdersController controller = Get.find();

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
            'Goods Order Reject',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          content: Builder(builder: (context) {
            var height = MediaQuery.of(context).size.height;
      
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
                    //     SizedBox(height: 20,),
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       SizedBox(
                    //         width: 15,
                    //       ),
                    //       ElevatedButton(
                    //         style: Styles.greenElevatedButtonStyle,
                    //         onPressed: () => Get.offAllNamed(Routes.newPermit),
                    //         child: const Text('Permit List'),
                    //       ),
                    //       Dimens.boxWidth10,
                    //       ElevatedButton(
                    //         style: Styles.blueElevatedButtonStyle,
                    //         onPressed: () => Get.offAndToNamed(Routes.newPermitList),
                    //         child: const Text('View This Permit'),
                    //       ),
                    //       Dimens.boxWidth10,
                    //       // ElevatedButton(
                    //       //   style: Styles.redElevatedButtonStyle,
                    //       //   onPressed: () => Get.offAndToNamed(Routes.addJob),
                    //       //   child: const Text('Add New Job'),
                    //       // ),
                    //     ]),
                  ]),
            );
          }),
          actions: [
            Row(
              children: [
                Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.darkBlueElevatedButtonStyle,
                    onPressed: () {
                      Get.offAllNamed(Routes.stockManagementGoodsOrdersScreen);
                    },
                    child: const Text('Goods Order List'),
                  ),
                ),
                Dimens.boxWidth10,
                Center(
                  child: ElevatedButton(
                    style: Styles.yellowElevatedButtonStyle,
                    onPressed: () {
                      Get.back();
                      Future.delayed(Duration(seconds: 1), () {
                        controller.getUnitCurrencyList();
                      });
                      Future.delayed(Duration(seconds: 1), () {
                        controller.getBusinessList(4,controller.facilityId);
                      });
                      Future.delayed(Duration(seconds: 1), () {
                        controller.getAssetList(controller.facilityId);
                        if (id != null) {
                          Future.delayed(Duration(seconds: 1), () {
                            controller.getPurchaseDetailsById(
                                id: controller.goId.value);
                          });
                        }
                      });
                    },
                    child: const Text('View Goods Order'),
                  ),
                ),
                Dimens.boxWidth10,
              ],
            )
          ],
        );
      })),
    );
  }
}
