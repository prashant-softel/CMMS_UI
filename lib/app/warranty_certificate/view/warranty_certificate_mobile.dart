import 'package:cmms/app/app.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/models/modulelist_model.dart';
import '../../../domain/models/warranty_certificate_model.dart';
import '../warranty_certificate_controller.dart';
// import '../preventive_list_controller.dart';

class WarrantyCertificateMobile
    extends GetView<WarrantyCertificateController> {
  WarrantyCertificateMobile({Key? key}) : super(key: key);

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
                    itemCount: controller.warrantyList != null
                        ? controller.warrantyList?.length
                        : 0,
                    itemBuilder: (context, index) {
                      final moduleModel =
                          (controller.warrantyList != null)
                              ? controller.warrantyList![index]
                              : WarrantyCertificateModel();
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
                                        'Asset Id: ',
                                        style: const TextStyle(
                                            color: ColorValues.blackColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '${moduleModel?.asset_id ?? 0}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorValues.navyBlueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    Text(
                                      'CategoryId: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                          '${moduleModel?.categoryId ?? 0}',
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
                                      'Asset name: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        moduleModel
                                                ?.asset_name ??
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
                                      'Warranty Type Id: ',
                                      style: const TextStyle(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${moduleModel?.warrantyTypeId ?? ''}",
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
                                          'Warranty Provoider',
                                          style: const TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${moduleModel?.warranty_provider ?? ''}",
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
                                            'Category Name',
                                            style: const TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${moduleModel?.categoryName ?? ''}",
                                            style: const TextStyle(
                                              color: ColorValues.navyBlueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Warranty Description',
                                          style: const TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${moduleModel?.warranty_description ?? ''} min.",
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
                                            'Warranty Type Name',
                                            style: const TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${moduleModel?.warrantyTypeName ?? ''}",
                                            style: const TextStyle(
                                              color: ColorValues.navyBlueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Column(
                                      children: [
                                        Text(
                                          'WarrantyTermId',
                                          style: const TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${moduleModel?.warrantyTermId ?? ''}",
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
                                            'WarrantyTermName',
                                            style: const TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${moduleModel?.warrantyTermName ?? ''}",
                                            style: const TextStyle(
                                              color: ColorValues.navyBlueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),

                                  Row(children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Certificate_number',
                                          style: const TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${moduleModel?.certificate_number ?? ''}",
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
                                            'Warranty certificate file path',
                                            style: const TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${moduleModel?.warranty_certificate_file_path ?? ''}",
                                            style: const TextStyle(
                                              color: ColorValues.navyBlueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Warranty Provider Id',
                                          style: const TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${moduleModel?.warrantyProviderId ?? 0}",
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
                                            'Warranty Provider Name',
                                            style: const TextStyle(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${moduleModel?.warrantyProviderName ?? ''}",
                                            style: const TextStyle(
                                              color: ColorValues.navyBlueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                                  Row(children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Warranty Term Type',
                                          style: const TextStyle(
                                              color: ColorValues.blackColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${moduleModel?.warranty_term_type ?? ''}",
                                          style: const TextStyle(
                                            color: ColorValues.navyBlueColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),

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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => controller.createModulelist(),
      //   backgroundColor: ColorValues.navyBlueColor,
      //   child: Icon(
      //     Icons.add,
      //     color: ColorValues.whiteColor,
      //   ),
      // ),
    );
  }

  ///
}
