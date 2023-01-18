import 'package:cmms/app/app.dart';
import 'package:cmms/app/theme/dimens.dart';
import 'package:cmms/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('${'hello'.tr}'),
        ),
        body: Center(
          child: Container(
            margin: Dimens.edgeInsets16,
            height: Get.height,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(.3)),
            ),
            constraints: BoxConstraints(
              maxWidth: 1100,
            ),
            child: Column(
              children: [
                CustomAppBar(),
                Expanded(
                  child: SfDataGrid(
                    allowSorting: true,
                    columnWidthMode: ColumnWidthMode.fill,
                    source: employeeDataSource,
                    columns: <GridColumn>[
                      GridColumn(
                        columnName: 'assetName'.tr,
                        label: Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.centerRight,
                          child: Text(
                            'assetName'.tr,
                          ),
                        ),
                      ),
                      GridColumn(
                          columnName: 'serialNo'.tr,
                          label: Container(
                              padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerLeft,
                              child: Text('serialNo'.tr))),
                      GridColumn(
                          columnName: 'parrentAsset'.tr,
                          // width: 120,
                          label: Container(
                              padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerLeft,
                              child: Text('parrentAsset'.tr))),
                      GridColumn(
                          columnName: 'catergory'.tr,
                          label: Container(
                              padding: EdgeInsets.all(16.0),
                              alignment: Alignment.centerRight,
                              child: Text('catergory'.tr))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

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
            onPress: () {},
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
            onPress: () {},
            color: Colors.blue,
          ),
          Dimens.boxWidth10,
          ActionButton(
            icon: Icons.add,
            lable: 'addAsset'.tr,
            onPress: () {},
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
