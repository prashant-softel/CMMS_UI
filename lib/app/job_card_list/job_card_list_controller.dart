import 'package:cmms/domain/models/job_card_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
class JobCardListController extends GetxController {
  final _jobCardList = <JobCardDetailsModel>[].obs;
  final _searchText = ''.obs;
  final _sortColumnIndex = 0.obs;
  final _sortAscending = true.obs;
  final _rowsPerPage = 10.obs;
  final _currentPage = 0.obs;

  List<JobCardDetailsModel> get jobCards => _jobCardList.toList();
  String get searchText => _searchText.value;
  set searchText(String value) => _searchText.value = value;
  int get sortColumnIndex => _sortColumnIndex.value;
  set sortColumnIndex(int value) => _sortColumnIndex.value = value;
  bool get sortAscending => _sortAscending.value;
  set sortAscending(bool value) => _sortAscending.value = value;
  int get rowsPerPage => _rowsPerPage.value;
  set rowsPerPage(int value) => _rowsPerPage.value = value;
  int get currentPage => _currentPage.value;
  set currentPage(int value) => _currentPage.value = value;

  @override
  void onInit() {
    super.onInit();
    // Here you can fetch the data from some data source (e.g., an API) and populate the _jobCards list
    _jobCardList.addAll([
      // Add more sample JobCard objects
    ]);
  }

  List<JobCardDetailsModel> get filteredJobCards {
    var filteredList = _jobCardList.where((jobCard) {
      if (searchText.isEmpty) return true;
      return jobCard.id
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase()) ||
          (jobCard.plantName
                  ?.toLowerCase()
                  .contains(searchText.toLowerCase()) ??
              false) ||
          (jobCard.assetCategoryName
                  ?.toLowerCase()
                  .contains(searchText.toLowerCase()) ??
              false) ||
          (jobCard.jcApprovedByName
                  ?.toLowerCase()
                  .contains(searchText.toLowerCase()) ??
              false);
    }).toList();
    if (sortAscending) {
      filteredList.sort((a, b) {
        switch (sortColumnIndex) {
          case 0:
            return (a.id?.toString() ?? '').compareTo(b.id?.toString() ?? '');
          case 1:
            return (a.plantName ?? '').compareTo(b.plantName ?? '');
          case 2:
            return (a.assetCategoryName ?? '')
                .compareTo(b.assetCategoryName ?? '');
          case 3:
            return (a.jcApprovedByName ?? '')
                .compareTo(b.jcApprovedByName ?? '');
          case 4:
            return (a.updatedByName ?? '').compareTo(b.updatedByName ?? '');
          case 5:
            return (a.currentEmpId?.toString() ?? '')
                .compareTo(b.currentEmpId?.toString() ?? '');
          case 6:
            return (a.currentStatus ?? '').compareTo(b.currentStatus ?? '');
          case 7:
            return (a.jcClosedByName ?? '').compareTo(b.jcClosedByName ?? '');
          case 8:
            return (a.jcRejectedByName ?? '')
                .compareTo(b.jcRejectedByName ?? '');
          case 9:
            return (a.description?.toString() ?? '')
                .compareTo(b.description?.toString() ?? '');
          case 10:
            return (a.jobId?.toString() ?? '')
                .compareTo(b.jobId?.toString() ?? '');
          case 11:
            return (a.ptwId?.toString() ?? '')
                .compareTo(b.ptwId?.toString() ?? '');

          default:
            return 0;
        }
      });
    } else {
      filteredList.sort((a, b) {
        switch (sortColumnIndex) {
          case 0:
            return (b.id?.toString() ?? '').compareTo(a.id?.toString() ?? '');
          case 1:
            return (b.plantName ?? '').compareTo(a.plantName ?? '');
          case 2:
            return (b.assetCategoryName ?? '')
                .compareTo(a.assetCategoryName ?? '');
          case 3:
            return (b.jcApprovedByName ?? '')
                .compareTo(a.jcApprovedByName ?? '');
          case 4:
            return (b.updatedByName ?? '').compareTo(a.updatedByName ?? '');
          case 5:
            return (b.currentEmpId?.toString() ?? '')
                .compareTo(a.currentEmpId?.toString() ?? '');
          case 6:
            return (b.currentStatus ?? '').compareTo(a.currentStatus ?? '');
          case 7:
            return (b.jcClosedByName ?? '').compareTo(a.jcClosedByName ?? '');
          case 8:
            return (b.jcRejectedByName ?? '')
                .compareTo(a.jcRejectedByName ?? '');
          case 9:
            return (b.description?.toString() ?? '')
                .compareTo(a.description?.toString() ?? '');
          case 10:
            return (b.jobId?.toString() ?? '')
                .compareTo(a.jobId?.toString() ?? '');
          case 11:
            return (b.ptwId?.toString() ?? '')
                .compareTo(a.ptwId?.toString() ?? '');
          default:
            return 0;
        }
      });
    }

    return filteredList;
  }

  void onPageChanged(int index) {
    currentPage = index;
  }

  void onSort(int columnIndex, bool ascending) {
    sortColumnIndex = columnIndex;
    sortAscending = ascending;
  }

  ///
}

/// ///
class JobCardDataSource extends DataTableSource {
  final JobCardListController _controller;
  List<JobCardDetailsModel> _jobCards = [];

  JobCardDataSource(this._controller) {
    _jobCards = _controller.jobCards;
  }

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _jobCards.length) {
      return null;
    }
    final jobCard = _jobCards[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${jobCard.id}')),
        DataCell(Text(jobCard.plantName ?? '')),
        DataCell(Text(jobCard.assetCategoryName ?? '')),
        DataCell(Text(jobCard.jcApprovedByName ?? '')),
        DataCell(Text(jobCard.updatedByName ?? '')),
        DataCell(Text(jobCard.currentEmpId.toString() ?? '')),
        DataCell(Text(jobCard.jcClosedByName ?? '')),
        DataCell(Text(jobCard.jcRejectedByName ?? '')),
        DataCell(Text(jobCard.jcRejectedByName ?? '')),
      ],
    );
  }

  @override
  int get rowCount => _jobCards.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  void sort<T>(
      Comparable<T> Function(JobCardDetailsModel d) getField, bool ascending) {
    _jobCards.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
}
