import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_multiselect_dialog_field.dart';
import '../../widgets/custom_richtext.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/dropdown.dart';
import '../add_asset_master_controller.dart';

class AddAssetMasterWeb extends GetView<AddAssetMasterController> {
  AddAssetMasterWeb({Key? key}) : super(key: key);
  final AddAssetMasterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    ///
    Widget _rowItem(int? defaultValue, {required Function(bool) onCheck}) {
      return Checkbox(
          value: defaultValue == 1 ? true : false,
          checkColor: Colors.white,
          activeColor: ColorValues.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
              width: 1.0,
              color: ColorValues.blackColor,
            ),
          ),
          onChanged: (val) {
            controller.isChecked.value = val!;
            onCheck(val);
          });
    }

    return Obx(
      () => Container(
        color: Color.fromARGB(255, 234, 236, 238),
        width: Get.width,
        height: Get.height,
        child: Column(
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
                    child: Text(" / MASTER", style: Styles.greyMediumLight12),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(" / STOCK MANAGEMENT",
                          style: Styles.greyMediumLight12)),
                  Text(" / MASTER MATERIAL", style: Styles.greyMediumLight12)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  //   margin: Dimens.edgeInsets20,
                  color: Color.fromARGB(255, 245, 248, 250),
                  child: Column(

                    children: [
                      Container(
                        height: 60,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Asset Material",
                                style: Styles.blackBold18,
                              ),

                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: ColorValues.greyLightColour,
                      ),
                      Container(
                        margin: Dimens.edgeInsets20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: Dimens.edgeInsets30_0_0_0,
                                child:
                            Dimens.boxWidth30,
                        ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [       
                                Row(
                                  children: [
                                    CustomRichText(title: 'Material Name: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
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
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: LoginCustomTextfield(
                                          ishint: 'Enter Material Name',
                                          textController:
                                              controller.loginIdCtrlr,
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Material Type: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                      (MediaQuery.of(context).size.width *
                                          .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.countryList,
                                        isValueSelected:
                                        controller.isSelectedMaterialType.value,
                                        selectedValue:
                                        controller.selectedMaterialType.value,
                                        onValueChanged:
                                        controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Unit of Measurement: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.countryList,
                                        isValueSelected:
                                            controller.isSelectedUnitOfMeasurement.value,
                                        selectedValue:
                                            controller.selectedUnitOfMeasurement.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Min. Required Qty : '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width *
                                              .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.cityList,
                                        isValueSelected:
                                            controller.isSelectedMinRequiredQty.value,
                                        selectedValue:
                                            controller.selectedMinRequiredQty.value,
                                        onValueChanged:
                                            controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                // Row(
                                //   children: [
                                //     CustomRichText(title: 'Asset Description: '),
                                //     Dimens.boxWidth10,
                                //     Container(
                                //         decoration: BoxDecoration(
                                //           borderRadius:
                                //           BorderRadius.circular(10),
                                //           border: Border.all(
                                //             color: Color.fromARGB(
                                //                 255, 227, 224, 224),
                                //             width: 1,
                                //           ),
                                //           boxShadow: [
                                //             BoxShadow(
                                //               color: Colors.black26,
                                //               offset: const Offset(
                                //                 5.0,
                                //                 5.0,
                                //               ),
                                //               blurRadius: 5.0,
                                //               spreadRadius: 1.0,
                                //             ),
                                //             BoxShadow(
                                //               color: ColorValues.whiteColor,
                                //               offset: const Offset(0.0, 0.0),
                                //               blurRadius: 0.0,
                                //               spreadRadius: 0.0,
                                //             ),
                                //           ],
                                //         ),
                                //         width:
                                //         (MediaQuery.of(context).size.width *
                                //             .2),
                                //         child: LoginCustomTextfield(
                                //           ishint: '',
                                //           textController:
                                //           controller.loginIdCtrlr,
                                //         )),
                                //   ],
                                // ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    CustomRichText(title: 'MDM Code: '),
                                    Dimens.boxWidth10,
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 227, 224, 224),
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
                                        width:
                                            (MediaQuery.of(context).size.width *
                                                .2),
                                        child: Expanded(
                                          child: LoginCustomTextfield(
                                            ishint: 'Enter MDM Code',
                                            textController:
                                                controller.secandoryIdCtrlr,
                                          ),
                                        )),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Material Category: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                      (MediaQuery.of(context).size.width *
                                          .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.countryList,
                                        isValueSelected:
                                        controller.isSelectedMaterialCategory.value,
                                        selectedValue:
                                        controller.selectedMaterialCategory.value,
                                        onValueChanged:
                                        controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'AC/DC: '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                      (MediaQuery.of(context).size.width *
                                          .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.countryList,
                                        isValueSelected:
                                        controller.isSelectedACDC.value,
                                        selectedValue:
                                        controller.selectedACDC.value,
                                        onValueChanged:
                                        controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                                Dimens.boxHeight8,
                                Row(
                                  children: [
                                    CustomRichText(title: 'Min. Reorder Qty : '),
                                    Dimens.boxWidth10,
                                    Container(
                                      width:
                                      (MediaQuery.of(context).size.width *
                                          .2),
                                      child: DropdownWidget(
                                        controller: controller,
                                        dropdownList: controller.cityList,
                                        isValueSelected:
                                        controller.isSelectedMinReorderQty.value,
                                        selectedValue:
                                        controller.selectedMinReorderQty.value,
                                        onValueChanged:
                                        controller.onValueChanged,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: Dimens.edgeInsets20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: Dimens.edgeInsets30_0_0_0,
                              child:
                              Dimens.boxWidth30,
                            ),
                            Container(
                          margin: Dimens.edgeInsets10,
                          child:
                            Row(
                              children: [
                                CustomRichText(title: 'Asset Description: '),
                                Dimens.boxWidth10,
                                Container(
                                    width: (Get.width * .5),
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
                                      borderRadius:
                                      BorderRadius.circular(5),
                                    ),
                                    child: LoginCustomTextfield(
                                      maxLine: 5,
                                    )),
                              ],
                            ),
                        )
                          ],
                        ),
                      ),
                      Container(
                        margin: Dimens.edgeInsets20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: Dimens.edgeInsets30_0_0_0,
                              child:
                              Dimens.boxWidth30,
                            ),
                            Container(
                              margin: Dimens.edgeInsets10,

                              child:
                              Row(
                                children: [
                                  CustomRichText(title: 'Material Image: '),
                                  Dimens.boxWidth10,
                                  SizedBox(
                                    height: 210,
                                    child: Stack(
                                      children: [
                                        controller.selectedImagePath.value.isNotEmpty
                                            ? GestureDetector(
                                          onTap: () => controller
                                              .getImage(ImageSource.gallery),
                                          child: Container(
                                            height: controller.thumbnailSize,
                                            width: controller.thumbnailSize,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              child: Image.memory(
                                                controller
                                                    .selectedImageBytes.value,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                            : Container(
                                          height: controller.thumbnailSize,
                                          width: controller.thumbnailSize,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 195, 192, 192),
                                            border: Border.all(
                                              color:
                                              ColorValues.appLightGreyColor,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(100),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.image,
                                                size: 70,
                                                color: Color.fromARGB(
                                                    255, 215, 192, 141),
                                              ),
                                              Dimens.boxHeight10,
                                              Text("Upload Photo",
                                                  style:
                                                  Styles.greyMediumLight12)
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 150,
                                          left: 100,
                                          right: 0,
                                          child: Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                controller
                                                    .getImage(ImageSource.gallery);
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: ColorValues.appDarkBlueColor,
                                                  border: Border.all(
                                                    color:
                                                    ColorValues.appDarkBlueColor,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(50),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 40,
                                                    color: ColorValues.whiteColor,
                                                  ), //Circ
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: Dimens.edgeInsets30_0_0_0,
                                    child:
                                    Dimens.boxWidth30,
                                  ),
                                  Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                child: DataTable(
                                    dataRowHeight: 60.0, // Adjust the row height as needed
                                    horizontalMargin: 10.0,   
                                  columnSpacing: 45.0,
                                  columns: [
                                    DataColumn(label: Text('ID'),),
                                    DataColumn(label: Text('Name')),
                                    DataColumn(label: Text('Upload Progress')),
                                    DataColumn(label: Text('Status')),
                                    DataColumn(label: Text('Description')),
                                    DataColumn(label: Text('Remove')),
                                  ],
                                  rows: [
                                    // DataRow(cells: [
                                    //   DataCell(Text('1')),
                                    //   DataCell(Text('John')),
                                    //   DataCell(Text('80%')),
                                    //   DataCell(Text('Complete')),
                                    //   DataCell(Text('Lorem ipsum')),
                                    //   DataCell(IconButton(
                                    //     icon: Icon(Icons.delete),
                                    //     onPressed: () {
                                    //       // Handle remove action
                                    //     },
                                    //   )),
                                    // ]),
                                    // DataRow(cells: [
                                    //   DataCell(Text('2')),
                                    //   DataCell(Text('Jane')),
                                    //   DataCell(Text('50%')),
                                    //   DataCell(Text('In Progress')),
                                    //   DataCell(Text('Dolor sit amet')),
                                    //   DataCell(IconButton(
                                    //     icon: Icon(Icons.delete),
                                    //     onPressed: () {
                                    //       // Handle remove action
                                    //     },
                                    //   )),
                                    // ]),
                                    // Add more rows as needed
                                  ],
                                ),
                              ),

                              // Center(
                                  //   child: ScrollableTableView(
                                  //     columns: [
                                  //       "Name",
                                  //       "Upload Progress",
                                  //       "Status",
                                  //       "Description"
                                  //       "Remove"
                                  //     ].map(
                                  //             (column) {
                                  //           return TableViewColumn(
                                  //             label:
                                  //             column,
                                  //             minWidth:
                                  //             Get.width * 0.10,
                                  //           );
                                  //         }).toList(),
                                  //     rows: true
                                  //         ? controller
                                  //         .plantListModel
                                  //         .map((plants) => TableViewRow(height: 90, cells: [
                                  //       // TableViewCell(child: Text("${plants?.plant_name ?? ""}")),
                                  //       // TableViewCell(child: Text("${plants?.spv_name ?? ""}")),
                                  //       // TableViewCell(child: Text("----")),
                                  //     ]
                                  //     ))
                                  //         .toList()
                                  //         : [],
                                  //   ),
                                  // ),
                                ],
                              ),

                            )

                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        color: ColorValues.whiteColor,
                        margin: Dimens.edgeInsets20,

                            // Text(" / MASTER MATERIAL", style: Styles.greyMediumLight12),
                           child: Container(
                              height: 300,
                              margin: Dimens.edgeInsets20,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(5),
                                border: Border.all(
                                  color:
                                  ColorValues.lightGreyColorWithOpacity35,
                                  width: 4,
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
                              child: ScrollableTableView(
                                // paginationController:
                                // controller.schedulePaginationController,
                                columns: [
                                  "Document Type",
                                  "Document Name",
                                  "Remarks",
                                  "Upload Files",
                                ].map((column) {
                                  return TableViewColumn(
                                    label: column,
                                    minWidth: Get.width * 0.18,
                                  );
                                }).toList(),
                                rows:
                                 [
                                   TableViewRow(height: 150, cells: [
                                TableViewCell(
                                  child:Container(
                                    width:
                                    (MediaQuery.of(context).size.width *
                                        .12),
                                    child: DropdownWidget(
                                      controller: controller,
                                      dropdownList: controller.countryList,
                                      isValueSelected:
                                      controller.isSelectedDocumentType.value,
                                      selectedValue:
                                      controller.selectedDocumentType.value,
                                      onValueChanged:
                                      controller.onValueChanged,
                                    ),
                                  ),
                                ),
                                TableViewCell(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color.fromARGB(
                                              255, 227, 224, 224),
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
                                      width:
                                      (MediaQuery.of(context).size.width *
                                          .12),
                                      child: LoginCustomTextfield(
                                        ishint: '',
                                        textController:
                                        controller.loginIdCtrlr,
                                      )),
                                ),
                                TableViewCell(
                                  child: Container(
                                      width: (Get.width * .12),
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
                                        borderRadius:
                                        BorderRadius.circular(5),
                                      ),
                                      child: LoginCustomTextfield(
                                        maxLine: 3,
                                      )),
                                ),
                                TableViewCell(
                                    child: Container(
                                      width: (MediaQuery.of(context).size.width *
                                          .12),
                                      child: ActionButton(
                                        label: 'Upload file',
                                        onPressed: () {},
                                        icon: Icons.file_upload_outlined,
                                        color: Colors.blue,
                                      ),
                                    )
                                ),
                              ]),
                                 ])

                                    // .toList()

                              ),
                            ),


                      // ),


                      // SizedBox(
                      //   // width: MediaQuery.of(context).size.width / 2,
                      //   child: Column(
                      //     children: [
                                                     //         children: [
                      //           Column(
                      //             children: [
                      //               SizedBox(
                      //                 width: MediaQuery.of(context).size.width /
                      //                     1.5,
                      //                 child: DefaultTabController(
                      //                   length: 3,
                      //                   child: Column(
                      //                     children: [
                      //                       Container(
                      //                         height: 45,
                      //                         decoration: BoxDecoration(
                      //                           borderRadius: BorderRadius.only(
                      //                               topLeft:
                      //                                   Radius.circular(40),
                      //                               topRight:
                      //                                   Radius.circular(40)),
                      //                           color: Color.fromARGB(
                      //                               255, 245, 248, 250),
                      //                         ),
                      //                         child: TabBar(
                      //                           labelPadding:
                      //                               EdgeInsets.symmetric(
                      //                                   horizontal: 10.0),
                      //                           labelColor: Colors.black,
                      //                           indicator: BoxDecoration(
                      //                             borderRadius:
                      //                                 BorderRadius.only(
                      //                                     topLeft:
                      //                                         Radius.circular(
                      //                                             40),
                      //                                     topRight:
                      //                                         Radius.circular(
                      //                                             40)),
                      //                             color: Colors.white,
                      //                             boxShadow: [
                      //                               BoxShadow(
                      //                                 color: Colors.black26,
                      //                                 offset: const Offset(
                      //                                   1.0,
                      //                                   1.0,
                      //                                 ),
                      //                                 blurRadius: 5.0,
                      //                               ),
                      //                               BoxShadow(
                      //                                 color: ColorValues
                      //                                     .whiteColor,
                      //                                 offset: const Offset(
                      //                                     0.0, 0.0),
                      //                                 blurRadius: 0.0,
                      //                                 spreadRadius: 0.0,
                      //                               ),
                      //                             ],
                      //                           ),
                      //                           unselectedLabelColor:
                      //                               Colors.black,
                      //                           tabs: [
                      //                             Tab(
                      //                               child: Row(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .center,
                      //                                 children: [
                      //                                   Icon(Icons
                      //                                       .analytics_outlined),
                      //                                   Dimens.boxWidth5,
                      //                                   Text('Plant Access'),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                             Tab(
                      //                               child: Row(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .center,
                      //                                 children: [
                      //                                   Icon(Icons
                      //                                       .account_tree_outlined),
                      //                                   Dimens.boxWidth5,
                      //                                   Text(
                      //                                     'Access Level',
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                             Tab(
                      //                               child: Row(
                      //                                 mainAxisAlignment:
                      //                                     MainAxisAlignment
                      //                                         .center,
                      //                                 children: [
                      //                                   Icon(Icons
                      //                                       .notifications),
                      //                                   Dimens.boxWidth5,
                      //                                   Text(
                      //                                     'Notification',
                      //                                   ),
                      //                                 ],
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                       Container(
                      //                         height: Get.height + 50,
                      //
                      //                         //  height: 500,
                      //                         decoration: BoxDecoration(
                      //                           borderRadius: BorderRadius.only(
                      //                               topLeft:
                      //                                   Radius.circular(40),
                      //                               topRight:
                      //                                   Radius.circular(40)),
                      //                           color: Color.fromARGB(
                      //                               255, 245, 248, 250),
                      //                         ),
                      //                         child: TabBarView(children: [
                      //                           Column(
                      //                             children: [
                      //                               Container(
                      //                                   color: ColorValues
                      //                                       .whiteColor,
                      //                                   child: Container(
                      //                                       height:
                      //                                           Get.height - 30,
                      //                                       margin: Dimens
                      //                                           .edgeInsets15,
                      //                                       decoration:
                      //                                           BoxDecoration(
                      //                                         border:
                      //                                             Border.all(
                      //                                           color: ColorValues
                      //                                               .lightGreyColorWithOpacity35,
                      //                                           width: 1,
                      //                                         ),
                      //                                         boxShadow: [
                      //                                           BoxShadow(
                      //                                             color: ColorValues
                      //                                                 .appBlueBackgroundColor,
                      //                                             spreadRadius:
                      //                                                 2,
                      //                                             blurRadius: 5,
                      //                                             offset:
                      //                                                 Offset(
                      //                                                     0, 2),
                      //                                           ),
                      //                                         ],
                      //                                       ),
                      //                                       child: controller
                      //                                                   .plantListModel
                      //                                                   .length >
                      //                                               0
                      //                                           ? Center(
                      //                                               child:
                      //                                                   ScrollableTableView(
                      //                                                 columns: [
                      //                                                   "Plant Name",
                      //                                                   "SPV",
                      //                                                   "Location",
                      //                                                 ].map(
                      //                                                     (column) {
                      //                                                   return TableViewColumn(
                      //                                                     label:
                      //                                                         column,
                      //                                                     minWidth:
                      //                                                         Get.width * 0.20,
                      //                                                   );
                      //                                                 }).toList(),
                      //                                                 rows: true
                      //                                                     ? controller
                      //                                                         .plantListModel
                      //                                                         .map((plants) => TableViewRow(height: 90, cells: [
                      //                                                               TableViewCell(child: Text("${plants?.plant_name ?? ""}")),
                      //                                                               TableViewCell(child: Text("${plants?.spv_name ?? ""}")),
                      //                                                               TableViewCell(child: Text("----")),
                      //                                                             ]))
                      //                                                         .toList()
                      //                                                     : [],
                      //                                               ),
                      //                                             )
                      //                                           : Container(
                      //                                               width: Get
                      //                                                   .width,
                      //                                               height:
                      //                                                   Get.height -
                      //                                                       30,
                      //                                               child:
                      //                                                   Column(
                      //                                                 crossAxisAlignment:
                      //                                                     CrossAxisAlignment
                      //                                                         .start,
                      //                                                 children: [
                      //                                                   SizedBox(
                      //                                                     width:
                      //                                                         MediaQuery.of(context).size.width / 9,
                      //                                                     child:
                      //                                                         ActionButton(
                      //                                                       label:
                      //                                                           'Add Facility',
                      //                                                       icon:
                      //                                                           Icons.add,
                      //                                                       onPressed:
                      //                                                           () {
                      //                                                         Get.dialog<void>(AddfacilityListAlertBox());
                      //
                      //                                                         //     void>(
                      //                                                         // AddfacilityListAlertBox());
                      //                                                       },
                      //                                                       color:
                      //                                                           Colors.green,
                      //                                                     ),
                      //                                                   ),
                      //                                                   Container(
                      //                                                     width:
                      //                                                         MediaQuery.of(context).size.height * 1.5,
                      //                                                     height:
                      //                                                         Get.height - 70,
                      //                                                     child: Column(
                      //                                                         //
                      //                                                         children: [
                      //                                                           Expanded(
                      //                                                             child: //
                      //                                                                 ScrollableTableView(
                      //                                                               columns: [
                      //                                                                 "Facility Id",
                      //                                                                 'Facility name',
                      //                                                                 'Location',
                      //                                                               ].map((column) {
                      //                                                                 return TableViewColumn(minWidth: Get.width * 0.20, label: column);
                      //                                                               }).toList(),
                      //                                                               rows: //
                      //                                                                   [
                      //                                                                 ...List.generate(
                      //                                                                   controller.filteredfacilityNameList.length,
                      //                                                                   (index) {
                      //                                                                     var facilityNameDetails = controller.filteredfacilityNameList[index];
                      //
                      //                                                                     return [
                      //                                                                       '${facilityNameDetails?.id ?? ''}',
                      //                                                                       '${facilityNameDetails?.name ?? ''}',
                      //                                                                       '${facilityNameDetails?.address ?? ''}',
                      //                                                                     ];
                      //                                                                   },
                      //                                                                 ),
                      //                                                               ].map((_inventoryDetailList) {
                      //                                                                 return TableViewRow(
                      //                                                                     onTap: () => {
                      //                                                                           //  print('ZERO = ${_inventoryDetailList[0]}')
                      //                                                                         },
                      //                                                                     height: 60,
                      //                                                                     cells: _inventoryDetailList.map((value) {
                      //                                                                       return TableViewCell(
                      //                                                                         //key: ,
                      //                                                                         child: Text(value.toString()),
                      //                                                                       );
                      //                                                                     }).toList());
                      //                                                               }).toList(),
                      //                                                             ),
                      //                                                           ),
                      //                                                         ]),
                      //                                                   ),
                      //                                                 ],
                      //                                               ),
                      //                                             ))),
                      //                             ],
                      //                           ),
                      //                           Column(
                      //                             children: [
                      //                               Container(
                      //                                   color: ColorValues
                      //                                       .whiteColor,
                      //                                   child: controller
                      //                                               .accesslevel
                      //                                               .length >
                      //                                           0
                      //                                       ? Container(
                      //                                           height:
                      //                                               Get.height -
                      //                                                   30,
                      //                                           margin: Dimens
                      //                                               .edgeInsets15,
                      //                                           decoration:
                      //                                               BoxDecoration(
                      //                                             border: Border
                      //                                                 .all(
                      //                                               color: ColorValues
                      //                                                   .lightGreyColorWithOpacity35,
                      //                                               width: 1,
                      //                                             ),
                      //                                             boxShadow: [
                      //                                               BoxShadow(
                      //                                                 color: ColorValues
                      //                                                     .appBlueBackgroundColor,
                      //                                                 spreadRadius:
                      //                                                     2,
                      //                                                 blurRadius:
                      //                                                     5,
                      //                                                 offset:
                      //                                                     Offset(
                      //                                                         0,
                      //                                                         2),
                      //                                               ),
                      //                                             ],
                      //                                           ),
                      //                                           child: controller
                      //                                                       .accesslevel
                      //                                                       .length >
                      //                                                   0
                      //                                               ? ScrollableTableView(
                      //                                                   columns:
                      //                                                       [
                      //                                                     "Module Name",
                      //                                                     "Add",
                      //                                                     "Edit",
                      //                                                     "Delete",
                      //                                                     "View",
                      //                                                     "Issue",
                      //                                                     "Approve",
                      //                                                     "Self View"
                      //                                                   ].map((column) {
                      //                                                     return TableViewColumn(
                      //                                                       label:
                      //                                                           column,
                      //                                                       // width:
                      //                                                       //     115, // Set the width of the column to 100
                      //
                      //                                                       minWidth:
                      //                                                           Get.width * 0.085,
                      //                                                     );
                      //                                                   }).toList(),
                      //                                                   rows: true
                      //                                                       ? controller.accesslevel
                      //                                                           .map((getAccesslevelDetails) => TableViewRow(height: 90, cells: [
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return Row(
                      //                                                                       children: [
                      //                                                                         Checkbox(
                      //                                                                             value: controller.isCheckedmodule.value,
                      //                                                                             checkColor: Colors.white,
                      //                                                                             activeColor: ColorValues.blackColor,
                      //                                                                             shape: RoundedRectangleBorder(
                      //                                                                               borderRadius: BorderRadius.circular(2.0),
                      //                                                                             ),
                      //                                                                             side: MaterialStateBorderSide.resolveWith(
                      //                                                                               (states) => BorderSide(
                      //                                                                                 width: 1.0,
                      //                                                                                 color: ColorValues.blackColor,
                      //                                                                               ),
                      //                                                                             ),
                      //                                                                             onChanged: (val) {
                      //                                                                               controller.accesslevel.firstWhere((e) => e?.feature_name == getAccesslevelDetails?.feature_name);
                      //                                                                               controller.isCheckedmodule.value = val!;
                      //
                      //                                                                               controller.update();
                      //                                                                             }),
                      //                                                                         Dimens.boxWidth5,
                      //                                                                         Expanded(child: Text("${getAccesslevelDetails?.feature_name}"))
                      //                                                                       ],
                      //                                                                     );
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return _rowItem(getAccesslevelDetails?.add.value, onCheck: (val) {
                      //                                                                       getAccesslevelDetails?.add.value = val == true ? 1 : 0;
                      //                                                                     });
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return _rowItem(getAccesslevelDetails?.edit.value, onCheck: (val) {
                      //                                                                       getAccesslevelDetails?.edit.value = val == true ? 1 : 0;
                      //                                                                     });
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslevelDetails?.delete.value, onCheck: (val) {
                      //                                                                     getAccesslevelDetails?.delete.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslevelDetails?.view.value, onCheck: (val) {
                      //                                                                     getAccesslevelDetails?.view.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslevelDetails?.issue.value, onCheck: (val) {
                      //                                                                     getAccesslevelDetails?.issue.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslevelDetails?.approve.value, onCheck: (val) {
                      //                                                                     getAccesslevelDetails?.approve.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslevelDetails?.selfView.value, onCheck: (val) {
                      //                                                                     getAccesslevelDetails?.selfView.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                               ]))
                      //                                                           .toList()
                      //                                                       : [],
                      //                                                 )
                      //                                               : Container())
                      //                                       : Container(
                      //                                           height:
                      //                                               Get.height -
                      //                                                   30,
                      //                                           margin: Dimens
                      //                                               .edgeInsets15,
                      //                                           decoration:
                      //                                               BoxDecoration(
                      //                                             border: Border
                      //                                                 .all(
                      //                                               color: ColorValues
                      //                                                   .lightGreyColorWithOpacity35,
                      //                                               width: 1,
                      //                                             ),
                      //                                             boxShadow: [
                      //                                               BoxShadow(
                      //                                                 color: ColorValues
                      //                                                     .appBlueBackgroundColor,
                      //                                                 spreadRadius:
                      //                                                     2,
                      //                                                 blurRadius:
                      //                                                     5,
                      //                                                 offset:
                      //                                                     Offset(
                      //                                                         0,
                      //                                                         2),
                      //                                               ),
                      //                                             ],
                      //                                           ),
                      //                                           child: controller
                      //                                                       .accessList
                      //                                                       .length >
                      //                                                   0
                      //                                               ? ScrollableTableView(
                      //                                                   columns:
                      //                                                       [
                      //                                                     "Module Name",
                      //                                                     "Add",
                      //                                                     "Edit",
                      //                                                     "Delete",
                      //                                                     "View",
                      //                                                     "Issue",
                      //                                                     "Approve",
                      //                                                     "Self View"
                      //                                                   ].map((column) {
                      //                                                     return TableViewColumn(
                      //                                                       label:
                      //                                                           column,
                      //                                                       // width:
                      //                                                       //     115, // Set the width of the column to 100
                      //
                      //                                                       minWidth:
                      //                                                           Get.width * 0.085,
                      //                                                     );
                      //                                                   }).toList(),
                      //                                                   rows: true
                      //                                                       ? controller.accessList
                      //                                                           .map((getAccesslistDetails) => TableViewRow(height: 90, cells: [
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return Row(
                      //                                                                       children: [
                      //                                                                         Checkbox(
                      //                                                                             value: controller.isCheckedmodule.value,
                      //                                                                             checkColor: Colors.white,
                      //                                                                             activeColor: ColorValues.blackColor,
                      //                                                                             shape: RoundedRectangleBorder(
                      //                                                                               borderRadius: BorderRadius.circular(2.0),
                      //                                                                             ),
                      //                                                                             side: MaterialStateBorderSide.resolveWith(
                      //                                                                               (states) => BorderSide(
                      //                                                                                 width: 1.0,
                      //                                                                                 color: ColorValues.blackColor,
                      //                                                                               ),
                      //                                                                             ),
                      //                                                                             onChanged: (val) {
                      //                                                                               controller.accessList.firstWhere((e) => e?.feature_name == getAccesslistDetails?.feature_name);
                      //                                                                               controller.isCheckedmodule.value = val!;
                      //
                      //                                                                               controller.update();
                      //                                                                             }),
                      //                                                                         Dimens.boxWidth5,
                      //                                                                         Expanded(child: Text("${getAccesslistDetails?.feature_name}"))
                      //                                                                       ],
                      //                                                                     );
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return _rowItem(getAccesslistDetails?.add.value, onCheck: (val) {
                      //                                                                       getAccesslistDetails?.add.value = val == true ? 1 : 0;
                      //                                                                     });
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return _rowItem(getAccesslistDetails?.edit.value, onCheck: (val) {
                      //                                                                       getAccesslistDetails?.edit.value = val == true ? 1 : 0;
                      //                                                                     });
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslistDetails?.delete.value, onCheck: (val) {
                      //                                                                     getAccesslistDetails?.delete.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslistDetails?.view.value, onCheck: (val) {
                      //                                                                     getAccesslistDetails?.view.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslistDetails?.issue.value, onCheck: (val) {
                      //                                                                     getAccesslistDetails?.issue.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslistDetails?.approve.value, onCheck: (val) {
                      //                                                                     getAccesslistDetails?.approve.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getAccesslistDetails?.selfView.value, onCheck: (val) {
                      //                                                                     getAccesslistDetails?.selfView.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                               ]))
                      //                                                           .toList()
                      //                                                       : [],
                      //                                                 )
                      //                                               : Container()))
                      //                             ],
                      //                           ),
                      //                           Column(
                      //                             children: [
                      //                               Container(
                      //                                   color: ColorValues
                      //                                       .whiteColor,
                      //                                   child: controller
                      //                                               .notificationList
                      //                                               .length >
                      //                                           0
                      //                                       ? Container(
                      //                                           height:
                      //                                               Get.height -
                      //                                                   30,
                      //                                           margin: Dimens
                      //                                               .edgeInsets15,
                      //                                           decoration:
                      //                                               BoxDecoration(
                      //                                             border: Border
                      //                                                 .all(
                      //                                               color: ColorValues
                      //                                                   .lightGreyColorWithOpacity35,
                      //                                               width: 1,
                      //                                             ),
                      //                                             boxShadow: [
                      //                                               BoxShadow(
                      //                                                 color: ColorValues
                      //                                                     .appBlueBackgroundColor,
                      //                                                 spreadRadius:
                      //                                                     2,
                      //                                                 blurRadius:
                      //                                                     5,
                      //                                                 offset:
                      //                                                     Offset(
                      //                                                         0,
                      //                                                         2),
                      //                                               ),
                      //                                             ],
                      //                                           ),
                      //                                           child: controller
                      //                                                       .notificationList
                      //                                                       .length >
                      //                                                   0
                      //                                               ? ScrollableTableView(
                      //                                                   columns:
                      //                                                       [
                      //                                                     "Notifications",
                      //                                                     "Default Value",
                      //                                                     "Can Override",
                      //                                                     "User Preference",
                      //                                                   ].map((column) {
                      //                                                     return TableViewColumn(
                      //                                                       label:
                      //                                                           column,
                      //                                                       minWidth:
                      //                                                           Get.width * 0.17,
                      //                                                     );
                      //                                                   }).toList(),
                      //                                                   rows: true
                      //                                                       ? controller.notificationList
                      //                                                           .map((getnotificationListDetails) => TableViewRow(height: 70, cells: [
                      //                                                                 TableViewCell(child: Text("${getnotificationListDetails?.feature_name}" " " "${getnotificationListDetails?.notification_name.value}")),
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return _rowItem(getnotificationListDetails?.default_flag.value, onCheck: (val) {
                      //                                                                       getnotificationListDetails?.default_flag.value = val == true ? 1 : 0;
                      //                                                                     });
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return _rowItem(getnotificationListDetails?.can_change.value, onCheck: (val) {
                      //                                                                       getnotificationListDetails?.can_change.value = val == true ? 1 : 0;
                      //                                                                     });
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getnotificationListDetails?.default_flag.value, onCheck: (val) {
                      //                                                                     getnotificationListDetails?.default_flag.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                               ]))
                      //                                                           .toList()
                      //                                                       : [],
                      //                                                 )
                      //                                               : Container())
                      //                                       : Container(
                      //                                           height:
                      //                                               Get.height -
                      //                                                   30,
                      //                                           margin: Dimens
                      //                                               .edgeInsets15,
                      //                                           decoration:
                      //                                               BoxDecoration(
                      //                                             border: Border
                      //                                                 .all(
                      //                                               color: ColorValues
                      //                                                   .lightGreyColorWithOpacity35,
                      //                                               width: 1,
                      //                                             ),
                      //                                             boxShadow: [
                      //                                               BoxShadow(
                      //                                                 color: ColorValues
                      //                                                     .appBlueBackgroundColor,
                      //                                                 spreadRadius:
                      //                                                     2,
                      //                                                 blurRadius:
                      //                                                     5,
                      //                                                 offset:
                      //                                                     Offset(
                      //                                                         0,
                      //                                                         2),
                      //                                               ),
                      //                                             ],
                      //                                           ),
                      //                                           child: controller
                      //                                                       .notificationListByUserId
                      //                                                       .length >
                      //                                                   0
                      //                                               ? ScrollableTableView(
                      //                                                   columns:
                      //                                                       [
                      //                                                     "Notifications",
                      //                                                     "Default Value",
                      //                                                     "Can Override",
                      //                                                     "User Preference",
                      //                                                   ].map((column) {
                      //                                                     return TableViewColumn(
                      //                                                       label:
                      //                                                           column,
                      //                                                       minWidth:
                      //                                                           Get.width * 0.17,
                      //                                                     );
                      //                                                   }).toList(),
                      //                                                   rows: true
                      //                                                       ? controller.notificationListByUserId
                      //                                                           .map((getnotificationListDetails) => TableViewRow(height: 70, cells: [
                      //                                                                 TableViewCell(child: Text("${getnotificationListDetails?.feature_name}" " " "${getnotificationListDetails?.notification_name.value}")),
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return _rowItem(getnotificationListDetails?.default_flag.value, onCheck: (val) {
                      //                                                                       getnotificationListDetails?.default_flag.value = val == true ? 1 : 0;
                      //                                                                     });
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(
                      //                                                                   child: Obx(() {
                      //                                                                     return _rowItem(getnotificationListDetails?.can_change.value, onCheck: (val) {
                      //                                                                       getnotificationListDetails?.can_change.value = val == true ? 1 : 0;
                      //                                                                     });
                      //                                                                   }),
                      //                                                                 ),
                      //                                                                 TableViewCell(child: Obx(() {
                      //                                                                   return _rowItem(getnotificationListDetails?.default_flag.value, onCheck: (val) {
                      //                                                                     getnotificationListDetails?.default_flag.value = val == true ? 1 : 0;
                      //                                                                   });
                      //                                                                 })),
                      //                                                               ]))
                      //                                                           .toList()
                      //                                                       : [],
                      //                                                 )
                      //                                               : Container()))
                      //                             ],
                      //                           ),
                      //                         ]),
                      //                       )
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 40, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.userId == null
                                  ? Container(
                                height: 35,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.greenColor,
                                  text: 'Submit',
                                  onPressed: () {
                                    controller.addUser();
                                    //  controller.saveAccessLevel();
                                  },
                                ),
                              )
                                  : Container(
                                height: 35,
                                child: CustomElevatedButton(
                                  backgroundColor:
                                  ColorValues.appDarkBlueColor,
                                  text: 'Update',
                                  onPressed: () {
                                    controller.updateUser().then((value) {
                                      if (value == true) {
                                        // controller.userId = 0;
                                        controller.saveAccessLevel();
                                        //   controller.saveNotification();
                                      }
                                    });
                                    //  controller.saveAccessLevel();
                                  },
                                ),
                              ),
                              Dimens.boxWidth20,
                              Container(
                                height: 35,
                                child: CustomElevatedButton(
                                  backgroundColor: ColorValues.redColor,
                                  text: "Cancel",
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, int type) async {
    DateTime today = DateTime.now();
    var date = await showDatePicker(
      context: context,
      cancelText: "Clear",
      confirmText: "Ok",
      initialDate: DateTime(today.year, today.month, today.day),
      firstDate: DateTime(1900),
      lastDate: DateTime(today.year + 18, today.month, today.day),
    );
    if (type == 1) {
      controller.dobCtrlr.text = date.toString().substring(0, 10);
    } else {
      controller.joingdateCtrlr.text = date.toString().substring(0, 10);
    }
  }

  AddfacilityListAlertBox() {
    return StatefulBuilder(builder: ((context, setState) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        insetPadding: Dimens.edgeInsets10_0_10_0,
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Select facility Name',
          textAlign: TextAlign.center,
          // style: TextStyle(color: Colors.green),
        ),
        content: Builder(builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Obx(
            () => Container(
              padding: Dimens.edgeInsets05_0_5_0,
              height: 300, // double.infinity,
              width: 300,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(
                      color: ColorValues.greyLightColour,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: CustomMultiSelectDialogField(
                        buttonText: 'Add Facility',
                        title: 'Select Facility',
                        initialValue:
                            (controller.selectedFacilityNameList.isNotEmpty)
                                ? controller.selectedfacilityNameIdList
                                : [],
                        items: controller.facilityNameList
                            .map(
                              (facilityName) => MultiSelectItem(
                                facilityName?.id,
                                facilityName?.name ?? '',
                              ),
                            )
                            .toList(),
                        onConfirm: (selectedOptionsList) => {
                          controller.facilityNameSelected(selectedOptionsList),
                        },
                      ),
                    )
                  ]),
            ),
          );
        }),
        actions: [
          Center(
            child: Container(
                height: 45,
                child: CustomElevatedButton(
                  backgroundColor: ColorValues.navyBlueColor,
                  text: "Ok",
                  onPressed: () {
                    Get.back();
                  },
                )),
          ),
        ],
      );
    }));
  }
}
