import 'package:cmms/app/theme/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_elevated_button.dart';
import '../import_inventory_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImportInventoryContentWeb extends GetView<ImportInventoryController> {
  ImportInventoryContentWeb({
    super.key,
  });

  ///
  var controller = Get.find<ImportInventoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
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
              child: controller.type == 1
                  ? Row(
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
                          child: Text(" / INVENTORY",
                              style: Styles.greyMediumLight12),
                        ),
                        Text(" / IMPORT INVENTORY",
                            style: Styles.greyMediumLight12),
                      ],
                    )
                  : Row(
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
                          child: Text(" / PREVENTIVE MAINTENANCE",
                              style: Styles.greyMediumLight12),
                        ),
                        Text(" / CHECK POINT CREATOR",
                            style: Styles.greyMediumLight12)
                      ],
                    )),
          //  Dimens.boxHeight20,
          Flexible(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Card(
                color: Color.fromARGB(255, 245, 248, 250),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Import Inventory file",
                        style: Styles.blackBold16,
                      ),
                    ),
                    Dimens.boxHeight20,
                    Center(child: Text("File to  import")),
                    Dimens.boxHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,
                          width: (Get.width * .3) - 10,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 227, 224, 224),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 236, 234, 234)
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                controller.fileName.value == ""
                                    ? 'File Name'
                                    : controller.fileName.value,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: Styles.greyLight14,
                              ),
                            ),
                          ),
                        ),
                        Dimens.boxWidth5,
                        Container(
                          height: 45,
                          child: CustomElevatedButton(
                            backgroundColor: ColorValues.appDarkBlueColor,
                            text: "Browse",
                            onPressed: () async {
                              final result =
                                  await FilePicker.platform.pickFiles();
                              if (result != null) {
                                // for (var file in result.files) {
                                controller.fileName.value =
                                    result.files.single.name;
                                controller.fileBytes =
                                    result.files.single.bytes;
                                //controller.filePath.value = file.;
                                //  print({"filepathes", fileBytes});
                                // }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Dimens.boxHeight20,
                    Center(
                      child: Text(
                        "Download template",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorValues.blueColor),
                      ),
                    ),
                    Dimens.boxHeight20,
                    Container(
                      margin: EdgeInsets.only(bottom: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   height: 35,
                          //   child: CustomElevatedButton(
                          //     backgroundColor: ColorValues.appDarkBlueColor,
                          //     text: "Validate",
                          //     onPressed: () {},
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          Container(
                            height: 35,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.greenColor,
                              text: 'Import',
                              onPressed: () {
                                if (controller.fileName.value != "") {
                                  controller
                                      .browseFiles(
                                    fileBytes: controller.fileBytes,
                                  )
                                      .then((value) {
                                    controller.isSuccessDialog();

                                    // Fluttertoast.showToast(
                                    //     msg: "file upload  Successfully",
                                    //     fontSize: 16.0);
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Please Select file...",
                                      fontSize: 16.0);
                                }

                                //  controller.savePmMapping();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 35,
                            child: CustomElevatedButton(
                              backgroundColor: ColorValues.appRedColor,
                              text: "Close",
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
