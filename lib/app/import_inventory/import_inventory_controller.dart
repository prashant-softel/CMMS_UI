import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color_values.dart';
import 'import_inventory_presenter.dart';

class ImportInventoryController extends GetxController {
  ///
  ImportInventoryController(
    this.importInventoryPresenter,
  );
  ImportInventoryPresenter importInventoryPresenter;
  RxString fileName = "".obs;
  Uint8List? fileBytes;

  int type = 0;
  @override
  void onInit() async {
    type = Get.arguments;
    super.onInit();
  }

  Future<bool> browseFiles({Uint8List? fileBytes}) async {
    await importInventoryPresenter.browseFiles(fileBytes, fileName.value, true);
    return true;
  }

  void isSuccessDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Import Inventory'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 7, 161, 17),
              border: Border.all(
                color: Color.fromARGB(255, 7, 161, 17),
                width: 1,
              ),
            ),
            child: Icon(Icons.check, size: 35, color: ColorValues.whiteColor),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
                "${fileName.value} \n inventory import Successfully....",
                style: TextStyle(fontSize: 16, color: ColorValues.blackColor)),
          )
        ]),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              // Get.back();
              Future.delayed(Duration(seconds: 2), () {
                fileName.value = "";
              });
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
