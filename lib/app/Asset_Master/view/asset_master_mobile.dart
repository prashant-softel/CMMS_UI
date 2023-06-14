import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/models/asset_master_model.dart';
import '../../../domain/models/modulelist_model.dart';
import '../../preventive_List/preventive_list_controller.dart';
import '../asset_master_Controller.dart';
// import '../module_list_controller.dart';
// import '../mrs_Details_Controller.dart';
// import '../preventive_list_controller.dart';

class AssetMasterMobile
    extends GetView<AssetMasterController> {
  AssetMasterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///
    return //
        Scaffold(
      body: //
          Obx(
        () => Container(
          child: //
              Column(
            children: [
              Expanded(
                child: ListView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.moduleList != null
                        ? controller.moduleList?.length
                        : 0,
                    itemBuilder: (context, index) {
                      final moduleModel =
                          (controller.moduleList != null)
                              ? controller.moduleList![index]
                              : AssetMasterModel();
                      return Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          color: Colors.lightBlue.shade50,
                          elevation: 10,
                          shadowColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'MDM Code: ',
                                        style: const TextStyle(
                                            color: ColorValues.blackColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '${moduleModel?.asset_code ?? ''}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorValues.navyBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    Text(
                                      'Material Name: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                          '${moduleModel?.asset_name}'
                                        '',
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Row(//
                                      children: [
                                    Text(
                                      'AC/DC: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'AC/DC' ??
                                            '',
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Text(
                                      'Material Type: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${moduleModel?.asset_type ?? ''}",
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Material Category',
                                          style: const TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${moduleModel?.cat_name ?? 0}",
                                          style: const TextStyle(
                                            color: ColorValues.navyBlueColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Min. Required Qty',
                                            style: const TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "2",
                                            style: const TextStyle(
                                              color: ColorValues.navyBlueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                  // Row(children: [
                                  //   Column(
                                  //     children: [
                                  //       Text(
                                  //         'Min. Reorder Qty ',
                                  //         style: const TextStyle(
                                  //             color: ColorValues.blackColor,
                                  //             fontWeight: FontWeight.w400),
                                  //       ),
                                  //       Text(
                                  //         "2",
                                  //         style: const TextStyle(
                                  //           color: ColorValues.navyBlueColor,
                                  //           fontWeight: FontWeight.bold,
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  //   Row(children: [
                                  //     Text(
                                  //       'Description: ',
                                  //       style: const TextStyle(
                                  //           color: ColorValues.blackColor,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //     SizedBox(
                                  //       width: 5,
                                  //     ),
                                  //     Expanded(
                                  //       child: Text(
                                  //         '${moduleModel?.description}'
                                  //             '',
                                  //         style: const TextStyle(
                                  //           color: ColorValues.navyBlueColor,
                                  //           fontWeight: FontWeight.bold,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ]),
                                  // ]),
                                  // Row(children: [
                                  //   Text(
                                  //     'Unit Of Measurement: ',
                                  //     style: const TextStyle(
                                  //         color: ColorValues.blackColor,
                                  //         fontWeight: FontWeight.w400),
                                  //   ),
                                  //   SizedBox(
                                  //     width: 5,
                                  //   ),
                                  //   Expanded(
                                  //     child: Text(
                                  //       "${moduleModel?.measurement ?? ''}",
                                  //       style: const TextStyle(
                                  //         color: ColorValues.navyBlueColor,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   )
                                  // ]),

                                ]),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.createModulelist(),
        backgroundColor: ColorValues.navyBlueColor,
        child: Icon(
          Icons.add,
          color: ColorValues.whiteColor,
        ),
      ),
    );
  }

  ///
}
