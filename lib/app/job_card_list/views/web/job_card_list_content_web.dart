import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../job_card_list_controller.dart';

class JobCardListPage extends StatelessWidget {
  final _controller = Get.put(JobCardListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Card List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _controller.searchText = value;
                },
              ),
            ),
            Obx(
              () => PaginatedDataTable2(
                columns: [
                  DataColumn2(
                    label: Text('ID'),
                    size: ColumnSize.S,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                  DataColumn2(
                    label: Text('Title'),
                    size: ColumnSize.L,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                  DataColumn2(
                    label: Text('Customer'),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                  DataColumn2(
                    label: Text('Status'),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                  DataColumn2(
                    label: Text('Assigned To'),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                  DataColumn2(
                    label: Text('Priority'),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                  DataColumn2(
                    label: Text('Start Date'),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                  DataColumn2(
                    label: Text('End Date'),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                  DataColumn2(
                    label: Text('Created By'),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                  DataColumn2(
                    label: Text('Created Date'),
                    size: ColumnSize.M,
                    onSort: (columnIndex, ascending) {
                      _controller.onSort(columnIndex, ascending);
                    },
                  ),
                ],
                source: JobCardDataSource(_controller),
                onPageChanged: (index) {
                  _controller.onPageChanged(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
