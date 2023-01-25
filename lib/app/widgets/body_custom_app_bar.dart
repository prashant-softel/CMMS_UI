import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';

import 'package:cmms/app/app.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.edgeInsets16_0_16_0,
      color: Colors.grey.withOpacity(.2),
      height: Dimens.fiftyFive,
      child: Row(
        children: [
          Container(
            child: Text('inventoryList'.tr),
          ),
          Spacer(),
          ActionButton(
            icon: Icons.close,
            lable: 'retireAsset'.tr,
            onPress: () async {
              ByteData data = await rootBundle
                  .load("assets/files/Fixed Asset Imports.xlsx");
              var bytes = data.buffer
                  .asUint8List(data.offsetInBytes, data.lengthInBytes);
              var excel = Excel.decodeBytes(bytes);

              for (var table in excel.tables.keys) {
                print(table); //sheet Name
                print(excel.tables[table]?.maxCols);
                print(excel.tables[table]?.maxRows);
                for (var row in excel.tables[table]!.rows) {
                  print("QWERTY $row");
                }
              }
            },
            color: Colors.red,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.download,
            lable: 'exportAsset'.tr,
            onPress: () {},
            color: Colors.blue,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.upload,
            lable: 'importAsset'.tr,
            onPress: () {
              var file = "assets/files/Fixed Asset Imports.xlsx";
              var bytes = File(file).readAsBytesSync();
              // var excel = Excel.decodeBytes(bytes);

              // for (var table in excel.tables.keys) {
              //   print(table); //sheet Name
              //   print(excel.tables[table]?.maxCols);
              //   print(excel.tables[table]?.maxRows);
              //   for (var row in excel.tables[table]!.rows) {
              //     print("QWERTY $row");
              //   }
              // }
            },
            color: Colors.blue,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.add,
            lable: 'addAsset'.tr,
            onPress: () {
              Get.dialog(
                AlertDialog(
                  contentPadding: Dimens.edgeInsets0,
                  titlePadding: Dimens.edgeInsets0,
                  title: Container(
                    padding: Dimens.edgeInsets12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black.withOpacity(.2),
                    ),
                    child: Text(
                      'addInventory'.tr,
                      style: Styles.white18,
                    ),
                  ),
                  content: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 1100,
                    ),
                    child: Column(
                      children: [
                        Wrap(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(.2),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Block'),
                                Dimens.boxWidth10,
                                Container(
                                  width: 200,
                                  height: 40,
                                  margin: Dimens.edgeInsets0_0_16_0,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 0.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 0.0),
                                      ),
                                      contentPadding: Dimens.edgeInsets10_0_0_0,
                                      hintText: 'search'.tr,
                                      hintStyle: Styles.grey12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Block'),
                            Dimens.boxWidth10,
                            Container(
                              width: 200,
                              height: 40,
                              margin: Dimens.edgeInsets0_0_16_0,
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  contentPadding: Dimens.edgeInsets10_0_0_0,
                                  hintText: 'search'.tr,
                                  hintStyle: Styles.grey12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
