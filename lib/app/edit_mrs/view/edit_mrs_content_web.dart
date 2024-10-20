import 'package:cmms/app/app.dart';
import 'package:cmms/app/edit_mrs/edit_mrs_controller.dart';
import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/widgets/custom_elevated_button.dart';
import 'package:cmms/app/widgets/custom_textField.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/dropdown_web.dart';

class EditMrsContentWeb extends GetView<EditMrsController> {
  EditMrsContentWeb({Key? key}) : super(key: key);
  final EditMrsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SelectionArea(
        child: Column(
          children: [
            HeaderWidget(),
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
                  InkWell(
                    onTap: () {
                      Get.offNamed(Routes.home);
                    },
                    child: Text(
                      "DASHBOARD",
                      style: Styles.greyLight14,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      final _flutterSecureStorage =
                          const FlutterSecureStorage();
                      _flutterSecureStorage.delete(key: "mrsId");

                      String refId = controller.whereUsedId.toString() ?? "";
                      controller.type.value == 1
                          ? Get.offNamed('${Routes.jobDetails}/$refId')
                          : controller.type.value == 2
                              ? Get.offAllNamed('${Routes.pmTaskView}/$refId')
                              : Get.offNamed(Routes.mrsListScreen);
                    },
                    child: controller.type.value == 1
                        ? Text(
                            "/ JOB",
                            style: Styles.greyLight14,
                          )
                        : controller.type.value == 2
                            ? Text(
                                "/ PM TASK",
                                style: Styles.greyLight14,
                              )
                            : Text(" / MRS LIST", style: Styles.greyLight14),
                  ),
                  Text(" / EDIT RETURN MATERIAL SLIP",
                      style: Styles.greyLight14)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Edit Return Material Requisition Slip",
                        style: Styles.blackBold16,
                      ),
                    ),
                    Divider(
                      color: ColorValues.greyLightColour,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 7, left: 7, top: 15),
                      child: Row(
                        children: [
                          CustomRichText(
                              title: 'Activity: ', includeAsterisk: false),
                          Dimens.boxWidth2,
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 227, 224, 224),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorValues.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              width: (MediaQuery.of(context).size.width * .2),
                              child: LoginCustomTextfield(
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.deny(
                                //       RegExp(r'\s')),
                                // ],
                                textController: controller.activityCtrlr,
                              )),
                          Spacer(),
                          Text('Where Used: '),
                          Dimens.boxWidth2,
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 227, 224, 224),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorValues.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              width: (MediaQuery.of(context).size.width * .2),
                              child: LoginCustomTextfield(
                                enabled: true,
                                textController: controller.whereUsedCtrlr,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: Dimens.edgeInsets20,
                      //  height: 300,
                      height: ((controller.rowItem.value.length) * 90) + 170,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorValues.lightGreyColorWithOpacity35,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ColorValues.appBlueBackgroundColor,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(children: [
                        // Column(
                        //     children: []
                        //       ..addAll(controller.rowItem.value.map((e) {
                        //         return Text(jsonEncode(e));
                        //       }))),
                        //  Text(jsonEncode(controller.dropdownMapperData)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Material",
                                style: Styles.blue700,
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.addRowItem();
                                },
                                child: Container(
                                  height: 25,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: ColorValues.addNewColor,
                                    border: Border.all(
                                      color: ColorValues
                                          .lightGreyColorWithOpacity35,
                                      width: 1,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      " + Add ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: DataTable2(
                            minWidth: 2000,
                            dataRowHeight: 105,
                            columnSpacing: 10,
                            border: TableBorder.all(
                                color: Color.fromARGB(255, 206, 229, 234)),
                            columns: [
                              DataColumn2(
                                  fixedWidth: 500,
                                  label: Text(
                                    "Material Name",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    "Material Type",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              // DataColumn2(
                              //     fixedWidth: 210,
                              //     label: Text(
                              //       "Image",
                              //       style: TextStyle(
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.bold),
                              //     )),
                              DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    "Available Qty",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn2(
                                  fixedWidth: 200,
                                  label: Text(
                                    "Requested Qty",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              DataColumn2(
                                  fixedWidth: 100,
                                  label: Text(
                                    "Action",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                            rows: List.generate(controller.rowItem.value.length,
                                (rowIndex) {
                              var record = controller.rowItem.value[rowIndex];
                              return DataRow(
                                cells:
                                    List.generate(record.length, (cellIndex) {
                                  var mapData = record[cellIndex];
                                  return DataCell(
                                    mapData['key'] == "Drop_down"
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                DropdownWebWidget(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  dropdownList: controller
                                                      .assetItemList
                                                      .where((p0) {
                                                        return !controller
                                                            .rowItem
                                                            .map((p0) =>
                                                                p0[0]["value"])
                                                            .contains(p0!.name);
                                                      })
                                                      .toList()
                                                      .obs,
                                                  isValueSelected: controller
                                                                  .errorState[
                                                              '$rowIndex-${mapData['key']}'] ==
                                                          true
                                                      ? false
                                                      : true,
                                                  selectedValue:
                                                      mapData["value"],
                                                  onValueChanged:
                                                      (list, selectedValue) {
                                                    controller.errorState
                                                        .removeWhere((key,
                                                                value) =>
                                                            key ==
                                                            '$rowIndex-Drop_down');
                                                    print({
                                                      "web",
                                                      controller
                                                              .dropdownMapperData[
                                                          selectedValue]
                                                    });
                                                    mapData["value"] =
                                                        selectedValue;
                                                    controller.dropdownMapperData[
                                                            selectedValue] =
                                                        list.firstWhere(
                                                            (element) =>
                                                                element.name ==
                                                                selectedValue,
                                                            orElse: null);
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        : mapData['key'] == "Action "
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TableActionButton(
                                                      color: ColorValues
                                                          .appRedColor,
                                                      icon: Icons.delete,
                                                      label: '',
                                                      message: '',
                                                      onPress: () {
                                                        controller.rowItem
                                                            .remove(record);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              )
                                            : mapData['key'] == "Requested_Qty"
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: (Get.width * .4),
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            offset:
                                                                const Offset(
                                                                    5.0, 5.0),
                                                            blurRadius: 5.0,
                                                            spreadRadius: 1.0,
                                                          ),
                                                        ],
                                                        color: ColorValues
                                                            .whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: StatefulBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            StateSetter
                                                                setState) {
                                                          // Create a TextEditingController
                                                          TextEditingController
                                                              _controller =
                                                              TextEditingController(
                                                                  text: mapData[
                                                                          "value"] ??
                                                                      '');

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      const Offset(
                                                                          5.0,
                                                                          5.0),
                                                                  blurRadius:
                                                                      5.0,
                                                                  spreadRadius:
                                                                      1.0,
                                                                ),
                                                              ],
                                                              color: ColorValues
                                                                  .whiteColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border: controller
                                                                              .errorState[
                                                                          '$rowIndex-${mapData['key']}'] ==
                                                                      true
                                                                  ? Border.all(
                                                                      color: Colors
                                                                          .red,
                                                                      width:
                                                                          2.0)
                                                                  : Border.all(
                                                                      color: ColorValues
                                                                          .appLightBlueColor,
                                                                      width:
                                                                          1.0),
                                                            ),
                                                            child:
                                                                LoginCustomTextfield(
                                                              inputFormatters: <TextInputFormatter>[
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly
                                                              ],
                                                              maxLine: 1,
                                                              textController:
                                                                  _controller,
                                                              onChanged: (txt) {
                                                                // Convert the entered text to an integer
                                                                int requestedQty =
                                                                    int.tryParse(
                                                                            txt) ??
                                                                        0;
                                                                // Get the available quantity for the current record
                                                                int availableQty = controller
                                                                        .dropdownMapperData
                                                                        .value[record[0]
                                                                            [
                                                                            'value']]
                                                                        ?.available_qty ??
                                                                    0;

                                                                // Validate if the requested quantity is less than or equal to the available quantity
                                                                if (requestedQty >
                                                                    availableQty) {
                                                                  // Show an error message or perform any action as needed
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            "Invalid Quantity!"),
                                                                        content:
                                                                            Text("Please select appropriate quantity.\nAvailable qty is: ${availableQty}, you requested: ${requestedQty}."),
                                                                        actions: <Widget>[
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                              setState(() {
                                                                                _controller.clear();
                                                                              });
                                                                            },
                                                                            child:
                                                                                Text("OK"),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  setState(() {
                                                                    mapData["value"] =
                                                                        "";
                                                                  });
                                                                } else {
                                                                  // Update the value if it's valid
                                                                  mapData["value"] =
                                                                      txt;
                                                                }
                                                                if (controller
                                                                            .errorState[
                                                                        '$rowIndex-${mapData['key']}'] ==
                                                                    true) {
                                                                  controller
                                                                      .errorState
                                                                      .remove(
                                                                          '$rowIndex-${mapData['key']}');
                                                                }
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                : mapData['key'] ==
                                                        "Available_Qty"
                                                    ? Text(
                                                        "${controller.dropdownMapperData[record[0]['value']]?.available_qty ?? ""}")
                                                    : mapData['key'] ==
                                                            "Material_Type"
                                                        ? Text(
                                                            "${controller.dropdownMapperData[record[0]['value']]?.asset_type ?? ""}")
                                                        : Text(mapData['key'] ??
                                                            ''),
                                  );
                                }),
                              );
                            }),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      margin: Dimens.edgeInsets15,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRichText(title: "Comment:"),
                          Dimens.boxWidth2,
                          Container(
                              width: (Get.width * .6),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorValues.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: ColorValues.whiteColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: LoginCustomTextfield(
                                maxLine: 5,
                                textController: controller.remarkCtrlr,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 10),
                      child: Row(
                        children: [
                          Text(
                            'Set As Template: ',
                            style: Styles.blackBold14,
                          ),
                          Dimens.boxWidth2,
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 227, 224, 224),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: ColorValues.whiteColor,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              width: (MediaQuery.of(context).size.width * .2),
                              child: LoginCustomTextfield(
                                // inputFormatters: [
                                //   FilteringTextInputFormatter.deny(
                                //       RegExp(r'\s')),
                                // ],
                                textController: controller.setTemlateCtrlr,
                              )),
                        ],
                      ),
                    ),
                    Dimens.boxHeight15,
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.updateColor,
                    text: 'Update',
                    onPressed: () {
                      // controller.addUser();
                      controller.editMrs();
                    },
                  ),
                ),
                Dimens.boxWidth20,
                Container(
                  height: 35,
                  child: CustomElevatedButton(
                    backgroundColor: ColorValues.cancelColor,
                    text: "Cancel",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
