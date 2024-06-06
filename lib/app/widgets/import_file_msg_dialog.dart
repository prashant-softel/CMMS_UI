import 'package:cmms/app/import_inventory/import_inventory_controller.dart';
import 'package:cmms/app/theme/color_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';

class ImportMsgDialog extends GetView {
  // String? approveIncidentReportData;
  final String? data;
  final dynamic importLog;

  ImportMsgDialog({super.key, this.data, this.importLog});
  final ImportInventoryController controller = Get.find();

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
          'Imported File Status.....',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;

          return Container(
            padding: Dimens.edgeInsets05_0_5_0,
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    // importLog == null
                    //     ? 
                        Center(
                            child: Text('${data}',
                                style: TextStyle(color: Colors.green),
                                textAlign: TextAlign.center),
                          ),
                        // : 
                        Center(
                            child: Text('${importLog}',
                                style: TextStyle(color: Colors.red),
                                textAlign: TextAlign.center),
                          ),
                    // SizedBox(height: 20,),
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
            ),
          );
        }),
        actions: [
          Dimens.boxWidth10,
          Center(
            child: ElevatedButton(
              style: Styles.greenElevatedButtonStyle,
              onPressed: () {
                Future.delayed(Duration(seconds: 2), () {
                  controller.fileName.value = "";
                });
                Get.back();
              },
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      );
    }));
  }
}
