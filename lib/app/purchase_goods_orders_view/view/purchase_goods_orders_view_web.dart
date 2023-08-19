import 'package:cmms/app/app.dart';
import 'package:cmms/app/purchase_goods_orders_view/purchase_goods_orders_view_controller.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseGoodsorderViewWeb
    extends GetView<PurchaseGoodsorderViewController> {
  PurchaseGoodsorderViewWeb({Key? key}) : super(key: key);
  final PurchaseGoodsorderViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        // () =>
        Container(
      color: Color.fromARGB(255, 234, 236, 238),
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 227, 224, 224),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: ColorValues.greyLightColor,
                ),
                Text(
                  "DASHBOARD",
                  style: Styles.greyLight14,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(" / STOCK MANAGEMENT ",
                      style: Styles.greyMediumLight12),
                ),
                Text(" / Goods Order Request Details",
                    style: Styles.greyMediumLight12)
              ],
            ),
          ),
          Container(
            width: Get.width * 7,
            margin: EdgeInsets.only(left: 10, top: 30, right: 10),
            height: Get.height,
            child: Card(
              color: ColorValues.cardColor,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            " Goods Order Request Details",
                            style: Styles.blackBold14,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 230,
                          decoration: BoxDecoration(
                              color: ColorValues.appYellowColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Waiting For Approval",
                                style: Styles.whiteColor16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                " Request ID : ",
                                style: Styles.blackBold14,
                              ),
                              Text(
                                " GO001 ",
                                style: Styles.blackBold14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: ColorValues.greyLightColour,
                  ),
                  Dimens.boxHeight10,
                  Row(
                    children: [
                      Spacer(),
                      Text("Generated  by :"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Prashant Shettye"),
                      Spacer(),
                      Text("Order Date & Time :"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("16/04/2023  11:00:00"),
                      Spacer(),
                    ],
                  ),
                  Container(
                    margin: Dimens.edgeInsets15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: ColorValues.lightGreyColorWithOpacity35,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorValues.appBlueBackgroundColor,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    width: Get.width * 7,
                    height: Get.height / 1.70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, right: 20),
                          child: Text("Material"),
                        ),
                        Container(
                          margin: Dimens.edgeInsets15,
                          decoration: BoxDecoration(
                            color: ColorValues.inerCardColorHex,
                            border: Border.all(
                              color: ColorValues.lightGreyColorWithOpacity35,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          width: Get.width * 7,
                          height: Get.height / 2,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
