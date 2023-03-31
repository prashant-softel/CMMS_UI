import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/custom_datatable_controller.dart';

class CustomDatatable extends StatelessWidget {
  final CustomDatatableController controller =
      Get.put(CustomDatatableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Datatable'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              // Filter data list by name or other search field
              controller.data.assignAll(controller.data.where((row) {
                return row['name'].toLowerCase().contains(value.toLowerCase());
              }));
            },
            decoration: InputDecoration(
              labelText: 'Search by name',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.data.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return PaginatedDataTable2(
                columns: controller.data[0].keys.map<DataColumn>((String key) {
                  return DataColumn(
                    label: Text(key),
                    onSort: (int columnIndex, bool ascending) {
                      controller.sort(key, ascending);
                    },
                  );
                }).toList(),
                source: CustomDataTableSource(controller.data),
                rowsPerPage: 5,
                sortColumnIndex: 0,
                sortAscending: true,
              );
            }),
          ),
        ],
      ),
    );
  }
}
