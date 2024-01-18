import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/training_courses/training_course_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingCourseWeb extends StatefulWidget {
  const TrainingCourseWeb({Key? key}) : super(key: key);

  @override
  _TrainingCourseWebState createState() => _TrainingCourseWebState();
}

final List<Map<dynamic, dynamic>> courseData = [
  {
    "id": "11",
    "topic": "test",
    "Desc": "test",
    "Category": "test",
    "Targatted Group": "test",
    "Duration in Minutes": "test",
    "MaxCapacity": "20"
  },
];

class _TrainingCourseWebState extends State<TrainingCourseWeb> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
      id: "stock_Mangement_Date",
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 227, 224, 224), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 236, 234, 234).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: ColorValues.greyLightColor,
                  ),
                  Text("DASHBOARD", style: Styles.greyLight14),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(Routes.misDashboard);
                    },
                    child: Text(
                      " / MIS",
                      style: Styles.greyLight14,
                    ),
                  ),
                  Text(
                    " / TRAINING COURSES",
                    style: Styles.greyLight14,
                  )
                ],
              ),
            ),
            Stack(children: [
              Container(
                  width: Get.width * 7,
                  margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                  height: Get.height,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          child: Container(
                              margin:
                                  EdgeInsets.only(left: 10, top: 10, right: 10),
                              child: Column(
                                children: [
                                  Card(
                                      color: Color.fromARGB(255, 245, 248, 250),
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                                top: 20,
                                              ),
                                              child: Text(
                                                "Waste Data List",
                                                style: Styles.blackBold16,
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 20, right: 20),
                                                child: Row(
                                                  children: [
                                                    ActionButton(
                                                      icon: Icons.add,
                                                      label: "Add New",
                                                      onPressed: () {},
                                                      color: ColorValues
                                                          .addNewColor,
                                                    ),
                                                  ],
                                                ))
                                          ]),
                                          Divider(
                                            color: ColorValues.greyLightColor,
                                          ),
                                          Container(
                                            color: Color.fromARGB(
                                                255, 245, 248, 250),
                                            width: Get.width,
                                            height: Get.height,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: DataTable2(
                                                  // fixedLeftColumns: 1,
                                                  headingRowHeight: 70,
                                                  columnSpacing: 12,
                                                  horizontalMargin: 12,
                                                  headingRowColor:
                                                      MaterialStateColor
                                                          .resolveWith(
                                                    (states) {
                                                      return ColorValues
                                                          .lightGreyColor;
                                                    },
                                                  ),
                                                  // fixedColumnsColor: ColorValues
                                                  //     .appYellowColor,
                                                  // minWidth: 2350,
                                                  columns: [
                                                    DataColumn2(
                                                      // fixedWidth: 70,
                                                      label: Text(
                                                        'Course ID',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 110,
                                                      label: Text(
                                                        'Topic',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 160,
                                                      label: Text(
                                                        'Description',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 160,
                                                      label: Text(
                                                        'Category',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 110,
                                                      label: Text(
                                                        'Targetted Group',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 90,
                                                      label: Text(
                                                        'Duration in minutes',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                      // fixedWidth: 90,
                                                      label: Text(
                                                        'Maximum Capacity',
                                                        style:
                                                            Styles.blackBold14,
                                                      ),
                                                      // size: ColumnSize.L,
                                                    ),
                                                    DataColumn2(
                                                        label: Text('Action',
                                                            style: Styles
                                                                .blackBold14))
                                                  ],
                                                  rows: courseData.map(
                                                    (data) {
                                                      return DataRow(
                                                        cells: [
                                                          DataCell(Text(data[
                                                              'id'.toString()])),
                                                          DataCell(Text(
                                                              data['topic'])),
                                                          DataCell(Text(
                                                              data['Desc'])),
                                                          DataCell(Text(data[
                                                              'Category'])),
                                                          DataCell(Text(data[
                                                              'Targatted Group'])),
                                                          DataCell(Text(data[
                                                              'Duration in Minutes'])),
                                                          DataCell(Text(data[
                                                              'MaxCapacity'
                                                                  .toString()])),
                                                          DataCell(
                                                            Row(
                                                              children: [
                                                                TableActionButton(
                                                                  color: ColorValues
                                                                      .viewColor,
                                                                  icon: Icons
                                                                      .remove_red_eye_outlined,
                                                                  message:
                                                                      'View',
                                                                  onPress:
                                                                      () {},
                                                                ),
                                                                TableActionButton(
                                                                  color: ColorValues
                                                                      .editColor,
                                                                  icon: Icons
                                                                      .edit,
                                                                  message:
                                                                      'Edit',
                                                                  onPress:
                                                                      () {},
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ).toList(),
                                                )),
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        ))
                      ]))
            ]),
          ]),
        );
      },
    );
  }
}

DataColumn2 buildDataColumn(
  // String columnName,
  String header,

  /// ColumnSize columnSize,
  RxString filterText,
  double? fixedWidth,
  //  {required Function(String) onSearchCallBack}
) {
  return //
      DataColumn2(
    // size: columnSize,
    fixedWidth: fixedWidth,

    label: //
        Column(
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
          SizedBox(
            height: Get.height * 0.05,
            child: TextField(
              style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
              ),
              onChanged: (value) {
                filterText.value = value;
                //   onSearchCallBack(value);
              },
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Filter',
                contentPadding:
                    EdgeInsets.fromLTRB(5, 0, 5, 0), // Reduced vertical padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              header,
              style: Styles.black16W500,
            ),
          ),
        ]),
    // ),
  );
}
