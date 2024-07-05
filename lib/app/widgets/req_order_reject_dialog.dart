import 'package:cmms/app/theme/color_values.dart';
// ignore: unused_import
import 'package:cmms/app/view_add_goods_orders.dart/stock_management_view_add_goods_orders_controller.dart';
import 'package:cmms/app/view_request_orders/request_goods_orders_view_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../theme/colors_value.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class ReqOrderRejectDialog extends GetView {
  int? id;

  ReqOrderRejectDialog({super.key, this.id});
  final PurchaseGoodsorderViewController _controller = Get.find();

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
          "Goods Request Reject",
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
                        controller: _controller.rejectCommentTextFieldCtrlr,
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
            Spacer(),
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
              style: Styles.darkRedElevatedButtonStyle,
              onPressed: () {
                _controller.rejectGoodsOrder(id: id);
                print('Goods Request id:$id');
                Get.back();
              },
              child: Text('Reject GR'),
            ),
            Spacer()
          ]),
        ],
      );
    }));
  }
}
