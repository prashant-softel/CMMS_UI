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
      id: 'stock_Mangement',
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
                            Text(" /VIEW DOCUMENT VERSION",
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
                                          "View Doc Data For ID ${controller.selectedDocUploadId} ",
                                          style: Styles.blackBold16,
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
                                                  '${controller.startDate.toString()} To ${controller.endDate.toString()}',
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                  ),
                                  Dimens.boxHeight20,
                                  Container(
                                    color: Color.fromARGB(255, 245, 248, 250),
                                    height: Get.height * .7,
                                    width: Get.width * .92,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.viewDocUploadList.length,
                                      itemBuilder: (context, index) {
                                        final item =
                                            controller.viewDocUploadList[index];
                                        return Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 227, 224, 224),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                        255, 236, 234, 234)
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          height: 200,
                                          margin: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text(
                                                  "${item.subDocName ?? ""}",
                                                  style: Styles.blue17,
                                                ),
                                              ),
                                              Divider(
                                                color:
                                                    ColorValues.greyLightColour,
                                              ),
                                              Expanded(
                                                child: DataTable2(
                                                  minWidth: 1400,
                                                  columns: [
                                                    DataColumn2(
                                                      fixedWidth: 50,
                                                      label: Text(
                                                        "ID",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      fixedWidth: 120,
                                                      label: Text(
                                                        "DCMID",
                                                        style: Styles.blue17,
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      fixedWidth: 120,
                                                      label: Text(
                                                        "File ID",
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
                                                  ],
                                                  rows: [
                                                    DataRow(
                                                      cells: [
                                                        DataCell(Text(
                                                            '${item.id ?? ""}',
                                                            style: Styles
                                                                .black14)),
                                                        DataCell(Text(
                                                            '${item.docMasterId ?? ""}',
                                                            style: Styles
                                                                .black14)),
                                                        DataCell(Text(
                                                            '${item.fileId ?? ""}',
                                                            style: Styles
                                                                .black14)),
                                                        DataCell(Text(
                                                            '${item.subDocName ?? ""}',
                                                            style: Styles
                                                                .black14)),
                                                        DataCell(Text(
                                                            '${item.renewDate != null ? DateFormat('yyyy-MM-dd').format(item.renewDate!) : ""}',
                                                            style: Styles
                                                                .black14)),
                                                        DataCell(Text(
                                                            '${item.addedBy ?? ""}',
                                                            style: Styles
                                                                .black14)),
                                                        DataCell(Text(
                                                            '${item.addedAt != null ? DateFormat('yyyy-MM-dd').format(item.addedAt!) : ""}',
                                                            style: Styles
                                                                .black14)),
                                                        DataCell(Text(
                                                            '${item.remarks ?? ""}',
                                                            style: Styles
                                                                .black14)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Dimens.boxHeight20,
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (controller.openDocUploadDatePicker)
                    Positioned(
                      right: 150,
                      top: 85,
                      child: DatePickerWidget(
                        selectionMode: DateRangePickerSelectionMode.range,
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          todayCellDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorValues.appDarkBlueColor),
                        ), // last date of this year
                        // controller: DateRangePickerController(),
                        initialSelectedRange: PickerDateRange(
                          controller.fromDate.value,
                          controller.toDate.value,
                        ),

                        onSubmit: (value) {
                          print('po valu ${value.toString()}');
                          PickerDateRange? data = value as PickerDateRange;

                          var pickUpDate =
                              DateTime.parse(data.startDate.toString());
                          controller.fromDate.value = pickUpDate;
                          var dropDate =
                              DateTime.parse(data.endDate.toString());
                          dropDate != null
                              ? controller.toDate.value = dropDate
                              : controller.toDate.value = pickUpDate;

                          // controller.viewDocUploadList();
                          controller.openFromDateToStartDatePicker =
                              !controller.openFromDateToStartDatePicker;
                          controller.update(['stock_Mangement_Date']);

                          // Get.toNamed(
                          //   Routes.stockManagementGoodsOrdersScreen,
                          // );
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
