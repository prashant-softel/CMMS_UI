import 'package:cmms/app/app.dart';
import 'package:cmms/app/document_master/document_master_controller.dart';
import 'package:cmms/domain/models/documentmaster_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentMasterContentMobile
    extends GetView<DocumentMasterController> {
  DocumentMasterContentMobile({Key? key}) : super(key: key);

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
                    itemCount: controller.DocumentMaster != null
                        ? controller.DocumentMaster.length
                        : 0,
                    itemBuilder: (context, index) {
                      final documentListModel =
                          (controller.DocumentMaster != null)
                              ? controller.DocumentMaster[index]
                              : DocumentMasterModel();
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
                                        'Id: ',
                                        style: const TextStyle(
                                            color: ColorValues.blackColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '${documentListModel.id ?? 0}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorValues.navyBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    Text(
                                      'Document Name: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${documentListModel.name}'
                                        '',
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Row(
                                      children: [
                                    Text(
                                      'Document Description: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        documentListModel
                                                .description ??
                                            '',
                                        style: const TextStyle(
                                          color: ColorValues.navyBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ]),
                                  // Row(children: [
                                  //   Text(
                                  //     'Frequency: ',
                                  //     style: const TextStyle(
                                  //         color: ColorValues.blackColor,
                                  //         fontWeight: FontWeight.w400),
                                  //   ),
                                  //   SizedBox(
                                  //     width: 5,
                                  //   ),
                                  //   Expanded(
                                  //     child: Text(
                                  //       "${documentListModel?.frequency_name ?? ''}",
                                  //       style: const TextStyle(
                                  //         color: ColorValues.navyBlueColor,
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  //     ),
                                  //   )
                                  // ]),
                                  // Row(children: [
                                  //   Column(
                                  //     children: [
                                  //       Text(
                                  //         'Duration',
                                  //         style: const TextStyle(
                                  //             color: ColorValues.blackColor,
                                  //             fontWeight: FontWeight.w400),
                                  //       ),
                                  //       Text(
                                  //         "${documentListModel?.duration ?? ''} min.",
                                  //         style: const TextStyle(
                                  //           color: ColorValues.navyBlueColor,
                                  //           fontWeight: FontWeight.bold,
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  //   Expanded(
                                  //     child: Column(
                                  //       children: [
                                  //         Text(
                                  //           'ManPower',
                                  //           style: const TextStyle(
                                  //               color: ColorValues.blackColor,
                                  //               fontWeight: FontWeight.w500),
                                  //         ),
                                  //         Text(
                                  //           "${documentListModel?.manPower ?? ''}",
                                  //           style: const TextStyle(
                                  //             color: ColorValues.navyBlueColor,
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   )
                                  // ]),
                                  // SwitchListTile(
                                  //   visualDensity: VisualDensity.comfortable,
                                  //   title: Text(
                                  //     'Active Status: ',
                                  //     style: TextStyle(
                                  //       color: Colors.black,
                                  //       fontWeight: FontWeight.w600,
                                  //     ),
                                  //   ),
                                  //   value: documentListModel?.status == 1
                                  //       ? true
                                  //       : false,
                                  //   onChanged: (value) {},
                                  //   activeColor: ColorValues.greenColor,
                                  // ),
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
    );
  }

  ///
}
