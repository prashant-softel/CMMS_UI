import 'dart:async';
import 'dart:typed_data';
import 'package:cmms/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:get/get.dart';
import '../theme/color_values.dart';
import 'import_inventory_presenter.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImportInventoryController extends GetxController {
  ///
  ImportInventoryController(
    this.importInventoryPresenter,
  );
  ImportInventoryPresenter importInventoryPresenter;
  RxString fileName = "".obs;
  Uint8List? fileBytes;

  Rx<int> importType = 0.obs;
  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;
  final HomeController homeController = Get.find();

  @override
  void onInit() async {
    await setImportType();

    // importType = Get.arguments;
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
    });
    super.onInit();
  }

  Future<void> setImportType() async {
    try {
      final _importType = await importInventoryPresenter.getValue();
      if (_importType == null || _importType == '' || _importType == "null") {
        var dataFromPreviousScreen = Get.arguments;

        importType.value = dataFromPreviousScreen['importType'];
        importInventoryPresenter.saveValue(
            importType: importType.value.toString());
      } else {
        importType.value = int.tryParse(_importType) ?? 0;
      }
    } catch (e) {
      print(e.toString() + 'importType');
      //  Utility.showDialog(e.toString() + 'userId');
    }
  }

  Future<bool> browseFiles({Uint8List? fileBytes}) async {
    await importInventoryPresenter.browseFiles(
        fileBytes, fileName.value, importType.value, true, facilityId);
    return true;
  }

  Future<String> downloadXLSXFromAssets(String assetPath) async {
    // Get the cache manager
    final cacheManager = DefaultCacheManager();

    // Check if the file is already cached
    File file = await cacheManager.getSingleFile(assetPath);

    if (file == null || !await file.exists()) {
      // If not cached, download the file and store it in the cache
      var fileData = await cacheManager.downloadFile(assetPath);
      file = fileData.file;
    }

    // Get the local path of the cached file
    String localPath = file.path;
    return localPath;
  }

  // void isSuccessDialog() {
  //   Get.dialog(
  //     AlertDialog(
  //       title: Text('Import Inventory'),
  //       content: Column(mainAxisSize: MainAxisSize.min, children: [
  //         Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5),
  //             color: Color.fromARGB(255, 7, 161, 17),
  //             border: Border.all(
  //               color: Color.fromARGB(255, 7, 161, 17),
  //               width: 1,
  //             ),
  //           ),
  //           child: Icon(Icons.check, size: 35, color: ColorValues.whiteColor),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Center(
  //           child: Text(
  //               "${fileName.value} \n inventory import Successfully....",
  //               style: TextStyle(fontSize: 16, color: ColorValues.blackColor)),
  //         )
  //       ]),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Get.back();
  //             // Get.back();
  //             Future.delayed(Duration(seconds: 2), () {
  //               fileName.value = "";
  //             });
  //           },
  //           child: Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
