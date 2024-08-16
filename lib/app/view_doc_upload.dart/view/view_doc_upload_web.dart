import 'package:cmms/app/home/widgets/header_widget.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/view_doc_upload.dart/view_doc_upload_controller.dart';
import 'package:cmms/app/widgets/custom_richtext.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/widgets/date_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewDocUploadWeb extends StatefulWidget {
  ViewDocUploadWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewDocUploadWeb> createState() => _DocUploadWebState();
}

class _DocUploadWebState extends State<ViewDocUploadWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewDocUploadController>(
      id: 'stock_Mangement_Date',
      builder: (controller) {
        return SelectionArea(
          child: Scaffold(
            body: Obx(
              () => Stack(
                children: [
                  Column(
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
                              color: Color.fromARGB(255, 236, 234, 234)
                                  .withOpacity(0.5),
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
                                Get.offAllNamed(Routes.docVersionDashboard);
                              },
                              child: Text(" / DOCUMENT VERSION",
                                  style: Styles.greyLight14),
                            ),
                            Text(" / VIEW DOCUMENT VERSION",
                                style: Styles.greyLight14)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Card(
                            color: Color.fromARGB(255, 245, 248, 250),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          "View Doc Data For :  ${controller.selectedItem != null ? controller.selectedItem!.doc_master_name : 'Unknown'} ",
                                          style: Styles.blue17,
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            CustomRichText(
                                                title: 'Date Range',
                                                includeAsterisk: false),
                                            Dimens.boxWidth2,
                                            CustomTextFieldForStock(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                              numberTextField: true,
                                              onTap: () {
                                                controller
                                                        .openFromDateToStartDatePicker =
                                                    !controller
                                                        .openFromDateToStartDatePicker;
                                                controller.update(
                                                    ['stock_Mangement_Date']);
                                              },
                                              hintText:
                                                  '${controller.start_date} To ${controller.end_date}',
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                  ),
                                  Dimens.boxHeight20,
                                  Container(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    height: Get.height * .7,
                                    width: Get.width * .92,
                                    child: DataTable2(
                                      minWidth: 1400,
                                      columns: [
                                        DataColumn2(
                                          fixedWidth: 100,
                                          label: Text(
                                            "DOC ID",
                                            style: Styles.blue17,
                                          ),
                                        ),
                                        DataColumn2(
                                          fixedWidth: 220,
                                          label: Text(
                                            "Sub Doc Name",
                                            style: Styles.blue17,
                                          ),
                                        ),
                                        DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "Renew Date",
                                            style: Styles.blue17,
                                          ),
                                        ),
                                        DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "Added By",
                                            style: Styles.blue17,
                                          ),
                                        ),
                                        DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "Added At",
                                            style: Styles.blue17,
                                          ),
                                        ),
                                        DataColumn2(
                                          fixedWidth: 200,
                                          label: Text(
                                            "Remarks",
                                            style: Styles.blue17,
                                          ),
                                        ),
                                        DataColumn2(
                                          fixedWidth: 120,
                                          label: Text(
                                            "Doc File",
                                            style: Styles.blue17,
                                          ),
                                        ),
                                      ],
                                      rows: controller.viewDocUploadList.map(
                                        (item) {
                                          return DataRow(
                                            cells: [
                                              DataCell(Text('${item.id ?? ""}',
                                                  style: Styles.black14)),
                                              DataCell(Text(
                                                  '${item.subDocName ?? ""}',
                                                  style: Styles.black14)),
                                              DataCell(Text(
                                                  '${item.renewDate != null ? DateFormat('yyyy-MM-dd').format(item.renewDate!) : ""}',
                                                  style: Styles.black14)),
                                              DataCell(Text(
                                                  '${item.created_by ?? ""}',
                                                  style: Styles.black14)),
                                              DataCell(Text(
                                                  '${item.created_at != null ? DateFormat('yyyy-MM-dd').format(item.created_at!) : ""}',
                                                  style: Styles.black14)),
                                              DataCell(Text(
                                                  '${item.remarks ?? ""}',
                                                  style: Styles.black14)),
                                              DataCell(TableActionButton(
                                                color: ColorValues
                                                    .appDarkBlueColor,
                                                icon: Icons.visibility,
                                                message: 'View File',
                                                onPress: () async {
                                                  String baseUrl =
                                                      'http://172.20.43.9:83/';
                                                  String fileName = controller
                                                          .selectedItem
                                                          ?.file_path ??
                                                      "";
                                                  String fullUrl =
                                                      baseUrl + fileName;
                                                  if (await canLaunch(
                                                      fullUrl)) {
                                                    await launch(fullUrl);
                                                  } else {
                                                    throw 'Could not launch $fullUrl';
                                                  }
                                                },
                                              )),
                                            ],
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                  Dimens.boxHeight20,
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    width: Get.width * 0.5,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 206, 229, 234),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "File Description: ",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                controller.selectedItem
                                                        ?.description ??
                                                    '',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        // Row(
                                        //   children: [
                                        //     Text(
                                        //       "View Image: ",
                                        //       style: TextStyle(
                                        //         fontSize: 15,
                                        //         fontWeight: FontWeight.bold,
                                        //       ),
                                        //     ),
                                        //     controller.selectedItem != null
                                        //         ? IconButton(
                                        //             icon:
                                        //                 Icon(Icons.visibility),
                                        //             color: ColorValues
                                        //                 .appDarkBlueColor,
                                        //             onPressed: () async {
                                        //               String baseUrl =
                                        //                   'http://172.20.43.9:83/';
                                        //               String fileName =
                                        //                   controller
                                        //                           .selectedItem
                                        //                           ?.file_path ??
                                        //                       "";
                                        //               String fullUrl =
                                        //                   baseUrl + fileName;
                                        //               if (await canLaunch(
                                        //                   fullUrl)) {
                                        //                 await launch(fullUrl);
                                        //               } else {
                                        //                 throw 'Could not launch $fullUrl';
                                        //               }
                                        //             },
                                        //           )
                                        //         : Dimens.box0
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (controller.openFromDateToStartDatePicker)
                    Positioned(
                      right: 40,
                      top: 180,
                      child: DatePickerWidget(
                        selectionMode: DateRangePickerSelectionMode.range,
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          todayCellDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorValues.appDarkBlueColor),
                        ),
                        initialSelectedRange: PickerDateRange(
                          controller.fromDate.value,
                          controller.toDate.value,
                        ),
                        onSubmit: (value) {
                          if (value is PickerDateRange) {
                            var startDate = value.startDate!;
                            var endDate = value.endDate ?? startDate;
                            controller.fromDate.value = startDate;
                            controller.toDate.value = endDate;
                            controller.getViewDocUploadListByDate();
                            controller.openFromDateToStartDatePicker = false;
                            controller.update(['stock_Mangement_Date']);
                          }
                        },
                        onCancel: () {
                          controller.openFromDateToStartDatePicker = false;
                          controller.update(['stock_Mangement_Date']);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
